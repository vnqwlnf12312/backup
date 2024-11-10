set(LIB_NAME backup_core)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/run_my_backup.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/do_backup.cpp
)

create_sources_list(${LIB_NAME})

add_sources(${LIB_NAME} "${SOURCES}")

create_library(${LIB_NAME})

target_link_libraries(${LIB_NAME} Boost::filesystem)
