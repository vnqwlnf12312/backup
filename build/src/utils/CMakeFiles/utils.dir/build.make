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
include src/utils/CMakeFiles/utils.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/utils/CMakeFiles/utils.dir/compiler_depend.make

# Include the progress variables for this target.
include src/utils/CMakeFiles/utils.dir/progress.make

# Include the compile flags for this target's objects.
include src/utils/CMakeFiles/utils.dir/flags.make

src/utils/CMakeFiles/utils.dir/codegen:
.PHONY : src/utils/CMakeFiles/utils.dir/codegen

src/utils/CMakeFiles/utils.dir/get_current_time.cpp.o: src/utils/CMakeFiles/utils.dir/flags.make
src/utils/CMakeFiles/utils.dir/get_current_time.cpp.o: /Users/amir/trash/backup/src/utils/get_current_time.cpp
src/utils/CMakeFiles/utils.dir/get_current_time.cpp.o: src/utils/CMakeFiles/utils.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/amir/trash/backup/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/utils/CMakeFiles/utils.dir/get_current_time.cpp.o"
	cd /Users/amir/trash/backup/build/src/utils && /opt/homebrew/bin/aarch64-apple-darwin23-g++-14 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/utils/CMakeFiles/utils.dir/get_current_time.cpp.o -MF CMakeFiles/utils.dir/get_current_time.cpp.o.d -o CMakeFiles/utils.dir/get_current_time.cpp.o -c /Users/amir/trash/backup/src/utils/get_current_time.cpp

src/utils/CMakeFiles/utils.dir/get_current_time.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/utils.dir/get_current_time.cpp.i"
	cd /Users/amir/trash/backup/build/src/utils && /opt/homebrew/bin/aarch64-apple-darwin23-g++-14 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/amir/trash/backup/src/utils/get_current_time.cpp > CMakeFiles/utils.dir/get_current_time.cpp.i

src/utils/CMakeFiles/utils.dir/get_current_time.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/utils.dir/get_current_time.cpp.s"
	cd /Users/amir/trash/backup/build/src/utils && /opt/homebrew/bin/aarch64-apple-darwin23-g++-14 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/amir/trash/backup/src/utils/get_current_time.cpp -o CMakeFiles/utils.dir/get_current_time.cpp.s

src/utils/CMakeFiles/utils.dir/backup_type.cpp.o: src/utils/CMakeFiles/utils.dir/flags.make
src/utils/CMakeFiles/utils.dir/backup_type.cpp.o: /Users/amir/trash/backup/src/utils/backup_type.cpp
src/utils/CMakeFiles/utils.dir/backup_type.cpp.o: src/utils/CMakeFiles/utils.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/amir/trash/backup/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/utils/CMakeFiles/utils.dir/backup_type.cpp.o"
	cd /Users/amir/trash/backup/build/src/utils && /opt/homebrew/bin/aarch64-apple-darwin23-g++-14 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/utils/CMakeFiles/utils.dir/backup_type.cpp.o -MF CMakeFiles/utils.dir/backup_type.cpp.o.d -o CMakeFiles/utils.dir/backup_type.cpp.o -c /Users/amir/trash/backup/src/utils/backup_type.cpp

src/utils/CMakeFiles/utils.dir/backup_type.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/utils.dir/backup_type.cpp.i"
	cd /Users/amir/trash/backup/build/src/utils && /opt/homebrew/bin/aarch64-apple-darwin23-g++-14 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/amir/trash/backup/src/utils/backup_type.cpp > CMakeFiles/utils.dir/backup_type.cpp.i

src/utils/CMakeFiles/utils.dir/backup_type.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/utils.dir/backup_type.cpp.s"
	cd /Users/amir/trash/backup/build/src/utils && /opt/homebrew/bin/aarch64-apple-darwin23-g++-14 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/amir/trash/backup/src/utils/backup_type.cpp -o CMakeFiles/utils.dir/backup_type.cpp.s

src/utils/CMakeFiles/utils.dir/canonize.cpp.o: src/utils/CMakeFiles/utils.dir/flags.make
src/utils/CMakeFiles/utils.dir/canonize.cpp.o: /Users/amir/trash/backup/src/utils/canonize.cpp
src/utils/CMakeFiles/utils.dir/canonize.cpp.o: src/utils/CMakeFiles/utils.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/amir/trash/backup/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/utils/CMakeFiles/utils.dir/canonize.cpp.o"
	cd /Users/amir/trash/backup/build/src/utils && /opt/homebrew/bin/aarch64-apple-darwin23-g++-14 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/utils/CMakeFiles/utils.dir/canonize.cpp.o -MF CMakeFiles/utils.dir/canonize.cpp.o.d -o CMakeFiles/utils.dir/canonize.cpp.o -c /Users/amir/trash/backup/src/utils/canonize.cpp

src/utils/CMakeFiles/utils.dir/canonize.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/utils.dir/canonize.cpp.i"
	cd /Users/amir/trash/backup/build/src/utils && /opt/homebrew/bin/aarch64-apple-darwin23-g++-14 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/amir/trash/backup/src/utils/canonize.cpp > CMakeFiles/utils.dir/canonize.cpp.i

src/utils/CMakeFiles/utils.dir/canonize.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/utils.dir/canonize.cpp.s"
	cd /Users/amir/trash/backup/build/src/utils && /opt/homebrew/bin/aarch64-apple-darwin23-g++-14 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/amir/trash/backup/src/utils/canonize.cpp -o CMakeFiles/utils.dir/canonize.cpp.s

# Object files for target utils
utils_OBJECTS = \
"CMakeFiles/utils.dir/get_current_time.cpp.o" \
"CMakeFiles/utils.dir/backup_type.cpp.o" \
"CMakeFiles/utils.dir/canonize.cpp.o"

# External object files for target utils
utils_EXTERNAL_OBJECTS =

src/utils/libutils.a: src/utils/CMakeFiles/utils.dir/get_current_time.cpp.o
src/utils/libutils.a: src/utils/CMakeFiles/utils.dir/backup_type.cpp.o
src/utils/libutils.a: src/utils/CMakeFiles/utils.dir/canonize.cpp.o
src/utils/libutils.a: src/utils/CMakeFiles/utils.dir/build.make
src/utils/libutils.a: src/utils/CMakeFiles/utils.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/amir/trash/backup/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX static library libutils.a"
	cd /Users/amir/trash/backup/build/src/utils && $(CMAKE_COMMAND) -P CMakeFiles/utils.dir/cmake_clean_target.cmake
	cd /Users/amir/trash/backup/build/src/utils && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/utils.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/utils/CMakeFiles/utils.dir/build: src/utils/libutils.a
.PHONY : src/utils/CMakeFiles/utils.dir/build

src/utils/CMakeFiles/utils.dir/clean:
	cd /Users/amir/trash/backup/build/src/utils && $(CMAKE_COMMAND) -P CMakeFiles/utils.dir/cmake_clean.cmake
.PHONY : src/utils/CMakeFiles/utils.dir/clean

src/utils/CMakeFiles/utils.dir/depend:
	cd /Users/amir/trash/backup/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/amir/trash/backup /Users/amir/trash/backup/src/utils /Users/amir/trash/backup/build /Users/amir/trash/backup/build/src/utils /Users/amir/trash/backup/build/src/utils/CMakeFiles/utils.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : src/utils/CMakeFiles/utils.dir/depend

