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

local spellframe = CreateFrame('ScrollingMessageFrame', 'KlazAnnounceSpells', UIParent)
--s:SetPoint('CENTER', anchor, 'CENTER', 0, 4)
spellframe:SetPoint("CENTER", UIParent, 0, 0)
spellframe:SetSize(C.Size.Width, C.Size.Height)
spellframe:SetFont(C.Font.Family, C.Font.Size, C.Font.Style)
spellframe:SetShadowOffset(0, 0)
spellframe:SetJustifyH('CENTER')
spellframe:SetMaxLines(6)
spellframe:SetTimeVisible(2)
spellframe:SetFadeDuration(2)

local f = CreateFrame('Frame')
f:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')
f:SetScript('OnEvent', function()
  local _, subEvent, _, sourceGUID, sourceName, _, _, _, destName, _, _, spellID = CombatLogGetCurrentEventInfo()
  local spells = T.FilterSpells

  local _, _, difficultyID = GetInstanceInfo()
  --if difficultyID == 0 or subEvent ~= 'SPELL_CAST_SUCCESS' then return end
  if subEvent ~= 'SPELL_CAST_SUCCESS' then return end

  if sourceName then sourceName = sourceName:gsub('%-[^|]+', '') end
  if destName then destName = destName:gsub('%-[^|]+', '') end

  if C.Spells.All == true and not (sourceGUID == UnitGUID('player') and sourceName == UnitName('player')) then
    if not sourceName then return end

    for _, spells in pairs(spells) do
      if spellID == spells then
        if destName == nil then
          -- PartyMember1 used [Spell].
          if C.Spells.Chat == true then
            print(format('|cff1994ff'..sourceName..' '..L.SPELLS..' |r'..GetSpellLink(spellID)..'|cff1994ff.|r'))
          end
          if C.Spells.Frame == true then
            spellframe:AddMessage(sourceName..' '..L.SPELLS..' '..GetSpellLink(spellID))
          end
        else
          -- PartyMember1 used [Spell] -> PartyMember2.
          if C.Spells.Chat == true then
            print(format('|cff1994ff'..sourceName..' '..L.SPELLS..' |r'..GetSpellLink(spellID)..'|cff1994ff -> '..destName..'.|r'))
          end
          if C.Spells.Frame == true then
            spellframe:AddMessage(sourceName..' '..L.SPELLS..' '..GetSpellLink(spellID)..' -> '..destName)
          end
        end
      end
    end
  else
    if C.Spells.Self == true and not (sourceGUID == UnitGUID('player') and sourceName == UnitName('player')) then return end

    for _, spells in pairs(spells) do
      if spellID == spells then
        if destName == nil then
          if C.Spells.Say == true then
            -- announce when Player used [Spell].
            if C.Spells.Chat == true then
              SendChatMessage(sourceName..' '..L.SPELLS..' '..GetSpellLink(spellID)..'.', T.ChatChannel(true))
            end
            if C.Spells.Frame == true then
              spellframe:AddMessage(sourceName..' '..L.SPELLS..' '..GetSpellLink(spellID))
            end
          else
            -- Player used Spell.
            if C.Spells.Chat == true then
              print(format('|cff1994ff'..sourceName..' '..L.SPELLS..' |r'..GetSpellLink(spellID)..'|cff1994ff.|r'))
            end
            if C.Spells.Frame == true then
              spellframe:AddMessage(sourceName..' '..L.SPELLS..' '..GetSpellLink(spellID))
            end
          end
        else
          if C.Spells.Say == true then
            -- announce when Player1 used [Spell] -> Player2.
            if C.Spells.Chat == true then
              SendChatMessage(GetSpellLink(spellID)..' -> '..destName..'.', T.ChatChannel(true))
            end
            if C.Spells.Frame == true then
              spellframe:AddMessage(sourceName..' '..L.SPELLS..' '..GetSpellLink(spellID)..' -> '..destName)
            end
          else
            -- Player1 used [Spell] -> Player2.
            if C.Spells.Chat == true then
              print(format('|cff1994ff'..sourceName..' '..L.SPELLS..' |r'..GetSpellLink(spellID)..'|cff1994ff -> '..destName..'.|r'))
            end
            if C.Spells.Frame == true then
              spellframe:AddMessage(sourceName..' '..L.SPELLS..' '..GetSpellLink(spellID)..' -> '..destName)
            end
          end
        end
      end
    end
  end
end)
