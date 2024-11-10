#pragma once

#include <string_view>

namespace core {

constexpr std::string_view GetHelpMessage() {
  return "command line util for directory backup\n"
         "parameters:\n"
         "--help: print this message\n"
         "--type=<Type> backup type, should be full or incremental\n"
         "arguments:\n"
         "backup_from backup_to - directories to run backup for";
}

}  // namespace core
