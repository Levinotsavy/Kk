
--[[
  ZYIKS RECOLOR V36
  BLUE EDITION
  VoidScope | GingerScope | Effects

  Multiple gun trails
  Individual trail colors
  Gun placement controls
  Gun-only particles
  Equipped-only effects
  V12/V34 shooting-beam recolor logic
  Mobile + PC
]]

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local WS = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

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

local old = PG:FindFirstChild("ZyiksRecolor")
if old then old:Destroy() end

local alive = true
local connections = {}
local effectLocks = {}
local effectOriginals = {}
local textureOriginals = {}
local alphaOriginals = {}
local watchedTools = {}

local function track(c)
    table.insert(connections,c)
    return c
end

local function RGB(r,g,b)
    return Color3.fromRGB(r,g,b)
end

local COLORS = {
    Blue=RGB(40,145,255),
    Pink=RGB(255,55,165),
    Black=RGB(10,10,15),
    Red=RGB(255,35,45),
    Green=RGB(35,255,90),
    Yellow=RGB(255,230,25),
    Purple=RGB(170,65,255),
    Cyan=RGB(35,235,255),
    Orange=RGB(255,135,25),
    White=RGB(255,255,255),
    Gold=RGB(255,195,55),
    Magenta=RGB(255,35,225),
    Lavender=RGB(210,175,255),
    ["Baby Blue"]=RGB(160,215,255),
    ["Light Pink"]=RGB(255,185,225),
    ["Light Green"]=RGB(175,255,195),
    ["Light Yellow"]=RGB(255,245,165),
    Mint=RGB(165,255,225),
    Peach=RGB(255,205,175),
    Silver=RGB(205,220,235),
    ["Dark Red"]=RGB(110,0,15),
    ["Dark Blue"]=RGB(5,35,120),
    ["Dark Purple"]=RGB(65,0,105),
    ["Neon Pink"]=RGB(255,0,175),
    ["Neon Green"]=RGB(0,255,65)
}

local colorNames = {
    "Blue","Pink","Black","Red","Green",
    "Yellow","Purple","Cyan","Orange",
    "White","Gold","Magenta","Lavender",
    "Baby Blue","Light Pink","Light Green",
    "Light Yellow","Mint","Peach","Silver",
    "Dark Red","Dark Blue","Dark Purple",
    "Neon Pink","Neon Green"
}

local BG = RGB(10,15,27)
local SIDE = RGB(14,22,39)
local CARD = RGB(22,33,53)
local ACTIVE = RGB(28,78,135)
local BLUE = COLORS.Blue
local WHITE = RGB(235,245,255)
local MUTED = RGB(145,166,195)

local function make(class,parent,props)
    local o = Instance.new(class)
    for k,v in pairs(props or {}) do
        pcall(function() o[k]=v end)
    end
    o.Parent=parent
    return o
end

local function round(o,r)
    make("UICorner",o,{
        CornerRadius=UDim.new(0,r or 9)
    })
end

local function stroke(o,c)
    make("UIStroke",o,{
        Color=c or BLUE,
        Thickness=1
    })
end

local function animate(o,p,t)
    if not alive then return end
    TweenService:Create(
        o,
        TweenInfo.new(t or .18,
            Enum.EasingStyle.Quart,
            Enum.EasingDirection.Out),
        p
    ):Play()
end

-- SCOPE DATABASE

local scopes = {
    VoidScope={},
    GingerScope={}
}

local function add(cat,name,id,...)
    table.insert(scopes[cat],{
        name=name,
        id=tostring(id),
        colors={...}
    })
end

local V="VoidScope"
local G="GingerScope"

add(V,"Chrome Chains Scope",89011297789911,RGB(170,183,202),RGB(244,247,255),RGB(83,103,127))
add(V,"ChromeScope",92721203897057,RGB(255,59,117),RGB(255,179,71),RGB(255,247,138),RGB(87,247,176),RGB(91,203,255),RGB(166,107,255))
add(V,"Cherry Blossom Scope",71388376520884,RGB(255,134,183),RGB(255,225,237),RGB(201,138,255))
add(V,"HackerScope",113547863710933,RGB(0,255,101),RGB(0,47,24),RGB(180,255,0))
add(V,"RedScope",89421027141827,RGB(255,0,0),RGB(255,128,80),RGB(129,0,0))
add(V,"YellowScope",118507091753068,RGB(255,245,0),RGB(255,153,0),RGB(255,251,176))
add(V,"CoolScope",106349999686565,RGB(0,223,255),RGB(0,109,255),RGB(197,255,255))
add(V,"PurpleScope",91431058867138,RGB(224,174,255),RGB(166,93,224),RGB(73,31,110))
add(V,"WhiteScope",138494542305273,RGB(255,255,255),RGB(188,223,255),RGB(228,228,255))
add(V,"PurpleBlackHoleScope",100593936768139,RGB(23,0,36),RGB(158,0,255),RGB(0,0,0))
add(V,"OrangeScope",138675106444675,RGB(255,106,0),RGB(255,208,0),RGB(255,49,0))
add(V,"RoseScope",98671498958418,RGB(255,112,176),RGB(255,224,237),RGB(200,90,152))
add(V,"RealVoidScope",138251909648943,RGB(126,54,255),RGB(226,170,255),RGB(49,16,111))
add(V,"Blood Moon Scope",77829814616900,RGB(255,22,22),RGB(69,0,0),RGB(255,107,61))
add(V,"Cotton Candy Galaxy Scope",89525299941655,RGB(255,138,212),RGB(156,117,255),RGB(116,230,255))
add(V,"Abyssal Lightning Scope",87564917363234,RGB(0,234,255),RGB(113,45,255),RGB(4,21,78))
add(V,"Frozen Crystal Scope",83555779459860,RGB(255,255,255),RGB(123,220,255),RGB(44,124,255))
add(V,"Toxic Slime Scope",135405854735405,RGB(197,255,0),RGB(0,230,83),RGB(30,104,0))
add(V,"Rose Gold Scope",96017056259067,RGB(255,187,172),RGB(255,224,161),RGB(215,124,156))
add(V,"GreenScope",107785539336433,RGB(0,255,90),RGB(190,255,0),RGB(0,100,55))
add(V,"CherryScope",116967488721010,RGB(255,183,210),RGB(255,225,238),RGB(255,115,175))
add(V,"HotPinkScope",109569323795920,RGB(255,20,147),RGB(255,105,180),RGB(199,21,133))
add(V,"BlueScope",137458554478558,RGB(0,100,255),RGB(0,190,255),RGB(10,25,125))
add(V,"CyanScope",118198204691185,RGB(0,255,255),RGB(120,255,245),RGB(0,120,150))
add(V,"SpiderScope",106127693338329,RGB(101,0,0),RGB(240,25,41),RGB(18,10,18))
add(V,"HalloweenScope",78855076452029,RGB(255,121,0),RGB(140,32,232),RGB(255,177,43))
add(V,"ChristmasScope",70567062837178,RGB(217,0,24),RGB(255,255,255),RGB(157,0,24))
add(V,"AmericaScope",134320447853136,RGB(215,25,56),RGB(255,255,255),RGB(23,78,166))
add(V,"GoldScope",90285221313816,RGB(166,91,0),RGB(255,224,122),RGB(255,174,0))
add(V,"GojoScope",118373398983463,RGB(52,0,92),RGB(187,63,255),RGB(240,198,255))
add(V,"GoldDiamondScope",137217613360948,RGB(217,154,0),RGB(255,255,255),RGB(255,215,106))
add(V,"CrimsonScope",105062792534372,RGB(82,0,11),RGB(220,20,60),RGB(255,82,104))
add(V,"LavaScope",116410139676399,RGB(181,0,0),RGB(255,69,0),RGB(255,208,0))
add(V,"MeiMeiScope",128578646191684,RGB(255,255,255),RGB(174,181,192),RGB(32,35,43))
add(V,"LadybugScope",81799898172130,RGB(255,32,44),RGB(181,0,22),RGB(18,9,12))
add(V,"AutumnScope",111008837768377,RGB(214,90,18),RGB(184,115,51),RGB(230,173,85))
add(V,"PinkDragonScope",115729260393472,RGB(255,54,213),RGB(165,44,222),RGB(255,255,255))
add(V,"WoodScope",137395201108472,RGB(74,36,21),RGB(150,81,45),RGB(200,132,78))
add(V,"GlassScope",120196396881002,RGB(245,252,255),RGB(201,217,223),RGB(255,255,255))
add(V,"GraveyardScope",94822780469065,RGB(36,17,51),RGB(167,123,217),RGB(241,232,255))
add(V,"PurpleVortexScope",128233143427951,RGB(23,6,34),RGB(139,25,255),RGB(193,122,255))
add(V,"WhiteVortexScope",73369779872481,RGB(8,8,12),RGB(174,178,191),RGB(255,255,255))
add(V,"CosmicScope",139394822253711,RGB(41,16,94),RGB(136,81,245),RGB(244,238,255))
add(V,"ChainedGalaxyScope",139286523160275,RGB(16,18,79),RGB(25,124,255),RGB(163,55,255))
add(V,"AngelScope",124383569086781,RGB(34,87,181),RGB(145,207,255),RGB(255,255,255))
add(V,"HeavenlyScope",136726132031346,RGB(255,212,92),RGB(255,255,255),RGB(120,185,255))
add(V,"MoonlightScope",72779774935963,RGB(8,21,45),RGB(71,127,205),RGB(220,234,255))
add(V,"NebulaScope",89552795828568,RGB(194,31,255),RGB(18,223,255),RGB(121,51,232))
add(V,"BlackChainsScope",71691975025595,RGB(8,8,11),RGB(169,169,181),RGB(255,255,255))
add(V,"CyberScope",133896069405310,RGB(0,85,255),RGB(0,229,255),RGB(160,32,240))
add(V,"RetrofantasyScope",80473799883435,RGB(133,91,255),RGB(255,130,210),RGB(255,198,107))
add(V,"DarkPurpleScope",134774749406354,RGB(22,0,31),RGB(82,0,128),RGB(160,32,240))
add(V,"BubblegumScope",93260110013377,RGB(255,0,140),RGB(255,115,203),RGB(255,255,255))
add(V,"RainbowCloudScope",74365710518249,RGB(255,48,48),RGB(255,223,0),RGB(39,237,100),RGB(35,138,255),RGB(162,44,255))
add(V,"GasolineScope",74498204052075,RGB(255,49,200),RGB(122,24,255),RGB(0,217,255),RGB(255,146,75))
add(V,"FutigerAeroScope",118255991818587,RGB(0,107,255),RGB(56,207,255),RGB(255,255,255),RGB(124,230,92))
add(V,"RubyScope",72964570850620,RGB(255,16,31),RGB(128,0,16),RGB(17,24,39),RGB(192,202,216))
add(V,"LightScope",102549210371348,RGB(201,151,72),RGB(248,228,162),RGB(255,249,218),RGB(248,228,162),RGB(201,151,72))
add(V,"Xchampulsescope",102825288638476,RGB(120,0,0),RGB(255,16,31),RGB(255,48,48),RGB(255,16,31),RGB(120,0,0))

add(G,"Pink Sci-Fi",117227915790509,RGB(255,20,147),RGB(255,105,210),RGB(255,255,255))
add(G,"Blue Sci-Fi",128592793058217,RGB(0,59,255),RGB(0,140,255),RGB(200,245,255))
add(G,"Championscope",107417008695054,RGB(21,0,0),RGB(160,0,0),RGB(255,16,16))
add(G,"Beastscope",100126583443070,RGB(36,0,71),RGB(101,0,184),RGB(160,32,240))
add(G,"Kittyscope",138130527508034,RGB(255,74,168),RGB(255,182,223),RGB(255,255,255))

local selected = nil
local textureEnabled = true
local shootingBeamEnabled = true
local shootingParticlesEnabled = true
local shotUntil = 0
local gradientCache = {}

local function gradient(s)
    if not s then return ColorSequence.new(BLUE) end
    if gradientCache[s] then
        return gradientCache[s]
    end

    local keys={}
    for i,c in ipairs(s.colors) do
        table.insert(keys,ColorSequenceKeypoint.new(
            (i-1)/(#s.colors-1),c
        ))
    end

    gradientCache[s]=ColorSequence.new(keys)
    return gradientCache[s]
end

-- GUN TEXTURE SYSTEM

local function isGun(o)
    local n=o.Name:lower():gsub("%s+","")
    return n=="gun" or n=="gundisplay"
        or n:find("voidscope",1,true)
        or n:find("gingerscope",1,true)
end

local function textureProperty(o)
    if o:IsA("MeshPart") then return "TextureID" end
    if o:IsA("SpecialMesh") then return "TextureId" end
    if o:IsA("SurfaceAppearance") then return "ColorMap" end
    if o:IsA("Decal") or o:IsA("Texture") then
        return "Texture"
    end
end

local function applyTexture(o)
    if not selected or not textureEnabled then return end

    local prop=textureProperty(o)
    if not prop then return end

    pcall(function()
        local current=o[prop]
        if type(current)~="string" or current=="" then
            return
        end

        if not textureOriginals[o] then
            textureOriginals[o]={prop,current}
        end

        local wanted="rbxassetid://"..selected.id
        if current~=wanted then o[prop]=wanted end
    end)
end

local function processGun(g)
    applyTexture(g)
    for _,o in ipairs(g:GetDescendants()) do
        applyTexture(o)
    end
end

local function scanContainer(container)
    if not container then return end
    if isGun(container) then
        processGun(container)
        return
    end

    for _,o in ipairs(container:GetDescendants()) do
        if isGun(o) then processGun(o) end
    end
end

local function scanGuns()
    local char=LP.Character
    scanContainer(char)
    scanContainer(LP:FindFirstChildOfClass("Backpack"))

    if char then
        local ref=char:FindFirstChild("DisplayRefGun",true)
        if ref and ref:IsA("ObjectValue") then
            scanContainer(ref.Value)
        end
    end
end

local function restoreTextures()
    for o,data in pairs(textureOriginals) do
        pcall(function()
            if o.Parent then o[data[1]]=data[2] end
        end)
    end
    table.clear(textureOriginals)
end

-- WORKING SHOOTING BEAM SYSTEM

local function isShotEffect(o)
    return o:IsA("Beam")
        or o:IsA("Trail")
        or o:IsA("ParticleEmitter")
end

local function shotEffectAllowed(o)
    if not shootingBeamEnabled then return false end
    if o:IsA("ParticleEmitter") then
        return shootingParticlesEnabled
    end
    return true
end

local function recolorShotEffect(o)
    if not alive or not selected
        or not shotEffectAllowed(o) then
        return
    end

    if effectOriginals[o]==nil then
        local ok,v=pcall(function() return o.Color end)
        if not ok then return end
        effectOriginals[o]=v
    end

    local function enforce()
        if not alive or not o.Parent or not selected
            or not shotEffectAllowed(o) then
            return
        end

        pcall(function()
            local wanted=gradient(selected)
            if o.Color~=wanted then
                o.Color=wanted
            end
        end)
    end

    enforce()

    if not effectLocks[o] then
        local changing=false
        effectLocks[o]=o:GetPropertyChangedSignal(
            "Color"
        ):Connect(function()
            if changing or not alive or not o.Parent
                or not shotEffectAllowed(o) then
                return
            end

            changing=true
            enforce()
            changing=false
        end)
    end
end

local function markShot()
    if selected then
        shotUntil=os.clock()+1
    end
end

track(UIS.InputBegan:Connect(function(input,processed)
    if processed then return end

    if input.UserInputType==Enum.UserInputType.Touch
        or input.UserInputType==Enum.UserInputType.MouseButton1
        or input.KeyCode==Enum.KeyCode.ButtonR2 then
        markShot()
    end
end))

local function watchTool(tool)
    if not tool:IsA("Tool") or watchedTools[tool] then
        return
    end
    watchedTools[tool]=true
    track(tool.Activated:Connect(markShot))
end

local function watchCharacter(char)
    for _,o in ipairs(char:GetChildren()) do
        watchTool(o)
    end
    track(char.ChildAdded:Connect(watchTool))
end

if LP.Character then watchCharacter(LP.Character) end
track(LP.CharacterAdded:Connect(watchCharacter))

track(WS.DescendantAdded:Connect(function(o)
    if not alive or not selected
        or not isShotEffect(o)
        or os.clock()>shotUntil then
        return
    end

    task.defer(function()
        if not alive or not o.Parent then return end

        local char=LP.Character
        local root=char and char:FindFirstChild(
            "HumanoidRootPart"
        )
        local part=o:FindFirstAncestorWhichIsA("BasePart")

        if root and part
            and (root.Position-part.Position).Magnitude>30 then
            return
        end

        recolorShotEffect(o)
    end)
end))

local function restoreShotEffects()
    for o,c in pairs(effectLocks) do
        c:Disconnect()
        effectLocks[o]=nil
    end

    for o,v in pairs(effectOriginals) do
        pcall(function()
            if o.Parent then o.Color=v end
        end)
    end
    table.clear(effectOriginals)
end

-- MULTIPLE GUN TRAILS AND PARTICLES

local placements={
    "Barrel",
    "Muzzle",
    "Top",
    "Bottom",
    "Left",
    "Right",
    "Rear",
    "Center"
}

local trailConfigs={}
local particleConfigs={}
local nextTrailId=0
local nextParticleId=0

local MAX_TRAILS=12
local MAX_PARTICLES=8

local activeGun=nil
local activeVisuals={}

local function colorOf(name)
    return COLORS[name] or BLUE
end

local function addTrailConfig()
    if #trailConfigs>=MAX_TRAILS then return nil end
    nextTrailId+=1

    local cfg={
        id=nextTrailId,
        color="Pink",
        placement="Barrel",
        width=.22,
        lifetime=.35,
        enabled=true
    }

    table.insert(trailConfigs,cfg)
    return cfg
end

local function addParticleConfig()
    if #particleConfigs>=MAX_PARTICLES then
        return nil
    end

    nextParticleId+=1

    local cfg={
        id=nextParticleId,
        color="Baby Blue",
        placement="Muzzle",
        rate=20,
        size=.16,
        enabled=true
    }

    table.insert(particleConfigs,cfg)
    return cfg
end

local function removeConfig(list,id)
    for i,cfg in ipairs(list) do
        if cfg.id==id then
            table.remove(list,i)
            return
        end
    end
end

local function findEquippedGun()
    local char=LP.Character
    if not char then return nil end

    -- Only objects belonging to the equipped character
    -- are eligible. Backpack and holstered guns are excluded.

    local tool=char:FindFirstChildOfClass("Tool")
    if tool then
        local handle=tool:FindFirstChild("Handle")

        if handle and handle:IsA("BasePart") then
            return handle
        end

        local part=tool:FindFirstChildWhichIsA(
            "BasePart",true
        )
        if part then return part end
    end

    -- Support custom gun systems using DisplayRefGun.

    local ref=char:FindFirstChild("DisplayRefGun",true)
    if ref and ref:IsA("ObjectValue") and ref.Value then
        local target=ref.Value
        if target:IsA("BasePart") then return target end
        return target:FindFirstChildWhichIsA(
            "BasePart",true
        )
    end

    -- Custom equipped gun fallback.

    local gun=char:FindFirstChild("Gun")
    if gun then
        if gun:IsA("BasePart") then return gun end
        return gun:FindFirstChildWhichIsA(
            "BasePart",true
        )
    end

    return nil
end

local function placementPosition(part,place)
    local s=part.Size

    if place=="Barrel" then
        return Vector3.new(0,0,-s.Z*.45)
    elseif place=="Muzzle" then
        return Vector3.new(0,0,-s.Z*.55)
    elseif place=="Top" then
        return Vector3.new(0,s.Y*.5,0)
    elseif place=="Bottom" then
        return Vector3.new(0,-s.Y*.5,0)
    elseif place=="Left" then
        return Vector3.new(-s.X*.5,0,0)
    elseif place=="Right" then
        return Vector3.new(s.X*.5,0,0)
    elseif place=="Rear" then
        return Vector3.new(0,0,s.Z*.45)
    end

    return Vector3.zero
end

local function clearVisuals()
    for _,o in ipairs(activeVisuals) do
        pcall(function() o:Destroy() end)
    end
    table.clear(activeVisuals)
end

local function visual(o)
    table.insert(activeVisuals,o)
    return o
end

local function makeAttachment(part,pos)
    return visual(make("Attachment",part,{
        Position=pos
    }))
end

local function makeGunTrail(part,cfg)
    local p=placementPosition(part,cfg.placement)

    local half=math.max(.035,cfg.width*.5)

    local a0=makeAttachment(
        part,p+Vector3.new(0,half,0)
    )
    local a1=makeAttachment(
        part,p-Vector3.new(0,half,0)
    )

    local c=colorOf(cfg.color)

    local trail=visual(make("Trail",part,{
        Attachment0=a0,
        Attachment1=a1,
        Color=ColorSequence.new(c),
        Lifetime=cfg.lifetime,
        MinLength=.01,
        LightEmission=.8,
        LightInfluence=0,
        FaceCamera=true,
        Enabled=true,
        Transparency=NumberSequence.new({
            NumberSequenceKeypoint.new(0,.05),
            NumberSequenceKeypoint.new(1,1)
        })
    }))

    return trail
end

local function makeGunParticles(part,cfg)
    local p=placementPosition(part,cfg.placement)
    local a=makeAttachment(part,p)

    local c=colorOf(cfg.color)

    local emitter=visual(make("ParticleEmitter",a,{
        Color=ColorSequence.new(c),
        Rate=cfg.rate,
        Lifetime=NumberRange.new(.3,.65),
        Speed=NumberRange.new(.5,2),
        SpreadAngle=Vector2.new(35,35),
        Size=NumberSequence.new({
            NumberSequenceKeypoint.new(0,cfg.size),
            NumberSequenceKeypoint.new(1,0)
        }),
        Transparency=NumberSequence.new({
            NumberSequenceKeypoint.new(0,.1),
            NumberSequenceKeypoint.new(1,1)
        }),
        LightEmission=.75,
        Enabled=true,
        LockedToPart=false
    }))

    return emitter
end

local function refreshVisuals()
    clearVisuals()

    activeGun=findEquippedGun()
    if not activeGun then return end

    for _,cfg in ipairs(trailConfigs) do
        if cfg.enabled then
            pcall(makeGunTrail,activeGun,cfg)
        end
    end

    for _,cfg in ipairs(particleConfigs) do
        if cfg.enabled then
            pcall(makeGunParticles,activeGun,cfg)
        end
    end
end

-- SCOPE SELECTION

local function selectScope(s)
    restoreTextures()
    selected=s
    scanGuns()

    for o in pairs(effectLocks) do
        if o.Parent then
            recolorShotEffect(o)
        end
    end
end

-- USER INTERFACE

local gui=make("ScreenGui",PG,{
    Name="ZyiksRecolor",
    ResetOnSpawn=false,
    IgnoreGuiInset=true,
    DisplayOrder=300,
    ZIndexBehavior=Enum.ZIndexBehavior.Sibling
})

local orb=make("TextButton",gui,{
    Size=UDim2.fromOffset(55,55),
    Position=UDim2.new(0,18,.42,0),
    BackgroundColor3=SIDE,
    Text="Z",
    TextColor3=BLUE,
    Font=Enum.Font.GothamBlack,
    TextSize=27,
    AutoButtonColor=false
})
round(orb,16)
stroke(orb,BLUE)

local panel=make("Frame",gui,{
    Size=UDim2.fromOffset(590,410),
    AnchorPoint=Vector2.new(.5,.5),
    Position=UDim2.fromScale(.5,.5),
    BackgroundColor3=BG,
    ClipsDescendants=true,
    Visible=false
})
round(panel,15)
stroke(panel,RGB(42,79,125))

local uiScale=make("UIScale",panel,{Scale=1})

local function fit()
    local cam=WS.CurrentCamera
    if not cam then return end
    local v=cam.ViewportSize
    uiScale.Scale=math.min(
        1,(v.X-20)/590,(v.Y-45)/410
    )
end

local sidebar=make("Frame",panel,{
    Size=UDim2.fromOffset(155,410),
    BackgroundColor3=SIDE,
    BorderSizePixel=0
})

make("TextLabel",sidebar,{
    Size=UDim2.fromOffset(140,37),
    Position=UDim2.fromOffset(12,13),
    BackgroundTransparency=1,
    Text="ZYIKS",
    Font=Enum.Font.GothamBlack,
    TextSize=26,
    TextColor3=BLUE,
    TextXAlignment=Enum.TextXAlignment.Left
})

make("TextLabel",sidebar,{
    Size=UDim2.fromOffset(140,20),
    Position=UDim2.fromOffset(12,50),
    BackgroundTransparency=1,
    Text="RECOLOR  /  V36",
    Font=Enum.Font.GothamBold,
    TextSize=10,
    TextColor3=MUTED,
    TextXAlignment=Enum.TextXAlignment.Left
})

local content=make("Frame",panel,{
    Position=UDim2.fromOffset(155,0),
    Size=UDim2.new(1,-155,1,0),
    BackgroundTransparency=1
})

local header=make("Frame",content,{
    Size=UDim2.new(1,0,0,61),
    BackgroundTransparency=1
})

local title=make("TextLabel",header,{
    Position=UDim2.fromOffset(18,12),
    Size=UDim2.new(1,-65,0,30),
    BackgroundTransparency=1,
    Text="VoidScope",
    TextColor3=WHITE,
    TextSize=21,
    Font=Enum.Font.GothamBold,
    TextXAlignment=Enum.TextXAlignment.Left
})

local close=make("TextButton",header,{
    Position=UDim2.new(1,-43,0,13),
    Size=UDim2.fromOffset(30,30),
    BackgroundColor3=CARD,
    Text="×",
    TextSize=23,
    TextColor3=WHITE,
    Font=Enum.Font.GothamBold
})
round(close,8)

local pages={}
local nav={}
local names={"VoidScope","GingerScope","Effects"}

local function pageSelect(name)
    for n,p in pairs(pages) do
        p.Visible=(n==name)
        animate(nav[n],{
            BackgroundColor3=n==name and ACTIVE or SIDE,
            TextColor3=n==name and WHITE or MUTED
        })
    end
    title.Text=name
end

for i,name in ipairs(names) do
    local b=make("TextButton",sidebar,{
        Size=UDim2.new(1,-18,0,42),
        Position=UDim2.fromOffset(9,95+(i-1)*50),
        BackgroundColor3=SIDE,
        Text="  "..name,
        TextColor3=MUTED,
        Font=Enum.Font.GothamBold,
        TextSize=13,
        TextXAlignment=Enum.TextXAlignment.Left,
        AutoButtonColor=false
    })
    round(b,9)
    nav[name]=b

    pages[name]=make("Frame",content,{
        Position=UDim2.fromOffset(15,65),
        Size=UDim2.new(1,-30,1,-80),
        BackgroundTransparency=1,
        Visible=false
    })

    track(b.Activated:Connect(function()
        pageSelect(name)
    end))
end

make("TextLabel",sidebar,{
    Position=UDim2.new(0,9,1,-45),
    Size=UDim2.new(1,-18,0,35),
    BackgroundTransparency=1,
    Text="BLUE EDITION",
    TextColor3=MUTED,
    TextSize=10,
    Font=Enum.Font.GothamBold
})

local function scrolling(parent,pos,size)
    local s=make("ScrollingFrame",parent,{
        Position=pos,
        Size=size,
        BackgroundTransparency=1,
        BorderSizePixel=0,
        ScrollBarThickness=3,
        ScrollBarImageColor3=BLUE,
        CanvasSize=UDim2.fromOffset(0,0),
        AutomaticCanvasSize=Enum.AutomaticSize.Y
    })

    make("UIListLayout",s,{
        Padding=UDim.new(0,7),
        SortOrder=Enum.SortOrder.LayoutOrder
    })

    return s
end

local scopeButtons={}

for _,category in ipairs({V,G}) do
    local page=pages[category]

    local search=make("TextBox",page,{
        Size=UDim2.new(1,0,0,36),
        BackgroundColor3=CARD,
        PlaceholderText="Search "..category.."...",
        PlaceholderColor3=MUTED,
        Text="",
        TextColor3=WHITE,
        Font=Enum.Font.Gotham,
        TextSize=12,
        ClearTextOnFocus=false
    })
    round(search,9)

    local list=scrolling(
        page,
        UDim2.fromOffset(0,45),
        UDim2.new(1,0,1,-45)
    )

    for i,s in ipairs(scopes[category]) do
        local b=make("TextButton",list,{
            Size=UDim2.new(1,-5,0,42),
            LayoutOrder=i,
            BackgroundColor3=CARD,
            Text="  "..s.name,
            TextColor3=WHITE,
            TextSize=12,
            Font=Enum.Font.GothamBold,
            TextXAlignment=Enum.TextXAlignment.Left,
            AutoButtonColor=false
        })
        round(b,9)

        local swatch=make("Frame",b,{
            Size=UDim2.fromOffset(54,18),
            Position=UDim2.new(1,-63,.5,-9),
            BackgroundColor3=WHITE
        })
        round(swatch,6)
        make("UIGradient",swatch,{Color=gradient(s)})

        scopeButtons[s]=b

        track(b.Activated:Connect(function()
            selectScope(s)
            for item,entry in pairs(scopeButtons) do
                animate(entry,{
                    BackgroundColor3=item==s
                        and ACTIVE or CARD
                })
            end
        end))
    end

    track(search:GetPropertyChangedSignal("Text"):Connect(function()
        local q=search.Text:lower()
        for _,s in ipairs(scopes[category]) do
            local b=scopeButtons[s]
            b.Visible=q==""
                or s.name:lower():find(q,1,true)~=nil
        end
    end))
end

-- EFFECTS TAB
-- TWO EFFECT TYPES ONLY

local effectsPage=pages.Effects

local tabs=make("Frame",effectsPage,{
    Size=UDim2.new(1,0,0,37),
    BackgroundTransparency=1
})

local trailsTab=make("TextButton",tabs,{
    Size=UDim2.new(.49,0,1,0),
    BackgroundColor3=ACTIVE,
    Text="TRAILS",
    TextColor3=WHITE,
    TextSize=12,
    Font=Enum.Font.GothamBold
})
round(trailsTab,9)

local particlesTab=make("TextButton",tabs,{
    Position=UDim2.new(.51,0,0,0),
    Size=UDim2.new(.49,0,1,0),
    BackgroundColor3=CARD,
    Text="PARTICLES",
    TextColor3=WHITE,
    TextSize=12,
    Font=Enum.Font.GothamBold
})
round(particlesTab,9)

local trailsPage=make("Frame",effectsPage,{
    Position=UDim2.fromOffset(0,44),
    Size=UDim2.new(1,0,1,-44),
    BackgroundTransparency=1
})

local particlesPage=make("Frame",effectsPage,{
    Position=UDim2.fromOffset(0,44),
    Size=UDim2.new(1,0,1,-44),
    BackgroundTransparency=1,
    Visible=false
})

local function setEffectsTab(name)
    trailsPage.Visible=name=="Trails"
    particlesPage.Visible=name=="Particles"

    animate(trailsTab,{
        BackgroundColor3=name=="Trails" and ACTIVE or CARD
    })
    animate(particlesTab,{
        BackgroundColor3=name=="Particles" and ACTIVE or CARD
    })
end

track(trailsTab.Activated:Connect(function()
    setEffectsTab("Trails")
end))

track(particlesTab.Activated:Connect(function()
    setEffectsTab("Particles")
end))

local function actionButton(parent,text,pos,size)
    local b=make("TextButton",parent,{
        Position=pos,
        Size=size,
        BackgroundColor3=CARD,
        Text=text,
        TextColor3=WHITE,
        Font=Enum.Font.GothamBold,
        TextSize=11,
        AutoButtonColor=false
    })
    round(b,7)
    return b
end

local function nextValue(list,current)
    local i=table.find(list,current) or 0
    return list[(i%#list)+1]
end

local trailList=scrolling(
    trailsPage,
    UDim2.fromOffset(0,0),
    UDim2.new(1,0,1,-47)
)

local particleList=scrolling(
    particlesPage,
    UDim2.fromOffset(0,0),
    UDim2.new(1,0,1,-47)
)

local addTrailButton=actionButton(
    trailsPage,
    "+ ADD GUN TRAIL",
    UDim2.new(0,0,1,-40),
    UDim2.new(1,0,0,38)
)
addTrailButton.BackgroundColor3=ACTIVE

local addParticleButton=actionButton(
    particlesPage,
    "+ ADD GUN PARTICLES",
    UDim2.new(0,0,1,-40),
    UDim2.new(1,0,0,38)
)
addParticleButton.BackgroundColor3=ACTIVE

local function clearRows(list)
    for _,o in ipairs(list:GetChildren()) do
        if o:IsA("Frame") then
            o:Destroy()
        end
    end
end

local function makeConfigRow(list,cfg,kind,refresh)
    local row=make("Frame",list,{
        Size=UDim2.new(1,-5,0,119),
        BackgroundColor3=CARD
    })
    round(row,9)

    make("TextLabel",row,{
        Position=UDim2.fromOffset(11,7),
        Size=UDim2.new(1,-95,0,23),
        BackgroundTransparency=1,
        Text=kind.." #"..cfg.id,
        TextColor3=WHITE,
        TextSize=13,
        Font=Enum.Font.GothamBold,
        TextXAlignment=Enum.TextXAlignment.Left
    })

    local remove=actionButton(
        row,"REMOVE",
        UDim2.new(1,-75,0,8),
        UDim2.fromOffset(65,23)
    )
    remove.BackgroundColor3=RGB(105,31,49)

    local color=actionButton(
        row,"Color: "..cfg.color,
        UDim2.fromOffset(10,39),
        UDim2.new(.53,-13,0,30)
    )

    local place=actionButton(
        row,cfg.placement,
        UDim2.new(.53,3,0,39),
        UDim2.new(.47,-13,0,30)
    )

    local enabled=actionButton(
        row,cfg.enabled and "ON" or "OFF",
        UDim2.fromOffset(10,77),
        UDim2.new(.3,-13,0,30)
    )

    enabled.BackgroundColor3=cfg.enabled
        and ACTIVE or RGB(65,69,83)

    local extra=actionButton(
        row,
        kind=="Trail"
            and ("Length: "..cfg.lifetime)
            or ("Amount: "..cfg.rate),
        UDim2.new(.3,3,0,77),
        UDim2.new(.7,-13,0,30)
    )

    track(color.Activated:Connect(function()
        cfg.color=nextValue(colorNames,cfg.color)
        color.Text="Color: "..cfg.color
        refreshVisuals()
    end))

    track(place.Activated:Connect(function()
        cfg.placement=nextValue(
            placements,cfg.placement
        )
        place.Text=cfg.placement
        refreshVisuals()
    end))

    track(enabled.Activated:Connect(function()
        cfg.enabled=not cfg.enabled
        enabled.Text=cfg.enabled and "ON" or "OFF"
        enabled.BackgroundColor3=cfg.enabled
            and ACTIVE or RGB(65,69,83)
        refreshVisuals()
    end))

    track(extra.Activated:Connect(function()
        if kind=="Trail" then
            local values={.15,.25,.35,.5,.75,1}
            cfg.lifetime=nextValue(
                values,cfg.lifetime
            )
            extra.Text="Length: "..cfg.lifetime
        else
            local values={5,10,20,35,50,75}
            cfg.rate=nextValue(values,cfg.rate)
            extra.Text="Amount: "..cfg.rate
        end
        refreshVisuals()
    end))

    track(remove.Activated:Connect(function()
        if kind=="Trail" then
            removeConfig(trailConfigs,cfg.id)
        else
            removeConfig(particleConfigs,cfg.id)
        end
        refreshVisuals()
        refresh()
    end))
end

local function refreshTrailRows()
    clearRows(trailList)
    for _,cfg in ipairs(trailConfigs) do
        makeConfigRow(
            trailList,cfg,"Trail",refreshTrailRows
        )
    end
end

local function refreshParticleRows()
    clearRows(particleList)
    for _,cfg in ipairs(particleConfigs) do
        makeConfigRow(
            particleList,cfg,"Particles",
            refreshParticleRows
        )
    end
end

-- Replace row builder callback with a single dispatcher.
-- Keeps every row's remove button tied to its own list.

local function rebuildRows()
    clearRows(trailList)
    clearRows(particleList)

    for _,cfg in ipairs(trailConfigs) do
        makeConfigRow(
            trailList,cfg,"Trail",rebuildRows
        )
    end

    for _,cfg in ipairs(particleConfigs) do
        makeConfigRow(
            particleList,cfg,"Particles",rebuildRows
        )
    end
end

track(addTrailButton.Activated:Connect(function()
    if addTrailConfig() then
        refreshVisuals()
        rebuildRows()
    end
end))

track(addParticleButton.Activated:Connect(function()
    if addParticleConfig() then
        refreshVisuals()
        rebuildRows()
    end
end))

-- MENU CONTROLS

local function show(v)
    if v then fit() end
    panel.Visible=v
end

track(orb.Activated:Connect(function()
    show(not panel.Visible)
end))

track(close.Activated:Connect(function()
    show(false)
end))

track(UIS.InputBegan:Connect(function(input,processed)
    if not processed
        and input.KeyCode==Enum.KeyCode.RightShift then
        show(not panel.Visible)
    end
end))

local dragging=false
local dragStart
local panelStart
local dragInput

track(header.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.Touch
        or input.UserInputType==Enum.UserInputType.MouseButton1 then
        dragging=true
        dragStart=input.Position
        panelStart=panel.Position
        dragInput=input
    end
end))

track(UIS.InputChanged:Connect(function(input)
    if not dragging then return end

    if input~=dragInput and input.UserInputType
        ~=Enum.UserInputType.MouseMovement then
        return
    end

    local delta=input.Position-dragStart

    panel.Position=UDim2.new(
        panelStart.X.Scale,
        panelStart.X.Offset+delta.X,
        panelStart.Y.Scale,
        panelStart.Y.Offset+delta.Y
    )
end))

track(UIS.InputEnded:Connect(function(input)
    if input==dragInput or input.UserInputType
        ==Enum.UserInputType.MouseButton1 then
        dragging=false
    end
end))

-- EQUIP / UNEQUIP WATCHER

local lastGun=nil
local refreshTimer=0
local gunScanTimer=0

track(RunService.Heartbeat:Connect(function(dt)
    if not alive then return end

    refreshTimer+=dt
    gunScanTimer+=dt

    if refreshTimer>=.12 then
        refreshTimer=0

        local gun=findEquippedGun()

        if gun~=lastGun then
            lastGun=gun
            refreshVisuals()
        end
    end

    if gunScanTimer>=.6 then
        gunScanTimer=0

        if selected then
            scanGuns()
        end

        for o,c in pairs(effectLocks) do
            if not o.Parent then
                c:Disconnect()
                effectLocks[o]=nil
                effectOriginals[o]=nil
            end
        end
    end
end))

track(LP.CharacterAdded:Connect(function(char)
    lastGun=nil
    clearVisuals()

    task.delay(.5,function()
        if alive then
            scanGuns()
            refreshVisuals()
        end
    end)
end))

-- DEFAULT EFFECT PRESETS

addTrailConfig()
addParticleConfig()

rebuildRows()
pageSelect(V)

-- CLEANUP

local function cleanup()
    if not alive then return end
    alive=false

    clearVisuals()
    restoreTextures()
    restoreShotEffects()

    for _,c in ipairs(connections) do
        pcall(function() c:Disconnect() end)
    end

    gui:Destroy()
end

ENV.ZyiksRecolorCleanup=cleanup

print("[ZYIKS RECOLOR V36] Loaded")
print("VoidScopes:",#scopes.VoidScope)
print("GingerScopes:",#scopes.GingerScope)
print("Gun-only trails and particles ready")
