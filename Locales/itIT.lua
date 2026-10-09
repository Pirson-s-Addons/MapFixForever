local ADDON_NAME, ns = ...

-- ==========================================
-- ITALIANO (itIT)
-- ==========================================
local locale = GetLocale()
if locale ~= "itIT" then return end
local L = ns.L

L["STATUS_ENGLISH"] = "il client è in inglese: le mappe sono complete, non c'è niente da correggere."
L["ENABLED"] = "correzione attiva (/mapfix off per disattivarla)."
L["DISABLED"] = "correzione disattivata (/mapfix on per attivarla). Cambia mappa per vedere il risultato."
L["STATUS"] = "%d texture originali della mappa di Forever mostrate (%d sostituzioni). Cambia mappa per vedere il risultato."
L["MINIMAP_ON"] = "correzione della minimappa attiva: Orgrimmar e Roccavento non sono più grigie sulla minimappa (/mapfix minimap per disattivarla)."
L["MINIMAP_OFF"] = "correzione della minimappa disattivata (/mapfix minimap per attivarla)."
