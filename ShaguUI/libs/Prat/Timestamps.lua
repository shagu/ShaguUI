--[[
Name: Prat_Timestamps
Revision: $Revision: 16065 $
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
Inspired by: idChat2_Timestamps by Industrial
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Timestamps
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that adds timestamps to chat windows (default=on).
Dependencies: Prat
]]

Prat_Timestamps = Prat:NewModule("timestamps")

function Prat_Timestamps:OnInitialize()
    self.db = Prat:AcquireDBNamespace("Timestamps")
    Prat:RegisterDefaults("Timestamps", "profile", {
        on = false,
        showmode = "ALL",
        show = {true, true, true, true, true, true, true},
        showall = true,
        formatmode = "ALL",
        format = {"%H:%M", "%H:%M", "%H:%M", "%H:%M", "%H:%M", "%H:%M", "%H:%M"},
        formatall = "%H:%M",
        colortimestamp = true,
        color = {
            r = 0.9,
            g = 0.9,
            b = 0.9
        },
        space = true,
        localtime = true
    })
end

function Prat_Timestamps:OnEnable()
    for i=1,NUM_CHAT_WINDOWS do
		Prat_Timestamps:SetFrameStatus(i)
    end

  	self.secondsDifference = 0
	_,self.lastMinute = GetGameTime()
end

function Prat_Timestamps:SetFrameStatus(id)
    if self.db.profile.show[id] and ShaguUIconfig["enableChatTimestamps"] then
    	if not self:IsHooked(getglobal("ChatFrame"..id), "AddMessage") then self:Hook(getglobal("ChatFrame"..id), "AddMessage", "AddMessage"..id) end
    else
        if self:IsHooked(getglobal("ChatFrame"..id), "AddMessage") then self:Unhook(getglobal("ChatFrame"..id), "AddMessage") end
    end
end

function Prat_Timestamps:AddMessage1(...)
	Prat_Timestamps:AddMessage(1, unpack(arg))
end
function Prat_Timestamps:AddMessage2(...)
	Prat_Timestamps:AddMessage(2, unpack(arg))
end
function Prat_Timestamps:AddMessage3(...)
	Prat_Timestamps:AddMessage(3, unpack(arg))
end
function Prat_Timestamps:AddMessage4(...)
	Prat_Timestamps:AddMessage(4, unpack(arg))
end
function Prat_Timestamps:AddMessage5(...)
	Prat_Timestamps:AddMessage(5, unpack(arg))
end
function Prat_Timestamps:AddMessage6(...)
	Prat_Timestamps:AddMessage(6, unpack(arg))
end
function Prat_Timestamps:AddMessage7(...)
	Prat_Timestamps:AddMessage(7, unpack(arg))
end

function Prat_Timestamps:AddMessage(id, frame, text, ...)
    if text then
		-- get timestamp format
        local dateFormat
       	dateFormat = self.db.profile.format[id]
       	-- get space character useage
        if ( self.db.profile.space ) then space = " " else space = "" end
        -- get color format
        if self.db.profile.colortimestamp then
            local color = string.format("%02x%02x%02x", self.db.profile.color.r*255, self.db.profile.color.g*255, self.db.profile.color.b*255)
            text = string.format("|cff"..color.."%s|r" .. space .. "%s", self:GetTime(dateFormat), text)
        else
            text = string.format("%s".. space .. "%s", self:GetTime(dateFormat), text)
        end
    end
    self.hooks[frame].AddMessage(frame, text, unpack(arg))
end

function Prat_Timestamps:GetTime(format)
	if self.db.profile.localtime then
		return date(format)
	else
		local tempDate = date("*t")
		tempDate["hour"], tempDate["min"] = GetGameTime()
		-- taken from FuBar_ClockFu
		if self.lastMinute ~= tempDate["min"] then
			_,self.lastMinute = GetGameTime()
			self.secondsDifference = mod(time(), 60)
		end
		tempDate["sec"] = mod(time() - self.secondsDifference, 60)
		return date(format, time(tempDate))
	end
end
