ShaguStanceDance = CreateFrame("Frame")
ShaguStanceDance:RegisterEvent("UI_ERROR_MESSAGE")

ShaguStanceDanceLastErr = ""
Hook_CastSpell = CastSpell
Hook_CastSpellByName = CastSpellByName
Hook_UseAction = UseAction

-- deDE
ShaguStanceDance.wantBattleStance = "Muss in Kampfhaltung sein."
ShaguStanceDance.wantBattleDefStance = "Muss in Kampfhaltung, Verteidigungshaltung sein."
ShaguStanceDance.BattleStance = "Kampfhaltung"
ShaguStanceDance.BattleStance = "Kampfhaltung"
ShaguStanceDance.wantBerserkerStance = "Muss in Berserkerhaltung sein."
ShaguStanceDance.BerserkerStance = "Berserkerhaltung"
ShaguStanceDance.wantDefensiveStance = "Muss in Verteidigungshaltung sein."
ShaguStanceDance.DefensiveStance = "Verteidigungshaltung"

function CastSpell(spellId, spellbookTabNum)
  if ShaguStanceDanceLastErr == ShaguStanceDance.wantBattleStance then
    Hook_CastSpellByName(ShaguStanceDance.BattleStance)
  elseif ShaguStanceDanceLastErr == ShaguStanceDance.wantBattleDefStance then
    Hook_CastSpellByName(ShaguStanceDance.BattleStance)
  elseif ShaguStanceDanceLastErr == ShaguStanceDance.wantBerserkerStance then
    Hook_CastSpellByName(ShaguStanceDance.BerserkerStance)
  elseif ShaguStanceDanceLastErr == ShaguStanceDance.wantDefensiveStance then
    Hook_CastSpellByName(ShaguStanceDance.DefensiveStance)
  end
  ShaguStanceDanceLastErr = ""

  Hook_CastSpell(spellId, spellbookTabNum)
end

function CastSpellByName(spellName, onSelf)
  if ShaguStanceDanceLastErr == ShaguStanceDance.wantBattleStance then
    Hook_CastSpellByName(ShaguStanceDance.BattleStance)
  elseif ShaguStanceDanceLastErr == ShaguStanceDance.wantBattleDefStance then
    Hook_CastSpellByName(ShaguStanceDance.BattleStance)
  elseif ShaguStanceDanceLastErr == ShaguStanceDance.wantBerserkerStance then
    Hook_CastSpellByName(ShaguStanceDance.BerserkerStance)
  elseif ShaguStanceDanceLastErr == ShaguStanceDance.wantDefensiveStance then
    Hook_CastSpellByName(ShaguStanceDance.DefensiveStance)
  end
  ShaguStanceDanceLastErr = ""

  Hook_CastSpellByName(spellName, onSelf)
end

function UseAction(slot, checkCursor, onSelf)
  if ShaguStanceDanceLastErr == ShaguStanceDance.wantBattleStance then
    Hook_CastSpellByName(ShaguStanceDance.BattleStance)
  elseif ShaguStanceDanceLastErr == ShaguStanceDance.wantBattleDefStance then
    Hook_CastSpellByName(ShaguStanceDance.BattleStance)
  elseif ShaguStanceDanceLastErr == ShaguStanceDance.wantBerserkerStance then
    Hook_CastSpellByName(ShaguStanceDance.BerserkerStance)
  elseif ShaguStanceDanceLastErr == ShaguStanceDance.wantDefensiveStance then
    Hook_CastSpellByName(ShaguStanceDance.DefensiveStance)
  end
  ShaguStanceDanceLastErr = ""

  Hook_UseAction(slot, checkCursor, onSelf)
end

ShaguStanceDance:SetScript("OnEvent", function()
  if not ShaguUIconfig["enableStanceDance"] then return end
  ShaguStanceDanceLastErr = arg1
end)