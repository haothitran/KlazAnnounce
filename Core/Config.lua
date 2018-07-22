local addon, ns = ...
local C = {}
ns.C = C

--------------------------------------------------------------------------------
-- // CORE / CONFIG
--------------------------------------------------------------------------------

C.Announce = {
  ['All'] = true,   -- receive notification for spell casts of party/raid members
  ['Self'] = true,  -- receive notification for self casts
  ['Say'] = false,  -- announce when you cast certain spells while in party/raid
}
