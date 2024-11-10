set(LIB_NAME restore_core)

set(SOURCES
  ${CMAKE_CURRENT_SOURCE_DIR}/run_my_restore.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/do_restore.cpp
)

create_sources_list(${LIB_NAME})

add_sources(${LIB_NAME} "${SOURCES}")

create_library(${LIB_NAME})

target_link_libraries(${LIB_NAME} Boost::filesystem)
