SLASH_OPENGM1, SLASH_OPENGM2 = '/gm', '/support';
function SlashCmdList.OPENGM(msg, editbox)
  ToggleHelpFrame(1)
end

SLASH_RELOAD1, SLASH_RELOAD2 = '/rl', '/reload';
function SlashCmdList.RELOAD(msg, editbox)
  ReloadUI()
end
