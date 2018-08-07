local addon, ns = ...
local C = ns.C
local L = ns.L
local T = ns.T
if C.Drinking ~= true then return end

--------------------------------------------------------------------------------
-- // MODULES / DRINKING
--------------------------------------------------------------------------------

local f = CreateFrame("Frame")
f:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
f:SetScript("OnEvent", function(self, event, ...)
	if not (event == "UNIT_SPELLCAST_SUCCEEDED" and GetZonePVPInfo() == "arena") then return end

	local unit, _, spellID = ...
	if UnitIsEnemy("player", unit) and (GetSpellInfo(spellID) == GetSpellInfo(118358) or GetSpellInfo(spellID) == GetSpellInfo(167152) or GetSpellInfo(spellID) == GetSpellInfo(167268)) then
		SendChatMessage(UnitClass(unit).." "..UnitName(unit).." "..L.DRINKING..".", T.ChatChannel(true))
	end
end)
