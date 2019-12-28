local addon, ns = ...
local C = ns.C
local T = ns.T
if C.Interrupt.Self ~= true then return end

--------------------------------------------------------------------------------
-- // MODULES / INTERRUPT
--------------------------------------------------------------------------------

local f = CreateFrame('Frame')
f:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')
f:SetScript('OnEvent', function()
  local _, event, _, sourceGUID, _, _, _, _, destName, _, _, _, _, _, spellID = CombatLogGetCurrentEventInfo()
  if not (event == 'SPELL_INTERRUPT' and sourceGUID == UnitGUID('player')) then return end

  if C.Interrupt.Say == true then
    local _, _, difficultyID = GetInstanceInfo()
    if difficultyID == 0 then return end

    local _, instanceType = IsInInstance()
    if instanceType == 'pvp' or instanceType == 'arena' then return end

    SendChatMessage(INTERRUPTED..' '..destName..': '..GetSpellLink(spellID)..'.', T.ChatChannel())
  else
    print('|cff1994ff'..INTERRUPTED..' '..destName..':|r '..GetSpellLink(spellID)..'|cff1994ff.|r')
  end
end)
