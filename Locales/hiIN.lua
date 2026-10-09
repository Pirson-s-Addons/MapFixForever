local ADDON_NAME, ns = ...

-- ==========================================
-- हिन्दी (hiIN)
-- ==========================================
local locale = GetLocale()
if locale ~= "hiIN" then return end
local L = ns.L

L["STATUS_ENGLISH"] = "क्लाइंट अंग्रेज़ी में है: नक्शे पूरे हैं, ठीक करने को कुछ नहीं।"
L["ENABLED"] = "सुधार चालू (/mapfix off से बंद करें)।"
L["DISABLED"] = "सुधार बंद (/mapfix on से चालू करें)। नतीजा देखने के लिए नक्शा बदलें।"
L["STATUS"] = "Forever के %d मूल नक्शा टेक्सचर दिखाए गए (%d बदलाव)। नतीजा देखने के लिए नक्शा बदलें।"
L["MINIMAP_ON"] = "मिनीमैप सुधार चालू: Orgrimmar और Stormwind अब मिनीमैप पर धूसर नहीं दिखते (बंद करने के लिए /mapfix minimap)।"
L["MINIMAP_OFF"] = "मिनीमैप सुधार बंद (चालू करने के लिए /mapfix minimap)।"
