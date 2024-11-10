#include "parse_command_line.hpp"

#include <boost/program_options.hpp>

#include <vector>
#include <format>


namespace parsing {

namespace program_options = boost::program_options;

ParseResult ParseCommandLineArguments(int argc, char* argv[]) {
  program_options::options_description description("Allowed options");
  description.add_options()
      ("help", "produce help message")
      ("type", program_options::value<std::string>(), "set backup type")
      ("backup_directories", program_options::value<std::vector<std::string>>(), "directories to do backup from and to");

  program_options::positional_options_description positional_descriptions;
  positional_descriptions.add("backup_directories", -1);

  program_options::variables_map variables_map;
  program_options::store(program_options::command_line_parser(argc, argv).options(description).positional(positional_descriptions).run(), variables_map);
  program_options::notify(variables_map);

  ParseResult parse_result;

  parse_result.help_flag = variables_map.contains("help");

  if (variables_map.contains("type")) {
    if (variables_map["type"].as<std::string>() == "full") {
      parse_result.backup_type = utils::BackupType::kFull;
    } else if (variables_map["type"].as<std::string>() == "incremental") {
      parse_result.backup_type = utils::BackupType::kIncremental;
    }
  }

  if (variables_map.contains("backup_directories"))  {
    const auto backup_directories = variables_map["backup_directories"].as<std::vector<std::string>>();
    if (backup_directories.size() != 2) {
      throw std::length_error(std::format("expected exactly 2 arguments for backup directories, got {}", backup_directories.size()));
    }
    parse_result.from = backup_directories[0];
    parse_result.to = backup_directories[1];
  }

  return parse_result;
}

}  // namespace models::parser
