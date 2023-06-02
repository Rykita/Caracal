require "premake5"

project "dxCaracal"
   objdir ("obj")
   kind "SharedLib"
   language "C++"
   targetdir "bin/%{cfg.buildcfg}"

   files {
         "**.cxx" ,
         "**.h"
      }
   
   global_config()