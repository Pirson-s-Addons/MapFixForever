local ADDON_NAME, ns = ...

-- ==========================================
-- 繁體中文 (zhTW)
-- ==========================================
local locale = GetLocale()
if locale ~= "zhTW" then return end
local L = ns.L

L["STATUS_ENGLISH"] = "用戶端為英文：地圖完整，無需修復。"
L["ENABLED"] = "修復已開啟（/mapfix off 關閉）。"
L["DISABLED"] = "修復已關閉（/mapfix on 開啟）。切換地圖即可看到效果。"
L["STATUS"] = "已顯示 %d 個 Forever 原版地圖材質（替換 %d 次）。切換地圖即可看到效果。"
