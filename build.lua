workspace "cpp-gui-app"
architecture "x64"
configurations {"Debug", "Release", "Dist"}
startproject "app"

-- set -Wall -Wextra -Werror
warnings "Extra"
fatalwarnings "all"

filter "system:windows"
buildoptions { -- Base options
"/EHsc", "/Zc:preprocessor", "/Zc:__cplusplus", -- Required by spdlog
"/utf-8"}

OutputDir = "%{cfg.system}-%{cfg.architecture}/%{cfg.buildcfg}"

os.execute("git submodule init")

group "core"
include "core/build-shared.lua"
include "core/build-backend.lua"
group ""

include "app/build-app.lua"
