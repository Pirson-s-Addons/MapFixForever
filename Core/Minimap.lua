-- Map Fix Forever: el minimapa gris de Orgrimmar y Ventormenta.
--
-- El fallo (beta, build 1.60.1.70291): dentro de esas dos ciudades el minimapa
-- sale gris claro y negro, en todos los idiomas; los iconos si se ven. Las dos
-- son un modelo grande (WMO) con minimapa propio, y es ese el que viene roto:
-- las teselas del suelo (world/minimaps/<continente>/mapX_Y) estan bien.
-- Blizzard lo da por conocido en Ventormenta desde el 24-09.
--
-- El parche: se apaga lo que pinta el minimapa (C_Minimap.SetDrawGroundTextures,
-- los iconos siguen) y detras se ponen esas teselas del suelo, que ya estan en
-- el cliente: recortadas con la mascara del minimapa, a la escala del zoom y
-- giradas si el minimapa gira. Al salir de la ciudad vuelve todo a la normalidad.

local _, ns = ...

local BROKEN = { orgrimmar_c60 = true, stormwindcity_c60 = true }   -- mapa de zona (Art\) de las ciudades rotas
-- ponytail: mascara redonda de Blizzard; si otro addon pone el minimapa cuadrado, el mapa sale redondo
local MASK = "ui-hud-minimap-frame-generic-mask"                     -- la de Camelot/Skin.lua
local CHECK_INTERVAL = 0.5
local TILE = 1600 / 3                                                -- yardas por tesela (ADT)

-- Teselas del minimapa alrededor de cada ciudad: [continente][x * 100 + y] = FileDataID
-- (MAID de kalimdor.wdt y azeroth.wdt, build 1.60.1.70291)
local GROUND = {
    [1] = {   -- Kalimdor (Orgrimmar)
        [3826] = 208242, [3926] = 208286, [4026] = 208330, [4126] = 208374, [4226] = 208418, [4326] = 208462,
        [3827] = 208243, [3927] = 208287, [4027] = 208331, [4127] = 208375, [4227] = 208419, [4327] = 208463,
        [3828] = 208244, [3928] = 208288, [4028] = 208332, [4128] = 208376, [4228] = 208420, [4328] = 208464,
        [3829] = 208245, [3929] = 208289, [4029] = 208333, [4129] = 208377, [4229] = 208421, [4329] = 208465,
        [3830] = 208246, [3930] = 208290, [4030] = 208334, [4130] = 208378, [4230] = 208422, [4330] = 208466,
        [3831] = 208247, [3931] = 208291, [4031] = 208335, [4131] = 208379, [4231] = 208423, [4331] = 208467,
    },
    [0] = {   -- Reinos del Este (Ventormenta)
        [2846] = 204331, [2946] = 204371, [3046] = 204411, [3146] = 204451, [3246] = 204491, [3346] = 204531,
        [2847] = 204332, [2947] = 204372, [3047] = 204412, [3147] = 204452, [3247] = 204492, [3347] = 204532,
        [2848] = 204333, [2948] = 204373, [3048] = 204413, [3148] = 204453, [3248] = 204493, [3348] = 204533,
        [2849] = 204334, [2949] = 204374, [3049] = 204414, [3149] = 204454, [3249] = 204494, [3349] = 204534,
        [2850] = 204335, [2950] = 204375, [3050] = 204415, [3150] = 204455, [3250] = 204495, [3350] = 204535,
        [2851] = 204336, [2951] = 204376, [3051] = 204416, [3151] = 204456, [3251] = 204496, [3351] = 204536,
    },
}

local under, mask
local tiles = {}      -- 3x3 alrededor del jugador: el radio del minimapa nunca pasa de una tesela
local zone            -- mapID de la ciudad rota en la que esta el jugador, o nil
local groundHidden = false

local function SetGround(draw)
    if groundHidden ~= draw then return end
    groundHidden = not draw
    C_Minimap.SetDrawGroundTextures(draw)
end

-- Es una de las ciudades rotas? Lo dice su mapa de zona
local function IsBroken(mapID)
    local textures = C_Map.GetMapArtLayerTextures(mapID, 1)
    local art = textures and textures[1] and ns.ART[textures[1]]
    return art and BROKEN[art:match("^[^\\]+")]
end

-- Las 3x3 teselas del suelo en su sitio respecto al jugador (centro del minimapa).
-- Mundo: x crece al norte, y al oeste; la tesela es 32 - coordenada / TILE.
local function Place()
    local pos = C_Map.GetPlayerMapPosition(zone, "player")
    if not pos then return false end
    local continent, world = C_Map.GetWorldPosFromMapPos(zone, pos)
    local ground = continent and GROUND[continent]
    if not ground then return false end
    local wx, wy = world:GetXY()
    local col, row = 32 - wy / TILE, 32 - wx / TILE
    local scale = under:GetWidth() / 2 / C_Minimap.GetViewRadius()   -- pixeles por yarda
    local size = TILE * scale
    local angle = C_CVar.GetCVarBool("rotateMinimap") and -(GetPlayerFacing() or 0) or 0
    local c, s = math.cos(angle), math.sin(angle)
    local i = 0
    for dy = -1, 1 do
        for dx = -1, 1 do
            i = i + 1
            local tile = tiles[i]
            local tx, ty = math.floor(col) + dx, math.floor(row) + dy
            local fileID = ground[tx * 100 + ty]
            tile:SetShown(fileID ~= nil)
            if fileID then
                if tile.fileID ~= fileID then
                    tile.fileID = fileID
                    tile:SetTexture(fileID, nil, nil, "TRILINEAR")
                end
                local x = (tx + 0.5 - col) * size
                local y = -(ty + 0.5 - row) * size
                tile:SetSize(size, size)
                tile:ClearAllPoints()
                tile:SetPoint("CENTER", under, "CENTER", x * c - y * s, x * s + y * c)
                tile:SetRotation(angle)
            end
        end
    end
    return true
end

local function Stop()
    zone = nil
    under:Hide()
    SetGround(true)
end

local function Check()
    local mapID = ns.db.minimap and C_Map.GetBestMapForUnit("player")
    if not mapID then return Stop() end
    if zone ~= mapID then zone = IsBroken(mapID) and mapID or nil end
    if not zone then return Stop() end
    under:Show()
    SetGround(false)
end

function ns.StartMinimap()
    if not (Minimap and C_Minimap and C_Minimap.SetDrawGroundTextures) then return end
    -- Hermano del minimapa, un nivel por debajo: los iconos quedan encima
    under = CreateFrame("Frame", nil, Minimap:GetParent())
    under:SetAllPoints(Minimap)
    under:SetFrameStrata(Minimap:GetFrameStrata())
    under:SetFrameLevel(math.max(0, Minimap:GetFrameLevel() - 1))
    under:Hide()
    -- Las teselas se salen mucho del minimapa y la mascara no corta fuera de su
    -- recuadro (estira el borde en franjas): se recortan tambien por el rectangulo.
    under:SetClipsChildren(true)
    local canvas = CreateFrame("Frame", nil, under)
    canvas:SetAllPoints(under)
    mask = canvas:CreateMaskTexture()
    mask:SetAtlas(MASK)
    mask:SetAllPoints(under)
    for i = 1, 9 do
        tiles[i] = canvas:CreateTexture(nil, "BACKGROUND")
        tiles[i]:AddMaskTexture(mask)
    end

    local elapsed = CHECK_INTERVAL
    local driver = CreateFrame("Frame")
    driver:SetScript("OnUpdate", function(_, delta)
        elapsed = elapsed + delta
        if elapsed >= CHECK_INTERVAL then
            elapsed = 0
            Check()
        end
        if zone and not Place() then Stop() end
    end)
end

ns.RefreshMinimap = function() if under then Check() end end
