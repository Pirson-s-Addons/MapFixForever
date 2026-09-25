local ADDON_NAME, ns = ...

-- ==========================================
-- 日本語 (jaJP)
-- ==========================================
local locale = GetLocale()
if locale ~= "jaJP" then return end
local L = ns.L

L["STATUS_ENGLISH"] = "クライアントは英語です：マップは完全なので、修正するものはありません。"
L["ENABLED"] = "修正オン（/mapfix off でオフ）。"
L["DISABLED"] = "修正オフ（/mapfix on でオン）。マップを切り替えると結果が表示されます。"
L["STATUS"] = "Forever のオリジナルマップテクスチャを %d 個表示（置き換え %d 回）。マップを切り替えると結果が表示されます。"
