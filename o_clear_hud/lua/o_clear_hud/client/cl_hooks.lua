scrw = ScrW()
scrh = ScrH()

-- Called when the client is fully connected
hook.Add("HUDPaint", "OCLEARHUD:HUDPaint", function()

	print("[OCLEARHUD] The client can now see the screen!")
	hook.Remove("HUDPaint", "OCLEARHUD:HUDPaint")

end)

-- Remove previous HUD
local HideElement = {
    ['CHudHealth'] = true,
    ['CHudBattery'] = true,
    ['CHudAmmo'] = true,
    ['CHudSecondaryAmmo'] = true,
    ['DarkRP_HUD'] = true,
    ['DarkRP_EntityDisplay'] = true,
    ['DarkRP_LocalplyHUD'] = true,
    ['DarkRP_Hungermod'] = true,
    ['DarkRP_Agenda'] = true,
    ['DarkRP_LockdownHUD'] = true,
    ['DarkRP_ArrestedHUD'] = true,
    ['DarkRP_ChatReceivers'] = true,
}

hook.Add('HUDShouldDraw', 'DisablePreviousHUD', function( name )
    if HideElement[name] then return false end
end)

-- Paint the HUD
hook.Add("HUDPaint", "OCLEARHUD:PaintHUD", function()
-- DEFINE LOCAL PLAYER
    local ply = LocalPlayer()

-- HEALTH FOOD AND ARMOR
    local pHealth = ply:Health()
    local pArmor = ply:Armor()
    local pHunger = DarkRP and ply:getDarkRPVar("Energy") or 0

    local pHealth_percent = (pHealth/math.max(ply:GetMaxHealth(), pHealth)) * 100
    local pHunger_percent = (pHunger/math.max(100, pHunger)) * 100
    local pArmor_percent = (pArmor/math.max(ply:GetMaxArmor(), pArmor)) * 100

-- PANEL
	draw.RoundedBox(14, scrw*.022, scrh*.935, scrw*.153, scrh*.044, OCLEARHUD.Constants.colors["background"])

-- HEALTH
    surface.SetMaterial(OCLEARHUD.Constants.materials["health_64"])
    surface.SetDrawColor(color_white)
    surface.DrawTexturedRect(scrw*.028, scrh*.949, scrw*.013, scrw*.013)
    draw.SimpleText(pHealth_percent.."%", "vitals", scrw*.045, scrh*.947, color_white)

-- HUNGER
    surface.SetMaterial(OCLEARHUD.Constants.materials["hunger_64"])
    surface.SetDrawColor(color_white)
    surface.DrawTexturedRect(scrw*.08, scrh*.944, scrw*.015, scrw*.015)
    draw.SimpleText(pHunger_percent.."%", "vitals", scrw*.1, scrh*.947, color_white)

-- ARMOR
    surface.SetMaterial(OCLEARHUD.Constants.materials["shield_64"])
    surface.SetDrawColor(color_white)
    surface.DrawTexturedRect(scrw*.128, scrh*.946, scrw*.013, scrw*.0132)
    draw.SimpleText(pArmor_percent.."%", "vitals", scrw*.145, scrh*.947, color_white)

-- WALLET AND SALARY
    local pMoney = DarkRP and ply:getDarkRPVar("money") or 0
    local pFormatedMoney = DarkRP and DarkRP.formatMoney(pMoney) or 0
    local pMoneyFont = surface.SetFont("wallet")
    local pMoneyW, pMoneyH = surface.GetTextSize(pFormatedMoney)
    local pSalary = DarkRP and ply:getDarkRPVar("salary") or 0

    surface.SetMaterial(OCLEARHUD.Constants.materials["wallet_64"])
    surface.SetDrawColor(color_white)
    surface.DrawTexturedRect(scrw*.026, scrh*.9, scrw*.015, scrw*.015)

-- WALLET
    draw.SimpleText(DarkRP and DarkRP.formatMoney(pMoney) or pMoney, "wallet", scrw*.045, scrh*.897, OCLEARHUD.Constants.colors["text"])

-- SALARY
    if pSalary >= 1 then
        local m = DarkRP and DarkRP.formatMoney(pSalary) or pSalary
        draw.SimpleText("+" .. m, "vitals", (scrw*.05)+pMoneyW, scrh*.89, OCLEARHUD.Constants.colors["text"])
    end

-- RP NAME AND JOB
    local pName = ply:Nick()
    local pTeam = ply:Team()
    local pJob = team.GetName(pTeam)

-- JOB
    surface.SetMaterial(OCLEARHUD.Constants.materials["job_64"])
    surface.SetDrawColor(color_white)
    surface.DrawTexturedRect(scrw*.0265, scrh*.86, scrw*.014, scrw*.014)
    draw.SimpleText(pJob, "vitals", scrw*.045, scrh*.8625, OCLEARHUD.Constants.colors["text"])

-- NAME
    surface.SetMaterial(OCLEARHUD.Constants.materials["name_64"])
    surface.SetDrawColor(color_white)
    surface.DrawTexturedRect(scrw*.0265, scrh*.825, scrw*.014, scrw*.014)
    draw.SimpleText(pName, "vitals", scrw*.045, scrh*.8255, OCLEARHUD.Constants.colors["text"])

-- WEAPON AND AMMO
    if ply and ply:Alive() then
        local pAWeapon = ply:GetActiveWeapon()
        local pAWeaponName = pAWeapon and pAWeapon:GetPrintName() or ""
        local pAWeaponAmmo = pAWeapon and pAWeapon:Clip1() or 0
        local pAWeaponMaxAmmo = pAWeapon and pAWeapon:GetMaxClip1() or 0

        if pAWeaponAmmo >= 0 then
            local str = pAWeaponAmmo .. " / " .. ply:GetAmmoCount(pAWeapon:GetPrimaryAmmoType())
            local strFont = surface.SetFont("ammo")
            local strW, strH = surface.GetTextSize(str)
            draw.SimpleText(str, "ammo", (scrw*1)-(strW+(scrw*.017)), scrh*.938, OCLEARHUD.Constants.colors["text"])
            
            local str = OCLEARHUD.Config.LangTranslation[OCLEARHUD.Config.Lang]["ammo"]
            local strFont = surface.SetFont("ammo_text")
            local strW, strH = surface.GetTextSize(str)
            draw.SimpleText(str, "ammo_text", (scrw*1)-(strW+(scrw*.017)), scrh*.915, OCLEARHUD.Constants.colors["darker_text"])
            
            if OCLEARHUD.Config.ShowWeaponName then
                local str = pAWeaponName
                local strFont = surface.SetFont("weapon_text")
                local strW, strH = surface.GetTextSize(str)
                draw.SimpleText(str, "weapon_text", (scrw*1)-(strW+(scrw*.017)), scrh*.89, OCLEARHUD.Constants.colors["text"])
            end
        end
    end

    if OCLEARHUD.Config.ShowInfo then
    -- SERVER LOGO, NAME, PLAYER COUNT AND CURTIME
        surface.SetMaterial(OCLEARHUD.Constants.materials["server_logo"])
        surface.SetDrawColor(OCLEARHUD.Constants.colors["even_darker_text"])
        surface.DrawTexturedRect((scrw-scrw*.033333)-(scrw*.017), scrh*.027, scrw*.033333, scrw*.033333)

    -- SEPARATION BAR
        draw.RoundedBox(0, (scrw-scrw*.033333)-(scrw*.022), scrh*.027, scrw*.000721, scrw*.035417, OCLEARHUD.Constants.colors["darker_text"])

    -- SERVER NAME
        surface.SetFont("server_name")
        local serverNameW, serverNameH = surface.GetTextSize(OCLEARHUD.Config.ServerName)
        draw.SimpleText(OCLEARHUD.Config.ServerName, "server_name", (scrw-serverNameW)-(scrw*.063), scrh*.03, OCLEARHUD.Constants.colors["even_darker_text"])
    
    -- CURTIME
        local osTime = os.date("*t")
        local hours = osTime.hour
        local minutes = osTime.min
        local CurTime = string.format("%02d:%02d", hours, minutes)
        draw.RoundedBox(8, scrw*.91, scrh*.06, scrw*.02604, scrw*.010417, OCLEARHUD.Constants.colors["lot_darker"])
        draw.SimpleText(CurTime, "curtime", scrw*.914, scrh*.0629, OCLEARHUD.Constants.colors["even_darker_text"])
    
    -- PLAYER COUNT
        surface.SetMaterial(OCLEARHUD.Constants.materials["server_players"])
        surface.SetDrawColor(OCLEARHUD.Constants.colors["text"])
        surface.DrawTexturedRect(scrw*.886, scrh*.0629, scrw*.008333, scrw*.008333)

        draw.RoundedBox(8, scrw*.883, scrh*.06, scrw*.02604, scrw*.010417, OCLEARHUD.Constants.colors["lot_darker"])
        draw.SimpleText(player.GetCount(), "curtime", scrw*.898, scrh*.0629, OCLEARHUD.Constants.colors["even_darker_text"])
    end
end)