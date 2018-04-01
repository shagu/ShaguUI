ShaguUI.eventList = {
  "PLAYER_ENTERING_WORLD", "PLAYER_MONEY", "PLAYER_XP_UPDATE", "FRIENDLIST_UPDATE",
  "GUILD_ROSTER_UPDATE", "PLAYER_GUILD_UPDATE", "PLAYER_REGEN_ENABLED",
  "PLAYER_DEAD", "ZONE_CHANGED_NEW_AREA", "ZONE_CHANGED_INDOORS", "UNIT_AURA", "ADDON_LOADED", "UNIT_FACTION"
}

table.foreach(ShaguUI.eventList, function(k,v)
    ShaguUI:RegisterEvent(v)
  end)

ShaguUI:SetScript("OnEvent", function()
    if event == "ADDON_LOADED" then

      ShaguUI:clientSetup()
    elseif event == "PLAYER_ENTERING_WORLD" then
      if not checkAltUF() then
        -- Change Luna Appearance to ShaguUI
        if LunaPlayerFrame.borderp == nil then
          LunaPlayerFrame.borderp = CreateFrame("Frame", nil, LunaPlayerFrame.bars["Healthbar"])
          LunaPlayerFrame.borderp:SetFrameLevel(LunaPlayerFrame.bars["Healthbar"]:GetFrameLevel())
          LunaPlayerFrame.borderp:SetPoint("TOPLEFT", LunaPlayerFrame.bars["Healthbar"], "TOPLEFT", -3, 3)
          LunaPlayerFrame.borderp:SetPoint("BOTTOMRIGHT", LunaPlayerFrame.bars["Healthbar"], "BOTTOMRIGHT", 3, -3)
          LunaPlayerFrame.borderp:SetBackdrop(ShaguUI.Backdrop)
        end

        if LunaPlayerFrame.border == nil then
          LunaPlayerFrame.border = CreateFrame("Frame", nil, LunaPlayerFrame.bars["Powerbar"])
          LunaPlayerFrame.border:SetFrameLevel(LunaPlayerFrame.bars["Powerbar"]:GetFrameLevel())
          LunaPlayerFrame.border:SetPoint("TOPLEFT", LunaPlayerFrame.bars["Powerbar"], "TOPLEFT", -3, 3)
          LunaPlayerFrame.border:SetPoint("BOTTOMRIGHT", LunaPlayerFrame.bars["Powerbar"], "BOTTOMRIGHT", 3, -3)
          LunaPlayerFrame.border:SetBackdrop(ShaguUI.Backdrop)
        end

        if LunaTargetFrame.borderp == nil then
          LunaTargetFrame.borderp = CreateFrame("Frame", nil, LunaTargetFrame.bars["Healthbar"])
          LunaTargetFrame.borderp:SetFrameLevel(LunaTargetFrame.bars["Healthbar"]:GetFrameLevel())
          LunaTargetFrame.borderp:SetPoint("TOPLEFT", LunaTargetFrame.bars["Healthbar"], "TOPLEFT", -3, 3)
          LunaTargetFrame.borderp:SetPoint("BOTTOMRIGHT", LunaTargetFrame.bars["Healthbar"], "BOTTOMRIGHT", 3, -3)
          LunaTargetFrame.borderp:SetBackdrop(ShaguUI.Backdrop)
        end

        if LunaTargetFrame.border == nil then
          LunaTargetFrame.border = CreateFrame("Frame", nil, LunaTargetFrame.bars["Powerbar"])
          LunaTargetFrame.border:SetFrameLevel(LunaTargetFrame.bars["Powerbar"]:GetFrameLevel())
          LunaTargetFrame.border:SetPoint("TOPLEFT", LunaTargetFrame.bars["Powerbar"], "TOPLEFT", -3, 3)
          LunaTargetFrame.border:SetPoint("BOTTOMRIGHT", LunaTargetFrame.bars["Powerbar"], "BOTTOMRIGHT", 3, -3)
          LunaTargetFrame.border:SetBackdrop(ShaguUI.Backdrop)
        end
        
        if LunaTargetTargetFrame.border == nil then
          LunaTargetTargetFrame.border = CreateFrame("Frame", nil, LunaTargetTargetFrame)
          LunaTargetTargetFrame.border:SetFrameLevel(LunaTargetTargetFrame:GetFrameLevel())
          LunaTargetTargetFrame.border:SetPoint("TOPLEFT", LunaTargetTargetFrame, "TOPLEFT", -3, 3)
          LunaTargetTargetFrame.border:SetPoint("BOTTOMRIGHT", LunaTargetTargetFrame, "BOTTOMRIGHT", 3, -3)
          LunaTargetTargetFrame.border:SetBackdrop(ShaguUI.Backdrop)
        end
        
        if LunaPetFrame.border == nil then
          LunaPetFrame.border = CreateFrame("Frame", nil, LunaPetFrame)
          LunaPetFrame.border:SetFrameLevel(LunaPetFrame:GetFrameLevel())
          LunaPetFrame.border:SetPoint("TOPLEFT", LunaPetFrame, "TOPLEFT", -3, 3)
          LunaPetFrame.border:SetPoint("BOTTOMRIGHT", LunaPetFrame, "BOTTOMRIGHT", 3, -3)
          LunaPetFrame.border:SetBackdrop(ShaguUI.Backdrop)
        end

        if ShaguUIconfig["enableBigBuffs"] == true and not ShaguAltUF then
          LunaOptions["frames"]["LunaPlayerFrame"]["BuffInRow"] = 8
          LunaOptions["frames"]["LunaTargetFrame"]["BuffInRow"] = 8
          LunaPlayerFrame.UpdateBuffSize()
          LunaTargetFrame.UpdateBuffSize()
        end
      end

      -- bottom stance warrior
      if ShaguUIconfig["enableBottomStance"] == true and not ShaguAltAB and Bartender.db.profile ~= nil then
        local _, class = UnitClass("player")
        if class == "WARRIOR" then
          BT2DefaultPositions["Bar6"]["PosX"] = -55
          BT2DefaultPositions["Bar6"]["PosY"] = 125
          BT2DefaultPositions["Bar6"]["Anchor"] = "BOTTOM"
          Bartender:LoadPosition("Bar6")
        end
        if class == "DRUID" then
          -- with moonkin button
          if Bar6Button5:IsShown() then
            Bartender.db.profile["Bar6"].Scale = 0.75
            Bartender:ButtonScaleCheck()

            Bartender.db.profile["Bar6"].Padding = 3
            BT2DefaultPositions["Bar6"]["PosX"] = -86
            BT2DefaultPositions["Bar6"]["PosY"] = 143
            BT2DefaultPositions["Bar6"]["Anchor"] = "BOTTOM"
            Bartender:LoadPosition("Bar6")
            Bartender:SetupBar6()
          else
            -- without moonkin button
            Bartender.db.profile["Bar6"].Padding = 5
            BT2DefaultPositions["Bar6"]["PosX"] = -73
            BT2DefaultPositions["Bar6"]["PosY"] = 118
            BT2DefaultPositions["Bar6"]["Anchor"] = "BOTTOM"
            Bartender:LoadPosition("Bar6")
            Bartender:SetupBar6()
          end
        end
        Bar6:SetWidth(20)
      end

      MultiBarBottomLeft:Show()
      MultiBarBottomRight:Show()
      MultiBarLeft:Show()
      MultiBarRight:Show()

      ShaguUI:clientSetup()
      ShaguUI:UpdateFriend()
      ShaguUI:UpdateGuild();
      ShaguUI:UpdateRepair();
      ShaguUI:UpdateGold()
      ShaguUI:UpdateExp()
      ShaguUI:UpdateMinimap()
      ShaguUI:UpdateBuffFrame()
      ShaguUI:UpdatePvP()
    elseif event == "UNIT_AURA" then
      ShaguUI:UpdateBuffFrame()
    elseif event == "PLAYER_MONEY" then
      ShaguUI:UpdateGold()
      ShaguUI:UpdateRepair();
    elseif event == "PLAYER_XP_UPDATE" then
      ShaguUI:UpdateExp()
    elseif event == "FRIENDLIST_UPDATE" then
      ShaguUI:UpdateFriend()
    elseif event == "GUILD_ROSTER_UPDATE" or event == "PLAYER_GUILD_UPDATE" then
      ShaguUI:UpdateGuild();
    elseif event == "PLAYER_REGEN_ENABLED" or event == "PLAYER_DEAD" then
      ShaguUI:UpdateRepair();
    elseif event == "ZONE_CHANGED_NEW_AREA" or event == "ZONE_CHANGED_INDOORS" then
      ShaguUI:UpdateMinimap()
    elseif event == "UNIT_FACTION" then
      ShaguUI:UpdatePvP()
    end
  end)

-- Update Buff Frames
ShaguUI.UpdateBuffFrame = function ()
  if ShaguUIconfig["enableHideBlizzardBuffs"] and ShaguUIconfig["enableHideBlizzardBuffs"] == true then
    BuffFrame:Hide()
  else
    for i = 0, 31 do
      buttonName = "BuffButton"..i;
      if getglobal(buttonName) ~= nil then
        buff = getglobal(buttonName);
        buff:SetBackdrop(ShaguUI.Buffdrop)
      end

      if getglobal(buttonName.."Border") ~= nil then
        buff = getglobal(buttonName.."Border");
        buff:SetTexture("Interface\\AddOns\\ShaguUI\\img\\debuff")
        buff:SetTexCoord(0,1,0,1)
      end
    end
  end
end

ShaguUI.UpdatePvP = function ()
  if ShaguUIconfig and ShaguUIconfig["enablePvPIcon"] then
    if ShaguUI.PvPIcon == nil then
      ShaguUI.PvPIcon = CreateFrame("Frame",nil,UIParent)
      ShaguUI.PvPIcon:SetFrameStrata("HIGH")
      ShaguUI.PvPIcon:SetWidth(12) -- Set these to whatever height/width is needed
      ShaguUI.PvPIcon:SetHeight(12) -- for your Texture
      ShaguUI.PvPIcon.texture = ShaguUI.PvPIcon:CreateTexture(nil,"BACKGROUND")
      ShaguUI.PvPIcon.texture:SetTexture("Interface\\AddOns\\ShaguUI\\img\\" .. strlower(UnitFactionGroup("player")))
      ShaguUI.PvPIcon.texture:SetAllPoints(ShaguUI.PvPIcon)
      if ShaguUIconfig["enablePvPIconLuna"] and LunaPlayerFrame then
        ShaguUI.PvPIcon:SetPoint("TOPLEFT", LunaPlayerFrame.bars["Healthbar"], "TOPLEFT", -10, 10)
      else
        ShaguUI.PvPIcon:SetPoint("BOTTOMRIGHT", ShaguUI.minimapInfo, "BOTTOMRIGHT", -4, 4)
      end
    end

    if UnitIsPVP("player") then
      ShaguUI.PvPIcon:Show()
    else
      ShaguUI.PvPIcon:Hide()
    end
  end
end

-- Setup the Client
ShaguUI.clientSetup = function ()
  font = "Interface\\AddOns\\ShaguUI\\fonts\\arial.ttf"
  combat_font = "Interface\\AddOns\\ShaguUI\\fonts\\combat_font.ttf"

  STANDARD_TEXT_FONT = font;
  UNIT_NAME_FONT = font;
  DAMAGE_TEXT_FONT = combat_font;
  NAMEPLATE_FONT = font;

  SystemFont:SetFont(font, 15)
  GameFontNormal:SetFont(font, 12)
  GameFontBlack:SetFont(font, 12)
  GameFontNormalSmall:SetFont(font, 10)
  GameFontNormalLarge:SetFont(font, 16)
  GameFontNormalHuge:SetFont(font, 20)
  NumberFontNormal:SetFont(font, 14, "OUTLINE")
  NumberFontNormalSmall:SetFont(font, 14, "OUTLINE")
  NumberFontNormalLarge:SetFont(font, 16, "OUTLINE")
  NumberFontNormalHuge:SetFont(font, 30, "OUTLINE")
  QuestTitleFont:SetFont(font, 18)
  QuestFont:SetFont(font, 13)
  QuestFontHighlight:SetFont(font, 14)
  ItemTextFontNormal:SetFont(font, 15)
  MailTextFontNormal:SetFont(font, 15)
  SubSpellFont:SetFont(font, 10)
  DialogButtonNormalText:SetFont(font, 16)
  ZoneTextFont:SetFont(font, 48, "OUTLINE")
  SubZoneTextFont:SetFont(font, 24, "OUTLINE")
  TextStatusBarTextSmall:SetFont(font, 12, "NORMAL")
  GameTooltipText:SetFont(font, 12)
  GameTooltipTextSmall:SetFont(font, 10)
  GameTooltipHeaderText:SetFont(font, 14)
  WorldMapTextFont:SetFont(font, 102, "THICK")
  InvoiceTextFontNormal:SetFont(font, 12)
  InvoiceTextFontSmall:SetFont(font, 10)
  CombatTextFont:SetFont(font, 25)
  ChatFontNormal:SetFont(font, 12, "NORMAL")


  ConsoleExec( 'SET CombatLogRangeParty "43"' );
  ConsoleExec( 'SET CombatLogRangePartyPet "43"' );
  ConsoleExec( 'SET CombatLogRangeFriendlyPlayers "43"' );
  ConsoleExec( 'SET CombatLogRangeFriendlyPlayersPets "43"' );
  ConsoleExec( 'SET CombatLogRangeHostilePlayers "43"' );

  if ShaguUIconfig["enablePopupBlocker"] == true then
    message = function (msg)
      DEFAULT_CHAT_FRAME:AddMessage("|cffcccc33INFO: |cffffff55"..msg)
    end
    ScriptErrors:SetScript("OnShow", function(msg)
        DEFAULT_CHAT_FRAME:AddMessage("|cffcc3333ERROR: |cffff5555"..ScriptErrors_Message:GetText())
        ScriptErrors:Hide()
      end)
  end



  if not ShaguUIconfig["enableRightActionbar"] == true and not ShaguAltAB and Bartender.db.profile ~= nil then
    Bartender.db.profile["Bar4"].Hide = true
    Bartender.db.profile["Bar5"].Hide = true
    Bartender.db.profile["Bar7"].PosX = 200




    if Bar7 ~= nil then
      BT2DefaultPositions["Bar7"]["PosX"] = -52
      Bartender:LoadPosition("Bar7")
      Bartender:ButtonHideCheck()
    end
    ShaguUI.verticalActionbar:Hide()
  end

  if ShaguUIconfig["enableBlueShaman"] then
    RAID_CLASS_COLORS = {
      ["WARRIOR"] = { r = 0.78, g = 0.61, b = 0.43, colorStr = "ffc79c6e" },
      ["MAGE"] = { r = 0.41, g = 0.8, b = 0.94, colorStr = "ff69ccf0" },
      ["ROGUE"] = { r = 1, g = 0.96, b = 0.41, colorStr = "fffff569" },
      ["DRUID"] = { r = 1, g = 0.49, b = 0.04, colorStr = "ffff7d0a" },
      ["HUNTER"] = { r = 0.67, g = 0.83, b = 0.45, colorStr = "ffabd473" },
      ["SHAMAN"] = { r = 0.14, g = 0.35, b = 1.0, colorStr = "ff0070de" },
      ["PRIEST"] = { r = 1, g = 1, b = 1, colorStr = "ffffffff" },
      ["WARLOCK"] = { r = 0.58, g = 0.51, b = 0.79, colorStr = "ff9482c9" },
      ["PALADIN"] = { r = 0.96, g = 0.55, b = 0.73, colorStr = "fff58cba" }
    }
  else
    RAID_CLASS_COLORS = {
      ["WARRIOR"] = { r = 0.78, g = 0.61, b = 0.43, colorStr = "ffc79c6e" },
      ["MAGE"] = { r = 0.41, g = 0.8, b = 0.94, colorStr = "ff69ccf0" },
      ["ROGUE"] = { r = 1, g = 0.96, b = 0.41, colorStr = "fffff569" },
      ["DRUID"] = { r = 1, g = 0.49, b = 0.04, colorStr = "ffff7d0a" },
      ["HUNTER"] = { r = 0.67, g = 0.83, b = 0.45, colorStr = "ffabd473" },
      ["SHAMAN"] = { r = 0.96, g = 0.55, b = 0.73, colorStr = "fff58cba" },
      ["PRIEST"] = { r = 1, g = 1, b = 1, colorStr = "ffffffff" },
      ["WARLOCK"] = { r = 0.58, g = 0.51, b = 0.79, colorStr = "ff9482c9" },
      ["PALADIN"] = { r = 0.96, g = 0.55, b = 0.73, colorStr = "fff58cba" }
    }
  end
end

-- Update Minimap
ShaguUI.UpdateMinimap = function ()
  if ShaguUIconfig["enableMenubar"] and not ShaguAltAB then
    Bar9:Show()
  else
    if not ShaguAltAB then Bar9:Hide() end
    ShaguUI.minimapInfo.TextCenter:SetText(GetZoneText())
  end
end

-- Update Experience
ShaguUI.UpdateExp = function ()
  curexp = UnitXP("player")
  if oldexp ~= nil then
    difexp = curexp - oldexp
    maxexp = UnitXPMax("player")
    remexp = floor((maxexp - curexp)/difexp)
    remstring = "|cff555555 [" .. remexp .. "]|r"
  end
  oldexp = curexp

  if (UnitLevel("player") ~= 60) then
    local a=UnitXP("player")
    local b=UnitXPMax("player")
    local xprested = tonumber(GetXPExhaustion())
    if remstring == nil then remstring = "" end
    if xprested ~= nil then
      ShaguUI.leftChat.TextLeft:SetText("Exp:|cffaaaaff "..floor((a/b)*100).."%"..remstring)
    else
      ShaguUI.leftChat.TextLeft:SetText("Exp: " .. floor((a/b)*100) .. "%" .. remstring)
    end
  end
end

-- Update Gold
ShaguUI.UpdateGold = function ()
  if not ShaguUI.initMoney then ShaguUI.initMoney = GetMoney() end
  ShaguUI.Gold = floor(GetMoney()/ 100 / 100);
  ShaguUI.Silver = floor(mod((GetMoney()/100),100));
  ShaguUI.Copper = floor(mod(GetMoney(),100));

  ShaguUI.rightChat.TextRight:SetText(
    ShaguUI.Gold .. "|cffffd700g|r " ..
    ShaguUI.Silver .. "|cffc7c7cfs|r " ..
    ShaguUI.Copper .. "|cffeda55fc|r"
  )
end

-- Update Friends
ShaguUI.UpdateFriend = function ()
  local online = 0;
  local all = GetNumFriends();
  for friendIndex=1, all do
    friend_name, friend_level, friend_class, friend_area, friend_connected = GetFriendInfo(friendIndex);
    if ( friend_connected ) then
      online = online + 1;
    end
  end
  ShaguUI.leftChat.TextRight:SetText("Friends: " .. online)
end

-- Update Guild
ShaguUI.UpdateGuild = function ()
  GuildRoster()
  if (UnitLevel("player") >= 60) then
    local online = GetNumGuildMembers();
    local all = GetNumGuildMembers(true);
    ShaguUI.leftChat.TextLeft:SetText("Guild: "..online)
  end
end

-- Update Clock & Performance
local SClock = CreateFrame("Frame",nil,UIParent)
SClock:SetScript("OnUpdate",function(s,e)
    if not SClock.oneSec then SClock.oneSec = GetTime() -5 end
    if not SClock.fiveSec then SClock.fiveSec = GetTime() - 5 end

    if GetTime() >= SClock.oneSec + 1 then
      SClock.oneSec = GetTime()
      -- time
      ShaguUI.rightChat.TextCenter:SetText(date("%H:%M:%S"))
    end

    if GetTime() >= SClock.fiveSec + 5 then
      SClock.fiveSec = GetTime()
      -- fps
      local down, up, lag = GetNetStats();
      local fps = floor(GetFramerate());
      ShaguUI.rightChat.TextLeft:SetText(fps.." fps & "..lag.." ms")
    end
  end);

-- Update Durability
ShaguUI.repairToolTip = CreateFrame('GameTooltip', "ShaguUI.repairToolTip", UIParent, "GameTooltipTemplate")
ShaguUI.UpdateRepair = function ()
  local slotnames = { "Head", "Shoulder", "Chest", "Wrist",
    "Hands", "Waist", "Legs", "Feet", "MainHand", "SecondaryHand", "Ranged", };
  local id, hasItem, repairCost;
  local itemName, durability, tmpText, midpt, lval, rval;

  duraLowestslotName = nil;
  repPercent = 100;
  lowestPercent = 100;

  for i,slotName in pairs(slotnames) do
    id, _ = GetInventorySlotInfo(slotName.. "Slot");
    ShaguUI.repairToolTip:Hide()
    ShaguUI.repairToolTip:SetOwner(this, "ANCHOR_LEFT");
    hasItem, _, repCost = ShaguUI.repairToolTip:SetInventoryItem("player", id);
    if (not hasItem) then ShaguUI.repairToolTip:ClearLines()
    else
      for i=1, 30, 1 do
        tmpText = getglobal("ShaguUI.repairToolTipTextLeft"..i);
        if (tmpText ~= nil) and (tmpText:GetText()) then
          local searchstr = string.gsub(DURABILITY_TEMPLATE, "%%[^%s]+", "(.+)")
          _, _, lval, rval = string.find(tmpText:GetText(), searchstr);
          if (lval and rval) then
            repPercent = math.floor(lval / rval * 100)
            break;
          end
        end
      end
    end
    if repPercent < lowestPercent then
      lowestPercent = repPercent
    end
  end
  ShaguUI.repairToolTip:Hide()
  ShaguUI.leftChat.TextCenter:SetText(lowestPercent .. "% Armor")
end
