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

local loader = CreateFrame('Frame')
loader:RegisterEvent('ADDON_LOADED')
loader:SetScript('OnEvent', function(self, addon)
  if addon ~= KlazAnnounceSpells then
    local function initDB(db, defaults)
      if type(db) ~= 'table' then db = {} end
      if type(defaults) ~= 'table' then return db end
      for k, v in pairs(defaults) do
        if type(v) == 'table' then
          db[k] = initDB(db[k], v)
        elseif type(v) ~= type(db[k]) then
          db[k] = v
        end
      end
    return db
  end

  KlazAnnounceSpellsDB = initDB(KlazAnnounceSpellsDB, C.Position)
    C.UserPlaced = KlazAnnounceSpellsDB
    self:UnregisterEvent('ADDON_LOADED')
  end
end)

--------------------------------------------------------------------------------
-- // ANCHOR FRAME
--------------------------------------------------------------------------------

local anchor = CreateFrame('Frame', 'KlazAnnounceSpellsAnchor', UIParent)
anchor:SetSize(C.Size.Width, C.Size.Height)
if not anchor.SetBackdrop then Mixin(anchor, BackdropTemplateMixin) end
anchor:SetBackdrop({bgFile="Interface\\DialogFrame\\UI-DialogBox-Background"})
anchor:SetFrameStrata('HIGH')
anchor:SetMovable(true)
anchor:SetClampedToScreen(true)
anchor:EnableMouse(true)
anchor:SetUserPlaced(true)
anchor:RegisterForDrag('LeftButton')
anchor:RegisterEvent('PLAYER_LOGIN')
anchor:Hide()

anchor.text = anchor:CreateFontString(nil, 'OVERLAY')
anchor.text:SetAllPoints(anchor)
anchor.text:SetFont(C.Font.Family, C.Font.Size, C.Font.Style)
anchor.text:SetShadowOffset(0, 0)
anchor.text:SetText(UnitName("player").." used <Spell Name>")

anchor:SetScript('OnEvent', function(self, event, arg1)
  if event == 'PLAYER_LOGIN' then
    self:ClearAllPoints()
    self:SetPoint(
    C.UserPlaced.Point,
    C.UserPlaced.RelativeTo,
    C.UserPlaced.RelativePoint,
    C.UserPlaced.XOffset,
    C.UserPlaced.YOffset)
  end
end)

anchor:SetScript('OnDragStart', function(self)
  self:StartMoving()
end)

anchor:SetScript('OnDragStop', function(self)
  self:StopMovingOrSizing()
  self:SetUserPlaced(false)

  point, relativeTo, relativePoint, xOffset, yOffset = self:GetPoint(1)
  if relativeTo then
    relativeTo = relativeTo:GetName();
  else
    relativeTo = self:GetParent():GetName();
  end

  C.UserPlaced.Point = point
  C.UserPlaced.RelativeTo = relativeTo
  C.UserPlaced.RelativePoint = relativePoint
  C.UserPlaced.XOffset = xOffset
  C.UserPlaced.YOffset = yOffset
end)

--------------------------------------------------------------------------------
-- // SPELLS
--------------------------------------------------------------------------------

local spellframe = CreateFrame('ScrollingMessageFrame', 'KlazAnnounceSpells', UIParent)
spellframe:SetPoint('CENTER', anchor, 'CENTER', 0, 0)
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

--------------------------------------------------------------------------------
-- // SLASH COMMAND
--------------------------------------------------------------------------------

SlashCmdList.KLAZANNOUNCESPELLS = function (msg, editbox)
  if string.lower(msg) == 'reset' then
    KlazAnnounceSpellsDB = C.Position
    ReloadUI()
  elseif string.lower(msg) == 'unlock' then
    if not anchor:IsShown() then
      anchor:Show()
      print('|cff1994ffKlazAnnounceSpells|r |cff00ff00Unlocked.|r')
    end
  elseif string.lower(msg) == 'lock' then
    anchor:Hide()
    print('|cff1994ffKlazAnnounceSpells|r |cffff0000Locked.|r')
  else
    print('------------------------------------------')
    print('|cff1994ffKlazAnnounceSpells commands:|r')
    print('------------------------------------------')
    print('|cff1994ff/klazannouncespells unlock|r Unlocks frame to be moved.')
    print('|cff1994ff/klazannouncespells lock|r Locks frame in position.')
    print('|cff1994ff/klazannouncespells reset|r Resets frame to default position.')
  end
end
SLASH_KLAZANNOUNCESPELLS1 = '/klazannouncespells'
SLASH_KLAZANNOUNCESPELLS2 = '/kannouncespells'
SLASH_KLAZANNOUNCESPELLS3 = '/kas'
