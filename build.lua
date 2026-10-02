workspace "cpp-gui-app"
   architecture "x64"
   configurations { "Debug", "Release", "Dist" }
   startproject "App"

   warnings "Extra"
   fatalwarnings "all"

   filter "system:windows"
      buildoptions { "/EHsc", "/Zc:preprocessor", "/Zc:__cplusplus", "/WX" }

OutputDir = "%{cfg.system}-%{cfg.architecture}/%{cfg.buildcfg}"

os.execute("git submodule init")

group "core"
	include "backend/build-backend.lua"
group ""

include "app/build-app.lua"
