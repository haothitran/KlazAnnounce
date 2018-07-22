local addon, ns = ...
local C = {}
ns.C = C

--------------------------------------------------------------------------------
-- // CORE / CONFIG
--------------------------------------------------------------------------------

C.Announce = {
  ['All'] = true,   -- receive notification for spell casted by party/raid members
  ['Self'] = true,  -- receive notification for spells cased by self
  ['Say'] = false,  -- announce in /party /raid /instance when you cast certain spells
}
