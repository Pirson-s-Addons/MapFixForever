local _, ns = ...

-- Idiomas del cliente: GetLocale() solo puede devolver enUS, enGB, deDE, esES,
-- esMX, frFR, itIT, koKR, ptBR, ruRU, zhCN y zhTW. El ingles define TODAS las
-- claves; cada idioma sobrescribe las suyas.

local L = {
    STATUS_ENGLISH = "the client is in English: the maps are complete, there is nothing to fix.",
    ENABLED = "fix on (/mapfix off to turn it off).",
    DISABLED = "fix off (/mapfix on to turn it on). Change map to see the result.",
    STATUS = "%d original Forever map textures shown (%d replacements). Change map to see the result.",
}

local TRANSLATIONS = {
    deDE = {
        STATUS_ENGLISH = "der Client ist auf Englisch: die Karten sind vollständig, es gibt nichts zu reparieren.",
        ENABLED = "Korrektur an (/mapfix off zum Ausschalten).",
        DISABLED = "Korrektur aus (/mapfix on zum Einschalten). Wechsle die Karte, um das Ergebnis zu sehen.",
        STATUS = "%d originale Forever-Kartentexturen angezeigt (%d Ersetzungen). Wechsle die Karte, um das Ergebnis zu sehen.",
    },
    esES = {
        STATUS_ENGLISH = "el cliente está en inglés: los mapas están completos, no hay nada que arreglar.",
        ENABLED = "arreglo activado (/mapfix off para desactivarlo).",
        DISABLED = "arreglo desactivado (/mapfix on para activarlo). Cambia de mapa para ver el resultado.",
        STATUS = "%d texturas originales del mapa de Forever mostradas (%d sustituciones). Cambia de mapa para ver el resultado.",
    },
    frFR = {
        STATUS_ENGLISH = "le client est en anglais : les cartes sont complètes, il n'y a rien à corriger.",
        ENABLED = "correction activée (/mapfix off pour la désactiver).",
        DISABLED = "correction désactivée (/mapfix on pour l'activer). Changez de carte pour voir le résultat.",
        STATUS = "%d textures originales de la carte de Forever affichées (%d remplacements). Changez de carte pour voir le résultat.",
    },
    itIT = {
        STATUS_ENGLISH = "il client è in inglese: le mappe sono complete, non c'è niente da correggere.",
        ENABLED = "correzione attiva (/mapfix off per disattivarla).",
        DISABLED = "correzione disattivata (/mapfix on per attivarla). Cambia mappa per vedere il risultato.",
        STATUS = "%d texture originali della mappa di Forever mostrate (%d sostituzioni). Cambia mappa per vedere il risultato.",
    },
    koKR = {
        STATUS_ENGLISH = "클라이언트가 영어입니다: 지도가 완전하여 고칠 것이 없습니다.",
        ENABLED = "수정 켜짐 (/mapfix off로 끄기).",
        DISABLED = "수정 꺼짐 (/mapfix on으로 켜기). 지도를 바꾸면 결과를 볼 수 있습니다.",
        STATUS = "Forever 원본 지도 텍스처 %d개 표시 (교체 %d회). 지도를 바꾸면 결과를 볼 수 있습니다.",
    },
    ptBR = {
        STATUS_ENGLISH = "o cliente está em inglês: os mapas estão completos, não há nada para corrigir.",
        ENABLED = "correção ativada (/mapfix off para desativar).",
        DISABLED = "correção desativada (/mapfix on para ativar). Mude de mapa para ver o resultado.",
        STATUS = "%d texturas originais do mapa de Forever exibidas (%d substituições). Mude de mapa para ver o resultado.",
    },
    ruRU = {
        STATUS_ENGLISH = "клиент на английском: карты полные, исправлять нечего.",
        ENABLED = "исправление включено (/mapfix off — выключить).",
        DISABLED = "исправление выключено (/mapfix on — включить). Смените карту, чтобы увидеть результат.",
        STATUS = "Показано оригинальных текстур карты Forever: %d (замен: %d). Смените карту, чтобы увидеть результат.",
    },
    zhCN = {
        STATUS_ENGLISH = "客户端为英文：地图完整，无需修复。",
        ENABLED = "修复已开启（/mapfix off 关闭）。",
        DISABLED = "修复已关闭（/mapfix on 开启）。切换地图即可看到效果。",
        STATUS = "已显示 %d 个 Forever 原版地图纹理（替换 %d 次）。切换地图即可看到效果。",
    },
    zhTW = {
        STATUS_ENGLISH = "用戶端為英文：地圖完整，無需修復。",
        ENABLED = "修復已開啟（/mapfix off 關閉）。",
        DISABLED = "修復已關閉（/mapfix on 開啟）。切換地圖即可看到效果。",
        STATUS = "已顯示 %d 個 Forever 原版地圖材質（替換 %d 次）。切換地圖即可看到效果。",
    },
}
TRANSLATIONS.esMX = TRANSLATIONS.esES

for key, text in pairs(TRANSLATIONS[GetLocale()] or {}) do
    L[key] = text
end

ns.L = L
-- Para el test de cobertura
ns.TRANSLATIONS = TRANSLATIONS
