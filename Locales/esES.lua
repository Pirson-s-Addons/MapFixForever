local ADDON_NAME, ns = ...

-- ==========================================
-- ESPAÑOL (esES / esMX)
-- ==========================================
local locale = GetLocale()
if locale ~= "esES" and locale ~= "esMX" then return end
local L = ns.L

L["STATUS_ENGLISH"] = "el cliente está en inglés: los mapas están completos, no hay nada que arreglar."
L["ENABLED"] = "arreglo activado (/mapfix off para desactivarlo)."
L["DISABLED"] = "arreglo desactivado (/mapfix on para activarlo). Cambia de mapa para ver el resultado."
L["STATUS"] = "%d texturas originales del mapa de Forever mostradas (%d sustituciones). Cambia de mapa para ver el resultado."
