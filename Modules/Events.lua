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
	local _, event, _, _, sourceName, _, _, _, _, _, _, spellID = CombatLogGetCurrentEventInfo()
	if InCombatLockdown() or not IsInGroup() or not event or not spellID or not sourceName then return end
	if not UnitInRaid(sourceName) and not UnitInParty(sourceName) then return end

	local sourceName = sourceName:gsub("%-[^|]+", "")
	if event == "SPELL_CAST_SUCCESS" then
		-- Ritual of Summoning
    if spellID == 698 and sourceName == UnitName("player") then
      SendChatMessage(sourceName.." "..L.EVENTS_CAST.." "..GetSpellLink(spellID)..". "..L.EVENTS_CLICK.."!", T.ChatChannel)
    -- Spirit Cauldron
    elseif spellID == 188036 then
			SendChatMessage(sourceName.." "..L.EVENTS_PREPARE.." "..GetSpellLink(spellID)..".", T.ChatChannel)
    end
	elseif event == "SPELL_SUMMON" then
		-- bots (e.g. Jeeves, Blingtron)
		if T.FilterEvents[spellID] then
      SendChatMessage(sourceName.." "..L.EVENTS_PLACE.." "..GetSpellLink(spellID)..".", T.ChatChannel)
		end
	elseif event == "SPELL_CREATE" then
		-- Create Soulwell
		if spellID == 29893 and sourceName == UnitName("player") then
      SendChatMessage(sourceName.." "..L.EVENTS_PLACE.." "..GetSpellLink(spellID)..".", T.ChatChannel)
		-- MOLLE-E
    elseif spellID == 54710 then
      SendChatMessage(sourceName.." "..L.EVENTS_PLACE.." "..GetSpellLink(spellID)..".", T.ChatChannel)
    end
	end
end)
