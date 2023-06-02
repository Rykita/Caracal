-- Variables
local src_dir = "src/"

workspace "Caracal"
   configurations { "Debug", "Release" }
   platforms { "Win64", "Linux" }
   objdir (src_dir .. "obj")

function link_deps()
   includedirs {
      "ext/sdl2/include"
   }

   libdirs {
      "ext/sdl2/lib/x64"
   }

   links {
      "SDL2"
   }
end

project "Caracal Core"
   kind "WindowedApp"
   language "C++"
   targetdir "bin/%{cfg.buildcfg}"
   link_deps()

   files {
         src_dir .. "**.cxx" ,
         src_dir .. "**.h"
      }

   filter { "platforms:Win64" }
      system "Windows"
      architecture "x64"
      entrypoint "WinMainCRTStartup"

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