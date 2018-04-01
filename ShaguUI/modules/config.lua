ShaguUI.configUI = CreateFrame("Frame","ShaguConfigUI",UIParent)

ShaguUI.configFields = {
  "enableAutomaticUnmount", "enableHideBlizzardBuffs", "enableClickableNameplate", "enableInfightGlow", "enableMenubar",
  "enableBlueShaman", "enableChatTimestamps", "enableOriginalCastbar", "enablePartyinRaid", "enableZoomedRaid",
  "enableBigZoomedRaid", "enableRaidFrames", "enableShowAggro", "enableHotTracker", "enablePopupBlocker",
  "enableInventoryCount", "enableRightActionbar", "enableBottomStance", "enableBigBuffs", "enableStanceDance", "enablePvPIcon", "enablePvPIconLuna" }

ShaguUI.configUI.UpdateCheckBoxes = function ()
  -- uncheck everything
  for id, option in pairs(ShaguUI.configFields) do
    ShaguUI.configUI[option]:SetChecked(false)

    if ShaguUIconfig[option] == true then
      ShaguUI.configUI[option]:SetChecked()
    end
  end

  if ShaguUI.configUI.enableBigZoomedRaid:GetChecked() or ShaguUI.configUI.enableZoomedRaid:GetChecked() then
    ShaguUI.configUI.enableHeaderZoomedRaid:SetChecked(true)
  end

  if GetLocale() ~= "deDE" then
    ShaguUI.configUI.enableStanceDance:Disable()
    enableStanceDanceText:SetTextColor(.5,.5,.5)
  end

  -- Disable Bartender2 options if alternative is in use
  if ShaguAltAB then
    ShaguUI.configUI.enableMenubar:Disable()
    enableMenubarText:SetTextColor(.5,.5,.5)

    ShaguUI.configUI.enableRightActionbar:Disable()
    enableRightActionbarText:SetTextColor(.5,.5,.5)

    ShaguUI.configUI.enableBottomStance:Disable()
    enableBottomStanceText:SetTextColor(.5,.5,.5)
  end

  -- Disable LunaUnitFrames options if alternative is in use
  if ShaguAltUF then
    local LunaOptions = { "enableOriginalCastbar", "enablePartyinRaid", "enableHeaderZoomedRaid",
      "enableZoomedRaid", "enableBigZoomedRaid", "enableRaidFrames", "enableShowAggro", 
      "enableHotTracker", "enableBigBuffs", "enablePvPIconLuna" }

    for id, LunaOption in pairs(LunaOptions) do
      ShaguUI.configUI[LunaOption]:Disable()
      getglobal(LunaOption .. "Text"):SetTextColor(.5,.5,.5)
    end
  end
end

ShaguUI.configUI:RegisterEvent("PLAYER_ENTERING_WORLD");
ShaguUI.configUI:SetScript("OnEvent", function(self, event, ...)
    ShaguUI.configUI:UpdateCheckBoxes()
    ShaguUI.configUI.reloadUI:Hide()
  end)
ShaguUI.configUI:SetScript("OnHide", function()
    if ShaguUI.configUI.hasChanged then
      ShaguUI.configUI.reloadUI:Show()
    end
  end)

ShaguUI.configUI:Hide()
ShaguUI.configUI:SetFrameStrata("TOOLTIP")
ShaguUI.configUI:SetWidth(403)
ShaguUI.configUI:SetHeight(325)
ShaguUI.configUI:SetBackdrop(ShaguUI.Backdrop)
ShaguUI.configUI:SetPoint("BOTTOMLEFT",30,45)

ShaguUI.configUI.text = ShaguUI.configUI:CreateFontString("Status", "LOW", "GameFontNormal")
ShaguUI.configUI.text:SetFontObject(GameFontWhite)
ShaguUI.configUI.text:SetFont("Interface\\AddOns\\ShaguUI\\fonts\\arial.ttf", 14)
ShaguUI.configUI.text:SetPoint("TOPLEFT", 15, -15)
ShaguUI.configUI.text:SetText("Shagu|cff33ffccUI|cffaaaaaa Config|r")

ShaguUI.configUI.enableInfightGlow = CreateFrame("CheckButton", "enableInfightGlow", ShaguUI.configUI, "UICheckButtonTemplate")
enableInfightGlowText:SetText("Infight Glow effects")
ShaguUI.configUI.enableInfightGlow:SetScript("OnClick", function ()
    ShaguUI.configUI.hasChanged = true;
    if ShaguUI.configUI.enableInfightGlow:GetChecked() then
      ShaguUIconfig["enableInfightGlow"] = true
    else
      ShaguUIconfig["enableInfightGlow"] = false
    end
  end)
  
-- Enable Blue Shaman
ShaguUI.configUI.enableBlueShaman = CreateFrame("CheckButton", "enableBlueShaman", ShaguUI.configUI, "UICheckButtonTemplate")
enableBlueShamanText:SetText("Show Shamans as Blue")
ShaguUI.configUI.enableBlueShaman:SetScript("OnClick", function ()
    ShaguUI.configUI.hasChanged = true;
    if ShaguUI.configUI.enableBlueShaman:GetChecked() then
      ShaguUIconfig["enableBlueShaman"] = true
    else
      ShaguUIconfig["enableBlueShaman"] = false
    end
  end)

-- Enable Chat Timestamps
ShaguUI.configUI.enableChatTimestamps = CreateFrame("CheckButton", "enableChatTimestamps", ShaguUI.configUI, "UICheckButtonTemplate")
enableChatTimestampsText:SetText("Show Timestamps in Chat")
ShaguUI.configUI.enableChatTimestamps:SetScript("OnClick", function ()
    ShaguUI.configUI.hasChanged = true;
    if ShaguUI.configUI.enableChatTimestamps:GetChecked() then
      ShaguUIconfig["enableChatTimestamps"] = true
    else
      ShaguUIconfig["enableChatTimestamps"] = false
    end
  end)

-- Enable Popup Blocker
ShaguUI.configUI.enablePopupBlocker = CreateFrame("CheckButton", "enablePopupBlocker", ShaguUI.configUI, "UICheckButtonTemplate")
enablePopupBlockerText:SetText("Info- and Error Popup Blocker")
ShaguUI.configUI.enablePopupBlocker:SetScript("OnClick", function ()
    ShaguUI.configUI.hasChanged = true;
    if ShaguUI.configUI.enablePopupBlocker:GetChecked() then
      ShaguUIconfig["enablePopupBlocker"] = true
    else
      ShaguUIconfig["enablePopupBlocker"] = false
    end
  end)

-- Enable Inventory Counter
ShaguUI.configUI.enableInventoryCount = CreateFrame("CheckButton", "enableInventoryCount", ShaguUI.configUI, "UICheckButtonTemplate")
enableInventoryCountText:SetText("Accountwide Inventory Counter")
ShaguUI.configUI.enableInventoryCount:SetScript("OnClick", function ()
    ShaguUI.configUI.hasChanged = true;
    if ShaguUI.configUI.enableInventoryCount:GetChecked() then
      ShaguUIconfig["enableInventoryCount"] = true
    else
      ShaguUIconfig["enableInventoryCount"] = false
    end
  end)

-- Hide Blizzard Buffs
ShaguUI.configUI.enableHideBlizzardBuffs = CreateFrame("CheckButton", "enableHideBlizzardBuffs", ShaguUI.configUI, "UICheckButtonTemplate")
enableHideBlizzardBuffsText:SetText("Hide Blizzard Buff Frames")
ShaguUI.configUI.enableHideBlizzardBuffs:SetScript("OnClick", function ()
    ShaguUI.configUI.hasChanged = true;
    if ShaguUI.configUI.enableHideBlizzardBuffs:GetChecked() then
      ShaguUIconfig["enableHideBlizzardBuffs"] = true
    else
      ShaguUIconfig["enableHideBlizzardBuffs"] = false
    end
  end)

-- Enable Clickable Nameplates
ShaguUI.configUI.enableClickableNameplate = CreateFrame("CheckButton", "enableClickableNameplate", ShaguUI.configUI, "UICheckButtonTemplate")
enableClickableNameplateText:SetText("Clickable Nameplates")
ShaguUI.configUI.enableClickableNameplate:SetScript("OnClick", function ()
    ShaguUI.configUI.hasChanged = true;
    if ShaguUI.configUI.enableClickableNameplate:GetChecked() then
      ShaguUIconfig["enableClickableNameplate"] = true
    else
      ShaguUIconfig["enableClickableNameplate"] = false
    end
  end)

-- Enable Automatic Unmount and Shapeshifting
ShaguUI.configUI.enableAutomaticUnmount = CreateFrame("CheckButton", "enableAutomaticUnmount", ShaguUI.configUI, "UICheckButtonTemplate")
enableAutomaticUnmountText:SetText("Automatic unmount and shapeshift")
ShaguUI.configUI.enableAutomaticUnmount:SetScript("OnClick", function ()
    ShaguUI.configUI.hasChanged = true;
    if ShaguUI.configUI.enableAutomaticUnmount:GetChecked() then
      ShaguUIconfig["enableAutomaticUnmount"] = true
    else
      ShaguUIconfig["enableAutomaticUnmount"] = false
    end
  end)

-- Enable Stance Dance
ShaguUI.configUI.enableStanceDance = CreateFrame("CheckButton", "enableStanceDance", ShaguUI.configUI, "UICheckButtonTemplate")
enableStanceDanceText:SetText("Automatic stance dance")
ShaguUI.configUI.enableStanceDance:SetScript("OnClick", function ()
    ShaguUI.configUI.hasChanged = true;
    if ShaguUI.configUI.enableStanceDance:GetChecked() then
      ShaguUIconfig["enableStanceDance"] = true
    else
      ShaguUIconfig["enableStanceDance"] = false
    end
  end)

-- Enable PvP Icon
ShaguUI.configUI.enablePvPIcon = CreateFrame("CheckButton", "enablePvPIcon", ShaguUI.configUI, "UICheckButtonTemplate")
enablePvPIconText:SetText("Show PvP Icon")
ShaguUI.configUI.enablePvPIcon:SetScript("OnClick", function ()
    ShaguUI.configUI.hasChanged = true;
    if ShaguUI.configUI.enablePvPIcon:GetChecked() then
      ShaguUIconfig["enablePvPIcon"] = true
    else
      ShaguUIconfig["enablePvPIcon"] = false
      ShaguUIconfig["enablePvPIconLuna"] = false
      ShaguUI.configUI.enablePvPIconLuna:SetChecked(false)
    end
  end)

-- Enable Raidframe
ShaguUI.configUI.enableRaidFrames = CreateFrame("CheckButton", "enableRaidFrames", ShaguUI.configUI, "UICheckButtonTemplate")
enableRaidFramesText:SetText("Enable Raidframes")
ShaguUI.configUI.enableRaidFrames:SetScript("OnClick", function ()
    ShaguUI.configUI.hasChanged = true;
    if ShaguUI.configUI.enableRaidFrames:GetChecked() then
      ShaguUIconfig["enableRaidFrames"] = true
    else
      ShaguUIconfig["enableRaidFrames"] = false
    end
  end)

-- Enable Party in Raid
ShaguUI.configUI.enablePartyinRaid = CreateFrame("CheckButton", "enablePartyinRaid", ShaguUI.configUI, "UICheckButtonTemplate")
enablePartyinRaidText:SetText("Show party while in raid")
ShaguUI.configUI.enablePartyinRaid:SetScript("OnClick", function ()
    ShaguUI.configUI.hasChanged = true;
    if ShaguUI.configUI.enablePartyinRaid:GetChecked() then
      ShaguUIconfig["enablePartyinRaid"] = true
    else
      ShaguUIconfig["enablePartyinRaid"] = false
    end
  end)

-- Enable Zoomed Raidframes
ShaguUI.configUI.enableHeaderZoomedRaid = CreateFrame("CheckButton", "enableHeaderZoomedRaid", ShaguUI.configUI, "UICheckButtonTemplate")
enableHeaderZoomedRaidText:SetText("Enable Zoomed Raid Frames")
ShaguUI.configUI.enableHeaderZoomedRaid:SetScript("OnClick", function ()
    ShaguUI.configUI.hasChanged = true;
    if ShaguUI.configUI.enableHeaderZoomedRaid:GetChecked() then
      ShaguUIconfig["enableZoomedRaid"] = true
      ShaguUIconfig["enableBigZoomedRaid"] = false
    else
      ShaguUIconfig["enableZoomedRaid"] = false
      ShaguUIconfig["enableBigZoomedRaid"] = false
      ShaguUI.configUI.enableZoomedRaid:SetChecked(false)
      ShaguUI.configUI.enableBigZoomedRaid:SetChecked(false)
    end
  end)

-- Enable Zoomed Raidframes
ShaguUI.configUI.enableZoomedRaid = CreateFrame("CheckButton", "enableZoomedRaid", ShaguUI.configUI, "UICheckButtonTemplate")
enableZoomedRaidText:SetText("2x")
ShaguUI.configUI.enableZoomedRaid:SetScript("OnClick", function ()
    ShaguUI.configUI.hasChanged = true;
    if ShaguUI.configUI.enableZoomedRaid:GetChecked() then
      ShaguUIconfig["enableZoomedRaid"] = true
      ShaguUIconfig["enableBigZoomedRaid"] = false
      ShaguUI.configUI.enableBigZoomedRaid:SetChecked(false)
      ShaguUI.configUI.enableHeaderZoomedRaid:SetChecked(true)
    else
      ShaguUIconfig["enableZoomedRaid"] = false
      if not ShaguUI.configUI.enableBigZoomedRaid:GetChecked() then
        ShaguUI.configUI.enableHeaderZoomedRaid:SetChecked(false)
      end
    end
  end)

-- Enable Big Zoomed Raidframes
ShaguUI.configUI.enableBigZoomedRaid = CreateFrame("CheckButton", "enableBigZoomedRaid", ShaguUI.configUI, "UICheckButtonTemplate")
enableBigZoomedRaidText:SetText("4x")
ShaguUI.configUI.enableBigZoomedRaid:SetScript("OnClick", function ()
    ShaguUI.configUI.hasChanged = true;
    if ShaguUI.configUI.enableBigZoomedRaid:GetChecked() then
      ShaguUIconfig["enableBigZoomedRaid"] = true
      ShaguUIconfig["enableZoomedRaid"] = false
      ShaguUI.configUI.enableZoomedRaid:SetChecked(false)
      ShaguUI.configUI.enableHeaderZoomedRaid:SetChecked(true)
    else
      ShaguUIconfig["enableBigZoomedRaid"] = false
      if not ShaguUI.configUI.enablZoomedRaid:GetChecked() then
        ShaguUI.configUI.enableHeaderZoomedRaid:SetChecked(false)
      end
    end
  end)

-- Show Aggro in Raidframe
ShaguUI.configUI.enableShowAggro = CreateFrame("CheckButton", "enableShowAggro", ShaguUI.configUI, "UICheckButtonTemplate")
enableShowAggroText:SetText("Show Aggro in Frames")
ShaguUI.configUI.enableShowAggro:SetScript("OnClick", function ()
    ShaguUI.configUI.hasChanged = true;
    if ShaguUI.configUI.enableShowAggro:GetChecked() then
      ShaguUIconfig["enableShowAggro"] = true
    else
      ShaguUIconfig["enableShowAggro"] = false
    end
  end)

-- Enable Hot Tracker
ShaguUI.configUI.enableHotTracker = CreateFrame("CheckButton", "enableHotTracker", ShaguUI.configUI, "UICheckButtonTemplate")
enableHotTrackerText:SetText("Show HoTs in Raid")
ShaguUI.configUI.enableHotTracker:SetScript("OnClick", function ()
    ShaguUI.configUI.hasChanged = true;
    if ShaguUI.configUI.enableHotTracker:GetChecked() then
      ShaguUIconfig["enableHotTracker"] = true
    else
      ShaguUIconfig["enableHotTracker"] = false
    end
  end)

-- Enable Show Castbar
ShaguUI.configUI.enableOriginalCastbar = CreateFrame("CheckButton", "enableOriginalCastbar", ShaguUI.configUI, "UICheckButtonTemplate")
enableOriginalCastbarText:SetText("Use original Castbar")
ShaguUI.configUI.enableOriginalCastbar:SetScript("OnClick", function ()
    ShaguUI.configUI.hasChanged = true;
    if ShaguUI.configUI.enableOriginalCastbar:GetChecked() then
      ShaguUIconfig["enableOriginalCastbar"] = true
    else
      ShaguUIconfig["enableOriginalCastbar"] = false
    end
  end)

-- Enable Big Buffs
ShaguUI.configUI.enableBigBuffs = CreateFrame("CheckButton", "enableBigBuffs", ShaguUI.configUI, "UICheckButtonTemplate")
enableBigBuffsText:SetText("Use big buff/debuff icons")
ShaguUI.configUI.enableBigBuffs:SetScript("OnClick", function ()
    ShaguUI.configUI.hasChanged = true;
    if ShaguUI.configUI.enableBigBuffs:GetChecked() then
      ShaguUIconfig["enableBigBuffs"] = true
    else
      ShaguUIconfig["enableBigBuffs"] = false
    end
  end)

-- Enable Menubar
ShaguUI.configUI.enableMenubar = CreateFrame("CheckButton", "enableMenubar", ShaguUI.configUI, "UICheckButtonTemplate")
enableMenubarText:SetText("Show Menubar instead of Location")
ShaguUI.configUI.enableMenubar:SetScript("OnClick", function ()
    ShaguUI.configUI.hasChanged = true;
    if ShaguUI.configUI.enableMenubar:GetChecked() then
      ShaguUIconfig["enableMenubar"] = true
    else
      ShaguUIconfig["enableMenubar"] = false
    end
  end)

-- Enable RightActionbar
ShaguUI.configUI.enableRightActionbar = CreateFrame("CheckButton", "enableRightActionbar", ShaguUI.configUI, "UICheckButtonTemplate")
enableRightActionbarText:SetText("Enable vertical Actionbars")
ShaguUI.configUI.enableRightActionbar:SetScript("OnClick", function ()
    ShaguUI.configUI.hasChanged = true;
    if ShaguUI.configUI.enableRightActionbar:GetChecked() then
      ShaguUIconfig["enableRightActionbar"] = true
    else
      ShaguUIconfig["enableRightActionbar"] = false
    end
  end)

-- Enable Bottom Stancebar
ShaguUI.configUI.enableBottomStance = CreateFrame("CheckButton", "enableBottomStance", ShaguUI.configUI, "UICheckButtonTemplate")
enableBottomStanceText:SetText("Use bottom stance bars")
ShaguUI.configUI.enableBottomStance:SetScript("OnClick", function ()
    ShaguUI.configUI.hasChanged = true;
    if ShaguUI.configUI.enableBottomStance:GetChecked() then
      ShaguUIconfig["enableBottomStance"] = true
    else
      ShaguUIconfig["enableBottomStance"] = false
    end
  end)

-- Enable PvP Icon on Luna
ShaguUI.configUI.enablePvPIconLuna = CreateFrame("CheckButton", "enablePvPIconLuna", ShaguUI.configUI, "UICheckButtonTemplate")
enablePvPIconLunaText:SetText("PvP Icon on UnitFrames")
ShaguUI.configUI.enablePvPIconLuna:SetScript("OnClick", function ()
    ShaguUI.configUI.hasChanged = true;
    if ShaguUI.configUI.enablePvPIconLuna:GetChecked() then
      ShaguUIconfig["enablePvPIconLuna"] = true
      ShaguUIconfig["enablePvPIcon"] = true
      ShaguUI.configUI.enablePvPIcon:SetChecked(true)
    else
      ShaguUIconfig["enablePvPIconLuna"] = false
    end
  end)

  
  ShaguUI.LeftPane = {
    "enableInfightGlow", "enableBlueShaman", "enableChatTimestamps", "enablePopupBlocker",  "enableInventoryCount", 
    "enableHideBlizzardBuffs", "enableClickableNameplate", "enableAutomaticUnmount", "enableStanceDance", "enableBottomStance", "enablePvPIcon" }
      
  for id, entry in pairs(ShaguUI.LeftPane) do
    getglobal(entry .. "Text"):SetTextColor(1,1,1)
    getglobal(entry .. "Text"):ClearAllPoints()
    getglobal(entry .. "Text"):SetPoint("LEFT", 25, 0, "RIGHT")
    ShaguUI.configUI[entry]:ClearAllPoints()
    ShaguUI.configUI[entry]:SetPoint("TOPLEFT", 15, -20 - id * 25)
    ShaguUI.configUI[entry]:SetBackdrop(ShaguUI.Backdrop)
    ShaguUI.configUI[entry]:SetNormalTexture(nil)
    ShaguUI.configUI[entry]:SetPushedTexture(nil)
    ShaguUI.configUI[entry]:SetHeight(16)
    ShaguUI.configUI[entry]:SetWidth(16)
  end 
  
  ShaguUI.RightPane = {
    "enableRaidFrames", "enablePartyinRaid", "enableHeaderZoomedRaid", "enableZoomedRaid",  "enableShowAggro", 
    "enableHotTracker", "enableOriginalCastbar", "enableBigBuffs", "enableMenubar", "enableRightActionbar", "enablePvPIconLuna" }
      
  for id, entry in pairs(ShaguUI.RightPane) do
    if entry == "enableZoomedRaid" then
      getglobal(entry .. "Text"):SetTextColor(1,1,1)
      getglobal(entry .. "Text"):ClearAllPoints()
      getglobal(entry .. "Text"):SetPoint("LEFT", 25, 0, "RIGHT")
      ShaguUI.configUI[entry]:ClearAllPoints()
      ShaguUI.configUI[entry]:SetPoint("TOPLEFT", 240, -20 - id * 25)
      ShaguUI.configUI[entry]:SetBackdrop(ShaguUI.Backdrop)
      ShaguUI.configUI[entry]:SetNormalTexture(nil)
      ShaguUI.configUI[entry]:SetPushedTexture(nil)
      ShaguUI.configUI[entry]:SetHeight(16)
      ShaguUI.configUI[entry]:SetWidth(16)
      
      entry = "enableBigZoomedRaid"
      getglobal(entry .. "Text"):SetTextColor(1,1,1)
      getglobal(entry .. "Text"):ClearAllPoints()
      getglobal(entry .. "Text"):SetPoint("LEFT", 25, 0, "RIGHT")
      ShaguUI.configUI[entry]:ClearAllPoints()
      ShaguUI.configUI[entry]:SetPoint("TOPLEFT", 290, -20 - id * 25)
      ShaguUI.configUI[entry]:SetBackdrop(ShaguUI.Backdrop)
      ShaguUI.configUI[entry]:SetNormalTexture(nil)
      ShaguUI.configUI[entry]:SetPushedTexture(nil)
      ShaguUI.configUI[entry]:SetHeight(16)
      ShaguUI.configUI[entry]:SetWidth(16)
    else
    
      getglobal(entry .. "Text"):SetTextColor(1,1,1)
      getglobal(entry .. "Text"):ClearAllPoints()
      getglobal(entry .. "Text"):SetPoint("LEFT", 25, 0, "RIGHT")
      ShaguUI.configUI[entry]:ClearAllPoints()
      ShaguUI.configUI[entry]:SetPoint("TOPLEFT", 215, -20 - id * 25)
      ShaguUI.configUI[entry]:SetBackdrop(ShaguUI.Backdrop)
      ShaguUI.configUI[entry]:SetNormalTexture(nil)
      ShaguUI.configUI[entry]:SetPushedTexture(nil)
      ShaguUI.configUI[entry]:SetHeight(16)
      ShaguUI.configUI[entry]:SetWidth(16)
    end
  end 


ShaguUI.configUI.cleanButton = CreateFrame("Button", "ShaguUI_CleanButton", ShaguUI.configUI, "UIPanelButtonTemplate")
ShaguUI.configUI.cleanButton:SetWidth(20)
ShaguUI.configUI.cleanButton:SetHeight(18) -- width, height
ShaguUI.configUI.cleanButton:SetText("|cffff5555X")
ShaguUI.configUI.cleanButton:SetPoint("TOPRIGHT", -10,-10)
ShaguUI_CleanButtonText:SetPoint("CENTER", 1, 0)
ShaguUI.configUI.cleanButton:SetNormalTexture(nil)
ShaguUI.configUI.cleanButton:SetPushedTexture(nil)
ShaguUI.configUI.cleanButton:SetBackdrop(ShaguUI.Backdrop)
ShaguUI.configUI.cleanButton:SetScript("OnClick", function()
    ShaguUI.configUI:Hide()
  end)

ShaguUI.configUI.resetButton = CreateFrame("Button", "ShaguUI_ResetButton", ShaguUI.configUI, "UIPanelButtonTemplate")
ShaguUI.configUI.resetButton:SetWidth(50)
ShaguUI.configUI.resetButton:SetHeight(18) -- width, height
ShaguUI.configUI.resetButton:SetText("|cffffeeccReset")
ShaguUI.configUI.resetButton:SetPoint("TOPRIGHT", -35,-10)
ShaguUI_ResetButtonText:SetPoint("CENTER", 0, 0)
ShaguUI.configUI.resetButton:SetNormalTexture(nil)
ShaguUI.configUI.resetButton:SetPushedTexture(nil)
ShaguUI.configUI.resetButton:SetBackdrop(ShaguUI.Backdrop)
ShaguUI.configUI.resetButton:SetScript("OnClick", function()
    ShaguUI:DefaultSettings()
    ShaguUIconfig["chatConfigured"] = true

    ShaguUI.configUI:UpdateCheckBoxes()
    ShaguUI.configUI.hasChanged = true
  end)

ShaguUI.configUI.chatButton = CreateFrame("Button", "ShaguUI_chatButton", ShaguUI.configUI, "UIPanelButtonTemplate")
ShaguUI.configUI.chatButton:SetWidth(50)
ShaguUI.configUI.chatButton:SetHeight(18) -- width, height
ShaguUI.configUI.chatButton:SetText("|cffffeeccChat")
ShaguUI.configUI.chatButton:SetPoint("TOPRIGHT", -90,-10)
ShaguUI_chatButtonText:SetPoint("CENTER", 0, 0)
ShaguUI.configUI.chatButton:SetNormalTexture(nil)
ShaguUI.configUI.chatButton:SetPushedTexture(nil)
ShaguUI.configUI.chatButton:SetBackdrop(ShaguUI.Backdrop)
ShaguUI.configUI.chatButton:SetScript("OnClick", function()
    ShaguUI.chatSetup:Show()
    ShaguUIconfig["chatConfigured"] = true
  end)

ShaguUI.configUI.reloadUI = CreateFrame("Frame","ShaguConfigReloadUI",UIParent)
ShaguUI.configUI.reloadUI:SetFrameStrata("TOOLTIP")
ShaguUI.configUI.reloadUI:SetWidth(300)
ShaguUI.configUI.reloadUI:SetHeight(100)
ShaguUI.configUI.reloadUI:Hide()
tinsert(UISpecialFrames, "ShaguConfigReloadUI")

ShaguUI.configUI.reloadUI:SetBackdrop(ShaguUI.Backdrop)
ShaguUI.configUI.reloadUI:SetPoint("CENTER",0,0)

ShaguUI.configUI.reloadUI.text = ShaguUI.configUI.reloadUI:CreateFontString("Status", "LOW", "GameFontNormal")
ShaguUI.configUI.reloadUI.text:SetFontObject(GameFontWhite)
ShaguUI.configUI.reloadUI.text:SetFont("Interface\\AddOns\\ShaguUI\\fonts\\arial.ttf", 14)
ShaguUI.configUI.reloadUI.text:SetPoint("TOP", 0, -15)
ShaguUI.configUI.reloadUI.text:SetText("Some settings need to reload the UI to take effect.\nDo you want to reloadUI now?")

ShaguUI.configUI.reloadUI.yes = CreateFrame("Button", nil, ShaguUI.configUI.reloadUI, "UIPanelButtonTemplate")
ShaguUI.configUI.reloadUI.yes:SetWidth(100)
ShaguUI.configUI.reloadUI.yes:SetHeight(20) -- width, height
ShaguUI.configUI.reloadUI.yes:SetPoint("BOTTOMLEFT", 20,15)
ShaguUI.configUI.reloadUI.yes:SetText("Yes")
ShaguUI.configUI.reloadUI.yes:SetScript("OnClick", function()
    ShaguUI.configUI.hasChanged = false
    ReloadUI();
  end)
ShaguUI.configUI.reloadUI.no = CreateFrame("Button", nil, ShaguUI.configUI.reloadUI, "UIPanelButtonTemplate")
ShaguUI.configUI.reloadUI.no:SetWidth(100)
ShaguUI.configUI.reloadUI.no:SetHeight(20) -- width, height
ShaguUI.configUI.reloadUI.no:SetPoint("BOTTOMRIGHT", -20,15)
ShaguUI.configUI.reloadUI.no:SetText("No")
ShaguUI.configUI.reloadUI.no:SetScript("OnClick", function()
    ShaguUI.configUI.reloadUI:Hide()
  end)
