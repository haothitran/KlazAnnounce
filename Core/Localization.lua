local addon, ns = ...
local L = {}
ns.L = L

--------------------------------------------------------------------------------
-- // CORE / LOCALIZATION
--------------------------------------------------------------------------------

setmetatable(L, { __index = function(t, k)
  local v = tostring(k)
  t[k] = v
  return v
end })

--------------------------------------------------------------------------------
-- // ENGLISH
--------------------------------------------------------------------------------

L.ITEMS_CAST = 'is casting'
L.ITEMS_CLICK = 'Click'
L.ITEMS_PREPARE = 'has prepared a'
L.ITEMS_PLACE = 'has put down'

L.SPELLS = 'used'

local locale = GetLocale()
if locale == 'enUS' then return end

--------------------------------------------------------------------------------
-- // FRENCH
--------------------------------------------------------------------------------

-- if locale == 'frFR' then
--
-- return end
