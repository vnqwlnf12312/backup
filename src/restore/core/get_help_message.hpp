#pragma once

#include <string_view>

namespace core {

constexpr std::string_view GetHelpMessage() {
  return "command line util to restore from a backup\n"
         "parameters:\n"
         "--help: print this message\n"
         "backup_from backup_to - directories to run restore for";
}

}  // namespace core
