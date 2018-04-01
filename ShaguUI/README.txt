About ShaguUI:
==============
This Addon Set is supposed to be a static configured All-in-One User-Interface 
with the goal of being the same on every PC and every screen resolution, 
without the need of sharing and modifying the "WTF" folders between several PCs.

The Interface is highly inspired by TukUI. This collection includes Addons like
LunaUnitFrames, Bartender2, simpleMinimap, Prat, customNameplates, OneBag, WIM 
and alot (all required) ACE2 Libraries. 

Installation:
=============
You should have received an archive containing two folders ("WIM" and "ShaguUI").
Copy them to your World of Warcraft Directory under Interface\AddOns. 
You should now have Interface\AddOns\ShaguUI and Interface\AddOns\WIM.

If you experience errors, please try to disable all addons beside ShaguUI and 
clean your WDB folder before reporting your bug. If you experience bugs with
other addons please check if you still got those problems without ShaguUI before
reporting any bug to me.

Configuration:
==============
As mentioned before, this is a static Interface, don't expect many configuration
options without reading through the code. Nevertheless there is a configuration-
menu which let you choose a few things many people wanted me to implement. To
open that menu, click on the panel below the bottom-left chat window.

Options:
========
## Buttons
chat:   
  Automatically places your chat windows to the correct positions and 
  enables and disables specific Channels/Messages on them.

reset:  
  Resets the UI to its default configuration.

x:
  Close the configuration menu, if you made any changes, a popup will appear, 
  asking you if you want to reload your UI.

## Checkboxes (default)
Infight Glow effects (on):
  If enabled, this will paint a glowing border around your screen edges as long
  as your character is infight.

Show Shamans as Blue (on):
  If enabled, all shamans will be shown with a blue class color instead of pink
  which was the default on classic wow. These settings affect the chat, map,
  unitframes and hopefully everything.

Show Timestamps in Chat (off):
  If enabled, the chat will include timestamps before every message. (HH:MM)

Info- and Error Popup Blocker (on):
  If enabled, every Popup message like Error frames or Info messages will be sent
  to your chat instead of bugging in the middle of the scren. Theese messages will
  have two different prefixes
    INFO: Text
    With a yellow color indicates a default message like /script message("Text")

    ERROR: Text
    With a red color indicates a error message like /script nil=nil
      
Accountwide Inventory Counter (on):
  If enabled, the tooltip on your bag items will be appended by several lines
  which are showing the amount of items available on other characters on this account.
    
Aggressive Nameplate scanning (on):
  If enabled, the nameplate function is scanning for new targets even if 
  another unit is focused.

Clickable Nameplates (on):
  If disabled, you can click through the nameplates. e.g while moving etc.

Automatic unmount and shapeshift (on)
  If performing any action that cannot be done on mount, you will be dismounted automatically.
  Same goes for Shapeshifting.

Automatic stance dance (on):
  Warriors only: If performing a skill which requires a specific stance, 
  the addon will automatically switch to the required stance.

Use Bottom Stance Bars (off)
  If enabled, the stance bar will be shown at the bottom, between Player and target frame, 
  instead of Top-left on the screen.

Enable Raidframes (on):
  If enabled, the Raidframes which are provided by LunaUnitFrames will be active.

Show party while in raid (on):
  If enabled, the Partyframes will be still visible while being in a Raidgroup.

Enable Zoomed Raid Frames (2x):
  If enabled, the Raidframes will be zoomed by 2x or 4x. On low screen resolutions
  without UI-Scale, theese settings might overlap with other frames.

Show Aggro in Frames (on):
  If enabled, players with aggro will be shown in the Raidframes with a red dot.

Show HoTs in Raid (on):
  If enabled, Druid and Priest hots will be visible in the Raidframes.

Use original Castbar (off):
  If enabled, the castbar which is integrated in the Luna Unit Frames will be
  disabled and instead the default world of warcraft castbar will be shown.

Use big buff/debuff icons (on)
  If enabled, bigger Buff & Debuff Icons will be used on Player and Target Frame.

Show Menubar instead of Location (off):
  If enabled, the Location text below your Minimap will be replaced by the 
  default menubar, the one including buttons for character info, spellbook, 
  talents, support menu and so on.

Enable vertical Actionbars (on):
  If enabled, the (right) vertical Actionbars will be visible.
