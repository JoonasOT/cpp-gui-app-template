print("Searching for openssl install")

openssl = os.outputof("where.exe openssl")
if openssl == nil then
    error("Could not locate openssl. Install openssl with e.g. \"choco install openssl\"")
end

opensslLocation = openssl:gsub("bin\\openssl.exe", "")
term.pushColor(term.green)
print(string.format("Located openssl install at: \"%s\"", opensslLocation))
term.popColor()

project "backend"
kind "StaticLib"
language "C++"
cppdialect "C++20"
targetdir "binaries/%{cfg.buildcfg}"
staticruntime "off"

files {"src/backend/**.hpp", "src/backend/**.cpp"}

includedirs {"src"}

-- include spdlog
includedirs {"../external_dependencies/spdlog/include"}
-- include nlohmann/json
includedirs {"../external_dependencies/json/single_include"}

-- start cpp-httplib stuff
includedirs {(opensslLocation .. "include"), "../external_dependencies/cpp-httplib", "src"}
libdirs {(opensslLocation .. "lib\\VC\\x64\\MT")}
links {"libcrypto.lib", "libssl.lib"}
-- end cpp-httplib stuff

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

