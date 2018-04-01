if checkAltAB() then return end
Bartender = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceHook-2.1", "AceDB-2.0", "AceConsole-2.0", "AceModuleCore-2.0")
Bartender:RegisterDB("BarDB")
Bartender:SetModuleMixins("AceEvent-2.0")
Bartender.version = "2.0." .. string.sub("$Revision: 15914 $", 12, -3)
Bartender.date = string.sub("$Date: 2006-11-04 12:25:58 -0500 (Sat, 04 Nov 2006) $", 8, 17)
Bartender:RegisterDefaults('profile', BT2Defaults )

local _G = getfenv(0)

function Bartender:OnEnable()
	self:RegisterEvent("UPDATE_BONUS_ACTIONBAR")
	self:Hook("ActionButton_ShowGrid")
	self:Hook("ActionButton_HideGrid")
	self:Hook("ActionButton_SetTooltip")
	self:Hook("MultiActionBar_ShowAllGrids")
	self:Hook("MultiActionBar_HideAllGrids")
	self:Hook("UpdateTalentButton")
	self:Hook("MainMenuBar_UpdateKeyRing")
	self:Hook("ChangeActionBarPage")
	for i,v in ipairs(AllButtons) do
		local hotkey = getglobal(v:GetName().."HotKey")
		if hotkey then	self:Hook(hotkey, "SetText", "HotKeySetText") end
	end
	self:MakeFrames()
	self:OnProfileEnable()
	self:HideNormalTexture()
end

function Bartender:OnProfileEnable()
	self:AllowMoving()
	self:SetAllParents()
	self:SetupBars()
	self:ButtonHideCheck()
	self:ButtonScaleCheck()
	self:ButtonHotKeyCheck()
	self:ButtonAlphaCheck()
	self:ButtonZoomCheck()
	self:StayOnScreenCheck()
	self:LoadAllPositions()
	MainMenuBar:Hide()
	self:HideNormalTexture()
end

function Bartender:AllowMoving()
	MultiBarLeft:ClearAllPoints()
	MultiBarRight:ClearAllPoints()
	MultiBarBottomLeft:ClearAllPoints()
	MultiBarBottomRight:ClearAllPoints()
	for i,v in ipairs(AllButtons) do v:ClearAllPoints() end
end

function Bartender:MakeFrames()
	for i=1,9 do
		self:CreateFrame("Bar"..i)
	end
end

function Bartender:SetAllParents()
	for i=1,12 do
		_G["Bar1Button"..i]:SetParent("Bar1")
	end
	MultiBarBottomLeft:SetParent("Bar2")
	MultiBarBottomRight:SetParent("Bar3")
	MultiBarRight:SetParent("Bar4")
	MultiBarLeft:SetParent("Bar5")
	for i=1,10 do
		_G["Bar6Button"..i]:SetParent("Bar6")
		_G["Bar7Button"..i]:SetParent("Bar7")
	end
	for i=1,5 do
		_G["Bar8Button"..i]:SetParent("Bar8")
	end
	for i=1,8 do
		_G["Bar9Button"..i]:SetParent("Bar9")
	end
	KeyRingButton:SetParent("UIParent")
end

function Bartender:SetupBars()
	for i=1,9 do
		self["SetupBar"..i](self)
	end
end

function Bartender:SetupActionBars(barName)
	local bar = _G[barName]
	local Rows = self.db.profile[barName].Rows
	local ButtonPerRow = math.floor(12 / Rows) -- just a precaution
	local Padding = self.db.profile[barName].Padding
	bar:SetWidth(36 * ButtonPerRow + ((ButtonPerRow - 1) * Padding) + 8)
	bar:SetHeight(36 * Rows + ((Rows - 1) * Padding) + 8)
	for i=1,Rows do
		if i > 1 then
			local FirstButton = (ButtonPerRow * (i - 1) + 1)
			_G[barName.."Button"..FirstButton]:ClearAllPoints()
                        _G[barName.."Button"..FirstButton]:SetFrameStrata("MEDIUM")
			_G[barName.."Button"..FirstButton]:SetPoint("TOPLEFT", barName.."Button"..(FirstButton - ButtonPerRow), "BOTTOMLEFT", 0, -Padding)
		end
		for k=(ButtonPerRow * (i - 1) + 2),(ButtonPerRow * i) do
			_G[barName.."Button"..k]:ClearAllPoints()
                        _G[barName.."Button"..k]:SetFrameStrata("MEDIUM")
			_G[barName.."Button"..k]:SetPoint("BOTTOMLEFT", barName.."Button"..k - 1, "BOTTOMRIGHT", Padding, 0)
		end
	end
	_G[barName.."Button1"]:ClearAllPoints()
	_G[barName.."Button1"]:SetPoint("TOPLEFT", barName, "TOPLEFT", 5, -3)
	self:LoadPosition(barName)
end

function Bartender:SetupBar1() self:SetupActionBars("Bar1") end
function Bartender:SetupBar2() self:SetupActionBars("Bar2") end
function Bartender:SetupBar3() self:SetupActionBars("Bar3") end
function Bartender:SetupBar4() self:SetupActionBars("Bar4") end
function Bartender:SetupBar5() self:SetupActionBars("Bar5") end

function Bartender:SetupBar6()
	local pad = self.db.profile.Bar6.Padding
	if self.db.profile.Bar6.Swap then
		Bar6:SetWidth(38)
		Bar6:SetHeight(308 + (pad * 9))
		for i=2,10 do
			_G["Bar6Button"..i]:ClearAllPoints()
			_G["Bar6Button"..i]:SetPoint("TOPLEFT", "Bar6Button"..i - 1, "BOTTOMLEFT", 0, pad)
		end
	else
		Bar6:SetWidth(308 + (pad * 9))
		Bar6:SetHeight(38)
		for i=2,10 do
			_G["Bar6Button"..i]:ClearAllPoints()
			_G["Bar6Button"..i]:SetPoint("BOTTOMLEFT", "Bar6Button"..i - 1, "BOTTOMRIGHT", pad, 0)
		end
	end
	Bar6Button1:SetPoint("TOPLEFT", "Bar6", "TOPLEFT", 5, -3)
	self:LoadPosition("Bar6")
end

function Bartender:SetupBar7()
	local pad = self.db.profile.Bar7.Padding
	if self.db.profile.Bar7.Swap then
		Bar7:SetWidth(38)
		Bar7:SetHeight(308 + (pad * 9))
		for i=2,10 do
			_G["Bar7Button"..i]:ClearAllPoints()
			_G["Bar7Button"..i]:SetPoint("TOPLEFT", "Bar7Button"..i - 1, "BOTTOMLEFT", 0, pad)
		end
	else
		Bar7:SetWidth(308 + (pad * 9))
		Bar7:SetHeight(38)
		for i=2,10 do
			_G["Bar7Button"..i]:ClearAllPoints()
			_G["Bar7Button"..i]:SetPoint("BOTTOMLEFT", "Bar7Button"..i - 1, "BOTTOMRIGHT", pad, 0)
		end
	end
	Bar7Button1:SetPoint("TOPLEFT", "Bar7", "TOPLEFT", 5, -3)
	self:LoadPosition("Bar7")
end

function Bartender:SetupBar8()
	local pad = self.db.profile.Bar8.Padding
	if self.db.profile.Bar8.Swap then
		Bar8:SetWidth(45)
		Bar8:SetHeight(193 + (pad *4))
		for i=2,5 do
			_G["Bar8Button"..i]:SetPoint("BOTTOMLEFT", "Bar8Button"..i - 1, "TOPLEFT", 0, pad)
		end
	else
		Bar8:SetWidth(193 + (pad * 4))
		Bar8:SetHeight(45)
		for i=2,5 do
			_G["Bar8Button"..i]:SetPoint("BOTTOMLEFT", "Bar8Button"..i - 1, "BOTTOMRIGHT", pad, 0)
		end
	end
	Bar8Button1:SetPoint("BOTTOMLEFT", "Bar8", "BOTTOMLEFT", 5, 5)
	self:LoadPosition("Bar8")
end

function Bartender:SetupBar9()
	local pad = self.db.profile.Bar9.Padding
	if self.db.profile.Bar9.Swap then
		Bar9:SetWidth(34)
		Bar9:SetHeight(302 + (pad * 7))
		for i=2,8 do
			_G["Bar9Button"..i]:SetPoint("BOTTOMLEFT", "Bar9Button"..i - 1, "TOPLEFT", 0, pad - 21)
		end
	else
		Bar9:SetWidth(236 + (pad * 7))
		Bar9:SetHeight(43)
		for i=2,8 do
			_G["Bar9Button"..i]:SetPoint("BOTTOMLEFT", "Bar9Button"..i - 1, "BOTTOMRIGHT", pad, 0)
		end
	end
	Bar9Button1:SetPoint("BOTTOMLEFT", "Bar9", "BOTTOMLEFT", 3, 4)
	self:LoadPosition("Bar9")
end

function Bartender:ButtonHideCheck()
	for i=1,9 do
		if self.db.profile["Bar"..i].Hide then _G["Bar"..i]:Hide() 
else  
    _G["Bar"..i]:Show() 
  end
	end
end

function Bartender:ButtonScaleCheck()
	for i=1,9 do
		_G["Bar"..i]:SetScale(self.db.profile["Bar"..i].Scale)
	end
end

function Bartender:ButtonHotKeyCheck()
	for i=1,12 do
		if self.db.profile.Bar1.HideHotKey then _G["Bar1Button"..i.."HK"]:Hide() end
		if self.db.profile.Bar2.HideHotKey then _G["Bar2Button"..i.."HK"]:Hide() end
		if self.db.profile.Bar3.HideHotKey then _G["Bar3Button"..i.."HK"]:Hide() end
		if self.db.profile.Bar4.HideHotKey then _G["Bar4Button"..i.."HK"]:Hide() end
		if self.db.profile.Bar5.HideHotKey then _G["Bar5Button"..i.."HK"]:Hide() end
	end
end

function Bartender:ButtonAlphaCheck()
	for i=1,12 do
		_G["Bar1Button"..i]:SetAlpha(self.db.profile.Bar1.Alpha)
		_G["Bar2Button"..i]:SetAlpha(self.db.profile.Bar2.Alpha)
		_G["Bar3Button"..i]:SetAlpha(self.db.profile.Bar3.Alpha)
		_G["Bar4Button"..i]:SetAlpha(self.db.profile.Bar4.Alpha)
		_G["Bar5Button"..i]:SetAlpha(self.db.profile.Bar5.Alpha)
	end
	for i=1,10 do
		_G["Bar6Button"..i]:SetAlpha(self.db.profile.Bar6.Alpha)
		_G["Bar7Button"..i]:SetAlpha(self.db.profile.Bar7.Alpha)
	end
	for i=1,5 do
		_G["Bar8Button"..i]:SetAlpha(self.db.profile.Bar8.Alpha)
	end
	for i=1,8 do
		_G["Bar9Button"..i]:SetAlpha(self.db.profile.Bar9.Alpha)
	end
end

function Bartender:ButtonZoomCheck()
		for i,v in ipairs(AllIcons) do v:SetTexCoord(0.07,0.93,0.07,0.93) end
end

function Bartender:StayOnScreenCheck()
		for i=1,9 do _G["Bar"..i]:SetClampedToScreen(1) end
end

function Bartender:LoadAllPositions()
	for i=1,9 do
		self:LoadPosition("Bar"..i)
	end
end

function Bartender:CreateFrame(name, text)
	if not name then return end
	local frame = CreateFrame("Button", name, UIParent)
end

function Bartender:LoadPosition(arg1)
	if not arg1 then return end
	local frame = _G[arg1]
	frame:ClearAllPoints()
	frame:SetPoint("BOTTOMLEFT", UIParent, BT2DefaultPositions[arg1].Anchor, BT2DefaultPositions[arg1].PosX, BT2DefaultPositions[arg1].PosY)
end

function Bartender:ToggleBar(arg1)
	if _G[arg1]:IsShown() then
		_G[arg1]:Hide()
	else
		_G[arg1]:Show()
	end
end

function Bartender:ToggleStayOnScreen()
	self:StayOnScreenCheck()
end

function Bartender:ToggleBorder()
	self:ButtonZoomCheck()
end

function Bartender:ToggleSwap(arg1)
	self["Setup"..arg1](self)
end

function Bartender:Rows(arg1,arg2)
	self["Setup"..arg1](self)
end

function Bartender:ToggleHK(arg1)
  for i=1,12 do
		_G[arg1.."Button"..i.."HK"]:Show()
	end
end

function Bartender:Scale(arg1,arg2)
	_G[arg1]:SetScale(arg2)
	self:LoadPosition(arg1)
end

function Bartender:Alpha(arg1,arg2)
	for i=1,12 do
		local button = _G[arg1.."Button"..i]
		if button then button:SetAlpha(arg2) end
	end
end

function Bartender:Padding(arg1,arg2)
	self["Setup"..arg1](self)
end

function Bartender:Lock()
	for i=1,9 do
		_G["Bar"..i]:EnableMouse(false)
		_G["Bar"..i]:SetScript("OnEnter", nil)
		_G["Bar"..i]:SetScript("OnLeave", nil)
		_G["Bar"..i]:SetScript("OnDragStart", nil)
		_G["Bar"..i]:SetScript("OnDragStop", nil)
		_G["Bar"..i]:SetScript("OnClick", nil)
		_G["Bar"..i]:SetBackdropColor(0, 0, 0, 0)
		_G["Bar"..i]:SetBackdropBorderColor(0, 0, 0, 0)
		_G["Bar"..i].Text:SetText("")
		_G["Bar"..i]:SetFrameLevel(1)
	end
	self.unlock = nil
end

function Bartender:ActionButton_ShowGrid(button)
	if ( not button ) then
		button = this
	end
	button.showgrid = button.showgrid + 1
	for i=1,12 do
		_G[button:GetName().."NormalTexture"]:SetVertexColor(0,0,0) 
		_G[button:GetName().."NormalTexture"]:SetAlpha(0.3)
	end
	button:Show()
end

function Bartender:ActionButton_HideGrid(button)
	if ( not button ) then
		button = this
	end
	button.showgrid = button.showgrid - 1
	if ( button.showgrid == 0 and not HasAction(ActionButton_GetPagedID(button)) ) then
		button:Hide()
		self:HideNormalTexture()
	end
end

function Bartender:ActionButton_SetTooltip()
		self.hooks["ActionButton_SetTooltip"]()
end

function Bartender:MultiActionBar_ShowAllGrids()
	self.hooks["MultiActionBar_ShowAllGrids"]()
	for i=1,12 do
		_G["Bar1Button"..i]:Show()
		_G["Bar1Button"..i.."NT"]:SetVertexColor(0,0,0)
		_G["Bar1Button"..i.."NT"]:SetAlpha(0.3)
	end
	self:HideNormalTexture()
end

function Bartender:MultiActionBar_HideAllGrids()
	self.hooks["MultiActionBar_HideAllGrids"]()
	for i=1,12 do
		local buttons = _G["Bar1Button"..i]
		if ( not HasAction(ActionButton_GetPagedID(buttons)) ) then
			buttons:Hide()
		end
	end
	self:HideNormalTexture()
end

function Bartender:UpdateTalentButton()
end

function Bartender:MainMenuBar_UpdateKeyRing()
	KeyRingButton:Hide()
end

function Bartender:HideNormalTexture()
	for i,v in ipairs(AllNormalTextures) do v:SetAlpha(0) end
end

local last_CURRENT_ACTIONBAR_PAGE = CURRENT_ACTIONBAR_PAGE
function Bartender:ChangeActionBarPage()
	if CURRENT_ACTIONBAR_PAGE == 1 then
		CURRENT_ACTIONBAR_PAGE = self:GetBonusActionBarPage()
	end
	if last_CURRENT_ACTIONBAR_PAGE ~= CURRENT_ACTIONBAR_PAGE then
		last_CURRENT_ACTIONBAR_PAGE = CURRENT_ACTIONBAR_PAGE
		self.hooks.ChangeActionBarPage()
	end
end

function Bartender:GetBonusActionBarPage()
	local x = GetBonusBarOffset()
	if x == 3 then
		return 9
	elseif x == 2 then
		return 8
	elseif x == 1 then
		return 7
  else
		return 1
	end
end

function Bartender:UPDATE_BONUS_ACTIONBAR()
	BonusActionBarFrame:Hide()
	CURRENT_ACTIONBAR_PAGE = self:GetBonusActionBarPage()
	ChangeActionBarPage()
end

function Bartender:HotKeySetText(object, text)
	text = string.gsub(text, "CTRL--", "|c00FF9966C|r")
	text = string.gsub(text, "STRG--", "|c00CCCC00S|r")
	text = string.gsub(text, "ALT--", "|c009966CCA|r")
	text = string.gsub(text, "SHIFT--", "|c00CCCC00S|r")
	text = string.gsub(text, "Num Pad ", "NP")
	text = string.gsub(text, "Mouse Button ", "M")
	text = string.gsub(text, "Middle Mouse", "MM")
	text = string.gsub(text, "Backspace", "Bs")
	text = string.gsub(text, "Spacebar", "Sp")
	text = string.gsub(text, "Delete", "De")
	text = string.gsub(text, "Home", "Ho")
	text = string.gsub(text, "End", "En")
	text = string.gsub(text, "Arrow", "")
	text = string.gsub(text, "Insert", "Ins")
	text = string.gsub(text, "Page Up", "Pu")
	text = string.gsub(text, "Page Down", "Pd")
	text = string.gsub(text, "Down ", "D")
	text = string.gsub(text, "Up ", "U")
	text = string.gsub(text, "Left ", "L")
	text = string.gsub(text, "Right ", "R")
	self.hooks[object].SetText(object, text)
end
