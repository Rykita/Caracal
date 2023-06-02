require "premake5"

project "vkCaracal"
   objdir ("obj")
   kind "SharedLib"
   language "C++"
   targetdir "bin/%{cfg.buildcfg}"

   files {
         "**.cxx" ,
         "**.h"
      }
   
   global_config()