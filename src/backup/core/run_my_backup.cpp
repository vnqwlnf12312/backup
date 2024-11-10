#include "run_my_backup.hpp"

#include <iostream>
#include <stdexcept>

#include <core/do_backup.hpp>
#include <core/get_help_message.hpp>
#include <parsing/parse_command_line.hpp>

namespace core {

void RunMyBackup(int argc, char* argv[]) {
  parsing::ParseResult parse_result;
  parse_result = parsing::ParseCommandLineArguments(argc, argv);

  if (parse_result.help_flag) {
    constexpr auto kHelpMessage = GetHelpMessage();
    std::cout << kHelpMessage;
    return;
  }

  if (!parse_result.backup_type.has_value()) {
    throw std::logic_error("please, specify backup type using --type option");
  }

  if (parse_result.from.empty() || parse_result.to.empty()) {
    throw std::logic_error(
        "please, specify directories for backup: backup_from and backup_to "
        "(see --help)");
  }

  switch (parse_result.backup_type.value()) {
    case utils::BackupType::kFull: {
      DoFullBackup(parse_result.from, parse_result.to);
      break;
    }
    case utils::BackupType::kIncremental: {
      DoIncrementalBackup(parse_result.from, parse_result.to);
      break;
    }
  }
}

}  // namespace core
