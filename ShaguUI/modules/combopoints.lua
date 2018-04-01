local ShaguComboPoints = CreateFrame("Frame")

ShaguComboPoints:RegisterEvent("UNIT_COMBO_POINTS")
ShaguComboPoints:RegisterEvent("PLAYER_COMBO_POINTS")
ShaguComboPoints:RegisterEvent("UNIT_DISPLAYPOWER")
ShaguComboPoints:RegisterEvent("PLAYER_TARGET_CHANGED")
ShaguComboPoints:RegisterEvent('UNIT_ENERGY');
ShaguComboPoints:RegisterEvent("PLAYER_ENTERING_WORLD")

ShaguComboPoint1 = CreateFrame("Frame")
ShaguComboPoint2 = CreateFrame("Frame")
ShaguComboPoint3 = CreateFrame("Frame")
ShaguComboPoint4 = CreateFrame("Frame")
ShaguComboPoint5 = CreateFrame("Frame")

ShaguComboPoints:SetScript("OnEvent", function()
  if event == "PLAYER_ENTERING_WORLD" then 
    for point=1, 5 do
      getglobal("ShaguComboPoint" .. point):SetFrameStrata("HIGH")
      getglobal("ShaguComboPoint" .. point):SetWidth(10)
      getglobal("ShaguComboPoint" .. point):SetHeight(10)
      getglobal("ShaguComboPoint" .. point):SetBackdrop({  
        bgFile = "Interface\\AddOns\\ShaguUI\\img\\normTex", tile = true, tileSize = 8,
        edgeFile = "Interface\\AddOns\\ShaguUI\\img\\border", edgeSize = 8,
        insets = {left = 0, right = 0, top = 0, bottom = 0},
          ["enableAggressiveNameplate"] = true,
      })
      getglobal("ShaguComboPoint" .. point):SetPoint("TOPLEFT", LunaTargetFrame, "TOPRIGHT", 5, -11 * point + 14)
      getglobal("ShaguComboPoint" .. point):SetBackdropColor(1,1,0.3, point / 10 * 2 + 0.2)
      getglobal("ShaguComboPoint" .. point):Hide()
    end
  else
    local combopoints = GetComboPoints("target")
    for point=1, 5 do
      getglobal("ShaguComboPoint" .. point):Hide()
    end
    for point=1, combopoints do
      getglobal("ShaguComboPoint" .. point):Show()
    end
  end
end)
