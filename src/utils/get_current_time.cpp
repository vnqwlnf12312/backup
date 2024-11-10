#include "get_current_time.hpp"

#include <chrono>

namespace utils {

std::string GetCurretTime() {
  auto now = std::chrono::zoned_time(
        std::chrono::current_zone(),
        std::chrono::floor<std::chrono::seconds>(std::chrono::system_clock::now()));
  return std::format("{:%F_%H-%M-%S}", now);
}

}