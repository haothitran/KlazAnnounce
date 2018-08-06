local addon, ns = ...
local C = ns.C
local L = ns.L
local T = ns.T
if C.Events ~= true then return end

--------------------------------------------------------------------------------
-- // MODULES / EVENTS
--------------------------------------------------------------------------------

local f = CreateFrame("Frame")
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
f:SetScript("OnEvent", function(self)
	local _, event, _, sourceGUID, srcName, _, _, _, destName, _, _, spellID = CombatLogGetCurrentEventInfo()
	if InCombatLockdown() or not IsInGroup() or not subEvent or not spellID or not srcName then return end
	if not UnitInRaid(srcName) and not UnitInParty(srcName) then return end

	local srcName = srcName:gsub("%-[^|]+", "")
	if event == "SPELL_CAST_SUCCESS" then
		-- Ritual of Summoning
    if spellID == 698 and sourceGUID == UnitGUID("player") then
      SendChatMessage(srcName.." "..L.EVENTS_CAST.." "..GetSpellLink(spellID)..". "..L.EVENTS_CLICK.."!", T.ChatChannel)
    -- Spirit Cauldron
    elseif spellID == 188036 then
			SendChatMessage(srcName.." "..L.EVENTS_PREPARE.." "..GetSpellLink(spellID)..".", T.ChatChannel)
    end
	elseif event == "SPELL_SUMMON" then
		-- bots (e.g. Jeeves, Blingtron)
		if T.FilterEvents[spellID] then
      SendChatMessage(srcName.." "..L.EVENTS_PLACE.." "..GetSpellLink(spellID)..".", T.ChatChannel)
		end
	elseif event == "SPELL_CREATE" then
		-- Ritual of Souls
		if spellID == 29893 and sourceGUID == UnitGUID("player") then
      SendChatMessage(srcName.." "..L.EVENTS.PLACE.." "..GetSpellLink(spellID)..".", T.ChatChannel)
		-- MOLLE-E
    elseif spellID == 54710 then
      SendChatMessage(srcName.." "..L.EVENTS.PLACE.." "..GetSpellLink(spellID)..".", T.ChatChannel)
    end
	end
end)
