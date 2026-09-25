local ADDON_NAME, ns = ...

-- ==========================================
-- PORTUGUÊS (ptBR)
-- ==========================================
local locale = GetLocale()
if locale ~= "ptBR" then return end
local L = ns.L

L["STATUS_ENGLISH"] = "o cliente está em inglês: os mapas estão completos, não há nada para corrigir."
L["ENABLED"] = "correção ativada (/mapfix off para desativar)."
L["DISABLED"] = "correção desativada (/mapfix on para ativar). Mude de mapa para ver o resultado."
L["STATUS"] = "%d texturas originais do mapa de Forever exibidas (%d substituições). Mude de mapa para ver o resultado."
