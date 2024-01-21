OCLEARHUD.Fonts = {}

-- Automatic responsive functions
RX = RX or function(x) return x / 1920 * ScrW() end
RY = RY or function(y) return y / 1080 * ScrH() end

scrw = ScrW()
scrh = ScrH()

-- Automatic font-creation function
function OCLEARHUD:Font(iSize, iWidth, iWeight)

	iSize = iSize or 15
	iWidth = iWidth or 500

	local sName = ("OCLEARHUD:Font:%i:%i"):format(iSize, iWidth)
	if not OCLEARHUD.Fonts[sName] then

		surface.CreateFont(sName, {
			font = OCLEARHUD.Config.UsedFont,
			size = RX(iSize),
			width = iWidth,
			weight = iWeight,
			-- antialias = true,
			extended = false
		})

		OCLEARHUD.Fonts[sName] = true

	end

	return sName

end

-- For the health, hunger and armor
surface.CreateFont("vitals", {
	font = OCLEARHUD.Config.UsedFont,
	size = scrw*.012,
	width = scrw*.02208,
	weight = 100
})

-- For the wallet
surface.CreateFont("wallet", {
	font = OCLEARHUD.Config.UsedFont,
	size = scrw*.018,
	width = 500,
	weight = 600,
	antialias = true,
})

-- For the salary
surface.CreateFont("salary", {
	font = OCLEARHUD.Config.UsedFont,
	size = scrw*.012,
	width = 500,
	weight = 600,
	antialias = true,
})

-- For ammo
surface.CreateFont("ammo", {
	font = OCLEARHUD.Config.UsedFont,
	size = scrw*.016,
	width = 500,
	weight = 600,
	antialias = true,
})

-- For ammo text
surface.CreateFont("ammo_text", {
	font = OCLEARHUD.Config.UsedFont,
	size = scrw*.01,
	width = 500,
	weight = 500,
	antialias = true,
})

-- For weapon text
surface.CreateFont("weapon_text", {
	font = OCLEARHUD.Config.UsedFont,
	size = scrw*.014,
	width = 500,
	weight = 600,
	antialias = true,
})

-- For server name
surface.CreateFont("server_name", {
	font = OCLEARHUD.Config.UsedFont,
	size = scrw*.016,
	width = 500,
	weight = 1000,
	antialias = true,
	italic = true,
})

-- For curtime
surface.CreateFont("curtime", {
	font = OCLEARHUD.Config.UsedFont,
	size = scrw*.008,
	width = 500,
	weight = 600,
	antialias = true,
})