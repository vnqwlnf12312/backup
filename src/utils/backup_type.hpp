#pragma once

#include <optional>

#include <boost/filesystem.hpp>

namespace utils {

constexpr std::string_view kFullTag = "full";
constexpr std::string_view kIncrementalTag = "incremental";
const std::string kDeleteMark = "DELETED";
const std::string kBackupTag = "backup_tag";

namespace filesystem = boost::filesystem;

enum class BackupType {
        kFull,
        kIncremental
};

std::string GetBackupTag(const filesystem::path& path);

void MakeBackupTag(const filesystem::path& path, std::string_view tag);

}