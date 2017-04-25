FuBar_BuffLeecherFu = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceConsole-2.0", "AceDB-2.0", "FuBarPlugin-2.0","AceHook-2.1")
FuBar_BuffLeecherFu.hasIcon = true
FuBar_BuffLeecherFu.cannotHideText = true
FuBar_BuffLeecherFu.cannotDetachTooltip = true
FuBar_BuffLeecherFu.hasNoColor = true
FuBar_BuffLeecherFu.clickableTooltip = true
FuBar_BuffLeecherFu.clickableTooltip = "Test"
FuBar_BuffLeecherFu.folderName = "FuBar_BuffLeecherFu"
FuBar_BuffLeecherFu:RegisterDB("FuBar_BuffLeecherFuDB")
local active = false

function FuBar_BuffLeecherFu:ChatFrame_OnEvent()
  if active == true and event == "CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS" and (arg1 == "You gain Rallying Cry of the Dragonslayer." or arg1 == "You gain Spirit of Zandalar.") then
   Logout()
 end
  
  self.hooks["ChatFrame_OnEvent"](event)
end

function FuBar_BuffLeecherFu:OnInitialize()
	self:Hook("ChatFrame_OnEvent", true)
	self:AdjustText()
end

function FuBar_BuffLeecherFu:OnEnable()
	self:AdjustText()
end

function FuBar_BuffLeecherFu:OnDisable()
	active = false
	self:AdjustText()
end

function FuBar_BuffLeecherFu:AdjustText()
	if (active) then
	self:SetText("BuffLeecher: Enabled")
	else
	self:SetText("BuffLeecher: Disabled")
	end
end

function FuBar_BuffLeecherFu:OnClick()
	active = not active
	self:AdjustText()
end
