#include "do_restore.hpp"

#include <format>

#include <boost/filesystem.hpp>

#include <utils/backup_type.hpp>

namespace core {

namespace {

namespace system = boost::system;
namespace filesystem = boost::filesystem;

void RestoreBackup(const filesystem::path& from_path,
                   const filesystem::path& to_path,
                   filesystem::copy_options copy_options) {
  for (const auto& direntry :
       filesystem::recursive_directory_iterator(from_path)) {
    const auto cur_path = direntry.path();
    if (cur_path.filename() == utils::kBackupTag) {
      continue;
    }

    const auto relative_path = cur_path.lexically_relative(from_path);

    filesystem::path new_path = to_path / relative_path;

    filesystem::copy(cur_path, new_path, copy_options);
  }
}

filesystem::path FindLastFullBackup(const filesystem::path& backup_path) {
  const auto backups_folder = backup_path.parent_path();
  filesystem::path latest_backup;

  for (const auto& dirent : filesystem::directory_iterator(backups_folder)) {
    const auto cur_path = dirent.path();
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
  filesystem::path from_path = restore_from;
  if (!filesystem::exists(from_path) || !filesystem::is_directory(from_path)) {
    throw std::runtime_error(std::format(
        "can't restore from path {} doesn't exist or is not directory\n",
        from_path.string()));
  }
  from_path = filesystem::canonical(from_path);

  filesystem::path to_path = filesystem::canonical(restore_to);

  system::error_code error_code;

  filesystem::create_directories(to_path, error_code);

  if (error_code.failed() && error_code != system::errc::file_exists) {
    throw std::runtime_error(
        std::format("can't create {} directory for backup. error message: {}\n",
                    to_path.string(), error_code.what()));
  }

  if (utils::GetBackupTag(from_path) == utils::kFullTag) {
    RestoreBackup(from_path, to_path, filesystem::copy_options::copy_symlinks);
    return;
  }

  const auto last_full_backup_path = FindLastFullBackup(from_path);

  RestoreBackup(from_path, to_path, filesystem::copy_options::copy_symlinks);
  RestoreBackup(last_full_backup_path, to_path,
                filesystem::copy_options::copy_symlinks |
                    filesystem::copy_options::skip_existing);
}

}  // namespace core
