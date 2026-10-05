project "shared"
kind "StaticLib"
language "C++"
cppdialect "C++20"
targetdir "binaries/%{cfg.buildcfg}"
staticruntime "off"

files {"src/shared/**.hpp", "src/shared/**.cpp"}

includedirs {"src"}

targetdir("../binaries/" .. OutputDir .. "/%{prj.name}")
objdir("../binaries/intermediates/" .. OutputDir .. "/%{prj.name}")

filter "system:windows"
systemversion "latest"
defines {}

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
