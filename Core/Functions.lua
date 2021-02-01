local addon, ns = ...
local T = {}
ns.T = T

--------------------------------------------------------------------------------
-- // CORE / FUNCTIONS
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- // FILTER ITEMS
--------------------------------------------------------------------------------
-- white list filter for events
-- retrieve item id from wowhead links
-- http://www.wowhead.com/item=49040/jeeves

T.FilterItemsCast = {
  [188036] = true,  -- Spirit Cauldron (Legion)
  [276972] = true,  -- Mystical Cauldron (Battle for Azeroth)
  [298861] = true,  -- Greater Mystical Cauldron (Battle for Azeroth)
  [307157] = true,  -- Eternal Cauldron (Shadowlands)
}

T.FilterItemsSummon = {
  [22700] = true,		-- Field Repair Bot 74A
  [44389] = true,		-- Field Repair Bot 110G
  [54711] = true,		-- Scrapbot
  [67826] = true,		-- Jeeves
  [126459] = true,	-- Blingtron 4000 (Mists of Pandaria)
  [161414] = true,	-- Blingtron 5000 (Warlords of Draenor)
  [199109] = true,	-- Auto-Hammer
  [226241] = true,	-- Codex of the Tranquil Mind (Legion)
  [298926] = true,  -- Blingtron 7000 (Battle for Azeroth)
  [324029] = true,  -- Codex of the Still Mind (Shadowlands)
}

--------------------------------------------------------------------------------
-- // FILTER SPELLS CHAT
--------------------------------------------------------------------------------
-- white list filter for spells shown in chat frame
-- retrieve spell id from wowhead links
-- http://www.wowhead.com/spell=2825/bloodlust

T.FilterSpellsChat = {
  -- Racials
  20549,  -- War Stomp
  255654, -- Bull Rush

  -- Items
  161399, -- Swap (Swapblaster)
  146555,	-- Drums of Rage (Mists of Pandaria)
  178207,	-- Drums of Fury (Warlords of Draenor)
  230935,	-- Drums of the Mountain (Legion)
  256740,	-- Drums of the Maelstrom (Battle for Azeroth)
  309658, -- Drums of Deathly Ferocity (Shadowlands)

  -- Death Knight
  51052,  -- Anti-Magic Zone
  61999,  -- Raise Ally
  108199, -- Gorefiend's Grasp

  -- Demon Hunter
  179057, -- Chaos Nova
  196718, -- Darkness
  202137, -- Sigil of Silence
  202138, -- Sigil of Chains
  207684, -- Sigil of Misery

  -- Druid
  99,     -- Incapacitating Roar
  740,    -- Tranquility
  20484,  -- Rebirth
  29166,  -- Innervate
  77761,  -- Stampeding Roar
  78675,  -- Solar Beam
  102342, -- Iron Bark
  102793, -- Ursol's Vortex
  132469, -- Typhoon
  197721, -- Flourish

  -- Hunter
  34477,  -- Misdirection
  109248, -- Binding Shot
  186387, -- Bursting Shot
  272678, -- Primal Rage

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
  31884,  -- Avenging Wrath
  115750, -- Blinding Light
  204018, -- Blessing of Spellwarding
  204150, -- Aegis of Light

  -- Priest
  10060,  -- Power Infusion
  15286,  -- Vampiric Embrace
  32375,  -- Mass Dispel
  33206,  -- Pain Suppression
  47536,  -- Rapture
  47788,  -- Guardian Spirit
  62618,  -- Power Word: Barrier
  64843,  -- Divine Hymn
  64901,  -- Symbol of Hope
  73325,  -- Leap of Faith
  109964, -- Spirit Shell
  200183, -- Apotheosis
  204263, -- Shining Force
  205369, -- Mind Bomb
  246287, -- Evangelism
  265202, -- Holy Word: Salvation
  271466, -- Luminous Barrier

  -- Rogue
  57934,  -- Tricks of the Trade
  114018, -- Shroud of Concealment

  -- Shaman
  2825,   -- Bloodlust
  16191,  -- Mana Tide Totem
  17030,  -- Ankh
  20608,  -- Reincarnation
  32182,  -- Heroism
  51490,  -- Thunderstorm
  65992,  -- Tremor Totem
  98008,  -- Spirit Link Totem
  108280, -- Healing Tide Totem
  114052, -- Ascendance
  192058, -- Lightning Surge Totem
  192077, -- Wind Rush Totem
  207399, -- Ancestral Protection Totem

  -- Warlock
  20707,  -- Soulstone
  30283,  -- Shadowfury

  -- Warrior
  46968,  -- Shockwave
  97462,  -- Rallying Cry
  114030, -- Vigilance
  122507, -- Rallying Cry
  223657, -- Safeguard
}

--------------------------------------------------------------------------------
-- // FILTER SPELLS FRAME
--------------------------------------------------------------------------------
-- white list filter for spells shown in separate moveable frame
-- retrieve spell id from wowhead links
-- http://www.wowhead.com/spell=2825/bloodlust

T.FilterSpellsFrame = {
  -- Items
  146555,	-- Drums of Rage (Mists of Pandaria)
  178207,	-- Drums of Fury (Warlords of Draenor)
  230935,	-- Drums of the Mountain (Legion)
  256740,	-- Drums of the Maelstrom (Battle for Azeroth)
  309658, -- Drums of Deathly Ferocity (Shadowlands)

  -- Death Knight
  51052,  -- Anti-Magic Zone
  61999,  -- Raise Ally
  108199, -- Gorefiend's Grasp

  -- Demon Hunter
  196718, -- Darkness
  202137, -- Sigil of Silence
  202138, -- Sigil of Chains
  207684, -- Sigil of Misery

  -- Druid
  99,     -- Incapacitating Roar
  740,    -- Tranquility
  20484,  -- Rebirth
  29166,  -- Innervate
  77761,  -- Stampeding Roar
  102342, -- Iron Bark
  102793, -- Ursol's Vortex
  132469, -- Typhoon
  197721, -- Flourish

  -- Hunter
  272678, -- Primal Rage

  -- Mage
  80353,  -- Time Warp

  -- Monk
  115310, -- Revival
  116844, -- Ring of Peace
  116849, -- Life Cocoon

  -- Paladin
  633,    -- Lay on Hands
  1022,   -- Blessing of Protection
  1044,   -- Blessing of Freedom
  6940,   -- Blessing of Sacrifice
  31821,  -- Aura Mastery
  31884,  -- Avenging Wrath
  204018, -- Blessing of Spellwarding
  204150, -- Aegis of Light

  -- Priest
  10060,  -- Power Infusion
  15286,  -- Vampiric Embrace
  32375,  -- Mass Dispel
  33206,  -- Pain Suppression
  47536,  -- Rapture
  47788,  -- Guardian Spirit
  62618,  -- Power Word: Barrier
  64843,  -- Divine Hymn
  64901,  -- Symbol of Hope
  73325,  -- Leap of Faith
  109964, -- Spirit Shell
  200183, -- Apotheosis
  204263, -- Shining Force
  205369, -- Mind Bomb
  246287, -- Evangelism
  265202, -- Holy Word: Salvation
  271466, -- Luminous Barrier

  -- Rogue

  -- Shaman
  2825,   -- Bloodlust
  16191,  -- Mana Tide Totem
  17030,  -- Ankh
  20608,  -- Reincarnation
  32182,  -- Heroism
  65992,  -- Tremor Totem
  98008,  -- Spirit Link Totem
  108280, -- Healing Tide Totem
  114052, -- Ascendance
  192077, -- Wind Rush Totem
  207399, -- Ancestral Protection Totem

  -- Warlock
  20707,  -- Soulstone

  -- Warrior
  97462,  -- Rallying Cry
  114030, -- Vigilance
  122507, -- Rallying Cry
  223657, -- Safeguard
}

--------------------------------------------------------------------------------
-- // CHECK CHAT
--------------------------------------------------------------------------------
-- check which chat channel is appropriate to use for announcements

T.ChatChannel = function(warning)
  if (not IsInGroup(LE_PARTY_CATEGORY_HOME) or not IsInRaid(LE_PARTY_CATEGORY_HOME))
  and IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
    return 'INSTANCE_CHAT'
  elseif IsInRaid(LE_PARTY_CATEGORY_HOME) then
    return 'RAID'
  elseif IsInGroup(LE_PARTY_CATEGORY_HOME) then
    return 'PARTY'
  else
    return 'SAY'
  end
end
