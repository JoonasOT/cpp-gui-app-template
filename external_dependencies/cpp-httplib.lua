

print("Searching for openssl install")

openssl = os.outputof("where.exe openssl")
if openssl == nil then
    error("Could not locate openssl. Install openssl with e.g. \"choco install openssl\"")
end

opensslLocation = openssl:gsub("bin\\openssl.exe", "")
term.pushColor(term.green)
print(string.format("Located openssl install at: \"%s\"", opensslLocation))
term.popColor()

libdirs { (opensslLocation .. "lib\\VC\\x64\\MT") }

includedirs
{
   (opensslLocation .. "include"),
    "cpp-httplib"
}

links
{
    "libcrypto.lib",
    "libssl.lib"
}