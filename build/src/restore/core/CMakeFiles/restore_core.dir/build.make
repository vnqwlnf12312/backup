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
include src/restore/core/CMakeFiles/restore_core.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/restore/core/CMakeFiles/restore_core.dir/compiler_depend.make

# Include the progress variables for this target.
include src/restore/core/CMakeFiles/restore_core.dir/progress.make

# Include the compile flags for this target's objects.
include src/restore/core/CMakeFiles/restore_core.dir/flags.make

src/restore/core/CMakeFiles/restore_core.dir/codegen:
.PHONY : src/restore/core/CMakeFiles/restore_core.dir/codegen

src/restore/core/CMakeFiles/restore_core.dir/run_my_restore.cpp.o: src/restore/core/CMakeFiles/restore_core.dir/flags.make
src/restore/core/CMakeFiles/restore_core.dir/run_my_restore.cpp.o: /Users/amir/trash/backup/src/restore/core/run_my_restore.cpp
src/restore/core/CMakeFiles/restore_core.dir/run_my_restore.cpp.o: src/restore/core/CMakeFiles/restore_core.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/amir/trash/backup/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/restore/core/CMakeFiles/restore_core.dir/run_my_restore.cpp.o"
	cd /Users/amir/trash/backup/build/src/restore/core && /opt/homebrew/bin/aarch64-apple-darwin23-g++-14 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/restore/core/CMakeFiles/restore_core.dir/run_my_restore.cpp.o -MF CMakeFiles/restore_core.dir/run_my_restore.cpp.o.d -o CMakeFiles/restore_core.dir/run_my_restore.cpp.o -c /Users/amir/trash/backup/src/restore/core/run_my_restore.cpp

src/restore/core/CMakeFiles/restore_core.dir/run_my_restore.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/restore_core.dir/run_my_restore.cpp.i"
	cd /Users/amir/trash/backup/build/src/restore/core && /opt/homebrew/bin/aarch64-apple-darwin23-g++-14 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/amir/trash/backup/src/restore/core/run_my_restore.cpp > CMakeFiles/restore_core.dir/run_my_restore.cpp.i

src/restore/core/CMakeFiles/restore_core.dir/run_my_restore.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/restore_core.dir/run_my_restore.cpp.s"
	cd /Users/amir/trash/backup/build/src/restore/core && /opt/homebrew/bin/aarch64-apple-darwin23-g++-14 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/amir/trash/backup/src/restore/core/run_my_restore.cpp -o CMakeFiles/restore_core.dir/run_my_restore.cpp.s

src/restore/core/CMakeFiles/restore_core.dir/do_restore.cpp.o: src/restore/core/CMakeFiles/restore_core.dir/flags.make
src/restore/core/CMakeFiles/restore_core.dir/do_restore.cpp.o: /Users/amir/trash/backup/src/restore/core/do_restore.cpp
src/restore/core/CMakeFiles/restore_core.dir/do_restore.cpp.o: src/restore/core/CMakeFiles/restore_core.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/amir/trash/backup/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/restore/core/CMakeFiles/restore_core.dir/do_restore.cpp.o"
	cd /Users/amir/trash/backup/build/src/restore/core && /opt/homebrew/bin/aarch64-apple-darwin23-g++-14 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/restore/core/CMakeFiles/restore_core.dir/do_restore.cpp.o -MF CMakeFiles/restore_core.dir/do_restore.cpp.o.d -o CMakeFiles/restore_core.dir/do_restore.cpp.o -c /Users/amir/trash/backup/src/restore/core/do_restore.cpp

src/restore/core/CMakeFiles/restore_core.dir/do_restore.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/restore_core.dir/do_restore.cpp.i"
	cd /Users/amir/trash/backup/build/src/restore/core && /opt/homebrew/bin/aarch64-apple-darwin23-g++-14 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/amir/trash/backup/src/restore/core/do_restore.cpp > CMakeFiles/restore_core.dir/do_restore.cpp.i

src/restore/core/CMakeFiles/restore_core.dir/do_restore.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/restore_core.dir/do_restore.cpp.s"
	cd /Users/amir/trash/backup/build/src/restore/core && /opt/homebrew/bin/aarch64-apple-darwin23-g++-14 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/amir/trash/backup/src/restore/core/do_restore.cpp -o CMakeFiles/restore_core.dir/do_restore.cpp.s

# Object files for target restore_core
restore_core_OBJECTS = \
"CMakeFiles/restore_core.dir/run_my_restore.cpp.o" \
"CMakeFiles/restore_core.dir/do_restore.cpp.o"

# External object files for target restore_core
restore_core_EXTERNAL_OBJECTS =

src/restore/core/librestore_core.a: src/restore/core/CMakeFiles/restore_core.dir/run_my_restore.cpp.o
src/restore/core/librestore_core.a: src/restore/core/CMakeFiles/restore_core.dir/do_restore.cpp.o
src/restore/core/librestore_core.a: src/restore/core/CMakeFiles/restore_core.dir/build.make
src/restore/core/librestore_core.a: src/restore/core/CMakeFiles/restore_core.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/amir/trash/backup/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library librestore_core.a"
	cd /Users/amir/trash/backup/build/src/restore/core && $(CMAKE_COMMAND) -P CMakeFiles/restore_core.dir/cmake_clean_target.cmake
	cd /Users/amir/trash/backup/build/src/restore/core && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/restore_core.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/restore/core/CMakeFiles/restore_core.dir/build: src/restore/core/librestore_core.a
.PHONY : src/restore/core/CMakeFiles/restore_core.dir/build

src/restore/core/CMakeFiles/restore_core.dir/clean:
	cd /Users/amir/trash/backup/build/src/restore/core && $(CMAKE_COMMAND) -P CMakeFiles/restore_core.dir/cmake_clean.cmake
.PHONY : src/restore/core/CMakeFiles/restore_core.dir/clean

src/restore/core/CMakeFiles/restore_core.dir/depend:
	cd /Users/amir/trash/backup/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/amir/trash/backup /Users/amir/trash/backup/src/restore/core /Users/amir/trash/backup/build /Users/amir/trash/backup/build/src/restore/core /Users/amir/trash/backup/build/src/restore/core/CMakeFiles/restore_core.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : src/restore/core/CMakeFiles/restore_core.dir/depend

