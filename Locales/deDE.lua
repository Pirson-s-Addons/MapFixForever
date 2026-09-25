local ADDON_NAME, ns = ...

-- ==========================================
-- DEUTSCH (deDE)
-- ==========================================
local locale = GetLocale()
if locale ~= "deDE" then return end
local L = ns.L

L["STATUS_ENGLISH"] = "der Client ist auf Englisch: die Karten sind vollständig, es gibt nichts zu reparieren."
L["ENABLED"] = "Korrektur an (/mapfix off zum Ausschalten)."
L["DISABLED"] = "Korrektur aus (/mapfix on zum Einschalten). Wechsle die Karte, um das Ergebnis zu sehen."
L["STATUS"] = "%d originale Forever-Kartentexturen angezeigt (%d Ersetzungen). Wechsle die Karte, um das Ergebnis zu sehen."
