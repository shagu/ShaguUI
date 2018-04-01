ShaguUI.chatSetup = CreateFrame("Frame","ShaguChatSetup",UIParent)
ShaguUI.chatSetup:SetFrameStrata("TOOLTIP")
ShaguUI.chatSetup:SetWidth(300)
ShaguUI.chatSetup:SetHeight(100)
ShaguUI.chatSetup:Hide()
tinsert(UISpecialFrames, "ShaguConfigChatSetup")

ShaguUI.chatSetup:SetBackdrop(ShaguUI.Backdrop)
ShaguUI.chatSetup:SetPoint("CENTER",0,0)

ShaguUI.chatSetup.SetupChatFrames = function ()
  -- set position of Main Window
  ChatFrame1:ClearAllPoints()
  ChatFrame1:SetPoint("BOTTOMLEFT", WorldFrame, 32,45)
  ChatFrame1:SetWidth(399)
  ChatFrame1:SetHeight(124)
  FCF_SetLocked(ChatFrame1, 1)
  FCF_SetWindowColor(ChatFrame1, 0, 0, 0);
  FCF_SetWindowAlpha(ChatFrame1, 0);
  FCF_SetChatWindowFontSize(ChatFrame1, 12)

  -- set position of Loot & Spam
  if not ChatFrame3.isDocked == 1 or not ChatFrame3:IsShown() then
    FCF_OpenNewWindow("Loot & Spam")
  end

  FCF_SetWindowColor(ChatFrame3, 0, 0, 0);
  FCF_SetWindowAlpha(ChatFrame3, 0);
  FCF_SetChatWindowFontSize(ChatFrame3, 12)
  FCF_SetWindowName(ChatFrame3, "Loot & Spam", 1 )
  FCF_UnDockFrame(ChatFrame3)
  ChatFrame3:ClearAllPoints()
  ChatFrame3:SetPoint("BOTTOMRIGHT", WorldFrame, -32,45)
  ChatFrame3:SetWidth(399)
  ChatFrame3:SetHeight(124)
  FCF_SetLocked(ChatFrame3, 1)

  JoinChannelByName("World")

  ChatFrame_RemoveAllMessageGroups(ChatFrame1)
  ChatFrame_RemoveChannel(ChatFrame1, "Trade")
  ChatFrame_RemoveChannel(ChatFrame1, "General")
  ChatFrame_RemoveChannel(ChatFrame1, "LocalDefense")
  ChatFrame_RemoveChannel(ChatFrame1, "GuildRecruitment")
  ChatFrame_RemoveChannel(ChatFrame1, "LookingForGroup")

  ChatFrame_RemoveChannel(ChatFrame1, "Handel")
  ChatFrame_RemoveChannel(ChatFrame1, "Allgemein")
  ChatFrame_RemoveChannel(ChatFrame1, "LokaleVerteidigung")
  ChatFrame_RemoveChannel(ChatFrame1, "Gildenrekrutierung")
  ChatFrame_RemoveChannel(ChatFrame1, "SucheNachGruppe")

  ChatFrame_RemoveChannel(ChatFrame1, "World")

  ChatFrame_AddMessageGroup(ChatFrame1, "SAY")
  ChatFrame_AddMessageGroup(ChatFrame1, "EMOTE")
  ChatFrame_AddMessageGroup(ChatFrame1, "YELL")
  ChatFrame_AddMessageGroup(ChatFrame1, "GUILD")
  ChatFrame_AddMessageGroup(ChatFrame1, "OFFICER")
  ChatFrame_AddMessageGroup(ChatFrame1, "GUILD_ACHIEVEMENT")
  ChatFrame_AddMessageGroup(ChatFrame1, "WHISPER")
  ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_SAY")
  ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_EMOTE")
  ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_YELL")
  ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_WHISPER")
  ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_BOSS_EMOTE")
  ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_BOSS_WHISPER")
  ChatFrame_AddMessageGroup(ChatFrame1, "PARTY")
  ChatFrame_AddMessageGroup(ChatFrame1, "PARTY_LEADER")
  ChatFrame_AddMessageGroup(ChatFrame1, "RAID")
  ChatFrame_AddMessageGroup(ChatFrame1, "RAID_LEADER")
  ChatFrame_AddMessageGroup(ChatFrame1, "RAID_WARNING")
  ChatFrame_AddMessageGroup(ChatFrame1, "BATTLEGROUND")
  ChatFrame_AddMessageGroup(ChatFrame1, "BATTLEGROUND_LEADER")
  ChatFrame_AddMessageGroup(ChatFrame1, "BG_HORDE")
  ChatFrame_AddMessageGroup(ChatFrame1, "BG_ALLIANCE")
  ChatFrame_AddMessageGroup(ChatFrame1, "BG_NEUTRAL")
  ChatFrame_AddMessageGroup(ChatFrame1, "SYSTEM")
  ChatFrame_AddMessageGroup(ChatFrame1, "ERRORS")
  ChatFrame_AddMessageGroup(ChatFrame1, "AFK")
  ChatFrame_AddMessageGroup(ChatFrame1, "DND")
  ChatFrame_AddMessageGroup(ChatFrame1, "IGNORED")
  ChatFrame_AddMessageGroup(ChatFrame1, "ACHIEVEMENT")
  ChatFrame_AddMessageGroup(ChatFrame1, "BN_WHISPER")
  ChatFrame_AddMessageGroup(ChatFrame1, "BN_CONVERSATION")

  -- Setup the spam chat frame
  ChatFrame_RemoveAllMessageGroups(ChatFrame3)

  ChatFrame_AddChannel(ChatFrame3, "Trade")
  ChatFrame_AddChannel(ChatFrame3, "General")
  ChatFrame_AddChannel(ChatFrame3, "LocalDefense")
  ChatFrame_AddChannel(ChatFrame3, "GuildRecruitment")
  ChatFrame_AddChannel(ChatFrame3, "LookingForGroup")

  ChatFrame_AddChannel(ChatFrame3, "Handel")
  ChatFrame_AddChannel(ChatFrame3, "Allgemein")
  ChatFrame_AddChannel(ChatFrame3, "LokaleVerteidigung")
  ChatFrame_AddChannel(ChatFrame3, "Gildenrekrutierung")
  ChatFrame_AddChannel(ChatFrame3, "SucheNachGruppe")

  ChatFrame_AddChannel(ChatFrame3, "World")

  -- Setup the right chat
  ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_XP_GAIN")
  ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_HONOR_GAIN")
  ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_FACTION_CHANGE")
  ChatFrame_AddMessageGroup(ChatFrame3, "LOOT")
  ChatFrame_AddMessageGroup(ChatFrame3, "MONEY")

  -- save positions on logout
  ChatFrame1:SetUserPlaced(1);
  ChatFrame3:SetUserPlaced(1);
end

ShaguUI.chatSetup.text = ShaguUI.chatSetup:CreateFontString("Status", "LOW", "GameFontNormal")
ShaguUI.chatSetup.text:SetFontObject(GameFontWhite)
ShaguUI.chatSetup.text:SetFont("Interface\\AddOns\\ShaguUI\\fonts\\arial.ttf", 14)
ShaguUI.chatSetup.text:SetPoint("TOP", 0, -15)
ShaguUI.chatSetup.text:SetText("Do you want ShaguUI to arrange your chat windows?")

ShaguUI.chatSetup.yes = CreateFrame("Button", nil, ShaguUI.chatSetup, "UIPanelButtonTemplate")
ShaguUI.chatSetup.yes:SetWidth(100)
ShaguUI.chatSetup.yes:SetHeight(20) -- width, height
ShaguUI.chatSetup.yes:SetPoint("BOTTOMLEFT", 20,15)
ShaguUI.chatSetup.yes:SetText("Yes")
ShaguUI.chatSetup.yes:SetScript("OnClick", function()
    ShaguUI.chatSetup:SetupChatFrames()
    ShaguUI.chatSetup:Hide()
  end)

ShaguUI.chatSetup.no = CreateFrame("Button", nil, ShaguUI.chatSetup, "UIPanelButtonTemplate")
ShaguUI.chatSetup.no:SetWidth(100)
ShaguUI.chatSetup.no:SetHeight(20) -- width, height
ShaguUI.chatSetup.no:SetPoint("BOTTOMRIGHT", -20,15)
ShaguUI.chatSetup.no:SetText("No")
ShaguUI.chatSetup.no:SetScript("OnClick", function()
    ShaguUI.chatSetup:Hide()
  end)

ShaguUI.chatSetup:RegisterEvent("PLAYER_ENTERING_WORLD");
ShaguUI.chatSetup:SetScript("OnEvent", function(self, event, ...)
    if ShaguUIconfig["chatConfigured"] ~= true then
      ShaguUI.chatSetup:Show()
      ShaguUIconfig["chatConfigured"] = true
    end
  end)

ChatFrameEditBox:ClearAllPoints()
ChatFrameEditBox:SetHeight(24)
ChatFrameEditBox:SetWidth(403)
ChatFrameEditBox:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 30, 19)
ChatFrameEditBox:SetBackdrop(ShaguUI.Backdrop)
for i,v in ipairs({ChatFrameEditBox:GetRegions()}) do
  if i==6 or i==7 or i==8 then
    v:Hide()
  end
end
ChatFrameEditBox:SetAltArrowKeyMode(false)
