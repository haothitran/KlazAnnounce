local addon, ns = ...
local C = {}
ns.C = C

--------------------------------------------------------------------------------
-- // CORE / CONFIG
--------------------------------------------------------------------------------

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

C.Interrupt = {
  ["Self"] = true,
}

end
