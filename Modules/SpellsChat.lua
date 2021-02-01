local addon, ns = ...
local C = ns.C
local L = ns.L
local T = ns.T
if C.Chat.Enable ~= true then return end

--------------------------------------------------------------------------------
-- // MODULES / SPELLS CHAT
--------------------------------------------------------------------------------
-- notification for when important friendly spells and abilities are used
-- in an instance while player is in a party or raid environment
-- includes tooltip link for these spells and abilities

local f = CreateFrame('Frame')
f:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')
f:SetScript('OnEvent', function()
  local _, subEvent, _, sourceGUID, sourceName, _, _, _, destName, _, _, spellID = CombatLogGetCurrentEventInfo()
  local spells = T.FilterSpellsChat

  local _, _, difficultyID = GetInstanceInfo()
  if difficultyID == 0 or subEvent ~= 'SPELL_CAST_SUCCESS' then return end

  if sourceName then sourceName = sourceName:gsub('%-[^|]+', '') end
  if destName then destName = destName:gsub('%-[^|]+', '') end

  if not sourceName then return end

  -- chat time stamp
  local function getTime()
    if C.Chat.Timestamp == true then
      if C.Chat.TwentyFour == true then
        t = date('%H:%M:%S')
      else
        t = date('%I:%M:%S')
        --t = date('%I:%M:%S %p') -- show pm/am
      end
      return '|cbbbbbbff'..t..'|r '
    else
      return ''
    end
  end

  for _, spells in pairs(spells) do
    if spellID == spells then
      -- PartyMember1 used [Spell].
      if destName == nil then
        -- only show Avenging Wrath from holy paladins
        if spellID == 31884 and UnitGroupRolesAssigned(sourceName) ~= 'HEALER' then return end
        print(format(getTime()..'|cff1994ff'..sourceName..' '..L.SPELLS..'|r '..GetSpellLink(spellID)..'|cff1994ff.|r'))
      -- PartyMember1 used [Spell] -> PartyMember2.
      else
        print(format(getTime()..'|cff1994ff'..sourceName..' '..L.SPELLS..'|r '..GetSpellLink(spellID)..' |cff1994ff-> '..destName..'.|r'))
      end
    end
  end
end)
