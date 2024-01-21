OCLEARHUD = {}

-- Make loading functions
local function Inclu(f) return include("o_clear_hud/"..f) end
local function AddCS(f) return AddCSLuaFile("o_clear_hud/"..f) end
local function IncAdd(f) return Inclu(f), AddCS(f) end

-- Load addon files
IncAdd("config.lua")
IncAdd("constants.lua")

if SERVER then

	AddCS("client/cl_functions.lua")
	AddCS("client/cl_hooks.lua")

else

	Inclu("client/cl_functions.lua")
	Inclu("client/cl_hooks.lua")

end
