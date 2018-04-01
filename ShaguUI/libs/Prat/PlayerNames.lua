--[[
Name: Prat_PlayerNames
Revision: $Revision: 16689 $
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
Inspired by: idChat2_PlayerNames by Industrial
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#PlayerNames
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that adds player name options.
Dependencies: Prat
]]

local BC = AceLibrary("Babble-Class-2.2")

Prat_PlayerNames = Prat:NewModule("playernames")

Prat_PlayerNames.Classes = {}
Prat_PlayerNames.Levels = {}
Prat_PlayerNames.Subgroups = {}

function Prat_PlayerNames:OnInitialize()
    Prat_PlayerNames.db = Prat:AcquireDBNamespace("PlayerNames")
    Prat:RegisterDefaults("PlayerNames", "profile", {
        on = true,
        brackets = "Square",
        tabcomplete = true,
        level = false,
        classes = {},
        levels = {},
        subgroup = true,
        keep = true,
        colormode = "CLASS",
        usecommoncolor = true,
        color = {
            r = 0.75,
            g = 0.75,
            b = 0.75,
        },
    })
end

function Prat_PlayerNames:OnEnable()
    for i = 1, NUM_CHAT_WINDOWS do
        self:Hook(getglobal("ChatFrame"..i), "AddMessage")
    end

    self:RegisterEvent("FRIENDLIST_UPDATE", "updateFriends")
    self:RegisterEvent("GUILD_ROSTER_UPDATE", "updateGuild")
    self:RegisterEvent("RAID_ROSTER_UPDATE", "updateRaid")
    self:RegisterEvent("PARTY_MEMBERS_CHANGED", "updateParty")
    self:RegisterEvent("PLAYER_TARGET_CHANGED", "updateTarget")
    self:RegisterEvent("WHO_LIST_UPDATE", "updateWho")
	self:RegisterEvent("CHAT_MSG_SYSTEM", "updateWho") -- for short /who command

    for name, color in pairs(Prat_PlayerNames.db.profile.classes) do Prat_PlayerNames.Classes[name] = color end
    for name, level in pairs(Prat_PlayerNames.db.profile.levels) do	Prat_PlayerNames.Levels[name] = level end

 	local PlayerClass
    _, PlayerClass = UnitClass("player")
    self:addName(UnitName("player"), Playerclass, UnitLevel("player"))

	self:updateParty()
	self:updateRaid()
	self:updateFriends()
	self:updateGuild()

    self:TabComplete(Prat_PlayerNames.db.profile.tabcomplete)
end

function Prat_PlayerNames:OnDisable()
    self:TabComplete(false)
end

function Prat_PlayerNames:updateFriends()
    local Name, Class, Level
    for i = 1, GetNumFriends() do
        Name, Level, Class = GetFriendInfo(i)
        self:addName(Name, Class, Level)
    end
end

function Prat_PlayerNames:updateGuild()
    local Name, Class, Level
    for i = 1, GetNumGuildMembers() do
        Name, _, _, Level, Class = GetGuildRosterInfo(i)
        self:addName(Name, Class, Level)
    end
end

function Prat_PlayerNames:updateRaid()
    local Name, Class, SubGroup, Level
	Prat_PlayerNames.Subgroups = {}
    for i = 1, GetNumRaidMembers() do
        Name, _, SubGroup, Level, Class = GetRaidRosterInfo(i)
        self:addName(Name, Class, Level, SubGroup)
    end
end

function Prat_PlayerNames:updateParty()
    local Class, Unit
    for i = 1, GetNumPartyMembers() do
        Unit = "party" .. i
        _, Class = UnitClass(Unit)
        self:addName(UnitName(Unit), Class, UnitLevel(Unit))
    end
end

function Prat_PlayerNames:updateTarget()
    local Class
    if not UnitIsPlayer("target") or not UnitIsFriend("player", "target") then
        return
    end
    _, Class = UnitClass("target")
    self:addName(UnitName("target"), Class, UnitLevel("target"))
end

function Prat_PlayerNames:updateWho()
    local Name, Class, Level
    for i = 1, GetNumWhoResults() do
        Name, _, Level, _, Class = GetWhoInfo(i)
        self:addName(Name, Class, Level)
    end
end

function Prat_PlayerNames:addName(Name, Class, Level, SubGroup)
  if Name then
	if Level and Level ~= 0 and ( not ( Prat_PlayerNames.Levels[Name] and Prat_PlayerNames.Levels[Name] > Level ) ) then
		Prat_PlayerNames.Levels[Name] = Level
        if ( Prat_PlayerNames.db.profile.keep) then	Prat_PlayerNames.db.profile.levels[Name] = Level end
	end
    if Class then
        Prat_PlayerNames.Classes[Name] = Class
        if ( Prat_PlayerNames.db.profile.keep ) then Prat_PlayerNames.db.profile.classes[Name] = Class end
    end
	if SubGroup then
		Prat_PlayerNames.Subgroups[Name] = SubGroup
	end
  end
end

function Prat_PlayerNames:randomColor(Name)
	local hash = 17
	for i=1,string.len(Name) do
		hash = hash * 37 * string.byte(Name, i);
	end

	local r = math.floor(math.mod(hash / 97, 255));
	local g = math.floor(math.mod(hash / 17, 255));
	local b = math.floor(math.mod(hash / 227, 255));

    if ((r * 299 + g * 587 + b * 114) / 1000) < 105 then
    	r = math.abs(r - 255);
        g = math.abs(g - 255);
        b = math.abs(b - 255);
    end

	return string.format("%02x%02x%02x", r, g, b)
end

function Prat_PlayerNames:addInfo(Name)
	if Name then
        local returnName = Name

        if Prat_PlayerNames.Levels[Name] and Prat_PlayerNames.db.profile.level then
			returnName = string.format("%s:%s", Prat_PlayerNames.Levels[Name], returnName)
        end
        if Prat_PlayerNames.Subgroups[Name] and Prat_PlayerNames.db.profile.subgroup then
			returnName = string.format("%s:%s", returnName, Prat_PlayerNames.Subgroups[Name])
        end
		if Prat_PlayerNames.Classes[Name] then
		        if Prat_PlayerNames.db.profile.colormode == "CLASS" then
				returnName =  string.format("|cff%s%s|r", BC:GetHexColor(Prat_PlayerNames.Classes[Name]), returnName)
			elseif Prat_PlayerNames.db.profile.colormode == "RANDOM" then
				returnName =  string.format("|cff%s%s|r", self:randomColor(Name), returnName)
		        end
		else
			if Prat_PlayerNames.db.profile.usecommoncolor then
				local color = string.format("%02x%02x%02x", Prat_PlayerNames.db.profile.color.r*255, Prat_PlayerNames.db.profile.color.g*255, Prat_PlayerNames.db.profile.color.b*255)
				returnName = string.format("|cff%s%s|r", color, returnName)
			end
		end

		return returnName
	else
		return ""
	end
end

function Prat_PlayerNames:AddMessage(frame, text, r, g, b, id)
    if text then
        local Name = string.gsub(text, ".*|Hplayer:(.-)|h.*", "%1")
        local Brackets

		Name = self:addInfo(Name)

        if Prat_PlayerNames.db.profile.brackets == "Angled" then
            Brackets = "<|Hplayer:%1|h" .. Name .. "|h>"
        elseif Prat_PlayerNames.db.profile.brackets == "None" then
            Brackets = "|Hplayer:%1|h" .. Name .. "|h"
        else
            Brackets = "[|Hplayer:%1|h" .. Name .. "|h]"
        end

        text = string.gsub(text, "|Hplayer:(.-)|h%[.-%]|h(.-:-)", Brackets .. "%2")
    end
    Prat_PlayerNames.hooks[frame].AddMessage(frame, text, r, g, b, id)
end

function Prat_PlayerNames:TabComplete(enabled)
    if enabled then
        if not AceLibrary("AceTab-2.0"):IsTabCompletionRegistered("Prat_PlayerNames") then
            AceLibrary("AceTab-2.0"):RegisterTabCompletion("Prat_PlayerNames", "",
                function(t, text, pos)
                    for name in pairs(Prat_PlayerNames.Classes) do
                        table.insert(t, pos == 0 and name..":" or name)
                    end
                end,
                function(u, cands)
					local text = ""
                    for _, cand in ipairs(cands) do
						cand = string.gsub(cand, ":", "")
						cand = self:addInfo(cand)
						text = text .. " " .. cand
                    end
                    Prat:Print("Tab completion : " .. text)
                end
            )
        end
    else
        if AceLibrary("AceTab-2.0"):IsTabCompletionRegistered("Prat_PlayerNames") then
            AceLibrary("AceTab-2.0"):UnregisterTabCompletion("Prat_PlayerNames")
        end
    end
end
