local ADDON_NAME, ns = ...

-- ==========================================
-- IDIOMA POR DEFECTO (enUS / enGB)
-- ==========================================
-- Este fichero define TODAS las claves. Los demas Locales/<idioma>.lua se
-- cargan despues y sobrescriben las suyas; lo que falte se queda en ingles.

local L = ns.L or {}
ns.L = L

L["STATUS_ENGLISH"] = "the client is in English: the maps are complete, there is nothing to fix."
L["ENABLED"] = "fix on (/mapfix off to turn it off)."
L["DISABLED"] = "fix off (/mapfix on to turn it on). Change map to see the result."
L["STATUS"] = "%d original Forever map textures shown (%d replacements). Change map to see the result."
