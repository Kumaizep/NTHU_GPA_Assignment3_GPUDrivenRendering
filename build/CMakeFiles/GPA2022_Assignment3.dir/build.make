# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.24

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/build

# Include any dependencies generated for this target.
include CMakeFiles/GPA2022_Assignment3.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/GPA2022_Assignment3.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/GPA2022_Assignment3.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/GPA2022_Assignment3.dir/flags.make

CMakeFiles/GPA2022_Assignment3.dir/src/DynamicSceneObject.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/flags.make
CMakeFiles/GPA2022_Assignment3.dir/src/DynamicSceneObject.cpp.o: /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/DynamicSceneObject.cpp
CMakeFiles/GPA2022_Assignment3.dir/src/DynamicSceneObject.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/GPA2022_Assignment3.dir/src/DynamicSceneObject.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GPA2022_Assignment3.dir/src/DynamicSceneObject.cpp.o -MF CMakeFiles/GPA2022_Assignment3.dir/src/DynamicSceneObject.cpp.o.d -o CMakeFiles/GPA2022_Assignment3.dir/src/DynamicSceneObject.cpp.o -c /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/DynamicSceneObject.cpp

CMakeFiles/GPA2022_Assignment3.dir/src/DynamicSceneObject.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GPA2022_Assignment3.dir/src/DynamicSceneObject.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/DynamicSceneObject.cpp > CMakeFiles/GPA2022_Assignment3.dir/src/DynamicSceneObject.cpp.i

CMakeFiles/GPA2022_Assignment3.dir/src/DynamicSceneObject.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GPA2022_Assignment3.dir/src/DynamicSceneObject.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/DynamicSceneObject.cpp -o CMakeFiles/GPA2022_Assignment3.dir/src/DynamicSceneObject.cpp.s

CMakeFiles/GPA2022_Assignment3.dir/src/InfinityPlane.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/flags.make
CMakeFiles/GPA2022_Assignment3.dir/src/InfinityPlane.cpp.o: /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/InfinityPlane.cpp
CMakeFiles/GPA2022_Assignment3.dir/src/InfinityPlane.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/GPA2022_Assignment3.dir/src/InfinityPlane.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GPA2022_Assignment3.dir/src/InfinityPlane.cpp.o -MF CMakeFiles/GPA2022_Assignment3.dir/src/InfinityPlane.cpp.o.d -o CMakeFiles/GPA2022_Assignment3.dir/src/InfinityPlane.cpp.o -c /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/InfinityPlane.cpp

CMakeFiles/GPA2022_Assignment3.dir/src/InfinityPlane.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GPA2022_Assignment3.dir/src/InfinityPlane.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/InfinityPlane.cpp > CMakeFiles/GPA2022_Assignment3.dir/src/InfinityPlane.cpp.i

CMakeFiles/GPA2022_Assignment3.dir/src/InfinityPlane.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GPA2022_Assignment3.dir/src/InfinityPlane.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/InfinityPlane.cpp -o CMakeFiles/GPA2022_Assignment3.dir/src/InfinityPlane.cpp.s

CMakeFiles/GPA2022_Assignment3.dir/src/MyImGuiPanel.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/flags.make
CMakeFiles/GPA2022_Assignment3.dir/src/MyImGuiPanel.cpp.o: /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/MyImGuiPanel.cpp
CMakeFiles/GPA2022_Assignment3.dir/src/MyImGuiPanel.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/GPA2022_Assignment3.dir/src/MyImGuiPanel.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GPA2022_Assignment3.dir/src/MyImGuiPanel.cpp.o -MF CMakeFiles/GPA2022_Assignment3.dir/src/MyImGuiPanel.cpp.o.d -o CMakeFiles/GPA2022_Assignment3.dir/src/MyImGuiPanel.cpp.o -c /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/MyImGuiPanel.cpp

CMakeFiles/GPA2022_Assignment3.dir/src/MyImGuiPanel.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GPA2022_Assignment3.dir/src/MyImGuiPanel.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/MyImGuiPanel.cpp > CMakeFiles/GPA2022_Assignment3.dir/src/MyImGuiPanel.cpp.i

CMakeFiles/GPA2022_Assignment3.dir/src/MyImGuiPanel.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GPA2022_Assignment3.dir/src/MyImGuiPanel.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/MyImGuiPanel.cpp -o CMakeFiles/GPA2022_Assignment3.dir/src/MyImGuiPanel.cpp.s

CMakeFiles/GPA2022_Assignment3.dir/src/SceneRenderer.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/flags.make
CMakeFiles/GPA2022_Assignment3.dir/src/SceneRenderer.cpp.o: /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/SceneRenderer.cpp
CMakeFiles/GPA2022_Assignment3.dir/src/SceneRenderer.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/GPA2022_Assignment3.dir/src/SceneRenderer.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GPA2022_Assignment3.dir/src/SceneRenderer.cpp.o -MF CMakeFiles/GPA2022_Assignment3.dir/src/SceneRenderer.cpp.o.d -o CMakeFiles/GPA2022_Assignment3.dir/src/SceneRenderer.cpp.o -c /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/SceneRenderer.cpp

CMakeFiles/GPA2022_Assignment3.dir/src/SceneRenderer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GPA2022_Assignment3.dir/src/SceneRenderer.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/SceneRenderer.cpp > CMakeFiles/GPA2022_Assignment3.dir/src/SceneRenderer.cpp.i

CMakeFiles/GPA2022_Assignment3.dir/src/SceneRenderer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GPA2022_Assignment3.dir/src/SceneRenderer.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/SceneRenderer.cpp -o CMakeFiles/GPA2022_Assignment3.dir/src/SceneRenderer.cpp.s

CMakeFiles/GPA2022_Assignment3.dir/src/Shader.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/flags.make
CMakeFiles/GPA2022_Assignment3.dir/src/Shader.cpp.o: /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/Shader.cpp
CMakeFiles/GPA2022_Assignment3.dir/src/Shader.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/GPA2022_Assignment3.dir/src/Shader.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GPA2022_Assignment3.dir/src/Shader.cpp.o -MF CMakeFiles/GPA2022_Assignment3.dir/src/Shader.cpp.o.d -o CMakeFiles/GPA2022_Assignment3.dir/src/Shader.cpp.o -c /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/Shader.cpp

CMakeFiles/GPA2022_Assignment3.dir/src/Shader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GPA2022_Assignment3.dir/src/Shader.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/Shader.cpp > CMakeFiles/GPA2022_Assignment3.dir/src/Shader.cpp.i

CMakeFiles/GPA2022_Assignment3.dir/src/Shader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GPA2022_Assignment3.dir/src/Shader.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/Shader.cpp -o CMakeFiles/GPA2022_Assignment3.dir/src/Shader.cpp.s

CMakeFiles/GPA2022_Assignment3.dir/src/ViewFrustumSceneObject.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/flags.make
CMakeFiles/GPA2022_Assignment3.dir/src/ViewFrustumSceneObject.cpp.o: /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/ViewFrustumSceneObject.cpp
CMakeFiles/GPA2022_Assignment3.dir/src/ViewFrustumSceneObject.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/GPA2022_Assignment3.dir/src/ViewFrustumSceneObject.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GPA2022_Assignment3.dir/src/ViewFrustumSceneObject.cpp.o -MF CMakeFiles/GPA2022_Assignment3.dir/src/ViewFrustumSceneObject.cpp.o.d -o CMakeFiles/GPA2022_Assignment3.dir/src/ViewFrustumSceneObject.cpp.o -c /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/ViewFrustumSceneObject.cpp

CMakeFiles/GPA2022_Assignment3.dir/src/ViewFrustumSceneObject.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GPA2022_Assignment3.dir/src/ViewFrustumSceneObject.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/ViewFrustumSceneObject.cpp > CMakeFiles/GPA2022_Assignment3.dir/src/ViewFrustumSceneObject.cpp.i

CMakeFiles/GPA2022_Assignment3.dir/src/ViewFrustumSceneObject.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GPA2022_Assignment3.dir/src/ViewFrustumSceneObject.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/ViewFrustumSceneObject.cpp -o CMakeFiles/GPA2022_Assignment3.dir/src/ViewFrustumSceneObject.cpp.s

CMakeFiles/GPA2022_Assignment3.dir/src/main.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/flags.make
CMakeFiles/GPA2022_Assignment3.dir/src/main.cpp.o: /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/main.cpp
CMakeFiles/GPA2022_Assignment3.dir/src/main.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/GPA2022_Assignment3.dir/src/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GPA2022_Assignment3.dir/src/main.cpp.o -MF CMakeFiles/GPA2022_Assignment3.dir/src/main.cpp.o.d -o CMakeFiles/GPA2022_Assignment3.dir/src/main.cpp.o -c /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/main.cpp

CMakeFiles/GPA2022_Assignment3.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GPA2022_Assignment3.dir/src/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/main.cpp > CMakeFiles/GPA2022_Assignment3.dir/src/main.cpp.i

CMakeFiles/GPA2022_Assignment3.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GPA2022_Assignment3.dir/src/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/src/main.cpp -o CMakeFiles/GPA2022_Assignment3.dir/src/main.cpp.s

CMakeFiles/GPA2022_Assignment3.dir/include/glad/glad.c.o: CMakeFiles/GPA2022_Assignment3.dir/flags.make
CMakeFiles/GPA2022_Assignment3.dir/include/glad/glad.c.o: /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/glad/glad.c
CMakeFiles/GPA2022_Assignment3.dir/include/glad/glad.c.o: CMakeFiles/GPA2022_Assignment3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object CMakeFiles/GPA2022_Assignment3.dir/include/glad/glad.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/GPA2022_Assignment3.dir/include/glad/glad.c.o -MF CMakeFiles/GPA2022_Assignment3.dir/include/glad/glad.c.o.d -o CMakeFiles/GPA2022_Assignment3.dir/include/glad/glad.c.o -c /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/glad/glad.c

CMakeFiles/GPA2022_Assignment3.dir/include/glad/glad.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/GPA2022_Assignment3.dir/include/glad/glad.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/glad/glad.c > CMakeFiles/GPA2022_Assignment3.dir/include/glad/glad.c.i

CMakeFiles/GPA2022_Assignment3.dir/include/glad/glad.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/GPA2022_Assignment3.dir/include/glad/glad.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/glad/glad.c -o CMakeFiles/GPA2022_Assignment3.dir/include/glad/glad.c.s

CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/flags.make
CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui.cpp.o: /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui.cpp
CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui.cpp.o -MF CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui.cpp.o.d -o CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui.cpp.o -c /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui.cpp

CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui.cpp > CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui.cpp.i

CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui.cpp -o CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui.cpp.s

CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_demo.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/flags.make
CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_demo.cpp.o: /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui_demo.cpp
CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_demo.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_demo.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_demo.cpp.o -MF CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_demo.cpp.o.d -o CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_demo.cpp.o -c /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui_demo.cpp

CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_demo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_demo.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui_demo.cpp > CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_demo.cpp.i

CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_demo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_demo.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui_demo.cpp -o CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_demo.cpp.s

CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_draw.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/flags.make
CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_draw.cpp.o: /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui_draw.cpp
CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_draw.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_draw.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_draw.cpp.o -MF CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_draw.cpp.o.d -o CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_draw.cpp.o -c /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui_draw.cpp

CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_draw.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_draw.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui_draw.cpp > CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_draw.cpp.i

CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_draw.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_draw.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui_draw.cpp -o CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_draw.cpp.s

CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_glfw.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/flags.make
CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_glfw.cpp.o: /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui_impl_glfw.cpp
CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_glfw.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_glfw.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_glfw.cpp.o -MF CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_glfw.cpp.o.d -o CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_glfw.cpp.o -c /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui_impl_glfw.cpp

CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_glfw.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_glfw.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui_impl_glfw.cpp > CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_glfw.cpp.i

CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_glfw.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_glfw.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui_impl_glfw.cpp -o CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_glfw.cpp.s

CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_opengl3.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/flags.make
CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_opengl3.cpp.o: /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui_impl_opengl3.cpp
CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_opengl3.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_opengl3.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_opengl3.cpp.o -MF CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_opengl3.cpp.o.d -o CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_opengl3.cpp.o -c /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui_impl_opengl3.cpp

CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_opengl3.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_opengl3.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui_impl_opengl3.cpp > CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_opengl3.cpp.i

CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_opengl3.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_opengl3.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui_impl_opengl3.cpp -o CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_opengl3.cpp.s

CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_tables.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/flags.make
CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_tables.cpp.o: /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui_tables.cpp
CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_tables.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_tables.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_tables.cpp.o -MF CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_tables.cpp.o.d -o CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_tables.cpp.o -c /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui_tables.cpp

CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_tables.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_tables.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui_tables.cpp > CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_tables.cpp.i

CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_tables.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_tables.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui_tables.cpp -o CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_tables.cpp.s

CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_widgets.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/flags.make
CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_widgets.cpp.o: /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui_widgets.cpp
CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_widgets.cpp.o: CMakeFiles/GPA2022_Assignment3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building CXX object CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_widgets.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_widgets.cpp.o -MF CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_widgets.cpp.o.d -o CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_widgets.cpp.o -c /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui_widgets.cpp

CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_widgets.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_widgets.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui_widgets.cpp > CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_widgets.cpp.i

CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_widgets.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_widgets.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/include/imgui/imgui_widgets.cpp -o CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_widgets.cpp.s

# Object files for target GPA2022_Assignment3
GPA2022_Assignment3_OBJECTS = \
"CMakeFiles/GPA2022_Assignment3.dir/src/DynamicSceneObject.cpp.o" \
"CMakeFiles/GPA2022_Assignment3.dir/src/InfinityPlane.cpp.o" \
"CMakeFiles/GPA2022_Assignment3.dir/src/MyImGuiPanel.cpp.o" \
"CMakeFiles/GPA2022_Assignment3.dir/src/SceneRenderer.cpp.o" \
"CMakeFiles/GPA2022_Assignment3.dir/src/Shader.cpp.o" \
"CMakeFiles/GPA2022_Assignment3.dir/src/ViewFrustumSceneObject.cpp.o" \
"CMakeFiles/GPA2022_Assignment3.dir/src/main.cpp.o" \
"CMakeFiles/GPA2022_Assignment3.dir/include/glad/glad.c.o" \
"CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui.cpp.o" \
"CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_demo.cpp.o" \
"CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_draw.cpp.o" \
"CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_glfw.cpp.o" \
"CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_opengl3.cpp.o" \
"CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_tables.cpp.o" \
"CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_widgets.cpp.o"

# External object files for target GPA2022_Assignment3
GPA2022_Assignment3_EXTERNAL_OBJECTS =

GPA2022_Assignment3: CMakeFiles/GPA2022_Assignment3.dir/src/DynamicSceneObject.cpp.o
GPA2022_Assignment3: CMakeFiles/GPA2022_Assignment3.dir/src/InfinityPlane.cpp.o
GPA2022_Assignment3: CMakeFiles/GPA2022_Assignment3.dir/src/MyImGuiPanel.cpp.o
GPA2022_Assignment3: CMakeFiles/GPA2022_Assignment3.dir/src/SceneRenderer.cpp.o
GPA2022_Assignment3: CMakeFiles/GPA2022_Assignment3.dir/src/Shader.cpp.o
GPA2022_Assignment3: CMakeFiles/GPA2022_Assignment3.dir/src/ViewFrustumSceneObject.cpp.o
GPA2022_Assignment3: CMakeFiles/GPA2022_Assignment3.dir/src/main.cpp.o
GPA2022_Assignment3: CMakeFiles/GPA2022_Assignment3.dir/include/glad/glad.c.o
GPA2022_Assignment3: CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui.cpp.o
GPA2022_Assignment3: CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_demo.cpp.o
GPA2022_Assignment3: CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_draw.cpp.o
GPA2022_Assignment3: CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_glfw.cpp.o
GPA2022_Assignment3: CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_impl_opengl3.cpp.o
GPA2022_Assignment3: CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_tables.cpp.o
GPA2022_Assignment3: CMakeFiles/GPA2022_Assignment3.dir/include/imgui/imgui_widgets.cpp.o
GPA2022_Assignment3: CMakeFiles/GPA2022_Assignment3.dir/build.make
GPA2022_Assignment3: CMakeFiles/GPA2022_Assignment3.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Linking CXX executable GPA2022_Assignment3"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/GPA2022_Assignment3.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/GPA2022_Assignment3.dir/build: GPA2022_Assignment3
.PHONY : CMakeFiles/GPA2022_Assignment3.dir/build

CMakeFiles/GPA2022_Assignment3.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/GPA2022_Assignment3.dir/cmake_clean.cmake
.PHONY : CMakeFiles/GPA2022_Assignment3.dir/clean

CMakeFiles/GPA2022_Assignment3.dir/depend:
	cd /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2 /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2 /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/build /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/build /home/kumaizep/文件/NTHU/Homework/9/GP/Assignment3/GPUDrivenRendering-dev2/build/CMakeFiles/GPA2022_Assignment3.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/GPA2022_Assignment3.dir/depend

