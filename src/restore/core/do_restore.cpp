#include "do_restore.hpp"

#include <boost/filesystem.hpp>

#include <format>
#include <iostream>

#include <utils/backup_type.hpp>

namespace core {

namespace {

namespace system = boost::system;
namespace filesystem = boost::filesystem;

}  // namespace

void DoRestore(const std::string& restore_from,
                  const std::string& restore_to) {
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

    for (const auto& direntry : filesystem::recursive_directory_iterator(from_path)) {
      const auto cur_path = direntry.path();
      if (cur_path.filename() == utils::kBackupTag) {
        continue;
      }

      const auto relative_path = cur_path.lexically_relative(from_path);

      filesystem::path new_path = to_path / relative_path;

      filesystem::copy(cur_path, new_path, filesystem::copy_options::copy_symlinks);
    }
}

}  // namespace core
