#include <exception>
#include <iostream>

#include <core/run_my_backup.hpp>

int main(int argc, char** argv) {
    try {
        core::RunMyBackup(argc, argv);
    } catch (const std::exception& exception) {
        std::cout << exception.what();
        return -1;
    }
    return 0;
}