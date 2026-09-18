-- Map Fix Forever: el mapa del mundo completo en los clientes de WoW Forever
-- que no estan en ingles.
--
-- El fallo (beta 1.60.1): los mapas nuevos de Forever (interface/worldmap/
-- <zona>_c60, la Isla de Zephras, hyjal_camelot) solo se publicaron en ingles.
-- En otro idioma el cliente no los encuentra ("Can't find file in build
-- manifest" en Logs/AsyncFile.log) y los pinta en verde.
--
-- El arreglo: el addon lleva esas texturas originales (Art/, las mismas del
-- cliente en ingles, build 1.60.1.69913) y, fuera del ingles, pone su copia en
-- cada textura del mapa que use una de ellas: teselas y zonas exploradas.
-- Para no depender de un unico camino, se engancha en tres sitios:
--   1. Los mixins (marcos del mapa que se creen despues).
--   2. Las capas y marcadores ya creados, al abrir o cambiar el mapa.
--   3. Un repaso cada medio segundo mientras el mapa esta abierto.
-- Solo post-hooks (hooksecurefunc): no se toca el codigo de Blizzard.
-- Contrastado con Gethe/wow-ui-source, rama "forever".

local _, ns = ...
local L = ns.L

local PREFIX = "|cffd597ffMap Fix Forever|r: "
local ART_PATH = "Interface\\AddOns\\MapFixForever\\Art\\"
local ENGLISH = { enUS = true, enGB = true }
local FILTER = "TRILINEAR"
local SCAN_INTERVAL = 0.5
local EXPLORATION_TEMPLATE = "MapExplorationPinTemplate"

local db
local stats = { replaced = 0 }
local seen = {}             -- fileIDs de Forever vistos en el mapa

local function Active()
    return db.enabled and not ENGLISH[GetLocale()]
end

-- El ID que puso Blizzard. Si el archivo no llego a cargar, GetTextureFileID
-- podria no darlo: GetTexture devuelve lo que se le paso a SetTexture.
local function FileID(texture)
    return texture:GetTextureFileID() or tonumber(texture:GetTexture())
end

local function Fix(texture)
    local fileID = FileID(texture)
    local art = fileID and ns.ART[fileID]
    if not art then return end
    seen[fileID] = true
    texture:SetTexture(ART_PATH .. art, nil, nil, FILTER)
    stats.replaced = stats.replaced + 1
end

local function FixPool(pool)
    if not (pool and Active()) then return end
    for texture in pool:EnumerateActive() do Fix(texture) end
end

-- 2. Marcos ya creados: capas de teselas y marcadores de zonas exploradas
local hookedPins = {}
local function Scan(map)
    if not (map and map.detailLayerPool and Active()) then return end
    for layer in map.detailLayerPool:EnumerateActive() do FixPool(layer.detailTilePool) end
    for pin in map:EnumeratePinsByTemplate(EXPLORATION_TEMPLATE) do
        if not hookedPins[pin] then
            hookedPins[pin] = true
            hooksecurefunc(pin, "RefreshOverlays", function(self) FixPool(self.overlayTexturePool) end)
        end
        FixPool(pin.overlayTexturePool)
    end
end

local hookedMaps = {}
local function HookMap(map)
    if not map or hookedMaps[map] or not map.EnumeratePinsByTemplate then return end
    hookedMaps[map] = true
    hooksecurefunc(map, "OnMapChanged", function(self) Scan(self) end)
    map:HookScript("OnShow", function(self) Scan(self) end)
    -- 3. Repaso mientras esta abierto: cubre repintados por otros caminos
    local elapsed = 0
    map:HookScript("OnUpdate", function(self, delta)
        elapsed = elapsed + delta
        if elapsed < SCAN_INTERVAL then return end
        elapsed = 0
        Scan(self)
    end)
end

-- 1. Mixins: los marcos del mapa copian sus metodos al crearse
local hookedDetail, hookedExploration = false, false
local function HookAll()
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
    HookMap(WorldMapFrame)
    HookMap(BattlefieldMapFrame)
end

local function Status()
    if ENGLISH[GetLocale()] then
        print(PREFIX .. L.STATUS_ENGLISH)
        return
    end
    print(PREFIX .. (db.enabled and L.ENABLED or L.DISABLED))
    local count = 0
    for _ in pairs(seen) do count = count + 1 end
    print(PREFIX .. L.STATUS:format(count, stats.replaced))
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_LOGIN" then
        MapFixForeverDB = MapFixForeverDB or {}
        db = MapFixForeverDB
        if db.enabled == nil then db.enabled = true end
        HookAll()

        SLASH_MAPFIXFOREVER1 = "/mapfix"
        SlashCmdList.MAPFIXFOREVER = function(msg)
            local command = (msg or ""):lower():match("^%s*(%S*)")
            if command == "on" or command == "off" then
                db.enabled = command == "on"
            end
            Status()
        end
    elseif db then
        -- Mapas de carga bajo demanda (mapa de batalla...)
        HookAll()
    end
end)
