local ADDON_NAME, ns = ...

-- ==========================================
-- POLSKI (plPL)
-- ==========================================
local locale = GetLocale()
if locale ~= "plPL" then return end
local L = ns.L

L["STATUS_ENGLISH"] = "klient jest po angielsku: mapy są kompletne, nie ma nic do naprawy."
L["ENABLED"] = "poprawka włączona (/mapfix off, aby wyłączyć)."
L["DISABLED"] = "poprawka wyłączona (/mapfix on, aby włączyć). Zmień mapę, aby zobaczyć efekt."
L["STATUS"] = "Wyświetlono %d oryginalnych tekstur mapy Forever (%d zamian). Zmień mapę, aby zobaczyć efekt."
L["MINIMAP_ON"] = "poprawka minimapy włączona: Orgrimmar i Stormwind nie są już szare na minimapie (/mapfix minimap, aby wyłączyć)."
L["MINIMAP_OFF"] = "poprawka minimapy wyłączona (/mapfix minimap, aby włączyć)."
