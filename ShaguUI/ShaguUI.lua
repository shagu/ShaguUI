ShaguUI = CreateFrame("Frame",nil,UIParent)

ShaguUI.Backdrop = {
  bgFile = "Interface\\AddOns\\ShaguUI\\img\\bg", tile = true, tileSize = 8,
  edgeFile = "Interface\\AddOns\\ShaguUI\\img\\border", edgeSize = 16,
  insets = {left = 0, right = 0, top = 0, bottom = 0},
}

ShaguUI.Buffdrop = {
  edgeFile = "Interface\\AddOns\\ShaguUI\\img\\border", edgeSize = 16,
  insets = {left = 4, right = 4, top = 4, bottom = 4},
}

ShaguUI.DefaultSettings = function ()
  ShaguUIconfig = {
    ["enableInfightGlow"] = true,
    ["enableMenubar"] = false,
    ["enableBlueShaman"] = true,
    ["enableChatTimestamps"] = false,
    ["enableOriginalCastbar"] = false,
    ["enablePartyinRaid"] = true,
    ["enableZoomedRaid"] = true,
    ["enableBigZoomedRaid"] = false,
    ["enableRaidFrames"] = true,
    ["enableShowAggro"] = true,
    ["enableHotTracker"] = true,
    ["enablePopupBlocker"] = true,
    ["enableRightActionbar"] = true,
    ["enableInventoryCount"] = true,
    ["enableHideBlizzardBuffs"] = false,
    ["enableClickableNameplate"] = true,
    ["enableAutomaticUnmount"] = true,
    ["enableBottomStance"] = false,
    ["enableBigBuffs"] = true,
    ["enableStanceDance"] = true,
    ["enablePvPIcon"] = true,
    ["enablePvPIconLuna"] = true,
  }
end

-- init config if not exists
if ShaguUIconfig == nil then
  ShaguUI:DefaultSettings()
end

-- bottom Decoration
ShaguUI.bottomDecoration = CreateFrame("Frame",nil,UIParent)
ShaguUI.bottomDecoration:SetFrameStrata("BACKGROUND")
ShaguUI.bottomDecoration:SetWidth(GetScreenWidth() * UIParent:GetEffectiveScale() - 60)
ShaguUI.bottomDecoration:SetHeight(8)
ShaguUI.bottomDecoration:SetBackdrop(ShaguUI.Backdrop)
ShaguUI.bottomDecoration:SetPoint("BOTTOM", UIParent, 0, 26)

-- left Decoration
ShaguUI.leftDecoration = CreateFrame("Frame",nil,UIParent)
ShaguUI.leftDecoration:SetFrameStrata("LOW")
ShaguUI.leftDecoration:SetWidth(16) -- Set these to whatever height/width is needed
ShaguUI.leftDecoration:SetHeight(256) -- for your Texture
ShaguUI.leftDecoration.texture = ShaguUI.leftDecoration:CreateTexture(nil,"BACKGROUND")
ShaguUI.leftDecoration.texture:SetTexture("Interface\\AddOns\\ShaguUI\\img\\cvl")
ShaguUI.leftDecoration.texture:SetAllPoints(ShaguUI.leftDecoration)
ShaguUI.leftDecoration:SetPoint("BOTTOMLEFT", 15, 15)
ShaguUI.leftDecoration:Show()

-- right Decoration
ShaguUI.rightDecoration = CreateFrame("Frame",nil,UIParent)
ShaguUI.rightDecoration:SetFrameStrata("LOW")
ShaguUI.rightDecoration:SetWidth(16) -- Set these to whatever height/width is needed
ShaguUI.rightDecoration:SetHeight(256) -- for your Texture
ShaguUI.rightDecoration.texture = ShaguUI.rightDecoration:CreateTexture(nil,"BACKGROUND")
ShaguUI.rightDecoration.texture:SetTexture("Interface\\AddOns\\ShaguUI\\img\\cvr")
ShaguUI.rightDecoration.texture:SetAllPoints(ShaguUI.rightDecoration)
ShaguUI.rightDecoration:SetPoint("BOTTOMRIGHT", -15, 15)
ShaguUI.rightDecoration:Show()

-- minimap Map
ShaguUI.minimapMap = CreateFrame("Frame",nil,UIParent)
ShaguUI.minimapMap:SetFrameStrata("BACKGROUND")
ShaguUI.minimapMap:SetWidth(146)
ShaguUI.minimapMap:SetHeight(146)
ShaguUI.minimapMap:SetBackdrop(ShaguUI.Backdrop)
ShaguUI.minimapMap:SetPoint("TOPRIGHT",UIParent, -15,-13)

-- minimap Info
ShaguUI.minimapInfo = CreateFrame("Frame",nil,UIParent)
ShaguUI.minimapInfo:SetFrameStrata("BACKGROUND")
ShaguUI.minimapInfo:SetWidth(146)
ShaguUI.minimapInfo:SetHeight(20)
ShaguUI.minimapInfo:SetBackdrop(ShaguUI.Backdrop)
ShaguUI.minimapInfo:SetPoint("TOPRIGHT",ShaguUI.minimapMap, "BOTTOMRIGHT", 0,-2)
ShaguUI.minimapInfo.TextCenter = ShaguUI.minimapInfo:CreateFontString("Status", "LOW", "GameFontNormal")
ShaguUI.minimapInfo.TextCenter:SetPoint("CENTER", 0, 0)
ShaguUI.minimapInfo.TextCenter:SetNonSpaceWrap(false)
ShaguUI.minimapInfo.TextCenter:SetFontObject(GameFontWhite)
ShaguUI.minimapInfo.TextCenter:SetFont("Interface\\AddOns\\ShaguUI\\fonts\\arial.ttf", 12)

-- left Chat
ShaguUI.leftChat = CreateFrame("Button",nil,UIParent)
ShaguUI.leftChat:SetFrameStrata("LOW")
ShaguUI.leftChat:SetWidth(403)
ShaguUI.leftChat:SetHeight(24)
ShaguUI.leftChat:SetBackdrop(ShaguUI.Backdrop)
ShaguUI.leftChat:SetPoint("BOTTOMLEFT", UIParent, 30, 19)
ShaguUI.leftChat:SetScript("OnClick", function()
    if ShaguUI.configUI:IsShown() then
      ShaguUI.configUI:Hide()
    else
      ShaguUI.configUI:Show()
    end
  end)
ShaguUI.leftChat:SetScript("OnEnter", function(self, motion)
    GameTooltip:SetOwner(this, "ANCHOR_NONE")
    GameTooltip:ClearLines()
    GameTooltip:AddLine("|cff555555Info")
    GameTooltip:AddDoubleLine("Left Click:","|cffffffffShow/Hide ShaguUI Config")
    GameTooltip:Show()
  end)
ShaguUI.leftChat:SetScript("OnLeave", function(self, motion)
    GameTooltip:Hide()
  end)

ShaguUI.leftChat.TextLeft = ShaguUI.leftChat:CreateFontString("Status", "LOW", "GameFontNormal")
ShaguUI.leftChat.TextLeft:SetPoint("LEFT", 15, 0)
ShaguUI.leftChat.TextLeft:SetFontObject(GameFontWhite)
ShaguUI.leftChat.TextLeft:SetFont("Interface\\AddOns\\ShaguUI\\fonts\\arial.ttf", 12)

ShaguUI.leftChat.TextCenter = ShaguUI.leftChat:CreateFontString("Status", "LOW", "GameFontNormal")
ShaguUI.leftChat.TextCenter:SetPoint("CENTER", 0, 0)
ShaguUI.leftChat.TextCenter:SetFontObject(GameFontWhite)
ShaguUI.leftChat.TextCenter:SetFont("Interface\\AddOns\\ShaguUI\\fonts\\arial.ttf", 12)

ShaguUI.leftChat.TextRight = ShaguUI.leftChat:CreateFontString("Status", "LOW", "GameFontNormal")
ShaguUI.leftChat.TextRight:SetPoint("RIGHT", -15, 0)
ShaguUI.leftChat.TextRight:SetFontObject(GameFontWhite)
ShaguUI.leftChat.TextRight:SetFont("Interface\\AddOns\\ShaguUI\\fonts\\arial.ttf", 12)

-- right Chat
ShaguUI.rightChat = CreateFrame("Button",nil,UIParent)
ShaguUI.rightChat:RegisterForClicks("LeftButtonUp", "RightButtonUp")
ShaguUI.rightChat:SetFrameStrata("LOW")
ShaguUI.rightChat:SetWidth(403)
ShaguUI.rightChat:SetHeight(24)
ShaguUI.rightChat:SetBackdrop(ShaguUI.Backdrop)
ShaguUI.rightChat:SetPoint("BOTTOMRIGHT", UIParent, -30, 19)
ShaguUI.rightChat:SetScript("OnClick", function(self, button, down)
    if arg1 == "LeftButton" then
      if ShaguUI.timerUI:IsShown() then
        ShaguUI.timerUI:Hide()
      else
        ShaguUI.timerUI:Show()
      end
    elseif arg1 == "RightButton" then
      ShaguUI.timerUI.Snapshot = GetTime()
    end
  end)
ShaguUI.rightChat:SetScript("OnEnter", function(self, motion)
    if not ShaguUI.initMoney then ShaguUI.initMoney = GetMoney() end
    ShaguUI.diffMoney = GetMoney() - ShaguUI.initMoney
    ShaguUI.currentMoney = GetMoney()

    ShaguUI.initGold = floor(ShaguUI.initMoney/ 100 / 100);
    ShaguUI.initSilver = floor(mod((ShaguUI.initMoney/100),100));
    ShaguUI.initCopper = floor(mod(ShaguUI.initMoney,100));

    ShaguUI.currentGold = floor(ShaguUI.currentMoney/ 100 / 100);
    ShaguUI.currentSilver = floor(mod((ShaguUI.currentMoney/100),100));
    ShaguUI.currentCopper = floor(mod(ShaguUI.currentMoney,100));

    ShaguUI.diffGold = floor(abs(ShaguUI.diffMoney/100/100));
    ShaguUI.diffSilver = floor(abs(mod((ShaguUI.diffMoney/100),100)));
    ShaguUI.diffCopper = floor(abs(mod(ShaguUI.diffMoney,100)));

    if ShaguUI.diffMoney < 0 then
      ShaguUI.diffModifier = "|cffffcccc"
      ShaguUI.diffNegative = "|cffffaaaa-"
    elseif ShaguUI.diffMoney > 0 then
      ShaguUI.diffModifier = "|cffccffcc"
      ShaguUI.diffNegative = "|cffaaffaa+"
    else
      ShaguUI.diffModifier = ""
      ShaguUI.diffNegative = ""
    end

    GameTooltip:SetOwner(this, "ANCHOR_NONE")
    GameTooltip:ClearLines()

    GameTooltip:AddLine("|cff555555Info")

    GameTooltip:AddDoubleLine("Login:",
      "|cffffffff " .. ShaguUI.initGold .. "|cffffd700g" ..
      "|cffffffff " .. ShaguUI.initSilver .. "|cffc7c7cfs" ..
      "|cffffffff " .. ShaguUI.initCopper .. "|cffeda55fc")

    GameTooltip:AddDoubleLine("Now:",
      "|cffffffff " .. ShaguUI.currentGold .. "|cffffd700g" ..
      "|cffffffff " .. ShaguUI.currentSilver .. "|cffc7c7cfs" ..
      "|cffffffff " .. ShaguUI.currentCopper .. "|cffeda55fc")

    GameTooltip:AddDoubleLine("|cffffffff","")

    GameTooltip:AddDoubleLine("This Session:",
      ShaguUI.diffNegative ..
      "|cffffffff " .. ShaguUI.diffModifier .. ShaguUI.diffGold .. "|cffffd700g" ..
      "|cffffffff " .. ShaguUI.diffModifier .. ShaguUI.diffSilver .. "|cffc7c7cfs" ..
      "|cffffffff " .. ShaguUI.diffModifier .. ShaguUI.diffCopper .. "|cffeda55fc")

    GameTooltip:AddDoubleLine("|cffffffff","")

    GameTooltip:AddDoubleLine("Left Click:","|cffffffffShow/Hide Timer")
    GameTooltip:AddDoubleLine("Right Click:","|cffffffffReset Timer")

    GameTooltip:Show()
  end)
ShaguUI.rightChat:SetScript("OnLeave", function(self, motion)
    GameTooltip:Hide()
  end)

ShaguUI.rightChat.TextLeft = ShaguUI.rightChat:CreateFontString("Status", "LOW", "GameFontNormal")
ShaguUI.rightChat.TextLeft:SetPoint("LEFT", 15, 0)
ShaguUI.rightChat.TextLeft:SetFontObject(GameFontWhite)
ShaguUI.rightChat.TextLeft:SetFont("Interface\\AddOns\\ShaguUI\\fonts\\arial.ttf", 12)

ShaguUI.rightChat.TextCenter = ShaguUI.rightChat:CreateFontString("Status", "LOW", "GameFontNormal")
ShaguUI.rightChat.TextCenter:SetPoint("CENTER", 0, 0)
ShaguUI.rightChat.TextCenter:SetFontObject(GameFontWhite)
ShaguUI.rightChat.TextCenter:SetFont("Interface\\AddOns\\ShaguUI\\fonts\\arial.ttf", 12)

ShaguUI.rightChat.TextRight = ShaguUI.rightChat:CreateFontString("Status", "LOW", "GameFontNormal")
ShaguUI.rightChat.TextRight:SetPoint("RIGHT", -15, 0)
ShaguUI.rightChat.TextRight:SetFontObject(GameFontWhite)
ShaguUI.rightChat.TextRight:SetFont("Interface\\AddOns\\ShaguUI\\fonts\\arial.ttf", 12)

ShaguUI.horizontalActionbar = CreateFrame("Frame",nil,UIParent)
ShaguUI.horizontalActionbar:SetFrameStrata("LOW")
ShaguUI.horizontalActionbar:SetWidth(520)
ShaguUI.horizontalActionbar:SetHeight(65)
ShaguUI.horizontalActionbar:SetBackdrop(ShaguUI.Backdrop)
ShaguUI.horizontalActionbar:SetPoint("BOTTOM", UIParent, 0, 15)

ShaguUI.verticalActionbar = CreateFrame("Frame",nil,UIParent)
ShaguUI.verticalActionbar:SetFrameStrata("LOW")
ShaguUI.verticalActionbar:SetWidth(65)
ShaguUI.verticalActionbar:SetHeight(350)
ShaguUI.verticalActionbar:SetBackdrop(ShaguUI.Backdrop)
ShaguUI.verticalActionbar:SetPoint("RIGHT", UIParent, -15, 0)
