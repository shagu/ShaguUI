--[[
Name: Prat_ChannelNames
Revision: $Revision: 16019 $
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
Inspired by: idChat2_ChannelNames by Industrial
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#ChannelNames
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that adds options and keybindings for all chat channels.
Dependencies: Prat
]]

local chanSave = {}

Prat_ChannelNames = Prat:NewModule("channelnames")

function Prat_ChannelNames:OnInitialize()
    self.db = Prat:AcquireDBNamespace("ChannelNames")
    Prat:RegisterDefaults("ChannelNames", "profile", {
        on = true,
        space = true,
		colon = true,
        replace = {
            say = true,
            whisper = true,
            whisperincome = true,
            yell = true,
            party = true,
            guild = true,
            officer = true,
            raid = true,
            raidleader = true,
            raidwarning = true,
            battleground = true,
            battlegroundleader = true,
            channel1 = true,
            channel2 = true,
            channel3 = true,
            channel4 = true,
            channel5 = true,
            channel6 = true,
            channel7 = true,
            channel8 = true,
            channel9 = true,
            channel10 = true,
        },
        shortnames = {
            say = "[S]",
            whisper = "[W To]",
            whisperincome = "[W From]",
            yell = "[Y]",
            party = "[P]",
            guild = "[G]",
            officer = "[O]",
            raid = "[R]",
            raidleader = "[RL]",
            raidwarning = "[RW]",
            battleground = "[B]",
            battlegroundleader = "[BL]",
            channel1 = "[1]",
            channel2 = "[2]",
            channel3 = "[3]",
            channel4 = "[4]",
            channel5 = "[5]",
            channel6 = "[6]",
            channel7 = "[7]",
            channel8 = "[8]",
            channel9 = "[9]",
            channel10 = "[10]",
        }
    })
end

function Prat_ChannelNames:OnEnable()
    for i=1,NUM_CHAT_WINDOWS do
        self:Hook(getglobal("ChatFrame"..i), "AddMessage")
    end
	self:saveChanName()
    self:doReplacement()
end

function Prat_ChannelNames:saveChanName()
	chanSave["guild"] = CHAT_GUILD_GET
	chanSave["officer"] = CHAT_OFFICER_GET
	chanSave["party"] = CHAT_PARTY_GET
	chanSave["raid"] = CHAT_RAID_GET
	chanSave["raidleader"] = CHAT_RAID_LEADER_GET
	chanSave["raidwarning"] = CHAT_RAID_WARNING_GET
	chanSave["battleground"] = CHAT_BATTLEGROUND_GET
	chanSave["battlegroundleader"] = CHAT_BATTLEGROUND_LEADER_GET
	chanSave["say"] = CHAT_SAY_GET
	chanSave["whisperincome"] = CHAT_WHISPER_GET
	chanSave["whisper"] = CHAT_WHISPER_INFORM_GET
	chanSave["yell"] = CHAT_YELL_GET
end

function Prat_ChannelNames:doReplacement()
	local replace = self.db.profile.replace
	local shortnames = self.db.profile.shortnames
	local space = self.db.profile.space and " " or ""
	local colon = self.db.profile.colon and ":" or ""
	local default = space .. "%s" .. colon .. "\32"

	CHAT_CHANNEL_GET = "%s" .. colon .. "\32";

	CHAT_GUILD_GET = replace["guild"] and (shortnames["guild"] .. default) or chanSave["guild"];
	CHAT_OFFICER_GET = replace["officer"] and (shortnames["officer"] .. default) or chanSave["officer"]

	CHAT_PARTY_GET = replace["party"] and (shortnames["party"] .. default) or chanSave["party"]
	CHAT_RAID_GET = replace["raid"] and (shortnames["raid"] .. default) or chanSave["raid"]
	CHAT_RAID_LEADER_GET = replace["raidleader"] and (shortnames["raidleader"] .. default) or chanSave["raidleader"]
	CHAT_RAID_WARNING_GET = replace["raidwarning"] and (shortnames["raidwarning"] .. default) or chanSave["raidwarning"]
	CHAT_BATTLEGROUND_GET = replace["battleground"] and (shortnames["battleground"] .. default) or chanSave["battleground"]
	CHAT_BATTLEGROUND_LEADER_GET = replace["battlegroundleader"] and (shortnames["battlegroundleader"] .. default) or chanSave["battlegroundleader"]

	CHAT_SAY_GET = replace["say"] and (shortnames["say"] .. default) or chanSave["say"]
	CHAT_WHISPER_GET = replace["whisperincome"] and (shortnames["whisperincome"] .. default) or chanSave["whisperincome"]
	CHAT_WHISPER_INFORM_GET = replace["whisper"] and (shortnames["whisper"] .. default) or chanSave["whisper"]
	CHAT_YELL_GET = replace["yell"] and (shortnames["yell"] .. default) or chanSave["yell"]

--	CHAT_AFK_GET = replace[""] and (shortnames["] .. "%s is Away From Keyboard" .. colon .. "\32";

--	CHAT_CHANNEL_JOIN_GET = replace[""] and (shortnames["] .. "%s joined channel."; -- another player joined
--	CHAT_CHANNEL_LEAVE_GET = replace[""] and (shortnames["] .. "%s left channel."; -- another player left
--	CHAT_CHANNEL_LIST_GET = replace[""] and (shortnames["] .. "[%s]\32"; -- Channel user list, user list is the "message", this is the channel name.

--	CHAT_CHANNEL_SEND = "[%d. %s]" .. colon .. "\32";

--	CHAT_GUILD_SEND = "Guild" .. colon .. "\32"; -- Chat message to your guild
--	CHAT_OFFICER_SEND = "Officer" .. colon .. "\32"; -- Chat message to officers in your guild
--	CHAT_PARTY_SEND = "Party" .. colon .. "\32"; -- Chat message to your party
--	CHAT_RAID_SEND = "Raid" .. colon .. "\32"; -- Chat message to your raid
--	CHAT_RAID_WARNING_SEND = "Raid Warning" .. colon .. "\32";
--	CHAT_BATTLEGROUND_SEND = "Battleground" .. colon .. "\32";

--	CHAT_SAY_SEND = "Say" .. colon .. "\32"; -- Normal chat message
--	CHAT_WHISPER_SEND = "Tell %s" .. colon .. "\32"; -- Whisper to a particular player
--	CHAT_YELL_SEND = "Yell" .. colon .. "\32"; -- Yell a message
end

function Prat_ChannelNames:AddMessage(frame, text, ...)
	self:doReplacement()
    if text then
        local pattern = "%]%s+(.*|Hplayer)"
        local channel = string.gsub(text, ".*%[(.-)" .. pattern ..".+", "%1")
        if string.find(channel, "%d+%. ") then
            channel = string.gsub(channel, "(%d+)%..*", "channel%1")
            pattern = "%[%d+%..-" .. pattern
		end
        if ( self.db.profile.replace[channel] ) then
            local replacement = self.db.profile.shortnames[channel]
            if replacement  then
                if ( (not(replacement == "")) and self.db.profile.space ) then replacement = replacement .. " " end
                text = string.gsub(text, pattern, replacement .. "%1")
            end
        end
    end
    self.hooks[frame].AddMessage(frame, text, unpack(arg))
end
