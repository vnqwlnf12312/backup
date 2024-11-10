#include "run_my_restore.hpp"

#include <iostream>

#include <parsing/parse_command_line.hpp>
#include <core/do_restore.hpp>
#include <core/get_help_message.hpp>

namespace core {

void RunMyRestore(int argc, char* argv[]) {
  parsing::ParseResult parse_result;
  parse_result = parsing::ParseCommandLineArguments(argc, argv);
  
  if (parse_result.help_flag) {
    constexpr auto kHelpMessage = GetHelpMessage();
    std::cout << kHelpMessage;
    return;
  }

  if (parse_result.from.empty() || parse_result.to.empty()) {
    throw std::logic_error("please, specify directories for restore: restore_from and restore_to (see --help)");
  }

  DoRestore(parse_result.from, parse_result.to);
}

}