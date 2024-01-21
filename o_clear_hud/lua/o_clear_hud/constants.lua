--[[

		Addon made by TheObtey
	https://steamcommunity.com/id/justobtey/

--]]

OCLEARHUD.Constants = {}

-- Colors constants
OCLEARHUD.Constants["colors"] = {
	["background"] = Color(40,40,40, 230),
	["text"] = Color(230,230,230, 255),
	["darker_text"] = Color(210,210,210, 255),
	["even_darker_text"] = Color(200,200,200, 255),
	["lot_darker"] = Color(40,40,40, 150),
}

-- Materials constants
OCLEARHUD.Constants["materials"] = {
-- Server logo
	["server_logo"] = Material("o_clear_hud/ico/server/logo.png", "noclamp smooth"),
-- Server player count
	["server_players"] = Material("o_clear_hud/ico/server/players.png", "noclamp smooth"),
-- Health
	["health_64"] = Material("o_clear_hud/ico/health/64.png", "noclamp smooth"),
-- Hunger
	["hunger_64"] = Material("o_clear_hud/ico/hunger/64.png", "noclamp smooth"),
-- Shield
	["shield_64"] = Material("o_clear_hud/ico/shield/64.png", "noclamp smooth"),
-- Wallet
	["wallet_64"] = Material("o_clear_hud/ico/wallet/64.png", "noclamp smooth"),
-- Job
	["job_64"] = Material("o_clear_hud/ico/job/64.png", "noclamp smooth"),
-- Name
	["name_64"] = Material("o_clear_hud/ico/name/64.png", "noclamp smooth"),
}
