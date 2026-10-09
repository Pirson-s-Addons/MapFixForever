local ADDON_NAME, ns = ...

-- ==========================================
-- TIẾNG VIỆT (viVN)
-- ==========================================
local locale = GetLocale()
if locale ~= "viVN" then return end
local L = ns.L

L["STATUS_ENGLISH"] = "máy khách đang dùng tiếng Anh: bản đồ đã đầy đủ, không có gì để sửa."
L["ENABLED"] = "đã bật sửa lỗi (/mapfix off để tắt)."
L["DISABLED"] = "đã tắt sửa lỗi (/mapfix on để bật). Đổi bản đồ để xem kết quả."
L["STATUS"] = "Đã hiển thị %d texture bản đồ gốc của Forever (%d lần thay thế). Đổi bản đồ để xem kết quả."
L["MINIMAP_ON"] = "sửa bản đồ nhỏ đang bật: Orgrimmar và Stormwind không còn bị xám trên bản đồ nhỏ (/mapfix minimap để tắt)."
L["MINIMAP_OFF"] = "sửa bản đồ nhỏ đang tắt (/mapfix minimap để bật)."
