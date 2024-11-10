#include "do_restore.hpp"

#include <format>
#include <iostream>

#include <boost/filesystem.hpp>

#include <utils/backup_type.hpp>
#include <utils/canonize.hpp>

namespace core {

namespace {

namespace system = boost::system;
namespace filesystem = boost::filesystem;

void RestoreBackup(const filesystem::path& from_path,
                   const filesystem::path& to_path,
                   filesystem::copy_options copy_options) {
  system::error_code error_code;
  for (const auto& direntry :
       filesystem::recursive_directory_iterator(from_path, error_code)) {
    const auto cur_path = direntry.path();
    if (error_code.failed()) {
      std::cout << std::format("failed to read {}. error message: {}",
                               cur_path.string(), error_code.what());
      continue;
    }
    if (cur_path.filename() == utils::kBackupTag) {
      continue;
    }

    if (cur_path.filename() == utils::kDeleteMark) {
      const auto dir_path = cur_path.parent_path();

      const auto relative_path = dir_path.lexically_relative(from_path);
      const auto new_path = to_path / relative_path;
      filesystem::remove_all(new_path, error_code);
      if (error_code.failed()) {
        std::cout << std::format(
            "failed to delete directory {}. error message: {}",
            new_path.string(), error_code.what());
        continue;
      }
      continue;
    }

    if (cur_path.filename().string().starts_with(utils::kDeleteMark)) {
      const auto relative_path = cur_path.lexically_relative(from_path);
      const auto new_path = to_path / cur_path.filename().string().substr(
                                          utils::kDeleteMark.size());
      filesystem::remove(new_path, error_code);
      if (error_code.failed()) {
        std::cout << std::format("failed to delete file {}. error message: {}",
                                 new_path.string(), error_code.what());
        continue;
      }
      continue;
    }

    const auto relative_path = cur_path.lexically_relative(from_path);

    filesystem::path new_path = to_path / relative_path;

    filesystem::copy(cur_path, new_path, copy_options, error_code);
    if (error_code.failed()) {
      std::cout << std::format("failed to copy {} to {}. error message: {}",
                               cur_path.string(), new_path.string(),
                               error_code.what());
      continue;
    }
  }
}

filesystem::path FindLastFullBackup(const filesystem::path& backup_path) {
  const auto backups_folder = backup_path.parent_path();
  filesystem::path latest_backup;

  system::error_code error_code;

  for (const auto& dirent :
       filesystem::directory_iterator(backups_folder, error_code)) {
    const auto cur_path = dirent.path();
    if (error_code.failed()) {
      std::cout << std::format("failed to read {}. error message: {}",
                               cur_path.string(), error_code.what());
      continue;
    }
    if (cur_path.string() < backup_path.string() &&
        latest_backup.string() < cur_path.string() &&
        utils::GetBackupTag(cur_path) == utils::kFullTag) {
      latest_backup = cur_path;
    }
  }

  return latest_backup;
}

}  // namespace

void DoRestore(const std::string& restore_from, const std::string& restore_to) {
  system::error_code error_code;

  filesystem::path from_path = utils::Canonize(restore_from);

  bool from_is_directory = filesystem::is_directory(from_path, error_code);
  if (error_code.failed() && error_code != system::errc::no_such_file_or_directory) {
    throw std::runtime_error(
        std::format("failed to check if {} is directory. error message: {}",
                    from_path.string(), error_code.what()));
  }

  if (!from_is_directory) {
    throw std::runtime_error(std::format(
        "can't restore from path {} doesn't exist or is not directory",
        from_path.string()));
  }

  filesystem::path to_path = restore_to;

  bool to_is_directory = filesystem::is_directory(to_path, error_code);
  if (error_code.failed() &&
      error_code != system::errc::no_such_file_or_directory) {
    throw std::runtime_error(std::format(
        "failed to check if {} is directory. error message: {}",
        to_path.string(), error_code.what()));
  }

  if (to_is_directory) {
    filesystem::remove_all(to_path, error_code);
    if (error_code.failed()) {
      throw std::runtime_error(std::format(
          "failed to delete directory {}. error message: {}", to_path.string(),
          error_code.what()));
    }
  }

  filesystem::create_directories(to_path, error_code);
  if (error_code.failed()) {
    throw std::runtime_error(
        std::format("can't create {} directory for backup. error message: {}",
                    to_path.string(), error_code.what()));
  }

  to_path = utils::Canonize(to_path);

  if (utils::GetBackupTag(from_path) == utils::kFullTag) {
    RestoreBackup(from_path, to_path, filesystem::copy_options::copy_symlinks);
    return;
  }

  const auto last_full_backup_path = FindLastFullBackup(from_path);
  if (last_full_backup_path.string().empty()) {
    throw std::runtime_error(std::format(
        "failed to find previous full backup for given incremental backup {}",
        from_path.string()));
  }

  RestoreBackup(last_full_backup_path, to_path,
                filesystem::copy_options::copy_symlinks);
  RestoreBackup(from_path, to_path,
                filesystem::copy_options::copy_symlinks |
                    filesystem::copy_options::overwrite_existing);
}

}  // namespace core
