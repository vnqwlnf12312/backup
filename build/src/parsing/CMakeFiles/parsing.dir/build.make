# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.31.0/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.31.0/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/amir/trash/backup

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/amir/trash/backup/build

# Include any dependencies generated for this target.
include src/parsing/CMakeFiles/parsing.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/parsing/CMakeFiles/parsing.dir/compiler_depend.make

# Include the progress variables for this target.
include src/parsing/CMakeFiles/parsing.dir/progress.make

# Include the compile flags for this target's objects.
include src/parsing/CMakeFiles/parsing.dir/flags.make

src/parsing/CMakeFiles/parsing.dir/codegen:
.PHONY : src/parsing/CMakeFiles/parsing.dir/codegen

src/parsing/CMakeFiles/parsing.dir/parse_command_line.cpp.o: src/parsing/CMakeFiles/parsing.dir/flags.make
src/parsing/CMakeFiles/parsing.dir/parse_command_line.cpp.o: /Users/amir/trash/backup/src/parsing/parse_command_line.cpp
src/parsing/CMakeFiles/parsing.dir/parse_command_line.cpp.o: src/parsing/CMakeFiles/parsing.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/amir/trash/backup/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/parsing/CMakeFiles/parsing.dir/parse_command_line.cpp.o"
	cd /Users/amir/trash/backup/build/src/parsing && /opt/homebrew/bin/aarch64-apple-darwin23-g++-14 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/parsing/CMakeFiles/parsing.dir/parse_command_line.cpp.o -MF CMakeFiles/parsing.dir/parse_command_line.cpp.o.d -o CMakeFiles/parsing.dir/parse_command_line.cpp.o -c /Users/amir/trash/backup/src/parsing/parse_command_line.cpp

src/parsing/CMakeFiles/parsing.dir/parse_command_line.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/parsing.dir/parse_command_line.cpp.i"
	cd /Users/amir/trash/backup/build/src/parsing && /opt/homebrew/bin/aarch64-apple-darwin23-g++-14 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/amir/trash/backup/src/parsing/parse_command_line.cpp > CMakeFiles/parsing.dir/parse_command_line.cpp.i

src/parsing/CMakeFiles/parsing.dir/parse_command_line.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/parsing.dir/parse_command_line.cpp.s"
	cd /Users/amir/trash/backup/build/src/parsing && /opt/homebrew/bin/aarch64-apple-darwin23-g++-14 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/amir/trash/backup/src/parsing/parse_command_line.cpp -o CMakeFiles/parsing.dir/parse_command_line.cpp.s

# Object files for target parsing
parsing_OBJECTS = \
"CMakeFiles/parsing.dir/parse_command_line.cpp.o"

# External object files for target parsing
parsing_EXTERNAL_OBJECTS =

src/parsing/libparsing.a: src/parsing/CMakeFiles/parsing.dir/parse_command_line.cpp.o
src/parsing/libparsing.a: src/parsing/CMakeFiles/parsing.dir/build.make
src/parsing/libparsing.a: src/parsing/CMakeFiles/parsing.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/amir/trash/backup/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libparsing.a"
	cd /Users/amir/trash/backup/build/src/parsing && $(CMAKE_COMMAND) -P CMakeFiles/parsing.dir/cmake_clean_target.cmake
	cd /Users/amir/trash/backup/build/src/parsing && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/parsing.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/parsing/CMakeFiles/parsing.dir/build: src/parsing/libparsing.a
.PHONY : src/parsing/CMakeFiles/parsing.dir/build

src/parsing/CMakeFiles/parsing.dir/clean:
	cd /Users/amir/trash/backup/build/src/parsing && $(CMAKE_COMMAND) -P CMakeFiles/parsing.dir/cmake_clean.cmake
.PHONY : src/parsing/CMakeFiles/parsing.dir/clean

src/parsing/CMakeFiles/parsing.dir/depend:
	cd /Users/amir/trash/backup/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/amir/trash/backup /Users/amir/trash/backup/src/parsing /Users/amir/trash/backup/build /Users/amir/trash/backup/build/src/parsing /Users/amir/trash/backup/build/src/parsing/CMakeFiles/parsing.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : src/parsing/CMakeFiles/parsing.dir/depend

