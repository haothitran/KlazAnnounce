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

L.BADGEAR_EQUIPPED = "Currently equipped"

L.DRINKING = "is drinking"

L.EVENTS_CAST = "is casting"
L.EVENTS_CLICK = "Click"
L.EVENTS_PREPARE = "has prepared a"
L.EVENTS_PLACE = "has put down"

L.SPELLS = "used"

local locale = GetLocale()
if locale == "enUS" then return end

--------------------------------------------------------------------------------
-- // FRENCH
--------------------------------------------------------------------------------

if locale == "frFR" then

L.SPELLS = "utilisé"

return end
