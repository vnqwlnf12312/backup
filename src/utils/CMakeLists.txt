set(LIB_NAME utils)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/get_current_time.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/backup_type.cpp
)

create_sources_list(${LIB_NAME})

add_sources(${LIB_NAME} "${SOURCES}")

create_library(${LIB_NAME})

target_link_libraries(${LIB_NAME} Boost::filesystem)