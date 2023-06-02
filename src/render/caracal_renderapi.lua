require "premake5"

project "Caracal RenderAPI"
   objdir ("obj")
   kind "SharedLib"
   language "C++"
   targetdir "bin/%{cfg.buildcfg}"
   link_core_deps()

   files {
         "**.cxx" ,
         "**.h"
      }
   
   global_config()