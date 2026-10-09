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
L["MINIMAP_ON"] = "minikartfix på: Orgrimmar och Stormwind är inte längre grå på minikartan (/mapfix minimap för att stänga av)."
L["MINIMAP_OFF"] = "minikartfix av (/mapfix minimap för att slå på)."
