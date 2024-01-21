-- [[

		Addon made by TheObtey
	https://steamcommunity.com/id/justobtey/
-- ]]

OCLEARHUD.Config = {}

-- Admin ranks
OCLEARHUD.Config.AdminRanks = {
	["superadmin"] = true,	
	["admin"] = true	
}

-- Should we show server infos (top right corner)
OCLEARHUD.Config.ShowInfo = true

-- Name of the server
OCLEARHUD.Config.ServerName = "Garry's Mod France"

-- Should we draw the name of the player active weapon
OCLEARHUD.Config.ShowWeaponName = true

-- Font name ('Headwar', 'Philosopher', 'DarksSkyrimFont')
OCLEARHUD.Config.UsedFont = "Philosopher"

-- What language should we use (fr, en)
OCLEARHUD.Config.Lang = "fr"

-- Table of translation (you can add new language here)
OCLEARHUD.Config.LangTranslation = {
	["fr"] = {
		["ammo"] = "munition"
	},
	["en"] = {
		["ammo"] = "ammo"
	}
}
