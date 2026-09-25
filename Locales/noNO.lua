local ADDON_NAME, ns = ...

-- ==========================================
-- NORSK (noNO)
-- ==========================================
local locale = GetLocale()
if locale ~= "noNO" then return end
local L = ns.L

L["STATUS_ENGLISH"] = "klienten er på engelsk: kartene er komplette, det er ingenting å fikse."
L["ENABLED"] = "fiks på (/mapfix off for å slå av)."
L["DISABLED"] = "fiks av (/mapfix on for å slå på). Bytt kart for å se resultatet."
L["STATUS"] = "%d originale Forever-kartteksturer vist (%d erstatninger). Bytt kart for å se resultatet."
