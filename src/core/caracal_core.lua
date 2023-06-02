require "premake5"

project "Caracal Core"
   objdir ("obj")
   kind "WindowedApp"
   language "C++"
   targetdir "bin/%{cfg.buildcfg}"
   link_core_deps()

   files {
         "**.cxx" ,
         "**.h"
      }

   global_config()