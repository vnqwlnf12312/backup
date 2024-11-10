add_executable(restore main.cpp)

include_directories(restore PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})

add_subdirectory(core)

target_link_libraries(restore PRIVATE restore_core)