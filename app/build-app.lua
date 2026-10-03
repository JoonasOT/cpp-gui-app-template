project "app"

kind "ConsoleApp"

language "C++"
cppdialect "C++20"
targetdir "binaries/%{cfg.buildcfg}"
staticruntime "off"

files {"src/**.hpp", "src/**.cpp"}

includedirs {"src", "../backend/src"}

-- include spdlog
includedirs {"../external_dependencies/spdlog/include"}

links {"backend"}

-- start imgui stuff

includedirs {"../external_dependencies/imgui", "../external_dependencies/imgui/backends",
             "../external_dependencies/imgui/examples/libs/glfw/include"}

files {"../external_dependencies/imgui/*.h", "../external_dependencies/imgui/*.cpp",
       "../external_dependencies/imgui/backends/imgui_impl_glfw.h",
       "../external_dependencies/imgui/backends/imgui_impl_glfw.cpp",
       "../external_dependencies/imgui/backends/imgui_impl_opengl3.h",
       "../external_dependencies/imgui/backends/imgui_impl_opengl3.cpp",
       "../external_dependencies/imgui/misc/cpp/imgui_stdlib.h",
       "../external_dependencies/imgui/misc/cpp/imgui_stdlib.cpp"}

libdirs {"../external_dependencies/imgui/examples/libs/glfw/lib-vc2010-64"}

-- end imgui stuff

links {"glfw3.lib", "opengl32.lib"}

targetdir("../binaries/" .. OutputDir .. "/%{prj.name}")
objdir("../binaries/intermediates/" .. OutputDir .. "/%{prj.name}")

filter "system:windows"
systemversion "latest"
defines {"WINDOWS"}

filter "configurations:Debug"
defines {"DEBUG"}
runtime "Debug"
symbols "On"

filter "configurations:Release"
defines {"RELEASE"}
runtime "Release"
optimize "Speed"
symbols "On"

filter "configurations:Dist"
defines {"DIST"}
runtime "Release"
optimize "Speed"
symbols "Off"
