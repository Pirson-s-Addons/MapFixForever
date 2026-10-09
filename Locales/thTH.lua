local ADDON_NAME, ns = ...

-- ==========================================
-- ไทย (thTH)
-- ==========================================
local locale = GetLocale()
if locale ~= "thTH" then return end
local L = ns.L

L["STATUS_ENGLISH"] = "ไคลเอนต์เป็นภาษาอังกฤษ: แผนที่ครบถ้วน ไม่มีอะไรต้องแก้"
L["ENABLED"] = "เปิดการแก้ไขแล้ว (/mapfix off เพื่อปิด)"
L["DISABLED"] = "ปิดการแก้ไขแล้ว (/mapfix on เพื่อเปิด) เปลี่ยนแผนที่เพื่อดูผลลัพธ์"
L["STATUS"] = "แสดงเท็กซ์เจอร์แผนที่ต้นฉบับของ Forever %d ชิ้น (แทนที่ %d ครั้ง) เปลี่ยนแผนที่เพื่อดูผลลัพธ์"
L["MINIMAP_ON"] = "แก้แผนที่ย่อเปิดอยู่: Orgrimmar และ Stormwind ไม่เป็นสีเทาบนแผนที่ย่ออีกต่อไป (/mapfix minimap เพื่อปิด)"
L["MINIMAP_OFF"] = "แก้แผนที่ย่อปิดอยู่ (/mapfix minimap เพื่อเปิด)"
