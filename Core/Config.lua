local addon, ns = ...
local C = {}
ns.C = C

--------------------------------------------------------------------------------
-- // CORE / CONFIG
--------------------------------------------------------------------------------

C.Items = true                -- anounce in /party /raid /instance when items are placed down

C.Chat = {
  ['Enable'] = true,          -- show notifications for spells in chat frame
  ['Timestamp'] = true,       -- show timestammp for notifications in chat frame
  ['TwentyFour'] = true,      -- show timestamp using 24-hour clock

}

C.Frame = {
  ['Enable'] = true,          -- show notifications for spells in seperate moveable frame
  ['Width'] = 450,            -- frame width
  ['Height'] = 80,            -- frame height
  ['Lines'] = 5,              -- max number of lines to display
  ['Visible'] = 8,            -- how long to show a line in seconds
  ['Fade'] = 1,               -- how long it takes a line to fade in seconds
}

C.Font = {
  ['Family'] = STANDARD_TEXT_FONT,  -- font family
  ['Size'] = 13,                    -- font size
  ['Style'] = 'OUTLINE',            -- font outline
  ['Justify'] = 'LEFT',             -- text justification
}

C.Position = {
  ['Point'] = 'CENTER',             -- attachment point to parent
  ['RelativeTo'] = 'UIParent',      -- parent frame
  ['RelativePoint'] = 'CENTER',     -- parent attachment point
  ['XOffset'] = 0,                  -- horizontal offset from parent point
  ['YOffset'] = 0,                  -- vertical offset from parent point
}
