local ADDON_NAME, ns = ...

-- ==========================================
-- 简体中文 (zhCN)
-- ==========================================
local locale = GetLocale()
if locale ~= "zhCN" then return end
local L = ns.L

L["STATUS_ENGLISH"] = "客户端为英文：地图完整，无需修复。"
L["ENABLED"] = "修复已开启（/mapfix off 关闭）。"
L["DISABLED"] = "修复已关闭（/mapfix on 开启）。切换地图即可看到效果。"
L["STATUS"] = "已显示 %d 个 Forever 原版地图纹理（替换 %d 次）。切换地图即可看到效果。"
L["MINIMAP_ON"] = "小地图修复已开启：奥格瑞玛和暴风城的小地图不再是灰色（/mapfix minimap 关闭）。"
L["MINIMAP_OFF"] = "小地图修复已关闭（/mapfix minimap 开启）。"
