--[[
    ZYIKS RECOLOR V40
    Squishy Pink Edition ♡

    60 VoidScope presets
    5 GingerScope presets
    65 total scopes

    TianluScope:
    135752938667175

    Client-side cosmetic script
]]

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local WS = game:GetService("Workspace")
local RS = game:GetService("RunService")
local TS = game:GetService("TweenService")

local LP = Players.LocalPlayer
local PG = LP:WaitForChild("PlayerGui")

local ENV = _G

pcall(function()
    if type(getgenv) == "function" then
        ENV = getgenv()
    end
end)

if type(ENV.ZyiksRecolorCleanup) == "function" then
    pcall(ENV.ZyiksRecolorCleanup)
end

for _, name in ipairs({
    "ZyiksRecolorV40",
    "ZyiksRecolorDecorations"
}) do
    local old = PG:FindFirstChild(name)
    if old then
        old:Destroy()
    end
end

local alive = true
local conns = {}
local rowConns = {}
local visuals = {}
local textureOriginals = {}
local effectOriginals = {}
local effectLocks = {}
local watchedTools = setmetatable({}, {
    __mode = "k"
})

local function conn(c)
    conns[#conns + 1] = c
    return c
end

local function rowconn(c)
    rowConns[#rowConns + 1] = c
    return c
end

local function rgb(r, g, b)
    return Color3.fromRGB(r, g, b)
end

-- COLORS

local PINK = rgb(255,105,180)
local HOT = rgb(233,75,149)
local SOFT = rgb(255,194,224)
local PALE = rgb(255,233,244)
local WHITE = rgb(255,252,254)
local ROSE = rgb(147,48,100)
local BORDER = rgb(235,135,186)
local MUTED = rgb(187,104,152)

-- UI IMAGE ASSETS

local GINGHAM = "rbxassetid://73119596471835"
local DOTS = "rbxassetid://83771519540099"
local CHRISTMAS = "rbxassetid://130031151722681"
local BOW = "rbxassetid://78059150337221"
local RAIN = "rbxassetid://89478965484950"

local FONT = Enum.Font.FredokaOne

-- HELPERS

local function make(class, parent, props)
    local o = Instance.new(class)

    for k, v in pairs(props or {}) do
        pcall(function()
            o[k] = v
        end)
    end

    o.Parent = parent
    return o
end

local function corner(o, r)
    make("UICorner", o, {
        CornerRadius = UDim.new(0, r or 12)
    })
end

local function border(o, color, width)
    return make("UIStroke", o, {
        Color = color or BORDER,
        Thickness = width or 1
    })
end

local function outlined(o)
    if not (
        o:IsA("TextLabel")
        or o:IsA("TextButton")
        or o:IsA("TextBox")
    ) then
        return
    end

    make("UIStroke", o, {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
        Color = WHITE,
        Thickness = 2,
        Transparency = 0.04
    })
end

local function text(class, parent, props)
    local o = make(class, parent, props)
    outlined(o)
    return o
end

local function tween(o, props, duration, style, direction)
    if not alive then
        return
    end

    local tw = TS:Create(
        o,
        TweenInfo.new(
            duration or 0.2,
            style or Enum.EasingStyle.Quart,
            direction or Enum.EasingDirection.Out
        ),
        props
    )

    tw:Play()
    return tw
end

local function button(parent, label, position, size, z)
    local b = text("TextButton", parent, {
        Position = position,
        Size = size,
        BackgroundColor3 = PALE,
        BackgroundTransparency = 0.12,
        Text = label,
        TextColor3 = ROSE,
        Font = FONT,
        TextSize = 12,
        AutoButtonColor = false,
        ZIndex = z or 9
    })

    corner(b, 11)
    border(b)

    local scale = make("UIScale", b, {
        Scale = 1
    })

    conn(b.Activated:Connect(function()
        tween(
            scale,
            {Scale = 0.92},
            0.09,
            Enum.EasingStyle.Quad
        )

        task.delay(0.09, function()
            if alive and scale.Parent then
                tween(
                    scale,
                    {Scale = 1},
                    0.32,
                    Enum.EasingStyle.Elastic
                )
            end
        end)
    end))

    return b
end

-- SCOPE PRESETS

local scopes = {
    VoidScope = {},
    GingerScope = {}
}

local function add(cat, name, id, ...)
    scopes[cat][#scopes[cat] + 1] = {
        name = name,
        id = tostring(id),
        colors = {...}
    }
end

local V = "VoidScope"
local G = "GingerScope"

add(V,"Chrome Chains Scope",89011297789911,
    rgb(170,183,202),rgb(244,247,255),rgb(83,103,127))

add(V,"ChromeScope",92721203897057,
    rgb(255,59,117),rgb(255,179,71),rgb(255,247,138),
    rgb(87,247,176),rgb(91,203,255),rgb(166,107,255))

add(V,"Cherry Blossom Scope",71388376520884,
    rgb(255,134,183),rgb(255,225,237),rgb(201,138,255))

add(V,"HackerScope",113547863710933,
    rgb(0,255,101),rgb(0,47,24),rgb(180,255,0))

add(V,"RedScope",89421027141827,
    rgb(255,0,0),rgb(255,128,80),rgb(129,0,0))

add(V,"YellowScope",118507091753068,
    rgb(255,245,0),rgb(255,153,0),rgb(255,251,176))

add(V,"CoolScope",106349999686565,
    rgb(0,223,255),rgb(0,109,255),rgb(197,255,255))

add(V,"PurpleScope",91431058867138,
    rgb(224,174,255),rgb(166,93,224),rgb(73,31,110))

add(V,"WhiteScope",138494542305273,
    rgb(255,255,255),rgb(188,223,255),rgb(228,228,255))

add(V,"PurpleBlackHoleScope",100593936768139,
    rgb(23,0,36),rgb(158,0,255),rgb(0,0,0))

add(V,"OrangeScope",138675106444675,
    rgb(255,106,0),rgb(255,208,0),rgb(255,49,0))

add(V,"RoseScope",98671498958418,
    rgb(255,112,176),rgb(255,224,237),rgb(200,90,152))

add(V,"RealVoidScope",138251909648943,
    rgb(126,54,255),rgb(226,170,255),rgb(49,16,111))

add(V,"Blood Moon Scope",77829814616900,
    rgb(255,22,22),rgb(69,0,0),rgb(255,107,61))

add(V,"Cotton Candy Galaxy Scope",89525299941655,
    rgb(255,138,212),rgb(156,117,255),rgb(116,230,255))

add(V,"Abyssal Lightning Scope",87564917363234,
    rgb(0,234,255),rgb(113,45,255),rgb(4,21,78))

add(V,"Frozen Crystal Scope",83555779459860,
    rgb(255,255,255),rgb(123,220,255),rgb(44,124,255))

add(V,"Toxic Slime Scope",135405854735405,
    rgb(197,255,0),rgb(0,230,83),rgb(30,104,0))

add(V,"Rose Gold Scope",96017056259067,
    rgb(255,187,172),rgb(255,224,161),rgb(215,124,156))

add(V,"GreenScope",107785539336433,
    rgb(0,255,90),rgb(190,255,0),rgb(0,100,55))

add(V,"CherryScope",116967488721010,
    rgb(255,183,210),rgb(255,225,238),rgb(255,115,175))

add(V,"HotPinkScope",109569323795920,
    rgb(255,20,147),rgb(255,105,180),rgb(199,21,133))

add(V,"BlueScope",137458554478558,
    rgb(0,100,255),rgb(0,190,255),rgb(10,25,125))

add(V,"CyanScope",118198204691185,
    rgb(0,255,255),rgb(120,255,245),rgb(0,120,150))

add(V,"SpiderScope",106127693338329,
    rgb(101,0,0),rgb(240,25,41),rgb(18,10,18))

add(V,"HalloweenScope",78855076452029,
    rgb(255,121,0),rgb(140,32,232),rgb(255,177,43))

add(V,"ChristmasScope",70567062837178,
    rgb(217,0,24),rgb(255,255,255),rgb(157,0,24))

add(V,"AmericaScope",134320447853136,
    rgb(215,25,56),rgb(255,255,255),rgb(23,78,166))

add(V,"GoldScope",90285221313816,
    rgb(166,91,0),rgb(255,224,122),rgb(255,174,0))

add(V,"GojoScope",118373398983463,
    rgb(52,0,92),rgb(187,63,255),rgb(240,198,255))

add(V,"GoldDiamondScope",137217613360948,
    rgb(217,154,0),rgb(255,255,255),rgb(255,215,106))

add(V,"CrimsonScope",105062792534372,
    rgb(82,0,11),rgb(220,20,60),rgb(255,82,104))

add(V,"LavaScope",116410139676399,
    rgb(181,0,0),rgb(255,69,0),rgb(255,208,0))

add(V,"MeiMeiScope",128578646191684,
    rgb(255,255,255),rgb(174,181,192),rgb(32,35,43))

add(V,"LadybugScope",81799898172130,
    rgb(255,32,44),rgb(181,0,22),rgb(18,9,12))

add(V,"AutumnScope",111008837768377,
    rgb(214,90,18),rgb(184,115,51),rgb(230,173,85))

add(V,"PinkDragonScope",115729260393472,
    rgb(255,54,213),rgb(165,44,222),rgb(255,255,255))

add(V,"WoodScope",137395201108472,
    rgb(74,36,21),rgb(150,81,45),rgb(200,132,78))

add(V,"GlassScope",120196396881002,
    rgb(245,252,255),rgb(201,217,223),rgb(255,255,255))

add(V,"GraveyardScope",94822780469065,
    rgb(36,17,51),rgb(167,123,217),rgb(241,232,255))

add(V,"PurpleVortexScope",128233143427951,
    rgb(23,6,34),rgb(139,25,255),rgb(193,122,255))

add(V,"WhiteVortexScope",73369779872481,
    rgb(8,8,12),rgb(174,178,191),rgb(255,255,255))

add(V,"CosmicScope",139394822253711,
    rgb(41,16,94),rgb(136,81,245),rgb(244,238,255))

add(V,"ChainedGalaxyScope",139286523160275,
    rgb(16,18,79),rgb(25,124,255),rgb(163,55,255))

add(V,"AngelScope",124383569086781,
    rgb(34,87,181),rgb(145,207,255),rgb(255,255,255))

add(V,"HeavenlyScope",136726132031346,
    rgb(255,212,92),rgb(255,255,255),rgb(120,185,255))

add(V,"MoonlightScope",72779774935963,
    rgb(8,21,45),rgb(71,127,205),rgb(220,234,255))

add(V,"NebulaScope",89552795828568,
    rgb(194,31,255),rgb(18,223,255),rgb(121,51,232))

add(V,"BlackChainsScope",71691975025595,
    rgb(8,8,11),rgb(169,169,181),rgb(255,255,255))

add(V,"CyberScope",133896069405310,
    rgb(0,85,255),rgb(0,229,255),rgb(160,32,240))

add(V,"RetrofantasyScope",80473799883435,
    rgb(133,91,255),rgb(255,130,210),rgb(255,198,107))

add(V,"DarkPurpleScope",134774749406354,
    rgb(22,0,31),rgb(82,0,128),rgb(160,32,240))

add(V,"BubblegumScope",93260110013377,
    rgb(255,0,140),rgb(255,115,203),rgb(255,255,255))

add(V,"RainbowCloudScope",74365710518249,
    rgb(255,48,48),rgb(255,223,0),rgb(39,237,100),
    rgb(35,138,255),rgb(162,44,255))

add(V,"GasolineScope",74498204052075,
    rgb(255,49,200),rgb(122,24,255),rgb(0,217,255),
    rgb(255,146,75))

add(V,"FutigerAeroScope",118255991818587,
    rgb(0,107,255),rgb(56,207,255),rgb(255,255,255),
    rgb(124,230,92))

add(V,"RubyScope",72964570850620,
    rgb(255,16,31),rgb(128,0,16),rgb(17,24,39),
    rgb(192,202,216))

add(V,"LightScope",102549210371348,
    rgb(201,151,72),rgb(248,228,162),rgb(255,249,218),
    rgb(248,228,162),rgb(201,151,72))

add(V,"Xchampulsescope",102825288638476,
    rgb(120,0,0),rgb(255,16,31),rgb(255,48,48),
    rgb(255,16,31),rgb(120,0,0))

-- NEW V40 SCOPE

add(V,"TianluScope",135752938667175,
    rgb(255,255,255),
    rgb(191,250,255),
    rgb(69,213,232),
    rgb(191,250,255),
    rgb(255,255,255)
)

-- GINGERSCOPES

add(G,"Pink Sci-Fi",117227915790509,
    rgb(255,20,147),rgb(255,105,210),rgb(255,255,255))

add(G,"Blue Sci-Fi",128592793058217,
    rgb(0,59,255),rgb(0,140,255),rgb(200,245,255))

add(G,"Championscope",107417008695054,
    rgb(21,0,0),rgb(160,0,0),rgb(255,16,16))

add(G,"Beastscope",100126583443070,
    rgb(36,0,71),rgb(101,0,184),rgb(160,32,240))

add(G,"Kittyscope",138130527508034,
    rgb(255,74,168),rgb(255,182,223),rgb(255,255,255))

-- COLOR GRADIENT SYSTEM

local selected = nil
local shotUntil = 0
local gradientCache = {}

local function gradient(s)
    if not s then
        return ColorSequence.new(PINK)
    end

    if gradientCache[s] then
        return gradientCache[s]
    end

    local points = {}

    for i, c in ipairs(s.colors) do
        points[#points + 1] =
            ColorSequenceKeypoint.new(
                (i - 1) / (#s.colors - 1),
                c
            )
    end

    gradientCache[s] = ColorSequence.new(points)
    return gradientCache[s]
end

-- TEXTURE REPLACEMENT

local function isGun(o)
    local n = o.Name:lower():gsub("%s+", "")

    return n == "gun"
        or n == "gundisplay"
        or n:find("voidscope", 1, true)
        or n:find("gingerscope", 1, true)
end

local function textureProperty(o)
    if o:IsA("MeshPart") then
        return "TextureID"
    end

    if o:IsA("SpecialMesh") then
        return "TextureId"
    end

    if o:IsA("SurfaceAppearance") then
        return "ColorMap"
    end

    if o:IsA("Decal") or o:IsA("Texture") then
        return "Texture"
    end
end

local function applyTexture(o)
    if not selected then
        return
    end

    local prop = textureProperty(o)

    if not prop then
        return
    end

    pcall(function()
        local current = o[prop]

        if type(current) ~= "string" then
            return
        end

        if not textureOriginals[o] then
            textureOriginals[o] = {
                prop,
                current
            }
        end

        local wanted = "rbxassetid://" .. selected.id

        if current ~= wanted then
            o[prop] = wanted
        end
    end)
end

local function scanContainer(container)
    if not container then
        return
    end

    if isGun(container) then
        applyTexture(container)

        for _, o in ipairs(container:GetDescendants()) do
            applyTexture(o)
        end

        return
    end

    for _, o in ipairs(container:GetDescendants()) do
        if isGun(o) then
            applyTexture(o)

            for _, d in ipairs(o:GetDescendants()) do
                applyTexture(d)
            end
        end
    end
end

local function scanGuns()
    local char = LP.Character

    scanContainer(char)
    scanContainer(LP:FindFirstChildOfClass("Backpack"))

    if char then
        local ref = char:FindFirstChild("DisplayRefGun", true)

        if ref and ref:IsA("ObjectValue") then
            scanContainer(ref.Value)
        end
    end
end

local function restoreTextures()
    for o, v in pairs(textureOriginals) do
        pcall(function()
            if o.Parent then
                o[v[1]] = v[2]
            end
        end)
    end

    table.clear(textureOriginals)
end

-- SHOOTING BEAM RECOLOR

local function isShotEffect(o)
    return o:IsA("Beam")
        or o:IsA("Trail")
        or o:IsA("ParticleEmitter")
end

local function recolorShot(o)
    if not alive or not selected then
        return
    end

    if effectOriginals[o] == nil then
        local ok, value = pcall(function()
            return o.Color
        end)

        if not ok then
            return
        end

        effectOriginals[o] = value
    end

    local changing = false

    local function enforce()
        if changing
            or not alive
            or not selected
            or not o.Parent then
            return
        end

        changing = true

        pcall(function()
            o.Color = gradient(selected)
        end)

        changing = false
    end

    enforce()

    if not effectLocks[o] then
        effectLocks[o] =
            o:GetPropertyChangedSignal("Color"):Connect(enforce)
    end
end

local function markShot()
    if selected then
        shotUntil = os.clock() + 1
    end
end

conn(UIS.InputBegan:Connect(function(input, processed)
    if processed then
        return
    end

    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1
        or input.KeyCode == Enum.KeyCode.ButtonR2 then
        markShot()
    end
end))

local function watchTool(o)
    if not o:IsA("Tool") or watchedTools[o] then
        return
    end

    watchedTools[o] = true
    conn(o.Activated:Connect(markShot))
end

local function watchCharacter(c)
    for _, o in ipairs(c:GetChildren()) do
        watchTool(o)
    end

    conn(c.ChildAdded:Connect(watchTool))
end

if LP.Character then
    watchCharacter(LP.Character)
end

conn(LP.CharacterAdded:Connect(watchCharacter))

conn(WS.DescendantAdded:Connect(function(o)
    if not alive
        or not selected
        or not isShotEffect(o)
        or os.clock() > shotUntil then
        return
    end

    task.defer(function()
        if not alive or not o.Parent then
            return
        end

        local c = LP.Character
        local root = c and c:FindFirstChild("HumanoidRootPart")
        local part = o:FindFirstAncestorWhichIsA("BasePart")

        if root and part then
            if (root.Position - part.Position).Magnitude > 30 then
                return
            end
        end

        recolorShot(o)
    end)
end))

local function restoreShots()
    for o, c in pairs(effectLocks) do
        c:Disconnect()
        effectLocks[o] = nil
    end

    for o, value in pairs(effectOriginals) do
        pcall(function()
            if o.Parent then
                o.Color = value
            end
        end)
    end

    table.clear(effectOriginals)
end

-- GUN TRAILS AND PARTICLES

local COLORS = {
    Pink = rgb(255,55,165),
    Black = rgb(10,10,15),
    Red = rgb(255,35,45),
    Green = rgb(35,255,90),
    Yellow = rgb(255,230,25),
    Blue = rgb(40,145,255),
    Purple = rgb(170,65,255),
    Cyan = rgb(35,235,255),
    Orange = rgb(255,135,25),
    White = WHITE,
    Gold = rgb(255,195,55),
    Magenta = rgb(255,35,225),
    Lavender = rgb(210,175,255),
    ["Baby Blue"] = rgb(160,215,255),
    ["Light Pink"] = rgb(255,185,225),
    ["Light Green"] = rgb(175,255,195),
    ["Light Yellow"] = rgb(255,245,165),
    Mint = rgb(165,255,225),
    Peach = rgb(255,205,175),
    Silver = rgb(205,220,235),
    ["Dark Red"] = rgb(110,0,15),
    ["Dark Blue"] = rgb(5,35,120),
    ["Dark Purple"] = rgb(65,0,105),
    ["Neon Pink"] = rgb(255,0,175),
    ["Neon Green"] = rgb(0,255,65)
}

local colorNames = {
    "Pink","Black","Red","Green","Yellow",
    "Blue","Purple","Cyan","Orange","White",
    "Gold","Magenta","Lavender","Baby Blue",
    "Light Pink","Light Green","Light Yellow",
    "Mint","Peach","Silver","Dark Red",
    "Dark Blue","Dark Purple","Neon Pink",
    "Neon Green"
}

local placements = {
    "Barrel","Muzzle","Top","Bottom",
    "Left","Right","Rear","Center"
}

local trailConfigs = {}
local particleConfigs = {}

local trailId = 0
local particleId = 0

local function addTrail()
    if #trailConfigs >= 12 then
        return false
    end

    trailId += 1

    trailConfigs[#trailConfigs + 1] = {
        id = trailId,
        color = "Pink",
        placement = "Barrel",
        lifetime = 0.35,
        width = 0.22,
        enabled = true
    }

    return true
end

local function addParticles()
    if #particleConfigs >= 8 then
        return false
    end

    particleId += 1

    particleConfigs[#particleConfigs + 1] = {
        id = particleId,
        color = "Light Pink",
        placement = "Muzzle",
        rate = 20,
        size = 0.16,
        enabled = true
    }

    return true
end

local function removeConfig(list, id)
    for i, c in ipairs(list) do
        if c.id == id then
            table.remove(list, i)
            return
        end
    end
end

local function equippedGun()
    local c = LP.Character

    if not c then
        return nil
    end

    local tool = c:FindFirstChildOfClass("Tool")

    if tool then
        local handle = tool:FindFirstChild("Handle")

        if handle and handle:IsA("BasePart") then
            return handle
        end

        local p = tool:FindFirstChildWhichIsA("BasePart", true)

        if p then
            return p
        end
    end

    local ref = c:FindFirstChild("DisplayRefGun", true)

    if ref and ref:IsA("ObjectValue") and ref.Value then
        local target = ref.Value

        if target:IsA("BasePart") then
            return target
        end

        return target:FindFirstChildWhichIsA("BasePart", true)
    end

    local gun = c:FindFirstChild("Gun")

    if gun then
        if gun:IsA("BasePart") then
            return gun
        end

        return gun:FindFirstChildWhichIsA("BasePart", true)
    end

    return nil
end

local function placementPosition(part, placement)
    local s = part.Size

    if placement == "Barrel" then
        return Vector3.new(0,0,-s.Z * 0.45)
    elseif placement == "Muzzle" then
        return Vector3.new(0,0,-s.Z * 0.55)
    elseif placement == "Top" then
        return Vector3.new(0,s.Y * 0.5,0)
    elseif placement == "Bottom" then
        return Vector3.new(0,-s.Y * 0.5,0)
    elseif placement == "Left" then
        return Vector3.new(-s.X * 0.5,0,0)
    elseif placement == "Right" then
        return Vector3.new(s.X * 0.5,0,0)
    elseif placement == "Rear" then
        return Vector3.new(0,0,s.Z * 0.45)
    end

    return Vector3.zero
end

local function visual(o)
    visuals[#visuals + 1] = o
    return o
end

local function clearVisuals()
    for _, o in ipairs(visuals) do
        pcall(function()
            o:Destroy()
        end)
    end

    table.clear(visuals)
end

local function attachment(part, position)
    return visual(make("Attachment", part, {
        Position = position
    }))
end

local function createTrail(part, config)
    local position = placementPosition(part, config.placement)
    local half = math.max(0.035, config.width * 0.5)

    local a = attachment(
        part,
        position + Vector3.new(0,half,0)
    )

    local b = attachment(
        part,
        position - Vector3.new(0,half,0)
    )

    visual(make("Trail", part, {
        Attachment0 = a,
        Attachment1 = b,
        Color = ColorSequence.new(
            COLORS[config.color] or PINK
        ),
        Lifetime = config.lifetime,
        MinLength = 0.01,
        LightEmission = 0.8,
        LightInfluence = 0,
        FaceCamera = true,
        Enabled = true,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0,0.05),
            NumberSequenceKeypoint.new(1,1)
        })
    }))
end

local function createParticles(part, config)
    local a = attachment(
        part,
        placementPosition(part, config.placement)
    )

    visual(make("ParticleEmitter", a, {
        Color = ColorSequence.new(
            COLORS[config.color] or PINK
        ),
        Rate = config.rate,
        Lifetime = NumberRange.new(0.3,0.65),
        Speed = NumberRange.new(0.5,2),
        SpreadAngle = Vector2.new(35,35),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0,config.size),
            NumberSequenceKeypoint.new(1,0)
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0,0.1),
            NumberSequenceKeypoint.new(1,1)
        }),
        LightEmission = 0.75,
        Enabled = true
    }))
end

local function refreshVisuals()
    clearVisuals()

    local gun = equippedGun()

    if not gun then
        return
    end

    for _, config in ipairs(trailConfigs) do
        if config.enabled then
            pcall(createTrail, gun, config)
        end
    end

    for _, config in ipairs(particleConfigs) do
        if config.enabled then
            pcall(createParticles, gun, config)
        end
    end
end

local function selectScope(scope)
    restoreTextures()
    selected = scope
    scanGuns()

    for o in pairs(effectLocks) do
        if o.Parent then
            recolorShot(o)
        end
    end
end

-- MAIN UI

local gui = make("ScreenGui", PG, {
    Name = "ZyiksRecolorV40",
    ResetOnSpawn = false,
    IgnoreGuiInset = true,
    DisplayOrder = 300,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling
})

local decorations = make("ScreenGui", PG, {
    Name = "ZyiksRecolorDecorations",
    ResetOnSpawn = false,
    IgnoreGuiInset = true,
    DisplayOrder = 301,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling
})

-- DRAGGABLE CHRISTMAS CAT LAUNCHER

local launcher = make("ImageButton", gui, {
    Size = UDim2.fromOffset(67,67),
    Position = UDim2.new(0,18,0.42,0),
    BackgroundColor3 = PALE,
    BackgroundTransparency = 0.05,
    Image = CHRISTMAS,
    ScaleType = Enum.ScaleType.Fit,
    AutoButtonColor = false,
    ZIndex = 30
})

corner(launcher,18)
border(launcher,HOT,2)

local launchScale = make("UIScale", launcher, {
    Scale = 1
})

-- MAIN PANEL

local panel = make("Frame", gui, {
    Size = UDim2.fromOffset(590,410),
    AnchorPoint = Vector2.new(0.5,0.5),
    Position = UDim2.fromScale(0.5,0.5),
    BackgroundColor3 = PALE,
    BackgroundTransparency = 0.15,
    ClipsDescendants = false,
    Visible = false,
    ZIndex = 1
})

corner(panel,19)
border(panel,HOT,2)

local panelScale = make("UIScale", panel, {
    Scale = 1
})

local function fittedScale()
    local camera = WS.CurrentCamera

    if not camera then
        return 1
    end

    local v = camera.ViewportSize

    return math.max(
        0.4,
        math.min(
            1,
            (v.X - 30) / 590,
            (v.Y - 55) / 410
        )
    )
end

local gingham = make("ImageLabel", panel, {
    Size = UDim2.fromScale(1,1),
    BackgroundTransparency = 1,
    Image = GINGHAM,
    ImageTransparency = 0.22,
    ScaleType = Enum.ScaleType.Stretch,
    ZIndex = 1
})

corner(gingham,19)

local tint = make("Frame", panel, {
    Size = UDim2.fromScale(1,1),
    BackgroundColor3 = SOFT,
    BackgroundTransparency = 0.68,
    ZIndex = 2
})

corner(tint,18)

local sidebar = make("Frame", panel, {
    Size = UDim2.fromOffset(158,410),
    BackgroundColor3 = PALE,
    BackgroundTransparency = 0.22,
    ZIndex = 3
})

corner(sidebar,16)

text("TextLabel", sidebar, {
    Position = UDim2.fromOffset(10,15),
    Size = UDim2.fromOffset(140,28),
    BackgroundTransparency = 1,
    Text = "୨୧ ZYIKS ୨୧",
    Font = FONT,
    TextSize = 19,
    TextColor3 = ROSE,
    TextXAlignment = Enum.TextXAlignment.Left,
    ZIndex = 4
})

text("TextLabel", sidebar, {
    Position = UDim2.fromOffset(11,45),
    Size = UDim2.fromOffset(140,18),
    BackgroundTransparency = 1,
    Text = "♡ RECOLOR V40 ♡",
    Font = FONT,
    TextSize = 12,
    TextColor3 = HOT,
    TextXAlignment = Enum.TextXAlignment.Left,
    ZIndex = 4
})

text("TextLabel", sidebar, {
    Position = UDim2.new(0,8,1,-43),
    Size = UDim2.new(1,-16,0,30),
    BackgroundTransparency = 1,
    Text = "♡ PINK EDITION ♡",
    Font = FONT,
    TextSize = 11,
    TextColor3 = ROSE,
    ZIndex = 5
})

local content = make("Frame", panel, {
    Position = UDim2.fromOffset(158,0),
    Size = UDim2.new(1,-158,1,0),
    BackgroundTransparency = 1,
    ZIndex = 3
})

local header = make("Frame", content, {
    Size = UDim2.new(1,0,0,65),
    BackgroundTransparency = 1,
    ZIndex = 4
})

local title = text("TextLabel", header, {
    Position = UDim2.fromOffset(15,12),
    Size = UDim2.new(1,-145,0,38),
    BackgroundTransparency = 1,
    Text = "♡ VoidScope ♡",
    Font = FONT,
    TextSize = 21,
    TextColor3 = ROSE,
    TextXAlignment = Enum.TextXAlignment.Left,
    ZIndex = 5
})

make("ImageLabel", header, {
    Size = UDim2.fromOffset(55,55),
    Position = UDim2.new(1,-120,0,3),
    BackgroundTransparency = 1,
    Image = CHRISTMAS,
    ScaleType = Enum.ScaleType.Fit,
    ZIndex = 6
})

local close = button(
    header,
    "×",
    UDim2.new(1,-43,0,13),
    UDim2.fromOffset(29,29),
    9
)

close.TextSize = 22

-- OVERLAPPING CORNER BOW

local bow = make("ImageLabel", decorations, {
    Size = UDim2.fromOffset(65,55),
    BackgroundTransparency = 1,
    Image = BOW,
    ScaleType = Enum.ScaleType.Fit,
    Visible = false,
    Active = false,
    ZIndex = 20
})

local function positionBow()
    bow.Visible = panel.Visible

    if not panel.Visible then
        return
    end

    local p = panel.AbsolutePosition
    local s = panel.AbsoluteSize
    local scale = panelScale.Scale

    local bw = 65 * scale
    local bh = 55 * scale

    bow.Size = UDim2.fromOffset(bw,bh)

    bow.Position = UDim2.fromOffset(
        p.X + s.X - bw * 0.58,
        p.Y - bh * 0.38
    )
end

conn(panel:GetPropertyChangedSignal(
    "AbsolutePosition"
):Connect(positionBow))

conn(panel:GetPropertyChangedSignal(
    "AbsoluteSize"
):Connect(positionBow))

conn(panel:GetPropertyChangedSignal(
    "Visible"
):Connect(positionBow))

conn(panelScale:GetPropertyChangedSignal(
    "Scale"
):Connect(positionBow))

-- SLOW FALLING IMAGE PARTICLES

local rainLayer = make("Frame", decorations, {
    Size = UDim2.fromScale(1,1),
    BackgroundTransparency = 1,
    Active = false,
    ZIndex = 2
})

local rainEnabled = true
local rainParticles = {}
local rng = Random.new()

local function clearRain()
    for _, o in ipairs(rainParticles) do
        pcall(function()
            o:Destroy()
        end)
    end

    table.clear(rainParticles)
end

local function rainDrop()
    if not alive
        or not panel.Visible
        or not rainEnabled then
        return
    end

    local p = panel.AbsolutePosition
    local s = panel.AbsoluteSize

    if s.X < 1 or s.Y < 1 then
        return
    end

    local size = rng:NextInteger(13,25) * panelScale.Scale

    local x = p.X + rng:NextNumber(4,s.X - 4)
    local y = p.Y - rng:NextNumber(8,24)

    local drift =
        rng:NextNumber(-32,32) * panelScale.Scale

    local drop = make("ImageLabel", rainLayer, {
        Position = UDim2.fromOffset(x,y),
        Size = UDim2.fromOffset(size,size),
        AnchorPoint = Vector2.new(0.5,0.5),
        BackgroundTransparency = 1,
        Image = RAIN,
        ImageTransparency = rng:NextNumber(0.12,0.38),
        Rotation = rng:NextInteger(-25,25),
        ScaleType = Enum.ScaleType.Fit,
        Active = false,
        ZIndex = 3
    })

    rainParticles[#rainParticles + 1] = drop

    local duration = rng:NextNumber(5,8)

    local tw = tween(
        drop,
        {
            Position = UDim2.fromOffset(
                x + drift,
                p.Y + s.Y + 40
            ),
            Rotation = drop.Rotation
                + rng:NextInteger(-80,80),
            ImageTransparency = 1
        },
        duration,
        Enum.EasingStyle.Linear
    )

    if tw then
        tw.Completed:Once(function()
            for i, v in ipairs(rainParticles) do
                if v == drop then
                    table.remove(rainParticles,i)
                    break
                end
            end

            if drop.Parent then
                drop:Destroy()
            end
        end)
    end
end

-- SIDEBAR TABS

local pages = {}
local nav = {}

local function selectPage(name)
    for n, p in pairs(pages) do
        p.Visible = n == name

        local b = nav[n]

        tween(b, {
            BackgroundColor3 =
                n == name and SOFT or WHITE
        },0.25,Enum.EasingStyle.Back)

        local pattern = b:FindFirstChild("DotPattern")

        if pattern then
            pattern.ImageTransparency =
                n == name and 0.3 or 0.12
        end
    end

    title.Text = "♡ " .. name .. " ♡"

    local p = pages[name]

    if p then
        local scale = p:FindFirstChild("PageScale")

        if scale then
            scale.Scale = 0.96

            tween(
                scale,
                {Scale = 1},
                0.3,
                Enum.EasingStyle.Back
            )
        end
    end
end

for i, name in ipairs({
    "VoidScope",
    "GingerScope",
    "Effects"
}) do
    local prefix =
        i == 1 and "♡ "
        or i == 2 and "୨୧ "
        or "ʚɞ "

    local b = button(
        sidebar,
        prefix .. name,
        UDim2.fromOffset(8,96 + (i - 1) * 51),
        UDim2.new(1,-16,0,43),
        6
    )

    b.BackgroundColor3 = WHITE
    b.TextColor3 = ROSE

    -- Polka dots inside each navigation button.
    -- Text stays above the pattern.

    local pattern = make("ImageLabel", b, {
        Name = "DotPattern",
        Size = UDim2.fromScale(1,1),
        BackgroundTransparency = 1,
        Image = DOTS,
        ImageTransparency = 0.12,
        ScaleType = Enum.ScaleType.Stretch,
        ZIndex = 5,
        Active = false
    })

    corner(pattern,12)

    nav[name] = b

    local page = make("Frame", content, {
        Position = UDim2.fromOffset(12,66),
        Size = UDim2.new(1,-24,1,-80),
        BackgroundTransparency = 1,
        Visible = false,
        ZIndex = 4
    })

    pages[name] = page

    make("UIScale", page, {
        Name = "PageScale",
        Scale = 1
    })

    local dots = make("ImageLabel", page, {
        Size = UDim2.fromScale(1,1),
        BackgroundColor3 = PALE,
        BackgroundTransparency = 0.3,
        Image = DOTS,
        ImageTransparency = 0.15,
        ScaleType = Enum.ScaleType.Stretch,
        ZIndex = 4
    })

    corner(dots,13)

    conn(b.Activated:Connect(function()
        selectPage(name)
    end))
end

local function scrolling(parent, position, size)
    local s = make("ScrollingFrame", parent, {
        Position = position,
        Size = size,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = PINK,
        CanvasSize = UDim2.fromOffset(0,0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ZIndex = 6
    })

    make("UIListLayout", s, {
        Padding = UDim.new(0,7),
        SortOrder = Enum.SortOrder.LayoutOrder
    })

    return s
end

-- SCOPE LISTS AND SEARCH

local scopeButtons = {}

for _, category in ipairs({V,G}) do
    local page = pages[category]

    local search = text("TextBox", page, {
        Position = UDim2.fromOffset(9,9),
        Size = UDim2.new(1,-18,0,36),
        BackgroundColor3 = WHITE,
        BackgroundTransparency = 0.08,
        PlaceholderText = "♡ Search " .. category .. "...",
        PlaceholderColor3 = MUTED,
        Text = "",
        TextColor3 = ROSE,
        Font = FONT,
        TextSize = 12,
        ClearTextOnFocus = false,
        ZIndex = 7
    })

    corner(search,12)
    border(search)

    local list = scrolling(
        page,
        UDim2.fromOffset(9,54),
        UDim2.new(1,-18,1,-63)
    )

    for i, scope in ipairs(scopes[category]) do
        local b = button(
            list,
            "  ♡ " .. scope.name,
            UDim2.fromOffset(0,0),
            UDim2.new(1,-5,0,43),
            7
        )

        b.LayoutOrder = i
        b.TextXAlignment = Enum.TextXAlignment.Left
        b.BackgroundColor3 = WHITE

        local swatch = make("Frame", b, {
            Size = UDim2.fromOffset(48,18),
            Position = UDim2.new(1,-57,0.5,-9),
            BackgroundColor3 = WHITE,
            ZIndex = 8
        })

        corner(swatch,7)

        make("UIGradient", swatch, {
            Color = gradient(scope)
        })

        scopeButtons[scope] = b

        conn(b.Activated:Connect(function()
            selectScope(scope)

            for item, entry in pairs(scopeButtons) do
                tween(entry, {
                    BackgroundColor3 =
                        item == scope and SOFT or WHITE
                },0.2)
            end
        end))
    end

    conn(search:GetPropertyChangedSignal(
        "Text"
    ):Connect(function()
        local q = search.Text:lower()

        for _, scope in ipairs(scopes[category]) do
            scopeButtons[scope].Visible =
                q == ""
                or scope.name:lower():find(
                    q,1,true
                ) ~= nil
        end
    end))
end

-- EFFECTS PAGE

local effectPage = pages.Effects

local trailTab = button(
    effectPage,
    "♡ TRAILS ♡",
    UDim2.fromOffset(9,9),
    UDim2.new(0.49,-9,0,37),
    8
)

local particleTab = button(
    effectPage,
    "୨୧ PARTICLES ୨୧",
    UDim2.new(0.51,0,0,9),
    UDim2.new(0.49,-9,0,37),
    8
)

local trailPage = make("Frame", effectPage, {
    Position = UDim2.fromOffset(9,54),
    Size = UDim2.new(1,-18,1,-63),
    BackgroundTransparency = 1,
    ZIndex = 7
})

local particlePage = make("Frame", effectPage, {
    Position = UDim2.fromOffset(9,54),
    Size = UDim2.new(1,-18,1,-63),
    BackgroundTransparency = 1,
    Visible = false,
    ZIndex = 7
})

local function effectTab(which)
    trailPage.Visible = which == "Trail"
    particlePage.Visible = which == "Particle"

    tween(trailTab, {
        BackgroundColor3 =
            which == "Trail" and SOFT or WHITE
    },0.2)

    tween(particleTab, {
        BackgroundColor3 =
            which == "Particle" and SOFT or WHITE
    },0.2)
end

conn(trailTab.Activated:Connect(function()
    effectTab("Trail")
end))

conn(particleTab.Activated:Connect(function()
    effectTab("Particle")
end))

local trailList = scrolling(
    trailPage,
    UDim2.fromOffset(0,0),
    UDim2.new(1,0,1,-47)
)

local particleList = scrolling(
    particlePage,
    UDim2.fromOffset(0,0),
    UDim2.new(1,0,1,-47)
)

local addTrailBtn = button(
    trailPage,
    "♡ ADD GUN TRAIL ♡",
    UDim2.new(0,0,1,-40),
    UDim2.new(1,0,0,38),
    9
)

local addParticleBtn = button(
    particlePage,
    "୨୧ ADD PARTICLES ୨୧",
    UDim2.new(0,0,1,-40),
    UDim2.new(1,0,0,38),
    9
)

local function nextValue(list, current)
    local i = table.find(list,current) or 0
    return list[(i % #list) + 1]
end

local rebuild

local function clearRows()
    for _, c in ipairs(rowConns) do
        pcall(function()
            c:Disconnect()
        end)
    end

    table.clear(rowConns)

    for _, list in ipairs({
        trailList,
        particleList
    }) do
        for _, o in ipairs(list:GetChildren()) do
            if o:IsA("Frame") then
                o:Destroy()
            end
        end
    end
end

local function configRow(list, config, kind)
    local frame = make("Frame", list, {
        Size = UDim2.new(1,-5,0,119),
        BackgroundColor3 = WHITE,
        BackgroundTransparency = 0.09,
        ZIndex = 8
    })

    corner(frame,12)
    border(frame)

    text("TextLabel", frame, {
        Position = UDim2.fromOffset(11,7),
        Size = UDim2.new(1,-95,0,23),
        BackgroundTransparency = 1,
        Text = kind == "Trail"
            and ("♡ Trail #" .. config.id)
            or ("୨୧ Particles #" .. config.id),
        TextColor3 = ROSE,
        TextSize = 13,
        Font = FONT,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 9
    })

    local remove = button(
        frame,
        "REMOVE",
        UDim2.new(1,-75,0,8),
        UDim2.fromOffset(65,23),
        9
    )

    local color = button(
        frame,
        "Color: " .. config.color,
        UDim2.fromOffset(10,39),
        UDim2.new(0.53,-13,0,30),
        9
    )

    local placeBtn = button(
        frame,
        config.placement,
        UDim2.new(0.53,3,0,39),
        UDim2.new(0.47,-13,0,30),
        9
    )

    local enabled = button(
        frame,
        config.enabled and "♡ ON" or "OFF",
        UDim2.fromOffset(10,77),
        UDim2.new(0.3,-13,0,30),
        9
    )

    local extra = button(
        frame,
        kind == "Trail"
            and ("Length: " .. config.lifetime)
            or ("Amount: " .. config.rate),
        UDim2.new(0.3,3,0,77),
        UDim2.new(0.7,-13,0,30),
        9
    )

    rowconn(color.Activated:Connect(function()
        config.color = nextValue(
            colorNames,
            config.color
        )

        color.Text = "Color: " .. config.color
        refreshVisuals()
    end))

    rowconn(placeBtn.Activated:Connect(function()
        config.placement = nextValue(
            placements,
            config.placement
        )

        placeBtn.Text = config.placement
        refreshVisuals()
    end))

    rowconn(enabled.Activated:Connect(function()
        config.enabled = not config.enabled

        enabled.Text =
            config.enabled and "♡ ON" or "OFF"

        refreshVisuals()
    end))

    rowconn(extra.Activated:Connect(function()
        if kind == "Trail" then
            config.lifetime = nextValue(
                {0.15,0.25,0.35,0.5,0.75,1},
                config.lifetime
            )

            extra.Text =
                "Length: " .. config.lifetime
        else
            config.rate = nextValue(
                {5,10,20,35,50,75},
                config.rate
            )

            extra.Text =
                "Amount: " .. config.rate
        end

        refreshVisuals()
    end))

    rowconn(remove.Activated:Connect(function()
        removeConfig(
            kind == "Trail"
                and trailConfigs
                or particleConfigs,
            config.id
        )

        refreshVisuals()
        rebuild()
    end))
end

rebuild = function()
    clearRows()

    for _, config in ipairs(trailConfigs) do
        configRow(trailList,config,"Trail")
    end

    for _, config in ipairs(particleConfigs) do
        configRow(particleList,config,"Particle")
    end
end

conn(addTrailBtn.Activated:Connect(function()
    if addTrail() then
        refreshVisuals()
        rebuild()
    end
end))

conn(addParticleBtn.Activated:Connect(function()
    if addParticles() then
        refreshVisuals()
        rebuild()
    end
end))

-- UI RAIN TOGGLE

local rainToggle = button(
    sidebar,
    "♡ UI RAIN: ON",
    UDim2.fromOffset(8,270),
    UDim2.new(1,-16,0,36),
    7
)

conn(rainToggle.Activated:Connect(function()
    rainEnabled = not rainEnabled

    rainToggle.Text = rainEnabled
        and "♡ UI RAIN: ON"
        or "♡ UI RAIN: OFF"

    if not rainEnabled then
        clearRain()
    end
end))

-- SQUISHY OPEN AND CLOSE

local closingToken = 0

local function show(visible)
    closingToken += 1
    local token = closingToken

    if visible then
        panel.Visible = true
        panelScale.Scale = fittedScale() * 0.82

        tween(
            panelScale,
            {Scale = fittedScale()},
            0.42,
            Enum.EasingStyle.Back
        )

        positionBow()
    else
        tween(
            panelScale,
            {Scale = fittedScale() * 0.86},
            0.19,
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.In
        )

        task.delay(0.2, function()
            if alive and closingToken == token then
                panel.Visible = false
                clearRain()
                positionBow()
            end
        end)
    end
end

-- DRAGGABLE LAUNCHER

local launchInput = nil
local launchStart = nil
local launchPosition = nil
local launchMoved = false

conn(launcher.InputBegan:Connect(function(input)
    if input.UserInputType ~= Enum.UserInputType.Touch
        and input.UserInputType ~= Enum.UserInputType.MouseButton1 then
        return
    end

    launchInput = input
    launchStart = input.Position
    launchPosition = launcher.Position
    launchMoved = false

    tween(
        launchScale,
        {Scale = 0.92},
        0.1
    )
end))

conn(UIS.InputChanged:Connect(function(input)
    if not launchInput then
        return
    end

    if input ~= launchInput
        and input.UserInputType ~= Enum.UserInputType.MouseMovement then
        return
    end

    local delta = input.Position - launchStart

    if delta.Magnitude > 9 then
        launchMoved = true
    end

    if not launchMoved then
        return
    end

    local view = WS.CurrentCamera
        and WS.CurrentCamera.ViewportSize
        or Vector2.new(1000,700)

    local x = math.clamp(
        launchPosition.X.Offset
            + launchPosition.X.Scale * view.X
            + delta.X,
        5,
        view.X - 72
    )

    local y = math.clamp(
        launchPosition.Y.Offset
            + launchPosition.Y.Scale * view.Y
            + delta.Y,
        5,
        view.Y - 72
    )

    launcher.Position = UDim2.fromOffset(x,y)
end))

conn(UIS.InputEnded:Connect(function(input)
    if not launchInput then
        return
    end

    if input ~= launchInput
        and input.UserInputType ~= Enum.UserInputType.MouseButton1 then
        return
    end

    launchInput = nil

    tween(
        launchScale,
        {Scale = 1},
        0.32,
        Enum.EasingStyle.Elastic
    )

    if not launchMoved then
        show(not panel.Visible)
    end
end))

conn(close.Activated:Connect(function()
    show(false)
end))

conn(UIS.InputBegan:Connect(function(input, processed)
    if not processed
        and input.KeyCode == Enum.KeyCode.RightShift then
        show(not panel.Visible)
    end
end))

-- SQUISHY PANEL DRAGGING

local dragging = false
local dragInput = nil
local dragStart = nil
local panelStart = nil

conn(header.InputBegan:Connect(function(input)
    if input.UserInputType ~= Enum.UserInputType.Touch
        and input.UserInputType ~= Enum.UserInputType.MouseButton1 then
        return
    end

    dragging = true
    dragInput = input
    dragStart = input.Position
    panelStart = panel.Position
end))

conn(UIS.InputChanged:Connect(function(input)
    if not dragging then
        return
    end

    if input ~= dragInput
        and input.UserInputType ~= Enum.UserInputType.MouseMovement then
        return
    end

    local delta = input.Position - dragStart

    panel.Position = UDim2.new(
        panelStart.X.Scale,
        panelStart.X.Offset + delta.X,
        panelStart.Y.Scale,
        panelStart.Y.Offset + delta.Y
    )

    tween(panel, {
        Rotation = math.clamp(
            delta.X * 0.02,
            -3,
            3
        )
    },0.15)

    positionBow()
end))

conn(UIS.InputEnded:Connect(function(input)
    if not dragging then
        return
    end

    if input ~= dragInput
        and input.UserInputType ~= Enum.UserInputType.MouseButton1 then
        return
    end

    dragging = false

    tween(
        panel,
        {Rotation = 0},
        0.38,
        Enum.EasingStyle.Elastic
    )
end))

-- LIVE UPDATES

local lastGun = nil
local visualTimer = 0
local scanTimer = 0
local rainTimer = 0

conn(RS.Heartbeat:Connect(function(dt)
    if not alive then
        return
    end

    visualTimer += dt
    scanTimer += dt
    rainTimer += dt

    if visualTimer >= 0.12 then
        visualTimer = 0

        local gun = equippedGun()

        if gun ~= lastGun then
            lastGun = gun
            refreshVisuals()
        end
    end

    if scanTimer >= 0.6 then
        scanTimer = 0

        if selected then
            scanGuns()
        end

        for o, c in pairs(effectLocks) do
            if not o.Parent then
                c:Disconnect()
                effectLocks[o] = nil
                effectOriginals[o] = nil
            end
        end
    end

    if rainTimer >= 0.38 then
        rainTimer = 0
        rainDrop()
    end
end))

conn(LP.CharacterAdded:Connect(function()
    lastGun = nil
    clearVisuals()

    task.delay(0.5, function()
        if alive then
            scanGuns()
            refreshVisuals()
        end
    end)
end))

-- INITIALIZATION

addTrail()
addParticles()
rebuild()
selectPage(V)

-- CLEANUP ON REEXECUTION

local function cleanup()
    if not alive then
        return
    end

    alive = false

    clearRain()
    clearVisuals()
    restoreTextures()
    restoreShots()

    for _, c in ipairs(rowConns) do
        pcall(function()
            c:Disconnect()
        end)
    end

    for _, c in ipairs(conns) do
        pcall(function()
            c:Disconnect()
        end)
    end

    gui:Destroy()
    decorations:Destroy()
end

ENV.ZyiksRecolorCleanup = cleanup

print("[ZYIKS RECOLOR V40] Loaded ♡")
print("VoidScopes:", #scopes.VoidScope)
print("GingerScopes:", #scopes.GingerScope)
print("Total:", #scopes.VoidScope + #scopes.GingerScope)
print("TianluScope texture: 135752938667175")
