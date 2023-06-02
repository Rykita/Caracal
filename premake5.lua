-- Variables
src_dir = "src/"

workspace "Caracal"
   configurations { "Debug", "Release" }
   platforms { "Win64", "Linux" }
   include(src_dir .. "core/caracal_core.lua")
   include(src_dir .. "render/caracal_renderapi.lua")
   include(src_dir .. "direct3d/dxcaracal.lua")
   include(src_dir .. "vulkan/vkcaracal.lua")

function link_core_deps()
   includedirs {
      "../../ext/sdl2/include",
   }

   libdirs {
      "../../ext/sdl2/lib/x64",
   }

   links {
      "SDL2",
      "SDL2main",
   }
end

function global_config()
   filter { "platforms:Win64" }
      system "Windows"
      architecture "x64"
      --entrypoint "WinMainCRTStartup"

   filter { "platforms:Linux" }
      system "Linux"

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"	
end

newaction {
    trigger = "clean",
    description = "Remove all binaries, intermediate binaries and VS files.",
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