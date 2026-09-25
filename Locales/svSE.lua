local ADDON_NAME, ns = ...

-- ==========================================
-- SVENSKA (svSE)
-- ==========================================
local locale = GetLocale()
if locale ~= "svSE" then return end
local L = ns.L

L["STATUS_ENGLISH"] = "klienten är på engelska: kartorna är kompletta, det finns inget att fixa."
L["ENABLED"] = "fix på (/mapfix off för att stänga av)."
L["DISABLED"] = "fix av (/mapfix on för att slå på). Byt karta för att se resultatet."
L["STATUS"] = "%d ursprungliga Forever-karttexturer visas (%d ersättningar). Byt karta för att se resultatet."
