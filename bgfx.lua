-- scaffold geniefile for bgfx

bgfx_script = path.getabsolute(path.getdirectory(_SCRIPT))
bgfx_root = path.join(bgfx_script, "bgfx")

bgfx_includedirs = {
	path.join(bgfx_script, "config"),
	bgfx_root,
}

bgfx_libdirs = {}
bgfx_links = {}
bgfx_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { bgfx_includedirs }
	end,

	_add_defines = function()
		defines { bgfx_defines }
	end,

	_add_libdirs = function()
		libdirs { bgfx_libdirs }
	end,

	_add_external_links = function()
		links { bgfx_links }
	end,

	_add_self_links = function()
		links { "bgfx" }
	end,

	_create_projects = function()

project "bgfx"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		bgfx_includedirs,
	}

	defines {}

	files {
		path.join(bgfx_script, "config", "**.h"),
		path.join(bgfx_root, "**.h"),
		path.join(bgfx_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
