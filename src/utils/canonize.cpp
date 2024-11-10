#include "canonize.hpp"

#include <format>
#include <iostream>

namespace utils {

namespace system = boost::system;
namespace filesystem = boost::filesystem;

filesystem::path Canonize(const filesystem::path& path) {
  system::error_code error_code;
  auto canonized = filesystem::canonical(path, error_code);
  if (error_code.failed()) {
    std::cout << std::format("failed to canonize {}. error message: {}",
                             path.string(), error_code.what());
    return {};
  }
  while (!canonized.empty() && canonized.string().back() == '/') {
    canonized = canonized.remove_trailing_separator();
  }
  return canonized;
}

}  // namespace utils
