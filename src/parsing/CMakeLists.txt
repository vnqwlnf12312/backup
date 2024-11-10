set(LIB_NAME parsing)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/parse_command_line.cpp
)

create_sources_list(${LIB_NAME})

add_sources(${LIB_NAME} "${SOURCES}")

create_library(${LIB_NAME})

target_link_libraries(${LIB_NAME} Boost::program_options)