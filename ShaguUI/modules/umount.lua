ShaguUI.umount = CreateFrame("Frame")
ShaguUI.umount:RegisterEvent("UI_ERROR_MESSAGE")

ShaguUI.umount.Buffs = { "spell_nature_swiftness", "_mount_", "_qirajicrystal_",
  "ability_racial_bearform", "ability_druid_catform", "ability_druid_travelform",
  "spell_nature_forceofnature", "ability_druid_aquaticform", "spell_shadow_shadowform",
  "spell_nature_spiritwolf" }

ShaguUI.umount.Errors = { SPELL_FAILED_NOT_MOUNTED, ERR_ATTACK_MOUNTED, ERR_TAXIPLAYERALREADYMOUNTED,
  SPELL_FAILED_NOT_SHAPESHIFT, SPELL_FAILED_NO_ITEMS_WHILE_SHAPESHIFTED, SPELL_NOT_SHAPESHIFTED,
  SPELL_NOT_SHAPESHIFTED_NOSPACE, ERR_CANT_INTERACT_SHAPESHIFTED, ERR_NOT_WHILE_SHAPESHIFTED,
  ERR_NO_ITEMS_WHILE_SHAPESHIFTED, ERR_TAXIPLAYERSHAPESHIFTED,ERR_MOUNT_SHAPESHIFTED,
  ERR_EMBLEMERROR_NOTABARDGEOSET }

ShaguUI.umount:SetScript("OnEvent", function()
    if not ShaguUIconfig["enableAutomaticUnmount"] then return end

    for id, errorstring in pairs(ShaguUI.umount.Errors) do
      if arg1 == errorstring then
        for i=0,15,1 do
          currBuffTex = GetPlayerBuffTexture(i);
          if (currBuffTex) then

            for id, bufftype in pairs(ShaguUI.umount.Buffs) do
              if string.find(string.lower(currBuffTex), bufftype) then
                CancelPlayerBuff(i);
              end
            end
          end
        end
      end
    end
  end)

