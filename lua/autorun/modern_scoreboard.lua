AddCSLuaFile()

ModernScoreboard = {
	VGUI = {}	
}

local files = {
	sv = {
		"main"
	},
	cl = {
		"main",
		"vgui"
	}
}

if SERVER then
	for _, f in pairs(files.sv) do
		include("modern_scoreboard/" .. f .. ".lua")
	end

	for _, f in pairs(files.cl) do
		AddCSLuaFile("modern_scoreboard/" .. f .. ".lua")
	end

	for _, f in pairs(file.Find("modern_scoreboard/vgui/*.lua", "LUA")) do
		AddCSLuaFile("modern_scoreboard/vgui/" .. f)
	end
else
	for _, f in pairs(files.cl) do
		include("modern_scoreboard/" .. f .. ".lua")
	end

	for _, f in pairs(file.Find("modern_scoreboard/vgui/*.lua", "LUA")) do
		local name, panel = include("modern_scoreboard/vgui/" .. f)
		ModernScoreboard.VGUI[name] = panel
	end
end