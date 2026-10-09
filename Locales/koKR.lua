local ADDON_NAME, ns = ...

-- ==========================================
-- 한국어 (koKR)
-- ==========================================
local locale = GetLocale()
if locale ~= "koKR" then return end
local L = ns.L

L["STATUS_ENGLISH"] = "클라이언트가 영어입니다: 지도가 완전하여 고칠 것이 없습니다."
L["ENABLED"] = "수정 켜짐 (/mapfix off로 끄기)."
L["DISABLED"] = "수정 꺼짐 (/mapfix on으로 켜기). 지도를 바꾸면 결과를 볼 수 있습니다."
L["STATUS"] = "Forever 원본 지도 텍스처 %d개 표시 (교체 %d회). 지도를 바꾸면 결과를 볼 수 있습니다."
L["MINIMAP_ON"] = "미니맵 수정 켜짐: 오그리마와 스톰윈드의 미니맵이 더 이상 회색으로 보이지 않습니다 (/mapfix minimap 으로 끄기)."
L["MINIMAP_OFF"] = "미니맵 수정 꺼짐 (/mapfix minimap 으로 켜기)."
