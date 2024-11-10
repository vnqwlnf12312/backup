#include <exception>
#include <iostream>

#include <core/run_my_restore.hpp>

int main(int argc, char* argv[]) {
  try {
    core::RunMyRestore(argc, argv);
  } catch (const std::exception& exception) {
    std::cout << exception.what();
    return -1;
  }
  return 0;
}
