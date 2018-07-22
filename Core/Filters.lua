local addon, ns = ...
local T = {}
ns.T = T

--------------------------------------------------------------------------------
-- // CORE / FILTERS
--------------------------------------------------------------------------------
-- white list filter for spells
-- retrieve spell id from wowhead links
-- http://www.wowhead.com/spell=2825/bloodlust

T.FilterSpells = {
  -- Death Knight
  61999,  -- Raise Ally
  108199, -- Gorefiend's Grasp

  -- Demon Hunter
  179057, -- Chaos Nova
  196718, -- Darkness
  202137, -- Sigil of Silence
  202138, -- Sigil of Chains
  207684, -- Sigil of Misery

  -- Druid
  740,    -- Tranquility
  20484,  -- Rebirth
  29166,  -- Innervate
  77761,  -- Stampeding Roar
  78675,  -- Solar Beam
  102342, -- Iron Bark
  102793, -- Ursol's Vortex
  132469, -- Typhoon

  -- Hunter
  109248, -- Binding Shot

  -- Mage
  80353,  -- Time Warp

  -- Monk
  115310, -- Revival
  116844, -- Ring of Peace
  116849, -- Life Cocoon
  119381, -- Leg Sweep

  -- Paladin
  633,    -- Lay on Hands
  1022,   -- Blessing of Protection
  1044,   -- Blessing of Freedom
  6940,   -- Blessing of Sacrifice
  31821,  -- Aura Mastery
  115750, -- Blinding Light
  204018, -- Blessing of Spellwarding

  -- Priest
  15286,  -- Vampiric Embrace
  32375,  -- Mass Dispel
  33206,  -- Pain Suppression
  47788,  -- Guardian Spirit
  62618,  -- Power Word: Barrier
  64843,  -- Divine Hymn
  73325,  -- Leap of Faith
  205369, -- Mind Bomb
  204263, -- Shining Force
  265202, -- Holy Word: Salvation

  -- Rogue
  114018, -- Shroud of Concealment

  -- Shaman
  2825,   -- Bloodlust
  20608,  -- Reincarnation
  32182,  -- Heroism
  51490,  -- Thunderstorm
  98008,  -- Spirit Link Totem
  108280, -- Healing Tide Totem
  114052, -- Ascendance
  192058, -- Lightning Surge Totem
  192077, -- Wind Rush Totem
  207399, -- Ancestral Protection Totem

  -- Warlock
  20707,  -- Soulstone

  -- Warrior
  46968,  -- Shockwave
  97462,  -- Commanding Shout
  114030, -- Vigilance
  223657, -- Safeguard
}

--------------------------------------------------------------------------------
-- // FUNCTIONS
--------------------------------------------------------------------------------
-- check which chat channel it would be appropriate to announce in

T.ChatChannel = function(warning)
  if (not IsInGroup(LE_PARTY_CATEGORY_HOME) or not IsInRaid(LE_PARTY_CATEGORY_HOME)) and IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
    return 'INSTANCE_CHAT'
  elseif IsInRaid(LE_PARTY_CATEGORY_HOME) then
    return 'RAID'
  elseif IsInGroup(LE_PARTY_CATEGORY_HOME) then
    return 'PARTY'
  else
    return 'SAY'
  end
end
