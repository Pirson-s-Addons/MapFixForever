local ADDON_NAME, ns = ...

-- ==========================================
-- FRANÇAIS (frFR)
-- ==========================================
local locale = GetLocale()
if locale ~= "frFR" then return end
local L = ns.L

L["STATUS_ENGLISH"] = "le client est en anglais : les cartes sont complètes, il n'y a rien à corriger."
L["ENABLED"] = "correction activée (/mapfix off pour la désactiver)."
L["DISABLED"] = "correction désactivée (/mapfix on pour l'activer). Changez de carte pour voir le résultat."
L["STATUS"] = "%d textures originales de la carte de Forever affichées (%d remplacements). Changez de carte pour voir le résultat."
