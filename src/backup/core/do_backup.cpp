#include "do_backup.hpp"

#include <boost/filesystem.hpp>
#include <boost/filesystem/fstream.hpp>
#include <boost/range/join.hpp>

#include <format>
#include <iostream>
#include <set>

#include <utils/backup_type.hpp>
#include <utils/canonize.hpp>
#include <utils/get_current_time.hpp>

namespace core {

namespace {

namespace system = boost::system;
namespace filesystem = boost::filesystem;

std::pair<filesystem::path, filesystem::path> PrepareForBackup(
    const std::string& backup_from, const std::string& backup_to) {
  filesystem::path from_path = backup_from;
  if (!filesystem::exists(from_path) || !filesystem::is_directory(from_path)) {
    throw std::runtime_error(std::format(
        "can't backup from path {} doesn't exist or is not directory\n",
        from_path.string()));
  }
  from_path = utils::Canonize(from_path);

  const std::string now = utils::GetCurretTime();

  auto to_path = filesystem::path(backup_to) / now;

  system::error_code error_code;

  if (!filesystem::create_directories(to_path, error_code)) {
    throw std::runtime_error(
        std::format("can't create {} directory for backup. error message: {}\n",
                    to_path.string(), error_code.what()));
  }

  to_path = utils::Canonize(to_path);

  return {from_path, to_path};
}

void MakeBackupTag(const filesystem::path& path, const std::string_view tag) {
  filesystem::ofstream backup_tag(path / utils::kBackupTag);
  backup_tag << tag;
}

filesystem::path FindLastFullBackup(const filesystem::path& path) {
  filesystem::path last_backup(std::string{});

  system::error_code error_code;
  auto iterator = filesystem::directory_iterator(path, error_code);
  if (error_code.failed()) {
    throw std::runtime_error(std::format("failed to read {}. error message: {}",
                                         path.string(), error_code.what()));
  }
  for (; iterator != filesystem::end(iterator);
       iterator.increment(error_code)) {
    if (error_code.failed()) {
      std::cout << std::format(
          "failed to read direntry of {}. error message : {}\n", path.string(),
          error_code.what());
      continue;
    }
    const auto cur_path = iterator->path();
    std::string backup_tag = utils::GetBackupTag(cur_path);
    if (backup_tag == utils::kFullTag &&
        backup_tag >
            last_backup.string()) {  // directories have strict formatting so we
                                     // can compare lexicographically
      last_backup = cur_path;
    }
  }

  return last_backup;
}

/// @brief tries to copy file into destination_path, but if file is symlink to a
/// file in base does nothing and return a symlink info, if file is symlink to
/// file out of base, then simply copy symlink
system::error_code CopyFile(const filesystem::path& file_path,
                            const filesystem::path& destination_path,
                            const filesystem::path& base) {
  system::error_code error_code;

  filesystem::copy(file_path, destination_path,
                   filesystem::copy_options::copy_symlinks, error_code);
  if (error_code.failed() && error_code != system::errc::file_exists) {
    std::cout << std::format(
        "failed to copy file from {} to {}. error message : {}\n",
        file_path.string(), destination_path.string(), error_code.what());
    return error_code;
  }
  return error_code;
}

std::pair<bool, system::error_code> IsChanged(
    const filesystem::path& old_file, const filesystem::path& new_file) {
  system::error_code error_code;
  auto old_write_time = filesystem::last_write_time(old_file, error_code);
  if (error_code.failed()) {
    return {false, error_code};
  }
  auto new_write_time = filesystem::last_write_time(new_file, error_code);
  if (error_code.failed()) {
    return {false, error_code};
  }
  if (filesystem::is_directory(old_file, error_code)) {
    return {old_write_time < new_write_time, error_code};
  }
  if (error_code.failed()) {
    return {false, error_code};
  }

  auto old_size = filesystem::file_size(old_file, error_code);
  if (error_code.failed()) {
    return {false, error_code};
  }
  auto new_size = filesystem::file_size(new_file, error_code);
  if (error_code.failed()) {
    return {false, error_code};
  }
  return {old_size != new_size && old_write_time != new_write_time, error_code};
}

system::error_code ProcessIncrementalUpdateFile(
    const filesystem::path& file_from_path, const filesystem::path& from_path,
    const filesystem::path& old_backup_file_path,
    const filesystem::path& new_backup_file_path) {
  system::error_code error_code;

  bool file_exists = filesystem::exists(file_from_path, error_code);
  if (error_code.failed() &&
      error_code != system::errc::no_such_file_or_directory) {
    std::cout << std::format("can't check existance of {}. error message: {}",
                             file_from_path.string(), error_code.what());
    return error_code;
  }

  bool old_backup_exists = filesystem::exists(old_backup_file_path, error_code);

  if (error_code.failed() &&
      error_code != system::errc::no_such_file_or_directory) {
    std::cout << std::format("can't check existance of {}. error message: {}",
                             old_backup_file_path.string(), error_code.what());
    return error_code;
  }

  if (!file_exists && old_backup_exists) {
    if (filesystem::is_directory(old_backup_file_path)) {
      filesystem::create_directories(new_backup_file_path);
      const auto deleted_directory_tag_path =
          new_backup_file_path / utils::kDeleteMark;
      filesystem::ofstream deleted_directory_tag(deleted_directory_tag_path);
      if (!deleted_directory_tag.is_open()) {
        std::cout << std::format("can't create {}",
                                 deleted_directory_tag_path.string());
      }
      return error_code;
    }
    const auto deleted_file_mark_path =
        new_backup_file_path.parent_path() /
        (utils::kDeleteMark + new_backup_file_path.filename().string());
    filesystem::ofstream new_backup_file(deleted_file_mark_path);
    if (!new_backup_file.is_open()) {
      std::cout << std::format("can't create {}",
                               deleted_file_mark_path.string());
    }
    return error_code;
  }

  bool changed;
  if (auto&& [changed, error_code] =
          IsChanged(old_backup_file_path, file_from_path);
      (file_exists && !old_backup_exists) ||
      (file_exists && old_backup_exists && changed)) {
    error_code = CopyFile(file_from_path, new_backup_file_path, from_path);
    return error_code;
  }

  return error_code;
}

}  // namespace

void DoFullBackup(const std::string& backup_from,
                  const std::string& backup_to) {
  auto [from_path, to_path] = PrepareForBackup(backup_from, backup_to);

  MakeBackupTag(to_path, utils::kFullTag);

  system::error_code error_code;

  auto iterator =
      filesystem::recursive_directory_iterator(from_path, error_code);
  if (error_code.failed()) {
    throw std::runtime_error(
        std::format("failed to read directory {}. error message : {}\n",
                    from_path.string(), error_code.what()));
  }
  for (; iterator != filesystem::end(iterator);
       iterator.increment(error_code)) {
    if (error_code.failed()) {
      std::cout << std::format(
          "failed to read direntry of {}. error message : {}\n",
          from_path.string(), error_code.what());
      continue;
    }
    const auto& cur_path = iterator->path();
    const auto relative_path = cur_path.lexically_relative(from_path);

    filesystem::path new_path = to_path / relative_path;

    error_code = CopyFile(cur_path, new_path, from_path);
    if (error_code.failed()) {
      continue;
    }
  }
}

void DoIncrementalBackup(const std::string& backup_from,
                         const std::string& backup_to) {
  auto [from_path, to_path] = PrepareForBackup(backup_from, backup_to);

  MakeBackupTag(to_path, utils::kIncrementalTag);

  filesystem::path last_full_backup = FindLastFullBackup(backup_to);

  if (last_full_backup.string().empty()) {
    std::cout << std::format(
        "previous full backup in {} not found, terminating", backup_to);
    return;
  }

  system::error_code error_code;

  auto from_path_iterator =
      filesystem::recursive_directory_iterator(from_path, error_code);
  if (error_code.failed()) {
    throw std::runtime_error(
        std::format("failed to read directory {}. error message : {}\n",
                    from_path.string(), error_code.what()));
  }

  auto last_backup_iterator =
      filesystem::recursive_directory_iterator(last_full_backup, error_code);
  if (error_code.failed()) {
    throw std::runtime_error(
        std::format("failed to read directory {}. error message : {}\n",
                    last_full_backup.string(), error_code.what()));
  }

  auto files_range = boost::join(from_path_iterator, last_backup_iterator);

  std::set<std::string> relatice_paths_for_process;

  for (const auto& direntry : files_range) {
    const auto cur_path = direntry.path();
    if (cur_path.filename() == utils::kBackupTag) {
      continue;
    }

    const auto file_relative_path =
        cur_path.lexically_normal().string().starts_with(
            from_path.lexically_normal().string())
            ? cur_path.lexically_relative(from_path)
            : cur_path.lexically_relative(last_full_backup);

    relatice_paths_for_process.insert(file_relative_path.string());
  }

  for (const auto& file_relative_path : relatice_paths_for_process) {
    const auto file_from_path = from_path / file_relative_path;
    const auto old_backup_file_path = last_full_backup / file_relative_path;
    const auto new_backup_file_path = to_path / file_relative_path;

    error_code = ProcessIncrementalUpdateFile(
        file_from_path, from_path, old_backup_file_path, new_backup_file_path);
    if (error_code.failed()) {
      continue;
    }
  }
}

}  // namespace core
