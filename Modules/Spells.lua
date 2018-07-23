local addon, ns = ...
local C = ns.C
local L = ns.L
local T = ns.T

--------------------------------------------------------------------------------
-- // MODULES / SPELLS
--------------------------------------------------------------------------------
-- notification for when important friendly spells and abilities are used
-- in an instance while player is in a party or raid environment
-- includes tooltip link for these spells and abilities

local f = CreateFrame('Frame')
f:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')
f:SetScript('OnEvent', function(self)
local _, event, _, sourceGUID, sourceName, _, _, _, destName, _, _, spellID = CombatLogGetCurrentEventInfo()
  -- retrive spells and abilities
  local spells = T.FilterSpells
  -- cast in instance
  local _, _, difficultyID = GetInstanceInfo()
  if difficultyID == 0 or event ~= 'SPELL_CAST_SUCCESS' then return end
  -- source
  if sourceName then sourceName = sourceName:gsub('%-[^|]+', '') end
  if destName then destName = destName:gsub('%-[^|]+', '') end

  -- cast by raid/party member
  if C.Announce.All == true and not (sourceGUID == UnitGUID('player') and sourceName == UnitName('player')) then
    if not sourceName then return end

    for i, spells in pairs(spells) do
      if spellID == spells then
        if destName == nil then
          -- Player used Spell.
          print(format('|cff1994ff'..sourceName..' '..L.SPELLS..' |r'..GetSpellLink(spellID)..'|cff1994ff.|r'))
        else
          -- Player1 used Spell -> Player2.
          print(format('|cff1994ff'..sourceName..' '..L.SPELLS..' |r'..GetSpellLink(spellID)..'|cff1994ff -> '..destName..'.|r'))
        end
      end
    end
  -- cast by player
  else
    if C.Announce.Self == true and not (sourceGUID == UnitGUID('player') and sourceName == UnitName('player')) then return end

    for i, spells in pairs(spells) do
      if spellID == spells then
        if destName == nil then
          if C.Announce.Say == true then
            -- announce when Player used Spell.
            SendChatMessage(sourceName..' '..L.SPELLS..' '..GetSpellLink(spellID)..'.', T.ChatChannel())
          else
            -- Player used Spell.
            print(format('|cff1994ff'..sourceName..' '..L.SPELLS..' |r'..GetSpellLink(spellID)..'|cff1994ff.|r'))
          end
        else
          if C.Announce.Say == true then
            -- announce when Player1 used Spell -> Player2.
            SendChatMessage(GetSpellLink(spellID)..' -> '..destName..'.', T.ChatChannel())
          else
            -- Player1 used Spell -> Player2.
            print(format('|cff1994ff'..sourceName..' '..L.SPELLS..' |r'..GetSpellLink(spellID)..'|cff1994ff -> '..destName..'.|r'))
          end
        end
      end
    end
  end
end)
