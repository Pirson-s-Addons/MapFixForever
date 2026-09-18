-- Map Fix Forever: el mapa del mundo sin teselas verdes en los clientes de WoW
-- Forever que no estan en ingles.
--
-- El fallo (beta 1.60.1): los mapas nuevos de Forever (interface/worldmap/
-- <zona>_c60, la Isla de Zephras...) solo se publicaron en ingles. En otro
-- idioma el cliente no los encuentra ("Can't find file in build manifest" en
-- Logs/AsyncFile.log) y pinta la textura que falta en verde.
--
-- El arreglo: despues de que Blizzard pinte las teselas del mapa y las zonas
-- exploradas, cada textura se comprueba en una textura oculta (SetTexture
-- devuelve si la pudo cargar). Si falta:
--   * tesela de un mapa _c60 -> la misma tesela del mapa antiguo de la zona
--     (Data.lua), si esa si existe;
--   * sin equivalente (zona nueva, zona explorada) -> se quita, para que no
--     salga el verde.
-- Solo post-hooks (hooksecurefunc): no se toca el codigo de Blizzard.
-- Contrastado con Gethe/wow-ui-source, rama "forever".

local _, ns = ...
local L = ns.L

local PREFIX = "|cffd597ffMap Fix Forever|r: "
local ENGLISH = { enUS = true, enGB = true }
local FILTER = "TRILINEAR"

local db
local probe                 -- textura oculta para comprobar archivos
local missing = {}          -- fileID -> true (falta) / false (existe)
local stats = { checked = 0, missing = 0, replaced = 0, cleared = 0 }

-- En ingles los mapas estan completos: no hay nada que arreglar.
local function Active()
    return db.enabled and not ENGLISH[GetLocale()]
end

local function IsMissing(fileID)
    if missing[fileID] == nil then
        local loaded = probe:SetTexture(fileID)
        missing[fileID] = ns.KNOWN_MISSING[fileID] or not loaded
        stats.checked = stats.checked + 1
        if missing[fileID] then stats.missing = stats.missing + 1 end
    end
    return missing[fileID]
end

local function Fix(texture)
    local fileID = texture:GetTextureFileID()
    if not fileID or not IsMissing(fileID) then return end
    local fallback = ns.FALLBACK[fileID]
    if fallback and not IsMissing(fallback) then
        texture:SetTexture(fallback, nil, nil, FILTER)
        stats.replaced = stats.replaced + 1
    else
        -- Sin nada que poner: vacia en vez de verde
        texture:SetTexture(nil)
        stats.cleared = stats.cleared + 1
    end
end

local function FixPool(pool)
    if not (pool and Active()) then return end
    for texture in pool:EnumerateActive() do Fix(texture) end
end

-- Los marcos del mapa copian los metodos del mixin al crearse, asi que el
-- enganche va en el mixin, antes de que se abra el mapa.
local hookedDetail, hookedExploration = false, false
local function HookMixins()
    if not hookedDetail and MapCanvasDetailLayerMixin then
        hookedDetail = true
        hooksecurefunc(MapCanvasDetailLayerMixin, "RefreshDetailTiles", function(self)
            FixPool(self.detailTilePool)
        end)
    end
    if not hookedExploration and MapExplorationPinMixin then
        hookedExploration = true
        hooksecurefunc(MapExplorationPinMixin, "RefreshOverlays", function(self)
            FixPool(self.overlayTexturePool)
        end)
    end
end

local function Status()
    if ENGLISH[GetLocale()] then
        print(PREFIX .. L.STATUS_ENGLISH)
        return
    end
    print(PREFIX .. (db.enabled and L.ENABLED or L.DISABLED))
    print(PREFIX .. L.STATUS:format(stats.checked, stats.missing, stats.replaced, stats.cleared))
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_LOGIN" then
        MapFixForeverDB = MapFixForeverDB or {}
        db = MapFixForeverDB
        if db.enabled == nil then db.enabled = true end
        probe = frame:CreateTexture()
        probe:Hide()
        HookMixins()

        SLASH_MAPFIXFOREVER1 = "/mapfix"
        SlashCmdList.MAPFIXFOREVER = function(msg)
            local command = (msg or ""):lower():match("^%s*(%S*)")
            if command == "on" or command == "off" then
                db.enabled = command == "on"
            end
            Status()
        end
    else
        -- Por si el mapa (y sus mixins) se cargan bajo demanda
        HookMixins()
    end
end)
