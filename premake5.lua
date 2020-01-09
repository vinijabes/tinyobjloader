project "tinyobj"
    kind "StaticLib"
    language "C++"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
    
    files{"tiny_obj_loader.h", "tiny_obj_loader.cc"}

    filter "system:linux"
        pic "On"
        systemversion "latest"
        staticruntime "On"
            
	filter "system:windows"
		systemversion "latest"        
		
		defines 
		{          
            "_CRT_SECURE_NO_WARNINGS"
		}
        

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"
        defines{"DEBUG"} -- -DDEBUG

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
    
    filter "configurations:Dist"
        runtime "Release"
        optimize "on"