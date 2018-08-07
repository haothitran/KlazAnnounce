local addon, ns = ...
local C = {}
ns.C = C

--------------------------------------------------------------------------------
-- // CORE / CONFIG
--------------------------------------------------------------------------------

C.BadGear = true    -- receive notification when unideal items are worn in instances
C.Drinking = false  -- announce in /party when enemy is drinking in arenas
C.Items = false     -- anounce in /party /raid /instance when items are placed down

C.Interrupt = {
  ["Self"] = false, -- receive notification when you successfully interrupt a cast
  ["Say"] = false,  -- announce in /party /raid /instance
}

C.Spells = {
  ["All"] = true,   -- receive notification for spell casted by party/raid members
  ["Self"] = true,  -- receive notification for spells casted by self
  ["Say"] = false,  -- announce in /party /raid /instance when you cast certain spells
}

--------------------------------------------------------------------------------
-- // PROFILES
--------------------------------------------------------------------------------

if UnitName("player") == "Klazomaniac" or "Klazyne" or "Klaz" or "Klazio"
or "Klaztrap" or "Klazzic" then

C.Drinking = true
C.Items = true

C.Interrupt = {
  ["Self"] = true,
  ["Say"] = false,
}

end
