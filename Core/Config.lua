local addon, ns = ...
local C = {}
ns.C = C

--------------------------------------------------------------------------------
-- // CORE / CONFIG
--------------------------------------------------------------------------------

C.Items = true      -- anounce in /party /raid /instance when items are placed down

C.Interrupt = {
  ['Self'] = true, -- receive notification when you successfully interrupt a cast
  ['Say'] = true,  -- announce in /party /raid /instance
}

C.Spells = {
  ['All'] = true,   -- receive notification for spell casted by party/raid members
  ['Self'] = true,  -- receive notification for spells casted by self
  ['Say'] = false,  -- announce in /party /raid /instance when you cast certain spells
}
