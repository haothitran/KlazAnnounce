local addon, ns = ...
local C = ns.C
local L = ns.L
local T = ns.T
if C.BadGear ~= true then return end

--------------------------------------------------------------------------------
-- // MODULES / BAD GEAR
--------------------------------------------------------------------------------

local f = CreateFrame("Frame")
f:RegisterEvent("ZONE_CHANGED_NEW_AREA")
f:SetScript("OnEvent", function(self, event)
	if event ~= "ZONE_CHANGED_NEW_AREA" or not IsInInstance() then return end

	local item = {}
	for i = 1, 17 do
		if T.FilterBadGear[i] ~= nil then
			item[i] = GetInventoryItemID("player", i) or 0
			for j, baditem in pairs(T.FilterBadGear[i]) do
				if item[i] == baditem then
					RaidNotice_AddMessage(RaidWarningFrame, L.BADGEAR_EQUIPPED.." "..select(2, GetItemInfo(item[i])).."!", ChatTypeInfo["RAID_WARNING"])
  				PlaySound(SOUNDKIT.RAID_WARNING, "Master")

          print("|cff1994ff"..L.BADGEAR_EQUIPPED.."|r "..select(2, GetItemInfo(item[i])).."|cff1994ff!|r")
				end
			end
		end
	end
end)
