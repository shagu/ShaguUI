-- define the border as "backdrop"
local backdrop = {
  edgeFile = "Interface\\AddOns\\ShaguUI\\img\\combat", edgeSize = 16,
  insets = {left = 16, right = 16, top = 16, bottom = 16},
}

-- build the frame
local ShaguCombat = CreateFrame("Frame")
ShaguCombat:SetFrameStrata("BACKGROUND")
ShaguCombat:SetWidth(GetScreenWidth() * UIParent:GetEffectiveScale())
ShaguCombat:SetHeight(GetScreenHeight() * UIParent:GetEffectiveScale())
ShaguCombat:SetBackdrop(backdrop)
ShaguCombat:SetPoint("CENTER",0,0)
ShaguCombat:Hide()

-- register for events
ShaguCombat:RegisterEvent("PLAYER_ENTERING_WORLD")
ShaguCombat:RegisterEvent("PLAYER_REGEN_ENABLED")
ShaguCombat:RegisterEvent("PLAYER_REGEN_DISABLED")

-- let it fade..
ShaguCombat:SetScript("OnUpdate",function(s,e)
    if not ShaguCombat.clock then ShaguCombat.clock = GetTime() -0.1 end
    if GetTime() >= ShaguCombat.clock + 0.1 then
      ShaguCombat.clock = GetTime()
      if not ShaguCombat.fadeValue then ShaguCombat.fadeValue = 1 end
      if ShaguCombat.fadeValue >= 0.3 then
        ShaguCombat.fadeModifier = -0.1
      end
      if ShaguCombat.fadeValue <= 0 then
        ShaguCombat.fadeModifier = 0.1
      end
      ShaguCombat.fadeValue = ShaguCombat.fadeValue + ShaguCombat.fadeModifier
      ShaguCombat:SetBackdropBorderColor(1,0.2+ShaguCombat.fadeValue, ShaguCombat.fadeValue, 1-ShaguCombat.fadeValue);
    end
  end);

-- show/hide on combat
ShaguCombat:SetScript("OnEvent", function()
    if event == "PLAYER_REGEN_ENABLED" or event == "PLAYER_ENTERING_WORLD" then
      ShaguCombat:Hide()
      -- UIErrorsFrame:AddMessage("ShaguCombat |cffffffaa OUTFIGHT")
    end
    if event == "PLAYER_REGEN_DISABLED" and ShaguUIconfig["enableInfightGlow"] then
      ShaguCombat:Show()
      -- UIErrorsFrame:AddMessage("ShaguCombat |cffffffaa INFIGHT")
    end
  end)
