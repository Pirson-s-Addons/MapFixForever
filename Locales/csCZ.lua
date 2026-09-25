local ADDON_NAME, ns = ...

-- ==========================================
-- ČEŠTINA (csCZ)
-- ==========================================
local locale = GetLocale()
if locale ~= "csCZ" then return end
local L = ns.L

L["STATUS_ENGLISH"] = "klient je v angličtině: mapy jsou kompletní, není co opravovat."
L["ENABLED"] = "oprava zapnuta (/mapfix off pro vypnutí)."
L["DISABLED"] = "oprava vypnuta (/mapfix on pro zapnutí). Změň mapu, abys viděl výsledek."
L["STATUS"] = "Zobrazeno %d původních textur mapy Forever (%d náhrad). Změň mapu, abys viděl výsledek."
