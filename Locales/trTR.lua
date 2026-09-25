local ADDON_NAME, ns = ...

-- ==========================================
-- TÜRKÇE (trTR)
-- ==========================================
local locale = GetLocale()
if locale ~= "trTR" then return end
local L = ns.L

L["STATUS_ENGLISH"] = "istemci İngilizce: haritalar eksiksiz, düzeltilecek bir şey yok."
L["ENABLED"] = "düzeltme açık (kapatmak için /mapfix off)."
L["DISABLED"] = "düzeltme kapalı (açmak için /mapfix on). Sonucu görmek için haritayı değiştir."
L["STATUS"] = "%d orijinal Forever harita dokusu gösteriliyor (%d değiştirme). Sonucu görmek için haritayı değiştir."
