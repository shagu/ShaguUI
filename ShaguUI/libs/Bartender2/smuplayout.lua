if checkAltAB() then return end
BT2Smuplayout = Bartender:NewModule("smuplayout")

local _G = getfenv(0)

function BT2Smuplayout:OnInitialize()
	self.db = Bartender:AcquireDBNamespace('Smuplayout')
	Bartender:RegisterDefaults('Smuplayout', 'profile', {
		applyskin = {
			Bar1 = true,
			Bar2 = true,
			Bar3 = true,
			Bar4 = true,
			Bar5 = true,
			Bar6 = true,
			Bar7 = true,
			Bar8 = true,
		},
	})
end

function BT2Smuplayout:OnEnable()
	BT2DL = true
	self:CreateLayout() 
	self:ScheduleRepeatingEvent(self.BGCheck, 0.1, self)
end

function BT2Smuplayout:CreateLayout()
	for i=1,12 do
		if self.db.profile.applyskin["Bar1"] then 
			Bartender:CreateFrame("B1B"..i)
			_G["B1B"..i]:SetBackdrop({bgFile = "Interface\\AddOns\\ShaguUI\\img\\button", tile = false, edgeFile = "", edgeSize = 0, insets = {left = -5, right = -5, top = -5, bottom = -5},})
			_G["B1B"..i]:SetPoint("TOPLEFT", "Bar1Button"..i, "TOPLEFT", -0.5, 0)
			_G["B1B"..i]:SetPoint("BOTTOMRIGHT", "Bar1Button"..i, "BOTTOMRIGHT", 0.5, -0)
			_G["B1B"..i]:SetParent("Bar1")
			_G["B1B"..i]:SetFrameLevel(1)
			
			_G["Bar1Button"..i.."Icon"]:ClearAllPoints()
			_G["Bar1Button"..i.."Icon"]:SetPoint("TOPLEFT", "B1B"..i, "TOPLEFT", 3, -3)
			_G["Bar1Button"..i.."Icon"]:SetPoint("BOTTOMRIGHT", "B1B"..i, "BOTTOMRIGHT", -3, 3)
		end
		
		if self.db.profile.applyskin["Bar2"] then 
			Bartender:CreateFrame("B2B"..i)
			_G["B2B"..i]:SetBackdrop({bgFile = "Interface\\AddOns\\ShaguUI\\img\\button", tile = false, edgeFile = "", edgeSize = 0, insets = {left = -5, right = -5, top = -5, bottom = -5},})
			_G["B2B"..i]:SetPoint("TOPLEFT", "Bar2Button"..i, "TOPLEFT", -0.5, 0)
			_G["B2B"..i]:SetPoint("BOTTOMRIGHT", "Bar2Button"..i, "BOTTOMRIGHT", 0.5, -0)
			_G["B2B"..i]:SetParent("Bar2")
			_G["B2B"..i]:SetFrameLevel(1)
			
			_G["Bar2Button"..i.."Icon"]:ClearAllPoints()
			_G["Bar2Button"..i.."Icon"]:SetPoint("TOPLEFT", "B2B"..i, "TOPLEFT", 3, -3)
			_G["Bar2Button"..i.."Icon"]:SetPoint("BOTTOMRIGHT", "B2B"..i, "BOTTOMRIGHT", -3, 3)
		end
		
		if self.db.profile.applyskin["Bar3"] then 
			Bartender:CreateFrame("B3B"..i)
			_G["B3B"..i]:SetBackdrop({bgFile = "Interface\\AddOns\\ShaguUI\\img\\button", tile = false, edgeFile = "", edgeSize = 0, insets = {left = -5, right = -5, top = -5, bottom = -5},})
			_G["B3B"..i]:SetPoint("TOPLEFT", "Bar3Button"..i, "TOPLEFT", -0.5, 0)
			_G["B3B"..i]:SetPoint("BOTTOMRIGHT", "Bar3Button"..i, "BOTTOMRIGHT", 0.5, -0)
			_G["B3B"..i]:SetParent("Bar3")
			_G["B3B"..i]:SetFrameLevel(1)
			
			_G["Bar3Button"..i.."Icon"]:ClearAllPoints()
			_G["Bar3Button"..i.."Icon"]:SetPoint("TOPLEFT", "B3B"..i, "TOPLEFT", 3, -3)
			_G["Bar3Button"..i.."Icon"]:SetPoint("BOTTOMRIGHT", "B3B"..i, "BOTTOMRIGHT", -3, 3)
		end
		
		if self.db.profile.applyskin["Bar4"] then 
			Bartender:CreateFrame("B4B"..i)
			_G["B4B"..i]:SetBackdrop({bgFile = "Interface\\AddOns\\ShaguUI\\img\\button", tile = false, edgeFile = "", edgeSize = 0, insets = {left = -5, right = -5, top = -5, bottom = -5},})
			_G["B4B"..i]:SetPoint("TOPLEFT", "Bar4Button"..i, "TOPLEFT", -0.5, 0)
			_G["B4B"..i]:SetPoint("BOTTOMRIGHT", "Bar4Button"..i, "BOTTOMRIGHT", 0.5, -0)
			_G["B4B"..i]:SetParent("Bar4")
			_G["B4B"..i]:SetFrameLevel(1)
			
			_G["Bar4Button"..i.."Icon"]:ClearAllPoints()
			_G["Bar4Button"..i.."Icon"]:SetPoint("TOPLEFT", "B4B"..i, "TOPLEFT", 3, -3)
			_G["Bar4Button"..i.."Icon"]:SetPoint("BOTTOMRIGHT", "B4B"..i, "BOTTOMRIGHT", -3, 3)
		end
		
		if self.db.profile.applyskin["Bar5"] then 
			Bartender:CreateFrame("B5B"..i)
			_G["B5B"..i]:SetBackdrop({bgFile = "Interface\\AddOns\\ShaguUI\\img\\button", tile = false, edgeFile = "", edgeSize = 0, insets = {left = -5, right = -5, top = -5, bottom = -5},})
			_G["B5B"..i]:SetPoint("TOPLEFT", "Bar5Button"..i, "TOPLEFT", -0.5, 0)
			_G["B5B"..i]:SetPoint("BOTTOMRIGHT", "Bar5Button"..i, "BOTTOMRIGHT", 0.5, -0)
			_G["B5B"..i]:SetParent("Bar5")
			_G["B5B"..i]:SetFrameLevel(1)
			
			_G["Bar5Button"..i.."Icon"]:ClearAllPoints()
			_G["Bar5Button"..i.."Icon"]:SetPoint("TOPLEFT", "B5B"..i, "TOPLEFT", 3, -3)
			_G["Bar5Button"..i.."Icon"]:SetPoint("BOTTOMRIGHT", "B5B"..i, "BOTTOMRIGHT", -3, 3)
		end
	end
	
	for i=1,10 do
		
		if self.db.profile.applyskin["Bar6"] then 
			Bartender:CreateFrame("B6B"..i)
			_G["B6B"..i]:SetBackdrop(ShaguUI.Backdrop)
			_G["B6B"..i]:SetPoint("TOPLEFT", "Bar6Button"..i, "TOPLEFT", -0.5, 0)
			_G["B6B"..i]:SetPoint("BOTTOMRIGHT", "Bar6Button"..i, "BOTTOMRIGHT", 0.5, -0)
			_G["B6B"..i]:SetParent("Bar6")
			_G["B6B"..i]:SetFrameLevel(1)
			
			_G["Bar6Button"..i.."Icon"]:ClearAllPoints()
			_G["Bar6Button"..i.."Icon"]:SetPoint("TOPLEFT", "B6B"..i, "TOPLEFT", 3, -3)
			_G["Bar6Button"..i.."Icon"]:SetPoint("BOTTOMRIGHT", "B6B"..i, "BOTTOMRIGHT", -3, 3)
		end
		
		if self.db.profile.applyskin["Bar7"] then 
			Bartender:CreateFrame("B7B"..i)
                        _G["B7B"..i]:SetBackdrop({bgFile = "Interface\\AddOns\\ShaguUI\\img\\button", tile = false, edgeFile = "", edgeSize = 0, insets = {left = -5, right = -5, top = -5, bottom = -5},})
			_G["B7B"..i]:SetPoint("TOPLEFT", "Bar7Button"..i, "TOPLEFT", -0.5, 0)
			_G["B7B"..i]:SetPoint("BOTTOMRIGHT", "Bar7Button"..i, "BOTTOMRIGHT", 0.5, -0)
			_G["B7B"..i]:SetParent("Bar7")
			_G["B7B"..i]:SetFrameLevel(1)
			
			_G["Bar7Button"..i.."Icon"]:ClearAllPoints()
			_G["Bar7Button"..i.."Icon"]:SetPoint("TOPLEFT", "B7B"..i, "TOPLEFT", 3, -3)
			_G["Bar7Button"..i.."Icon"]:SetPoint("BOTTOMRIGHT", "B7B"..i, "BOTTOMRIGHT", -3, 3)
		end
	end

    for i=1,5 do
        if self.db.profile.applyskin["Bar8"] then 
			Bartender:CreateFrame("B8B"..i)
	        _G["B8B"..i]:SetBackdropColor(0,0,0,1)
	        _G["B8B"..i]:SetBackdropBorderColor(0.5, 0.5, 0, 0)
	        _G["B8B"..i]:SetPoint("TOPLEFT", "Bar8Button"..i, "TOPLEFT", -0.5, 0)
	        _G["B8B"..i]:SetPoint("BOTTOMRIGHT", "Bar8Button"..i, "BOTTOMRIGHT", 0.5, -0)
	        _G["B8B"..i]:SetParent("Bar8")
	        _G["B8B"..i]:SetFrameLevel(1)
			
	        _G["Bar8Button"..i.."Icon"]:ClearAllPoints()
	        _G["Bar8Button"..i.."Icon"]:SetPoint("TOPLEFT", "B8B"..i, "TOPLEFT", 3, -3)
	        _G["Bar8Button"..i.."Icon"]:SetPoint("BOTTOMRIGHT", "B8B"..i, "BOTTOMRIGHT", -3, 3)
		end
    end
end

function BT2Smuplayout:BGCheck()
	for i=1,12 do
		if self.db.profile.applyskin["Bar1"] then 
			local buttons1 = _G["Bar1Button"..i]
			local background1 = _G["B1B"..i]
			if ( not HasAction(ActionButton_GetPagedID(buttons1)) ) then
				if background1 then background1:Show() end
			else
				if background1 then background1:Show() end
			end
		end
		
		if self.db.profile.applyskin["Bar2"] then 
			local buttons2 = _G["Bar2Button"..i]
			local background2 = _G["B2B"..i]
			if ( not HasAction(ActionButton_GetPagedID(buttons2)) ) then
				if background2 then background2:Show() end
			else
				if background2 then background2:Show() end
			end
		end
		
		if self.db.profile.applyskin["Bar3"] then 
			local buttons3 = _G["Bar3Button"..i]
			local background3 = _G["B3B"..i]
			if ( not HasAction(ActionButton_GetPagedID(buttons3)) ) then
				if background3 then background3:Show() end
			else
				if background3 then background3:Show() end
			end
		end
		
		if self.db.profile.applyskin["Bar4"] then 
			local buttons4 = _G["Bar4Button"..i]
			local background4 = _G["B4B"..i]
			if ( not HasAction(ActionButton_GetPagedID(buttons4)) ) then
				if background4 then background4:Show() end
			else
				if background4 then background4:Show() end
			end
		end
		
		if self.db.profile.applyskin["Bar5"] then 
			local buttons5 = _G["Bar5Button"..i]
			local background5 = _G["B5B"..i]
			if ( not HasAction(ActionButton_GetPagedID(buttons5)) ) then
				if background5 then background5:Show() end
			else
				if background5 then background5:Show() end
			end
		end
	end
	
	if self.db.profile.applyskin["Bar6"] then 
		local amountofshapes = GetNumShapeshiftForms()
		for i=1,amountofshapes do
			local background6 = getglobal("B6B"..i)
			if background6 then background6:Show() end
		end
		for i=(amountofshapes+1),10 do
			local background6 = getglobal("B6B"..i)
			if background6 then background6:Hide() end
		end
	end

	if self.db.profile.applyskin["Bar7"] then 
		for i = 1, 10 do 
			if (GetPetActionInfo(i)) then 
		        local background7 = getglobal("B7B"..i)
		        if background7 then background7:Show() end
			elseif (not GetPetActionInfo(i)) then
		        local background7 = getglobal("B7B"..i)
		        if background7 then background7:Hide() end
			end
		end
	end
	Bartender:HideNormalTexture()
end
