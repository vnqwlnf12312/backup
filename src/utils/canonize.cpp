#include "canonize.hpp"

#include <exception>
#include <format>

namespace utils {

namespace system = boost::system;
namespace filesystem = boost::filesystem;

filesystem::path Canonize(const filesystem::path& path) {
  system::error_code error_code;
  auto canonized = filesystem::canonical(path, error_code);
  if (error_code.failed()) {
    throw std::runtime_error(
        std::format("failed to canonize {}. error message: {}", path.string(),
                    error_code.what()));
  }
  while (!canonized.empty() && canonized.string().back() == '/') {
    canonized = canonized.remove_trailing_separator();
  }
  return canonized;
}

}  // namespace utils
