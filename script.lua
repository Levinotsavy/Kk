
--[[
    ZYIKS RECOLOR V49
    ♡ MOBILE UI FIXED EDITION ♡

    74 VoidScopes + 5 GingerScopes = 79

    Mobile-safe menu
    Centered opening
    Bounded dragging
    Draggable launcher
    Scope search
    Themes
    Custom trails / particles
    Real texture replacement attempts
    Shot beam / trail recoloring
    BlackScope passcode + smoke

    Client-side cosmetics only.
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
    "ZyiksRecolorV48",
    "ZyiksRecolorV49",
    "ZyiksRecolorDecorations",
    "ZYIKS_RECOLOR_V46",
    "ZYIKS_RECOLOR_V47"
}) do
    local old = PG:FindFirstChild(name)
    if old then old:Destroy() end
end

local alive = true
local connections = {}
local rowConnections = {}
local textureOriginals = {}
local shotOriginals = {}
local shotLocks = {}
local watchedTools = setmetatable({}, {__mode = "k"})
local visuals = {}
local smokeVisuals = {}

local function connect(signal, callback, row)
    local c = signal:Connect(callback)
    table.insert(row and rowConnections or connections, c)
    return c
end

local function rgb(r,g,b)
    return Color3.fromRGB(r,g,b)
end

local WHITE = rgb(255,255,255)
local BLACK = rgb(0,0,0)
local PINK = rgb(255,105,180)
local HOT = rgb(233,75,149)
local SOFT = rgb(255,194,224)
local PALE = rgb(255,233,244)
local ROSE = rgb(147,48,100)
local BORDER = rgb(235,135,186)
local MUTED = rgb(187,104,152)

local GINGHAM = "rbxassetid://73119596471835"
local DOTS = "rbxassetid://83771519540099"
local CHRISTMAS = "rbxassetid://130031151722681"
local FONT = Enum.Font.FredokaOne

local function make(class,parent,props)
    local obj = Instance.new(class)

    for k,v in pairs(props or {}) do
        pcall(function()
            obj[k] = v
        end)
    end

    obj.Parent = parent
    return obj
end

local function corner(obj,r)
    make("UICorner",obj,{
        CornerRadius = UDim.new(0,r or 12)
    })
end

local function stroke(obj,color,thickness)
    make("UIStroke",obj,{
        Color = color or BORDER,
        Thickness = thickness or 1
    })
end

local function button(parent,label)
    local b = make("TextButton",parent,{
        BackgroundColor3 = PALE,
        BorderSizePixel = 0,
        Text = label,
        TextColor3 = ROSE,
        Font = FONT,
        TextSize = 13,
        TextWrapped = true,
        AutoButtonColor = true,
        ZIndex = 8
    })

    corner(b,11)
    stroke(b)

    return b
end

local function label(parent,value,size)
    return make("TextLabel",parent,{
        BackgroundTransparency = 1,
        Text = value,
        TextColor3 = ROSE,
        Font = FONT,
        TextSize = size or 14,
        TextWrapped = true,
        ZIndex = 8
    })
end

local function tween(obj,properties,duration)
    if not alive or not obj.Parent then return end

    local t = TS:Create(
        obj,
        TweenInfo.new(
            duration or 0.2,
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.Out
        ),
        properties
    )

    t:Play()
    return t
end

-- =========================================
-- ALL 79 SCOPE PRESETS
-- =========================================

local scopes = {
    VoidScope = {},
    GingerScope = {}
}

local function add(category,name,id,...)
    table.insert(scopes[category],{
        name = name,
        id = tostring(id),
        colors = {...}
    })
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
    WHITE,rgb(188,223,255),rgb(228,228,255))
add(V,"PurpleBlackHoleScope",100593936768139,
    rgb(23,0,36),rgb(158,0,255),BLACK)
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
    WHITE,rgb(123,220,255),rgb(44,124,255))
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
    rgb(217,0,24),WHITE,rgb(157,0,24))
add(V,"AmericaScope",134320447853136,
    rgb(215,25,56),WHITE,rgb(23,78,166))
add(V,"GoldScope",90285221313816,
    rgb(166,91,0),rgb(255,224,122),rgb(255,174,0))
add(V,"GojoScope",118373398983463,
    rgb(52,0,92),rgb(187,63,255),rgb(240,198,255))
add(V,"GoldDiamondScope",137217613360948,
    rgb(217,154,0),WHITE,rgb(255,215,106))
add(V,"CrimsonScope",105062792534372,
    rgb(82,0,11),rgb(220,20,60),rgb(255,82,104))
add(V,"LavaScope",116410139676399,
    rgb(181,0,0),rgb(255,69,0),rgb(255,208,0))
add(V,"MeiMeiScope",128578646191684,
    WHITE,rgb(174,181,192),rgb(32,35,43))
add(V,"LadybugScope",81799898172130,
    rgb(255,32,44),rgb(181,0,22),rgb(18,9,12))
add(V,"AutumnScope",111008837768377,
    rgb(214,90,18),rgb(184,115,51),rgb(230,173,85))
add(V,"PinkDragonScope",115729260393472,
    rgb(255,54,213),rgb(165,44,222),WHITE)
add(V,"WoodScope",137395201108472,
    rgb(74,36,21),rgb(150,81,45),rgb(200,132,78))
add(V,"GlassScope",120196396881002,
    rgb(245,252,255),rgb(201,217,223),WHITE)
add(V,"GraveyardScope",94822780469065,
    rgb(36,17,51),rgb(167,123,217),rgb(241,232,255))
add(V,"PurpleVortexScope",128233143427951,
    rgb(23,6,34),rgb(139,25,255),rgb(193,122,255))
add(V,"WhiteVortexScope",73369779872481,
    rgb(8,8,12),rgb(174,178,191),WHITE)
add(V,"CosmicScope",139394822253711,
    rgb(41,16,94),rgb(136,81,245),rgb(244,238,255))
add(V,"ChainedGalaxyScope",139286523160275,
    rgb(16,18,79),rgb(25,124,255),rgb(163,55,255))
add(V,"AngelScope",124383569086781,
    rgb(34,87,181),rgb(145,207,255),WHITE)
add(V,"HeavenlyScope",136726132031346,
    rgb(255,212,92),WHITE,rgb(120,185,255))
add(V,"MoonlightScope",72779774935963,
    rgb(8,21,45),rgb(71,127,205),rgb(220,234,255))
add(V,"NebulaScope",89552795828568,
    rgb(194,31,255),rgb(18,223,255),rgb(121,51,232))
add(V,"BlackChainsScope",71691975025595,
    rgb(8,8,11),rgb(169,169,181),WHITE)
add(V,"CyberScope",133896069405310,
    rgb(0,85,255),rgb(0,229,255),rgb(160,32,240))
add(V,"RetrofantasyScope",80473799883435,
    rgb(133,91,255),rgb(255,130,210),rgb(255,198,107))
add(V,"DarkPurpleScope",134774749406354,
    rgb(22,0,31),rgb(82,0,128),rgb(160,32,240))
add(V,"BubblegumScope",93260110013377,
    rgb(255,0,140),rgb(255,115,203),WHITE)
add(V,"RainbowCloudScope",74365710518249,
    rgb(255,48,48),rgb(255,223,0),rgb(39,237,100),
    rgb(35,138,255),rgb(162,44,255))
add(V,"GasolineScope",74498204052075,
    rgb(255,49,200),rgb(122,24,255),
    rgb(0,217,255),rgb(255,146,75))
add(V,"FutigerAeroScope",118255991818587,
    rgb(0,107,255),rgb(56,207,255),
    WHITE,rgb(124,230,92))
add(V,"RubyScope",72964570850620,
    rgb(255,16,31),rgb(128,0,16),
    rgb(17,24,39),rgb(192,202,216))
add(V,"LightScope",102549210371348,
    rgb(201,151,72),rgb(248,228,162),
    rgb(255,249,218),rgb(248,228,162),
    rgb(201,151,72))
add(V,"Xchampulsescope",102825288638476,
    rgb(120,0,0),rgb(255,16,31),
    rgb(255,48,48),rgb(255,16,31),
    rgb(120,0,0))
add(V,"TianluScope",135752938667175,
    WHITE,rgb(191,250,255),
    rgb(69,213,232),rgb(191,250,255),WHITE)

add(V,"DonkeyScope",133327993843894,
    rgb(85,60,45),rgb(160,120,90),rgb(80,60,50))
add(V,"HeatScope",125825381971059,
    rgb(150,0,0),rgb(255,120,0),rgb(255,230,0))
add(V,"BananaScope",73001343336219,
    rgb(180,130,0),rgb(255,230,0),rgb(255,255,130))
add(V,"HolographicScope",109379901851195,
    rgb(50,220,255),rgb(255,90,210),rgb(125,255,180))
add(V,"StrawberryScope",75065964035523,
    rgb(180,0,50),rgb(255,75,110),rgb(100,190,70))
add(V,"GlowScope",109191078587806,
    rgb(100,190,255),WHITE,rgb(180,120,255))
add(V,"CandycaneScope",90984440412156,
    rgb(255,0,0),WHITE,rgb(255,0,0))
add(V,"ConstellationScope",97839654053094,
    rgb(10,20,70),rgb(140,170,255),WHITE)
add(V,"Hello Kitty Scope",94384865528578,
    rgb(255,135,190),WHITE,rgb(255,135,190))
add(V,"Cinnamoroll Scope",74237551801907,
    rgb(130,200,255),WHITE,rgb(130,200,255))
add(V,"My Melody Scope",126809009282219,
    rgb(255,100,170),WHITE,rgb(255,160,210))
add(V,"TacticalScope",118575208363243,
    rgb(35,50,35),rgb(100,115,85),rgb(30,35,30))
add(V,"Content Creator Scope",107993800698671,
    rgb(110,0,160),rgb(255,70,185),WHITE)
add(V,"BlackScope (Void)",93946368710281,
    BLACK,BLACK,BLACK)

add(G,"Pink Sci-Fi",117227915790509,
    rgb(255,20,147),rgb(255,105,210),WHITE)
add(G,"Blue Sci-Fi",128592793058217,
    rgb(0,59,255),rgb(0,140,255),rgb(200,245,255))
add(G,"Championscope",107417008695054,
    rgb(21,0,0),rgb(160,0,0),rgb(255,16,16))
add(G,"Beastscope",100126583443070,
    rgb(36,0,71),rgb(101,0,184),rgb(160,32,240))
add(G,"Kittyscope",138130527508034,
    rgb(255,74,168),rgb(255,182,223),WHITE)

-- =========================================
-- GRADIENT SYSTEM
-- =========================================

local selected = nil
local gradientCache = {}

local function gradient(scope)
    if not scope then
        return ColorSequence.new(PINK)
    end

    if gradientCache[scope] then
        return gradientCache[scope]
    end

    local points = {}
    local colors = scope.colors

    for i,c in ipairs(colors) do
        table.insert(points,
            ColorSequenceKeypoint.new(
                (i-1)/(#colors-1),
                c
            )
        )
    end

    gradientCache[scope] = ColorSequence.new(points)
    return gradientCache[scope]
end

-- =========================================
-- TEXTURE ENGINE
-- =========================================

local function isGun(obj)
    local n = obj.Name:lower():gsub("%s+","")

    return n == "gun"
        or n == "gundisplay"
        or n:find("voidscope",1,true)
        or n:find("gingerscope",1,true)
        or n:find("sniper",1,true)
        or n:find("revolver",1,true)
        or n:find("pistol",1,true)
        or n:find("rifle",1,true)
end

local function textureProperty(obj)
    if obj:IsA("MeshPart") then
        return "TextureID"
    elseif obj:IsA("SpecialMesh") then
        return "TextureId"
    elseif obj:IsA("SurfaceAppearance") then
        return "ColorMap"
    elseif obj:IsA("Decal") or obj:IsA("Texture") then
        return "Texture"
    end
end

local function applyTexture(obj)
    if not selected then return end

    local property = textureProperty(obj)
    if not property then return end

    pcall(function()
        local current = obj[property]

        if type(current) ~= "string" then return end

        if not textureOriginals[obj] then
            textureOriginals[obj] = {
                property,
                current
            }
        end

        local wanted = "rbxassetid://"..selected.id

        if current ~= wanted then
            obj[property] = wanted
        end
    end)
end

local function scanContainer(container)
    if not container then return end

    if isGun(container) then
        applyTexture(container)

        for _,obj in ipairs(container:GetDescendants()) do
            applyTexture(obj)
        end

        return
    end

    for _,obj in ipairs(container:GetDescendants()) do
        if isGun(obj) then
            applyTexture(obj)

            for _,child in ipairs(obj:GetDescendants()) do
                applyTexture(child)
            end
        end
    end
end

local function scanGuns()
    local char = LP.Character

    scanContainer(char)
    scanContainer(LP:FindFirstChildOfClass("Backpack"))

    if char then
        local ref = char:FindFirstChild("DisplayRefGun",true)

        if ref and ref:IsA("ObjectValue") then
            scanContainer(ref.Value)
        end
    end

    local cam = WS.CurrentCamera
    if cam then
        for _,child in ipairs(cam:GetChildren()) do
            if isGun(child) then
                scanContainer(child)
            end
        end
    end
end

local function restoreTextures()
    for obj,data in pairs(textureOriginals) do
        pcall(function()
            if obj.Parent then
                obj[data[1]] = data[2]
            end
        end)
    end

    table.clear(textureOriginals)
end

-- =========================================
-- REAL SHOT RECOLORING
-- =========================================

local shotUntil = 0

local function isShotEffect(obj)
    return obj:IsA("Beam")
        or obj:IsA("Trail")
        or obj:IsA("ParticleEmitter")
end

local function recolorShot(obj)
    if not alive or not selected or not obj.Parent then
        return
    end

    if obj.Name:find("ZyiksCustom") then
        return
    end

    if shotOriginals[obj] == nil then
        local ok,value = pcall(function()
            return obj.Color
        end)

        if not ok then return end
        shotOriginals[obj] = value
    end

    local changing = false

    local function enforce()
        if changing or not alive
            or not selected or not obj.Parent then
            return
        end

        changing = true

        pcall(function()
            obj.Color = gradient(selected)
        end)

        changing = false
    end

    enforce()

    if not shotLocks[obj] then
        shotLocks[obj] =
            obj:GetPropertyChangedSignal("Color"):Connect(enforce)
    end
end

local function markShot()
    if selected then
        shotUntil = os.clock()+1.5
    end
end

local function watchTool(tool)
    if not tool:IsA("Tool") or watchedTools[tool] then
        return
    end

    watchedTools[tool] = true

    connect(tool.Activated,markShot)

    connect(tool.DescendantAdded,function(obj)
        if selected and isShotEffect(obj) then
            task.defer(function()
                if alive and obj.Parent then
                    recolorShot(obj)
                end
            end)
        end
    end)
end

local function watchCharacter(char)
    for _,child in ipairs(char:GetChildren()) do
        watchTool(child)
    end

    connect(char.ChildAdded,watchTool)
end

if LP.Character then
    watchCharacter(LP.Character)
end

connect(LP.CharacterAdded,watchCharacter)

connect(UIS.InputBegan,function(input,processed)
    if processed then return end

    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch
        or input.KeyCode == Enum.KeyCode.ButtonR2 then
        markShot()
    end
end)

connect(WS.DescendantAdded,function(obj)
    if not alive or not selected or not isShotEffect(obj) then
        return
    end

    if os.clock() > shotUntil then return end

    task.defer(function()
        if not alive or not obj.Parent then return end

        local char = LP.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        local part = obj:FindFirstAncestorWhichIsA("BasePart")

        if root and part then
            if (root.Position-part.Position).Magnitude > 75 then
                return
            end
        end

        recolorShot(obj)
    end)
end)

local function restoreShots()
    for _,c in pairs(shotLocks) do
        pcall(function() c:Disconnect() end)
    end

    table.clear(shotLocks)

    for obj,value in pairs(shotOriginals) do
        pcall(function()
            if obj.Parent then
                obj.Color = value
            end
        end)
    end

    table.clear(shotOriginals)
end

-- =========================================
-- EQUIPPED GUN
-- =========================================

local function equippedGun()
    local char = LP.Character
    if not char then return nil end

    local tool = char:FindFirstChildOfClass("Tool")

    if tool then
        local handle = tool:FindFirstChild("Handle")

        if handle and handle:IsA("BasePart") then
            return handle
        end

        local part = tool:FindFirstChildWhichIsA("BasePart",true)
        if part then return part end
    end

    local ref = char:FindFirstChild("DisplayRefGun",true)

    if ref and ref:IsA("ObjectValue") and ref.Value then
        if ref.Value:IsA("BasePart") then
            return ref.Value
        end

        return ref.Value:FindFirstChildWhichIsA("BasePart",true)
    end

    local gun = char:FindFirstChild("Gun",true)

    if gun then
        if gun:IsA("BasePart") then return gun end
        return gun:FindFirstChildWhichIsA("BasePart",true)
    end

    return nil
end

-- =========================================
-- BLACKSCOPE SMOKE
-- =========================================

local function clearSmoke()
    for _,obj in ipairs(smokeVisuals) do
        pcall(function() obj:Destroy() end)
    end

    table.clear(smokeVisuals)
end

local function createSmoke()
    clearSmoke()

    if not selected
        or selected.name ~= "BlackScope (Void)" then
        return
    end

    local gun = equippedGun()
    if not gun then return end

    local scopePart = gun
    local tool = gun:FindFirstAncestorOfClass("Tool")

    if tool then
        for _,obj in ipairs(tool:GetDescendants()) do
            if obj:IsA("BasePart")
                and (
                    obj.Name:lower():find("scope",1,true)
                    or obj.Name:lower():find("sight",1,true)
                ) then
                scopePart = obj
                break
            end
        end
    end

    local a = make("Attachment",scopePart,{
        Name = "ZyiksBlackSmokeAttachment"
    })

    table.insert(smokeVisuals,a)

    make("ParticleEmitter",a,{
        Name = "ZyiksBlackSmoke",
        Texture = "rbxasset://textures/particles/smoke_main.dds",
        Color = ColorSequence.new(BLACK),
        Rate = 2,
        Lifetime = NumberRange.new(0.5,0.85),
        Speed = NumberRange.new(0.1,0.35),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0,0.1),
            NumberSequenceKeypoint.new(1,0.3)
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0,0.6),
            NumberSequenceKeypoint.new(1,1)
        }),
        LightEmission = 0,
        Enabled = true
    })
end

-- =========================================
-- CUSTOM GUN EFFECTS
-- =========================================

local COLORS = {
    Pink = rgb(255,55,165),
    Black = BLACK,
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
    "Light Pink","Light Green","Mint","Peach",
    "Silver","Dark Red","Dark Blue",
    "Dark Purple","Neon Pink","Neon Green"
}

local placements = {
    "Barrel","Muzzle","Top","Bottom",
    "Left","Right","Rear","Center"
}

local trailConfigs = {}
local particleConfigs = {}
local effectId = 0

local function newConfig(kind)
    effectId += 1

    return {
        id = effectId,
        kind = kind,
        color = kind == "Trail" and "Pink" or "Light Pink",
        placement = kind == "Trail" and "Barrel" or "Muzzle",
        enabled = true,
        lifetime = 0.35,
        rate = 20
    }
end

local function clearVisuals()
    for _,obj in ipairs(visuals) do
        pcall(function() obj:Destroy() end)
    end

    table.clear(visuals)
end

local function track(obj)
    table.insert(visuals,obj)
    return obj
end

local function placementPosition(part,placement)
    local s = part.Size

    if placement == "Barrel" then
        return Vector3.new(0,0,-s.Z*0.45)
    elseif placement == "Muzzle" then
        return Vector3.new(0,0,-s.Z*0.55)
    elseif placement == "Top" then
        return Vector3.new(0,s.Y*0.5,0)
    elseif placement == "Bottom" then
        return Vector3.new(0,-s.Y*0.5,0)
    elseif placement == "Left" then
        return Vector3.new(-s.X*0.5,0,0)
    elseif placement == "Right" then
        return Vector3.new(s.X*0.5,0,0)
    elseif placement == "Rear" then
        return Vector3.new(0,0,s.Z*0.45)
    end

    return Vector3.zero
end

local function refreshVisuals()
    clearVisuals()

    local gun = equippedGun()
    if not gun then return end

    for _,config in ipairs(trailConfigs) do
        if config.enabled then
            local pos = placementPosition(gun,config.placement)

            local a = track(make("Attachment",gun,{
                Position = pos+Vector3.new(0,0.11,0)
            }))

            local b = track(make("Attachment",gun,{
                Position = pos-Vector3.new(0,0.11,0)
            }))

            track(make("Trail",gun,{
                Name = "ZyiksCustomTrail",
                Attachment0 = a,
                Attachment1 = b,
                Color = ColorSequence.new(
                    COLORS[config.color] or PINK
                ),
                Lifetime = config.lifetime,
                LightEmission = 0.8,
                FaceCamera = true,
                Enabled = true
            }))
        end
    end

    for _,config in ipairs(particleConfigs) do
        if config.enabled then
            local a = track(make("Attachment",gun,{
                Position = placementPosition(
                    gun,config.placement
                )
            }))

            track(make("ParticleEmitter",a,{
                Name = "ZyiksCustomParticles",
                Color = ColorSequence.new(
                    COLORS[config.color] or PINK
                ),
                Rate = config.rate,
                Lifetime = NumberRange.new(0.3,0.65),
                Speed = NumberRange.new(0.5,2),
                Size = NumberSequence.new(0.16),
                Enabled = true
            }))
        end
    end
end

local function activateScope(scope)
    restoreTextures()
    restoreShots()
    clearSmoke()

    selected = scope
    scanGuns()

    local gun = equippedGun()

    if gun then
        local tool = gun:FindFirstAncestorOfClass("Tool")

        if tool then
            for _,obj in ipairs(tool:GetDescendants()) do
                if isShotEffect(obj)
                    and not obj.Name:find("ZyiksCustom") then
                    recolorShot(obj)
                end
            end
        end
    end

    if scope.name == "BlackScope (Void)" then
        createSmoke()
    end
end

-- =========================================
-- MOBILE-SAFE UI
-- =========================================

local gui = make("ScreenGui",PG,{
    Name = "ZyiksRecolorV49",
    ResetOnSpawn = false,
    IgnoreGuiInset = false,
    DisplayOrder = 300,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling
})

local launcher = make("ImageButton",gui,{
    Size = UDim2.fromOffset(62,62),
    Position = UDim2.fromOffset(14,180),
    BackgroundColor3 = PALE,
    Image = CHRISTMAS,
    ScaleType = Enum.ScaleType.Fit,
    AutoButtonColor = false,
    ZIndex = 50
})

corner(launcher,18)
stroke(launcher,HOT,2)

local panel = make("Frame",gui,{
    AnchorPoint = Vector2.new(0.5,0.5),
    Position = UDim2.fromScale(0.5,0.5),
    Size = UDim2.fromOffset(590,410),
    BackgroundColor3 = PALE,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    Visible = false,
    ZIndex = 1
})

corner(panel,19)
stroke(panel,HOT,2)

local panelScale = make("UIScale",panel,{
    Scale = 1
})

local function viewport()
    local cam = WS.CurrentCamera

    return cam and cam.ViewportSize
        or Vector2.new(800,600)
end

local function fittedScale()
    local v = viewport()

    return math.min(
        1,
        math.max(
            0.25,
            math.min(
                (v.X-24)/590,
                (v.Y-75)/410
            )
        )
    )
end

local function clampPanel()
    local v = viewport()
    local scale = panelScale.Scale

    local halfW = 590*scale*0.5
    local halfH = 410*scale*0.5

    local p = panel.AbsolutePosition
    local s = panel.AbsoluteSize

    local centerX = p.X+s.X*0.5
    local centerY = p.Y+s.Y*0.5

    centerX = math.clamp(
        centerX,
        halfW+5,
        math.max(halfW+5,v.X-halfW-5)
    )

    centerY = math.clamp(
        centerY,
        halfH+5,
        math.max(halfH+5,v.Y-halfH-5)
    )

    panel.Position = UDim2.fromOffset(centerX,centerY)
end

local function centerPanel()
    panelScale.Scale = fittedScale()
    panel.Position = UDim2.fromScale(0.5,0.5)
end

local background = make("ImageLabel",panel,{
    Size = UDim2.fromScale(1,1),
    BackgroundTransparency = 1,
    Image = GINGHAM,
    ImageTransparency = 0.22,
    ScaleType = Enum.ScaleType.Stretch,
    ZIndex = 1
})

local sidebar = make("Frame",panel,{
    Size = UDim2.fromOffset(158,410),
    BackgroundColor3 = PALE,
    BackgroundTransparency = 0.12,
    BorderSizePixel = 0,
    ZIndex = 2
})

corner(sidebar,16)

local sideTitle = label(sidebar,"୨୧ ZYIKS ୨୧",20)
sideTitle.Position = UDim2.fromOffset(9,12)
sideTitle.Size = UDim2.fromOffset(145,30)
sideTitle.ZIndex = 3

local version = label(sidebar,"♡ RECOLOR V49 ♡",12)
version.Position = UDim2.fromOffset(9,43)
version.Size = UDim2.fromOffset(145,22)
version.TextColor3 = HOT
version.ZIndex = 3

local content = make("Frame",panel,{
    Position = UDim2.fromOffset(158,0),
    Size = UDim2.new(1,-158,1,0),
    BackgroundTransparency = 1,
    ZIndex = 2
})

local header = make("Frame",content,{
    Size = UDim2.new(1,0,0,65),
    BackgroundTransparency = 1,
    Active = true,
    ZIndex = 4
})

local title = label(header,"♡ VoidScope ♡",21)
title.Position = UDim2.fromOffset(15,12)
title.Size = UDim2.new(1,-75,0,38)
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 5

local close = button(header,"×")
close.Position = UDim2.new(1,-43,0,15)
close.Size = UDim2.fromOffset(32,32)
close.TextSize = 23
close.ZIndex = 10

local pages = {}
local navButtons = {}

local function selectPage(name)
    for pageName,page in pairs(pages) do
        page.Visible = pageName == name

        navButtons[pageName].BackgroundColor3 =
            pageName == name and SOFT or PALE
    end

    title.Text = "♡ "..name.." ♡"
end

for i,name in ipairs({
    "VoidScope",
    "GingerScope",
    "Effects",
    "Themes"
}) do
    local nav = button(sidebar,"♡ "..name)

    nav.Position = UDim2.fromOffset(
        8,91+(i-1)*49
    )
    nav.Size = UDim2.new(1,-16,0,42)
    nav.ZIndex = 5

    navButtons[name] = nav

    local page = make("Frame",content,{
        Position = UDim2.fromOffset(12,66),
        Size = UDim2.new(1,-24,1,-80),
        BackgroundTransparency = 1,
        Visible = false,
        ClipsDescendants = true,
        ZIndex = 3
    })

    pages[name] = page

    local dots = make("ImageLabel",page,{
        Size = UDim2.fromScale(1,1),
        BackgroundColor3 = PALE,
        BackgroundTransparency = 0.3,
        Image = DOTS,
        ImageTransparency = 0.15,
        ScaleType = Enum.ScaleType.Stretch,
        Active = false,
        ZIndex = 3
    })

    corner(dots,13)

    connect(nav.Activated,function()
        selectPage(name)
    end)
end

local function scrolling(parent,pos,size)
    local scroll = make("ScrollingFrame",parent,{
        Position = pos,
        Size = size,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 4,
        ScrollBarImageColor3 = PINK,
        CanvasSize = UDim2.fromOffset(0,0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ZIndex = 6
    })

    make("UIListLayout",scroll,{
        Padding = UDim.new(0,7),
        SortOrder = Enum.SortOrder.LayoutOrder
    })

    return scroll
end

-- =========================================
-- BLACKSCOPE PASSCODE
-- =========================================

local lock = make("Frame",gui,{
    Size = UDim2.fromScale(1,1),
    BackgroundColor3 = BLACK,
    BorderSizePixel = 0,
    Visible = false,
    ZIndex = 100
})

local lockTitle = label(
    lock,
    "BLACKSCOPE // VOID ACCESS",
    24
)

lockTitle.AnchorPoint = Vector2.new(0.5,0.5)
lockTitle.Position = UDim2.fromScale(0.5,0.34)
lockTitle.Size = UDim2.new(0.9,0,0,55)
lockTitle.TextColor3 = WHITE
lockTitle.ZIndex = 101

local passcode = make("TextBox",lock,{
    AnchorPoint = Vector2.new(0.5,0.5),
    Position = UDim2.fromScale(0.5,0.51),
    Size = UDim2.new(0.7,0,0,48),
    BackgroundColor3 = rgb(25,25,25),
    TextColor3 = WHITE,
    PlaceholderText = "ENTER PASSCODE",
    PlaceholderColor3 = rgb(130,130,130),
    Text = "",
    Font = FONT,
    TextSize = 19,
    ClearTextOnFocus = false,
    ZIndex = 102
})

corner(passcode,10)

make("UISizeConstraint",passcode,{
    MaxSize = Vector2.new(300,48)
})

local unlock = button(lock,"UNLOCK")
unlock.AnchorPoint = Vector2.new(0.5,0.5)
unlock.Position = UDim2.fromScale(0.5,0.62)
unlock.Size = UDim2.new(0.7,0,0,44)
unlock.BackgroundColor3 = rgb(50,50,50)
unlock.TextColor3 = WHITE
unlock.ZIndex = 102

make("UISizeConstraint",unlock,{
    MaxSize = Vector2.new(300,44)
})

local cancel = button(lock,"CANCEL")
cancel.AnchorPoint = Vector2.new(0.5,0.5)
cancel.Position = UDim2.fromScale(0.5,0.72)
cancel.Size = UDim2.new(0.7,0,0,40)
cancel.BackgroundColor3 = rgb(35,35,35)
cancel.TextColor3 = WHITE
cancel.ZIndex = 102

make("UISizeConstraint",cancel,{
    MaxSize = Vector2.new(300,40)
})

local lockStatus = label(lock,"",15)
lockStatus.AnchorPoint = Vector2.new(0.5,0.5)
lockStatus.Position = UDim2.fromScale(0.5,0.82)
lockStatus.Size = UDim2.new(0.9,0,0,35)
lockStatus.TextColor3 = rgb(255,75,75)
lockStatus.ZIndex = 102

local pendingBlack = nil

local function openLock(scope)
    pendingBlack = scope
    passcode.Text = ""
    lockStatus.Text = ""
    lock.Visible = true
end

local function checkPasscode()
    if passcode.Text == "Black" then
        lock.Visible = false

        if pendingBlack then
            activateScope(pendingBlack)
        end

        pendingBlack = nil
    else
        lockStatus.Text = "INCORRECT PASSCODE"
        passcode.Text = ""
    end
end

connect(unlock.Activated,checkPasscode)

connect(passcode.FocusLost,function(enter)
    if enter then checkPasscode() end
end)

connect(cancel.Activated,function()
    lock.Visible = false
    pendingBlack = nil
    passcode.Text = ""
end)

-- =========================================
-- SCOPE LISTS
-- =========================================

local scopeButtons = {}

for _,category in ipairs({V,G}) do
    local page = pages[category]

    local search = make("TextBox",page,{
        Position = UDim2.fromOffset(9,9),
        Size = UDim2.new(1,-18,0,36),
        BackgroundColor3 = WHITE,
        BorderSizePixel = 0,
        PlaceholderText = "♡ Search "..category.."...",
        PlaceholderColor3 = MUTED,
        Text = "",
        TextColor3 = ROSE,
        Font = FONT,
        TextSize = 13,
        ClearTextOnFocus = false,
        ZIndex = 7
    })

    corner(search,12)
    stroke(search)

    local list = scrolling(
        page,
        UDim2.fromOffset(9,54),
        UDim2.new(1,-18,1,-63)
    )

    for i,scope in ipairs(scopes[category]) do
        local b = button(list,"♡ "..scope.name)

        b.Size = UDim2.new(1,-6,0,43)
        b.LayoutOrder = i
        b.BackgroundColor3 = WHITE
        b.TextXAlignment = Enum.TextXAlignment.Left
        b.ZIndex = 7

        local swatch = make("Frame",b,{
            Size = UDim2.fromOffset(45,17),
            Position = UDim2.new(1,-53,0.5,-8),
            BackgroundColor3 = WHITE,
            BorderSizePixel = 0,
            ZIndex = 8
        })

        corner(swatch,7)

        make("UIGradient",swatch,{
            Color = gradient(scope)
        })

        scopeButtons[scope] = b

        connect(b.Activated,function()
            if scope.name == "BlackScope (Void)" then
                openLock(scope)
            else
                activateScope(scope)

                for item,entry in pairs(scopeButtons) do
                    entry.BackgroundColor3 =
                        item == scope and SOFT or WHITE
                end
            end
        end)
    end

    connect(search:GetPropertyChangedSignal("Text"),function()
        local query = search.Text:lower()

        for _,scope in ipairs(scopes[category]) do
            scopeButtons[scope].Visible =
                query == ""
                or scope.name:lower():find(
                    query,1,true
                ) ~= nil
        end
    end)
end

-- =========================================
-- EFFECTS PAGE
-- =========================================

local effectsPage = pages.Effects

local trailTab = button(effectsPage,"♡ TRAILS ♡")
trailTab.Position = UDim2.fromOffset(9,9)
trailTab.Size = UDim2.new(0.49,-9,0,37)

local particleTab = button(effectsPage,"♡ PARTICLES ♡")
particleTab.Position = UDim2.new(0.51,0,0,9)
particleTab.Size = UDim2.new(0.49,-9,0,37)

local trailPage = make("Frame",effectsPage,{
    Position = UDim2.fromOffset(9,54),
    Size = UDim2.new(1,-18,1,-63),
    BackgroundTransparency = 1,
    ZIndex = 6
})

local particlePage = make("Frame",effectsPage,{
    Position = UDim2.fromOffset(9,54),
    Size = UDim2.new(1,-18,1,-63),
    BackgroundTransparency = 1,
    Visible = false,
    ZIndex = 6
})

connect(trailTab.Activated,function()
    trailPage.Visible = true
    particlePage.Visible = false
end)

connect(particleTab.Activated,function()
    trailPage.Visible = false
    particlePage.Visible = true
end)

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

local addTrailButton = button(
    trailPage,"♡ ADD GUN TRAIL ♡"
)

addTrailButton.Position = UDim2.new(0,0,1,-40)
addTrailButton.Size = UDim2.new(1,0,0,38)

local addParticleButton = button(
    particlePage,"♡ ADD PARTICLES ♡"
)

addParticleButton.Position = UDim2.new(0,0,1,-40)
addParticleButton.Size = UDim2.new(1,0,0,38)

local function nextValue(list,current)
    local i = table.find(list,current) or 0
    return list[(i % #list)+1]
end

local rebuildEffects

local function clearRows()
    for _,c in ipairs(rowConnections) do
        pcall(function() c:Disconnect() end)
    end

    table.clear(rowConnections)

    for _,list in ipairs({trailList,particleList}) do
        for _,child in ipairs(list:GetChildren()) do
            if child:IsA("Frame") then
                child:Destroy()
            end
        end
    end
end

local function effectRow(list,config)
    local frame = make("Frame",list,{
        Size = UDim2.new(1,-6,0,119),
        BackgroundColor3 = WHITE,
        BorderSizePixel = 0,
        ZIndex = 7
    })

    corner(frame,12)
    stroke(frame)

    local heading = label(
        frame,
        config.kind.." #"..config.id,
        14
    )

    heading.Position = UDim2.fromOffset(10,7)
    heading.Size = UDim2.new(1,-90,0,24)

    local remove = button(frame,"REMOVE")
    remove.Position = UDim2.new(1,-75,0,7)
    remove.Size = UDim2.fromOffset(65,24)

    local color = button(
        frame,"Color: "..config.color
    )

    color.Position = UDim2.fromOffset(10,39)
    color.Size = UDim2.new(0.53,-13,0,30)

    local place = button(frame,config.placement)
    place.Position = UDim2.new(0.53,3,0,39)
    place.Size = UDim2.new(0.47,-13,0,30)

    local toggle = button(
        frame,config.enabled and "ON" or "OFF"
    )

    toggle.Position = UDim2.fromOffset(10,77)
    toggle.Size = UDim2.new(0.3,-13,0,30)

    local extra = button(
        frame,
        config.kind == "Trail"
            and "Length: "..config.lifetime
            or "Amount: "..config.rate
    )

    extra.Position = UDim2.new(0.3,3,0,77)
    extra.Size = UDim2.new(0.7,-13,0,30)

    connect(color.Activated,function()
        config.color = nextValue(
            colorNames,config.color
        )

        color.Text = "Color: "..config.color
        refreshVisuals()
    end,true)

    connect(place.Activated,function()
        config.placement = nextValue(
            placements,config.placement
        )

        place.Text = config.placement
        refreshVisuals()
    end,true)

    connect(toggle.Activated,function()
        config.enabled = not config.enabled
        toggle.Text = config.enabled and "ON" or "OFF"
        refreshVisuals()
    end,true)

    connect(extra.Activated,function()
        if config.kind == "Trail" then
            config.lifetime = nextValue(
                {0.15,0.25,0.35,0.5,0.75,1},
                config.lifetime
            )

            extra.Text = "Length: "..config.lifetime
        else
            config.rate = nextValue(
                {5,10,20,35,50,75},
                config.rate
            )

            extra.Text = "Amount: "..config.rate
        end

        refreshVisuals()
    end,true)

    connect(remove.Activated,function()
        local listData =
            config.kind == "Trail"
            and trailConfigs or particleConfigs

        for i,item in ipairs(listData) do
            if item == config then
                table.remove(listData,i)
                break
            end
        end

        refreshVisuals()
        rebuildEffects()
    end,true)
end

rebuildEffects = function()
    clearRows()

    for _,config in ipairs(trailConfigs) do
        effectRow(trailList,config)
    end

    for _,config in ipairs(particleConfigs) do
        effectRow(particleList,config)
    end
end

connect(addTrailButton.Activated,function()
    if #trailConfigs >= 12 then return end

    table.insert(trailConfigs,newConfig("Trail"))
    rebuildEffects()
    refreshVisuals()
end)

connect(addParticleButton.Activated,function()
    if #particleConfigs >= 8 then return end

    table.insert(particleConfigs,newConfig("Particle"))
    rebuildEffects()
    refreshVisuals()
end)

-- =========================================
-- THEMES
-- =========================================

local themes = {
    Pink = {rgb(255,105,180),rgb(255,233,244)},
    ["Baby Pink"] = {rgb(255,175,211),rgb(255,237,245)},
    ["Hot Pink"] = {rgb(255,30,135),rgb(255,180,220)},
    Purple = {rgb(145,75,220),rgb(225,195,255)},
    Blue = {rgb(65,135,245),rgb(195,222,255)},
    Red = {rgb(210,40,65),rgb(255,195,205)}
}

local themeList = scrolling(
    pages.Themes,
    UDim2.fromOffset(9,9),
    UDim2.new(1,-18,1,-18)
)

for _,name in ipairs({
    "Pink","Baby Pink","Hot Pink",
    "Purple","Blue","Red"
}) do
    local b = button(themeList,name)
    b.Size = UDim2.new(1,-6,0,43)

    connect(b.Activated,function()
        local colors = themes[name]

        panel.BackgroundColor3 = colors[2]
        sidebar.BackgroundColor3 = colors[2]

        for _,nav in pairs(navButtons) do
            nav.BackgroundColor3 = colors[1]
        end
    end)
end

-- =========================================
-- FIXED OPEN / CLOSE
-- =========================================

local function show(visible)
    if visible then
        centerPanel()
        panel.Visible = true

        local targetScale = fittedScale()
        panelScale.Scale = targetScale*0.9

        tween(panelScale,{
            Scale = targetScale
        },0.25)
    else
        panel.Visible = false
    end
end

connect(close.Activated,function()
    show(false)
end)

connect(UIS.InputBegan,function(input,processed)
    if not processed
        and input.KeyCode == Enum.KeyCode.RightShift then
        show(not panel.Visible)
    end
end)

-- =========================================
-- FIXED DRAGGING
-- =========================================

local function dragControl(target,handle,isLauncher)
    local active = false
    local dragInput = nil
    local startInput = nil
    local startPosition = nil
    local moved = false

    connect(handle.InputBegan,function(input)
        if input.UserInputType ~= Enum.UserInputType.Touch
            and input.UserInputType ~=
                Enum.UserInputType.MouseButton1 then
            return
        end

        active = true
        dragInput = input
        startInput = input.Position
        startPosition = target.Position
        moved = false
    end)

    connect(UIS.InputChanged,function(input)
        if not active then return end

        if input ~= dragInput
            and input.UserInputType ~=
                Enum.UserInputType.MouseMovement then
            return
        end

        local delta = input.Position-startInput

        if delta.Magnitude > 8 then
            moved = true
        end

        if not moved then return end

        local v = viewport()

        if isLauncher then
            local x = startPosition.X.Offset+delta.X
            local y = startPosition.Y.Offset+delta.Y

            target.Position = UDim2.fromOffset(
                math.clamp(x,5,v.X-65),
                math.clamp(y,5,v.Y-65)
            )
        else
            local scale = panelScale.Scale
            local halfW = 590*scale*0.5
            local halfH = 410*scale*0.5

            local centerX = v.X*startPosition.X.Scale
                +startPosition.X.Offset+delta.X

            local centerY = v.Y*startPosition.Y.Scale
                +startPosition.Y.Offset+delta.Y

            centerX = math.clamp(
                centerX,
                halfW+5,
                math.max(halfW+5,v.X-halfW-5)
            )

            centerY = math.clamp(
                centerY,
                halfH+5,
                math.max(halfH+5,v.Y-halfH-5)
            )

            target.Position = UDim2.fromOffset(
                centerX,centerY
            )
        end
    end)

    connect(UIS.InputEnded,function(input)
        if not active then return end

        if input ~= dragInput
            and input.UserInputType ~=
                Enum.UserInputType.MouseButton1 then
            return
        end

        active = false
        dragInput = nil

        if isLauncher and not moved then
            show(not panel.Visible)
        end
    end)
end

dragControl(panel,header,false)
dragControl(launcher,launcher,true)

-- =========================================
-- SCREEN RESIZE SAFETY
-- =========================================

local lastViewport = viewport()

connect(RS.Heartbeat,function()
    if not alive then return end

    local current = viewport()

    if current ~= lastViewport then
        lastViewport = current

        if panel.Visible then
            centerPanel()
        end

        launcher.Position = UDim2.fromOffset(
            math.clamp(
                launcher.Position.X.Offset,
                5,current.X-65
            ),
            math.clamp(
                launcher.Position.Y.Offset,
                5,current.Y-65
            )
        )
    end
end)

-- =========================================
-- LIVE GUN UPDATES
-- =========================================

local scanTimer = 0
local visualTimer = 0
local lastGun = nil

connect(RS.Heartbeat,function(dt)
    if not alive then return end

    scanTimer += dt
    visualTimer += dt

    if visualTimer >= 0.2 then
        visualTimer = 0

        local gun = equippedGun()

        if gun ~= lastGun then
            lastGun = gun
            refreshVisuals()

            if selected
                and selected.name == "BlackScope (Void)" then
                createSmoke()
            end
        end
    end

    if scanTimer >= 0.5 then
        scanTimer = 0

        if selected then
            scanGuns()
        end

        for obj,c in pairs(shotLocks) do
            if not obj.Parent then
                c:Disconnect()
                shotLocks[obj] = nil
                shotOriginals[obj] = nil
            end
        end
    end
end)

connect(LP.CharacterAdded,function(char)
    lastGun = nil
    clearVisuals()
    clearSmoke()

    task.delay(0.5,function()
        if alive then
            scanGuns()
            refreshVisuals()

            if selected
                and selected.name == "BlackScope (Void)" then
                createSmoke()
            end
        end
    end)
end)

-- =========================================
-- CLEANUP
-- =========================================

local function cleanup()
    if not alive then return end
    alive = false

    clearVisuals()
    clearSmoke()
    restoreTextures()
    restoreShots()

    for _,c in ipairs(rowConnections) do
        pcall(function() c:Disconnect() end)
    end

    for _,c in ipairs(connections) do
        pcall(function() c:Disconnect() end)
    end

    gui:Destroy()
end

ENV.ZyiksRecolorCleanup = cleanup

-- =========================================
-- START
-- =========================================

table.insert(trailConfigs,newConfig("Trail"))
table.insert(particleConfigs,newConfig("Particle"))

rebuildEffects()
selectPage("VoidScope")
centerPanel()

print("[ZYIKS RECOLOR V49] Loaded ♡")
print("VoidScopes:",#scopes.VoidScope)
print("GingerScopes:",#scopes.GingerScope)
print("Total:",#scopes.VoidScope+#scopes.GingerScope)
print("Mobile-safe UI enabled")
