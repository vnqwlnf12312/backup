add_executable(backup main.cpp)

include_directories(backup PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})

add_subdirectory(core)

target_link_libraries(backup PRIVATE backup_core)