-- Variables
local src_dir = "src/"

workspace "Caracal"
   configurations { "Debug", "Release" }
   platforms { "Win64", "Linux" }
   objdir (src_dir .. "obj")


project "Caracal Core"
   kind "WindowedApp"
   language "C"
   targetdir "bin/%{cfg.buildcfg}"

   files {
         src_dir .. "**.c" ,
         src_dir .. "**.h"
      }

   filter { "platforms:Win64" }
      system "Windows"
      architecture "x64"

   filter { "platforms:Linux" }
      system "Linux"

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"	

newaction {
    trigger = "clean",
    description = "Remove all binaries and intermediate binaries, and vs files.",
    execute = function()
        print("Removing compiled objects")
        os.rmdir(src_dir .. "obj")
        print("Removing binaries")
        os.rmdir("./bin")
        print("Removing intermediate binaries")
        os.rmdir("./bin-int")
        print("Removing project files")
        os.rmdir("./.vs")
        os.remove("**.sln")
        os.remove("**.vcxproj")
        os.remove("**.vcxproj.filters")
        os.remove("**.vcxproj.user")
        print("Done")
    end
}