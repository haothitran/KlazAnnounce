local addon, ns = ...
local C = ns.C
local L = ns.L
local T = ns.T
if C.Items ~= true then return end

--------------------------------------------------------------------------------
-- // MODULES / ITEMS
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
      SendChatMessage(sourceName.." "..L.ITEMS_CAST.." "..GetSpellLink(spellID)..". "..L.ITEMS_CLICK.."!", T.ChatChannel(true))
    -- Spirit Cauldron
	elseif T.FilterItemsCast[spellID] then
			SendChatMessage(sourceName.." "..L.ITEMS_PREPARE.." "..GetSpellLink(spellID)..".", T.ChatChannel(true))
    end
	elseif event == "SPELL_SUMMON" then
		-- bots (e.g. Jeeves, Blingtron)
		if T.FilterItemsSummon[spellID] then
      SendChatMessage(sourceName.." "..L.ITEMS_PLACE.." "..GetSpellLink(spellID)..".", T.ChatChannel(true))
		end
	elseif event == "SPELL_CREATE" then
		-- Create Soulwell
		if spellID == 29893 and sourceName == UnitName("player") then
      SendChatMessage(sourceName.." "..L.ITEMS_PLACE.." "..GetSpellLink(spellID)..".", T.ChatChannel(true))
		-- MOLLE-E
    elseif spellID == 54710 then
      SendChatMessage(sourceName.." "..L.ITEMS_PLACE.." "..GetSpellLink(spellID)..".", T.ChatChannel(true))
    end
	end
end)
