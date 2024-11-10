#pragma once

#include <optional>
#include <string>

#include <utils/backup_type.hpp>

namespace parsing {

struct ParseResult {
  bool help_flag;
  std::optional<utils::BackupType> backup_type;
  std::string from;
  std::string to;
};

ParseResult ParseCommandLineArguments(int argc, char* argv[]);

}  // namespace parsing
