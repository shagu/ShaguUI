ShaguUI.timerUI = CreateFrame("Frame",nil,UIParent)
ShaguUI.timerUI:RegisterEvent("PLAYER_ENTERING_WORLD");
ShaguUI.timerUI:SetScript("OnEvent", function(self, event, ...)
    -- apply settings
  end)

ShaguUI.timerUI:Hide()
ShaguUI.timerUI:SetFrameStrata("TOOLTIP")
ShaguUI.timerUI:SetWidth(200)
ShaguUI.timerUI:SetHeight(50)
ShaguUI.timerUI:SetPoint("TOP",0,-100)

ShaguUI.timerUI.text = ShaguUI.timerUI:CreateFontString("Status", "LOW", "GameFontNormal")
ShaguUI.timerUI.text:SetFontObject(GameFontWhite)
ShaguUI.timerUI.text:SetFont("Interface\\AddOns\\ShaguUI\\fonts\\arial.ttf", 14)
ShaguUI.timerUI.text:SetPoint("CENTER", 0, 0)

ShaguUI.timerUI:SetScript("OnUpdate", function()
    if not ShaguUI.timerUI.Snapshot then ShaguUI.timerUI.Snapshot = GetTime() end
    ShaguUI.timerUI.curTime = SecondsToTime(floor(GetTime() - ShaguUI.timerUI.Snapshot))
    if ShaguUI.timerUI.curTime ~= "" then
      ShaguUI.timerUI.text:SetText("|c33cccccc" .. ShaguUI.timerUI.curTime)
    else
      ShaguUI.timerUI.text:SetText("|cffff3333 --- NEW TIMER ---")
    end
  end)
