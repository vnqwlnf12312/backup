cmake_minimum_required(VERSION 3.31)
project(BACKUP)

set(CMAKE_CXX_STANDARD 23)

set(BACKUP_MAIN_SRC_DIR  ${CMAKE_CURRENT_SOURCE_DIR}/src)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

include_directories(${BACKUP_MAIN_SRC_DIR})

macro(create_sources_list LIB_NAME)
    define_property(GLOBAL PROPERTY "${LIB_NAME}_SOURCES"
    BRIEF_DOCS "${LIB_NAME} sources" FULL_DOCS "${LIB_NAME} sources")
    set_property(GLOBAL PROPERTY "${LIB_NAME}_SOURCES" "")
endmacro()

macro(add_sources LIB_NAME SOURCES)
  set_property(GLOBAL APPEND PROPERTY "${LIB_NAME}_SOURCES" ${SOURCES})
endmacro()

macro(create_library LIB_NAME)
    get_property("${LIB_NAME}_SOURCES_VALUE" GLOBAL PROPERTY "${LIB_NAME}_SOURCES")
    add_library(${LIB_NAME} "${${LIB_NAME}_SOURCES_VALUE}")
endmacro()

find_package(Boost 1.86.0 REQUIRED COMPONENTS filesystem program_options)

include_directories(${Boost_INCLUDE_DIRS}) 

add_subdirectory(src)
