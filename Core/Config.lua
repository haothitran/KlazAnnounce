local addon, ns = ...
local C = {}
ns.C = C

--------------------------------------------------------------------------------
-- // CORE / CONFIG
--------------------------------------------------------------------------------

C.Font = {
  ['Family'] = STANDARD_TEXT_FONT,  -- font family
  ['Size'] = 13,                    -- font size
  ['Style'] = 'OUTLINE',            -- font outline
  ['Justify'] = 'LEFT',             -- text justification
  ['Visible'] = 8,                  -- how long to show a line in seconds
  ['Fade'] = 1,                     -- how long it takes a line to fade in seconds
}

C.Size = {
  ['Width'] = 450,                   -- frame width
  ['Height'] = 80,                  -- frame height
  ['Lines'] = 5,                    -- max number of lines to display
}

C.Position = {
  ['Point'] = 'CENTER',             -- attachment point to parent
  ['RelativeTo'] = 'UIParent',      -- parent frame
  ['RelativePoint'] = 'CENTER',     -- parent attachment point
  ['XOffset'] = 0,                  -- horizontal offset from parent point
  ['YOffset'] = -110,               -- vertical offset from parent point
}

C.Items = true      -- anounce in /party /raid /instance when items are placed down

C.Spells = {
  ['All'] = true,   -- receive notification for spell casted by party/raid members
  ['Self'] = true,  -- receive notification for spells casted by self
  ['Chat'] = true,  -- receive announcement for used spells in chat frame
  ['Frame'] = true, -- receive announcement for used spells in a moveable frame
  ['Say'] = false,  -- announce in /party /raid /instance when you cast certain spells
}
