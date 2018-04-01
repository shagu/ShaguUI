ShaguAltUF = false
ShaguAltAB = false

-- Check if alternative Unit Frames are loaded
function checkAltUF()
  local conflicts = {
    "LunaUnitFrames", "XPerl", "Perl_Player", "DiscordUnitFrames",
    "ag_UnitFrames", "CT_UnitFrames", "Gypsy_UnitBars"
  }

  for i = 1, GetNumAddOns() do
    local addonName, _, _, enabled = GetAddOnInfo(i)
    if enabled then
      for id, conflict in pairs(conflicts) do
        if strfind(addonName, conflict) then
          ShaguAltUF = true
          return true
        end
      end
    end
  end
  return false
end

-- Check if alternative Action Bars are loaded
function checkAltAB()
  local conflicts = {
    "Bongos_ActionBar", "Bartender2", "DiscordActionBars"
  }

  for i = 1, GetNumAddOns() do
    local addonName, _, _, enabled = GetAddOnInfo(i)
    if enabled then
      for id, conflict in pairs(conflicts) do
        if strfind(addonName, conflict) then
          ShaguAltAB = true
          return true
        end
      end
    end
  end
  return false
end

