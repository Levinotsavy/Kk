
--[[
 ZYIKS RECOLOR V12
 49 CONFIRMED VOIDSCOPE TEXTURES
 Mobile + PC | Client-side cosmetics
 Gun transparency slider
 Matching shooting-beam gradients
 Searchable, draggable black/purple UI
]]

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local WS = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
if not player then return end
local playerGui = player:WaitForChild("PlayerGui")

local env = _G
pcall(function()
    if type(getgenv) == "function" then
        env = getgenv()
    end
end)

if type(env.ZyiksRecolorCleanup) == "function" then
    pcall(env.ZyiksRecolorCleanup)
end

for _,name in ipairs({
    "ZyiksRecolorV8",
    "ZyiksRecolorV9",
    "ZyiksRecolorV10",
    "ZyiksRecolorV11",
    "ZyiksRecolorV12"
}) do
    local old = playerGui:FindFirstChild(name)
    if old then old:Destroy() end
end

local function C(r,g,b)
    return Color3.fromRGB(r,g,b)
end

local function S(name,id,a,b,c)
    return {
        name=name,
        id=tostring(id),
        colors={
            C(a[1],a[2],a[3]),
            C(b[1],b[2],b[3]),
            C(c[1],c[2],c[3])
        }
    }
end

-- ALL 49 SCOPES
local skins = {
    S("Chrome Chains Scope",89011297789911,{170,183,202},{244,247,255},{83,103,127}),
    S("ChromeScope",92721203897057,{255,59,117},{91,203,255},{255,115,212}),
    S("Cherry Blossom Scope",71388376520884,{255,134,183},{255,225,237},{201,138,255}),
    S("HackerScope",83596829894051,{0,255,101},{0,47,24},{180,255,0}),
    S("RedScope",89421027141827,{255,0,0},{255,128,80},{129,0,0}),
    S("YellowScope",118507091753068,{255,245,0},{255,153,0},{255,251,176}),
    S("CoolScope",106349999686565,{0,223,255},{0,109,255},{197,255,255}),
    S("PurpleScope",91431058867138,{224,174,255},{166,93,224},{73,31,110}),
    S("WhiteScope",138494542305273,{255,255,255},{188,223,255},{228,228,255}),
    S("PurpleBlackHoleScope",100593936768139,{23,0,36},{158,0,255},{0,0,0}),
    S("OrangeScope",138675106444675,{255,106,0},{255,208,0},{255,49,0}),
    S("RoseScope",98671498958418,{255,112,176},{255,224,237},{200,90,152}),
    S("RealVoidScope",138251909648943,{126,54,255},{226,170,255},{49,16,111}),
    S("Blood Moon Scope",77829814616900,{255,22,22},{69,0,0},{255,107,61}),
    S("Cotton Candy Galaxy Scope",89525299941655,{255,138,212},{156,117,255},{116,230,255}),
    S("Abyssal Lightning Scope",87564917363234,{0,234,255},{113,45,255},{4,21,78}),
    S("Frozen Crystal Scope",83555779459860,{255,255,255},{123,220,255},{44,124,255}),
    S("Toxic Slime Scope",135405854735405,{197,255,0},{0,230,83},{30,104,0}),
    S("Rose Gold Scope",96017056259067,{255,187,172},{255,224,161},{215,124,156}),
    S("GreenScope",107785539336433,{0,255,90},{190,255,0},{0,100,55}),
    S("CherryScope",116967488721010,{255,183,210},{255,225,238},{255,115,175}),
    S("HotPinkScope",109569323795920,{255,20,147},{255,105,180},{199,21,133}),
    S("BlueScope",137458554478558,{0,100,255},{0,190,255},{10,25,125}),
    S("CyanScope",118198204691185,{0,255,255},{120,255,245},{0,120,150}),
    S("SpiderScope",106127693338329,{101,0,0},{240,25,41},{18,10,18}),
    S("HalloweenScope",78855076452029,{255,121,0},{140,32,232},{255,177,43}),
    S("ChristmasScope",70567062837178,{217,0,24},{255,255,255},{157,0,24}),
    S("AmericaScope",134320447853136,{215,25,56},{255,255,255},{23,78,166}),
    S("GoldScope",90285221313816,{166,91,0},{255,224,122},{255,174,0}),
    S("GojoScope",118373398983463,{52,0,92},{187,63,255},{240,198,255}),
    S("GoldDiamondScope",137217613360948,{217,154,0},{255,255,255},{255,215,106}),
    S("CrimsonScope",105062792534372,{82,0,11},{220,20,60},{255,82,104}),
    S("LavaScope",116410139676399,{181,0,0},{255,69,0},{255,208,0}),
    S("MeiMeiScope",128578646191684,{255,255,255},{174,181,192},{32,35,43}),
    S("LadybugScope",81799898172130,{255,32,44},{181,0,22},{18,9,12}),
    S("AutumnScope",111008837768377,{214,90,18},{184,115,51},{230,173,85}),
    S("PinkDragonScope",115729260393472,{255,54,213},{165,44,222},{255,255,255}),
    S("WoodScope",137395201108472,{74,36,21},{150,81,45},{200,132,78}),
    S("GlassScope",120196396881002,{245,252,255},{201,217,223},{255,255,255}),
    S("GraveyardScope",94822780469065,{36,17,51},{167,123,217},{241,232,255}),
    S("PurpleVortexScope",128233143427951,{23,6,34},{139,25,255},{193,122,255}),
    S("WhiteVortexScope",73369779872481,{8,8,12},{174,178,191},{255,255,255}),
    S("CosmicScope",139394822253711,{41,16,94},{136,81,245},{244,238,255}),
    S("ChainedGalaxyScope",139286523160275,{16,18,79},{25,124,255},{163,55,255}),
    S("AngelScope",124383569086781,{34,87,181},{145,207,255},{255,255,255}),
    S("HeavenlyScope",136726132031346,{255,212,92},{255,255,255},{120,185,255}),
    S("MoonlightScope",72779774935963,{8,21,45},{71,127,205},{220,234,255}),
    S("NebulaScope",89552795828568,{194,31,255},{18,223,255},{121,51,232}),
    S("BlackChainsScope",71691975025595,{8,8,11},{169,169,181},{255,255,255})
}

local running = true
local selected = nil
local gunAlpha = 0
local shotUntil = 0
local connections = {}
local originals = {}
local originalAlpha = {}
local effectOriginals = {}
local effectLocks = {}

local function bind(signal,fn)
    local connection = signal:Connect(fn)
    connections[#connections+1] = connection
    return connection
end

local function gradient(s)
    local colors = s.colors

    if s.name == "ChromeScope" then
        local rainbow = {
            C(255,59,117),C(255,179,71),
            C(255,247,138),C(87,247,176),
            C(91,203,255),C(166,107,255),
            C(255,115,212)
        }

        local points = {}
        for i,color in ipairs(rainbow) do
            points[#points+1] =
                ColorSequenceKeypoint.new(
                    (i-1)/(#rainbow-1),color
                )
        end
        return ColorSequence.new(points)
    end

    return ColorSequence.new({
        ColorSequenceKeypoint.new(0,colors[1]),
        ColorSequenceKeypoint.new(0.5,colors[2]),
        ColorSequenceKeypoint.new(1,colors[3])
    })
end

-- GUN DETECTION
local function isGun(obj)
    if not obj then return false end
    local n = obj.Name:lower()

    return n == "gun"
        or n == "gundisplay"
        or n:find("voidscope",1,true) ~= nil
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

local function applyObject(obj)
    if not running then return end

    if obj:IsA("BasePart") then
        if originalAlpha[obj] == nil then
            originalAlpha[obj] =
                obj.LocalTransparencyModifier
        end

        pcall(function()
            obj.LocalTransparencyModifier = gunAlpha
        end)
    end

    if not selected then return end

    local prop = textureProperty(obj)
    if not prop then return end

    pcall(function()
        local value = obj[prop]
        if type(value) ~= "string" or value == "" then
            return
        end

        if not originals[obj] then
            originals[obj] = {
                property=prop,
                value=value
            }
        end

        obj[prop] = "rbxassetid://" .. selected.id
    end)
end

local function processModel(model)
    if not model then return end

    applyObject(model)

    for _,obj in ipairs(model:GetDescendants()) do
        applyObject(obj)
    end
end

local function scanContainer(container)
    if not container then return end

    if isGun(container) then
        processModel(container)
        return
    end

    for _,obj in ipairs(container:GetDescendants()) do
        if isGun(obj) then
            processModel(obj)
        end
    end
end

local function scanGuns()
    if not running then return end

    local character = player.Character
    local backpack = player:FindFirstChildOfClass("Backpack")

    scanContainer(character)
    scanContainer(backpack)

    if character then
        local ref = character:FindFirstChild(
            "DisplayRefGun",true
        )

        if ref and ref:IsA("ObjectValue") then
            scanContainer(ref.Value)
        end
    end
end

local function restoreTextures()
    for obj,data in pairs(originals) do
        pcall(function()
            obj[data.property] = data.value
        end)
    end
    table.clear(originals)
end

local function restoreTransparency()
    for obj,value in pairs(originalAlpha) do
        pcall(function()
            obj.LocalTransparencyModifier = value
        end)
    end
    table.clear(originalAlpha)
end

local function restoreEffects()
    for obj,connection in pairs(effectLocks) do
        pcall(function()
            connection:Disconnect()
        end)
    end
    table.clear(effectLocks)

    for obj,value in pairs(effectOriginals) do
        pcall(function()
            obj.Color = value
        end)
    end
    table.clear(effectOriginals)
end

local function chooseSkin(s)
    restoreTextures()
    restoreEffects()
    selected = s
    scanGuns()
end

local function setTransparency(value)
    gunAlpha = math.clamp(value,0,1)
    scanGuns()
end

-- SHOOTING BEAM SYSTEM
local function isEffect(obj)
    return obj:IsA("Beam")
        or obj:IsA("Trail")
        or obj:IsA("ParticleEmitter")
end

local function recolorEffect(obj)
    if not running or not selected then return end

    local ok,current = pcall(function()
        return obj.Color
    end)
    if not ok then return end

    if not effectOriginals[obj] then
        effectOriginals[obj] = current
    end

    local wanted = gradient(selected)
    local changing = false

    local function enforce()
        if changing or not running or not selected then
            return
        end

        changing = true
        pcall(function()
            obj.Color = wanted
        end)
        changing = false
    end

    enforce()

    if not effectLocks[obj] then
        effectLocks[obj] =
            obj:GetPropertyChangedSignal("Color"):Connect(
                enforce
            )
    end
end

bind(UIS.InputBegan,function(input,processed)
    if processed then return end

    if input.UserInputType ==
        Enum.UserInputType.MouseButton1
        or input.UserInputType ==
        Enum.UserInputType.Touch then

        shotUntil = os.clock()+1
    end
end)

bind(WS.DescendantAdded,function(obj)
    if not running or not selected then return end
    if os.clock() > shotUntil then return end
    if not isEffect(obj) then return end

    task.defer(function()
        if not running or not selected then return end

        local char = player.Character
        local root = char and char:FindFirstChild(
            "HumanoidRootPart"
        )
        local part = obj:FindFirstAncestorWhichIsA(
            "BasePart"
        )

        if root and part then
            if (root.Position-part.Position).Magnitude > 30 then
                return
            end
        end

        recolorEffect(obj)
    end)
end)

-- WATCH GUNS
local watched = {}

local function watch(container)
    if not container or watched[container] then return end
    watched[container] = true

    bind(container.DescendantAdded,function()
        task.defer(function()
            if running then scanGuns() end
        end)
    end)
end

watch(player.Character)
watch(player:FindFirstChildOfClass("Backpack"))

bind(player.CharacterAdded,function(char)
    watch(char)
    task.delay(0.5,function()
        if running then scanGuns() end
    end)
end)

bind(player.ChildAdded,function(obj)
    if obj:IsA("Backpack") then
        watch(obj)
        task.defer(scanGuns)
    end
end)

-- UI HELPERS
local function make(class,parent,props)
    local obj = Instance.new(class)

    for key,value in pairs(props or {}) do
        obj[key] = value
    end

    obj.Parent = parent
    return obj
end

local function round(obj,radius)
    make("UICorner",obj,{
        CornerRadius=UDim.new(0,radius)
    })
end

local function outline(obj,color,width)
    return make("UIStroke",obj,{
        Color=color,
        Thickness=width or 1.5
    })
end

local purple = C(165,88,255)
local white = C(250,245,255)
local dark = C(19,12,32)
local buttonColor = C(43,29,66)

local gui = make("ScreenGui",playerGui,{
    Name="ZyiksRecolorV12",
    ResetOnSpawn=false,
    IgnoreGuiInset=true,
    ZIndexBehavior=Enum.ZIndexBehavior.Sibling,
    DisplayOrder=100
})

-- LAUNCHER
local orb = make("ImageButton",gui,{
    Size=UDim2.fromOffset(68,68),
    Position=UDim2.new(0,20,0.43,0),
    BackgroundColor3=dark,
    Image="rbxassetid://93829119988995",
    BorderSizePixel=0
})
round(orb,34)
outline(orb,purple,3)

make("TextLabel",orb,{
    Size=UDim2.new(1,0,0,17),
    Position=UDim2.new(0,0,1,-17),
    BackgroundTransparency=1,
    Text="ZYIKS",
    Font=Enum.Font.GothamBlack,
    TextSize=11,
    TextColor3=white
})

-- PANEL
local panel = make("Frame",gui,{
    Size=UDim2.fromOffset(350,480),
    AnchorPoint=Vector2.new(0.5,0.5),
    Position=UDim2.fromScale(0.5,0.5),
    BackgroundColor3=dark,
    BorderSizePixel=0,
    Visible=false,
    ClipsDescendants=true
})
round(panel,18)
outline(panel,purple,3)

local scale = make("UIScale",panel,{Scale=1})

local function fitPanel()
    local camera = WS.CurrentCamera
    if not camera then return end

    local viewport = camera.ViewportSize
    scale.Scale = math.min(
        1,
        (viewport.X-24)/350,
        (viewport.Y-70)/480
    )
end

fitPanel()

make("ImageLabel",panel,{
    Size=UDim2.fromScale(1,1),
    BackgroundTransparency=1,
    Image="rbxassetid://77066684532333",
    ImageTransparency=0.84,
    ScaleType=Enum.ScaleType.Crop
})

local header = make("Frame",panel,{
    Size=UDim2.new(1,0,0,54),
    BackgroundColor3=C(43,24,72),
    BorderSizePixel=0
})
round(header,18)

make("TextLabel",header,{
    Size=UDim2.new(1,-58,1,0),
    Position=UDim2.fromOffset(12,0),
    BackgroundTransparency=1,
    Text="ZYIKS RECOLOR",
    TextColor3=white,
    TextSize=20,
    Font=Enum.Font.GothamBlack,
    TextXAlignment=Enum.TextXAlignment.Left
})

local close = make("TextButton",header,{
    Size=UDim2.fromOffset(35,34),
    Position=UDim2.new(1,-43,0,10),
    BackgroundColor3=C(100,42,147),
    Text="X",
    TextSize=18,
    Font=Enum.Font.GothamBlack,
    TextColor3=white,
    BorderSizePixel=0
})
round(close,10)

-- SEARCH
local search = make("TextBox",panel,{
    Size=UDim2.new(1,-24,0,38),
    Position=UDim2.fromOffset(12,65),
    BackgroundColor3=C(34,24,51),
    Text="",
    PlaceholderText="Search 49 scopes...",
    PlaceholderColor3=C(170,150,190),
    TextColor3=white,
    TextSize=14,
    Font=Enum.Font.GothamBold,
    ClearTextOnFocus=false,
    BorderSizePixel=0
})
round(search,10)
outline(search,C(90,57,138),1)

-- SCOPE LIST
local scrolling = make("ScrollingFrame",panel,{
    Size=UDim2.new(1,-24,0,255),
    Position=UDim2.fromOffset(12,112),
    BackgroundTransparency=1,
    BorderSizePixel=0,
    ScrollBarThickness=4,
    ScrollBarImageColor3=purple,
    CanvasSize=UDim2.fromOffset(0,0),
    AutomaticCanvasSize=Enum.AutomaticSize.Y,
    ScrollingDirection=Enum.ScrollingDirection.Y
})

make("UIListLayout",scrolling,{
    SortOrder=Enum.SortOrder.LayoutOrder,
    Padding=UDim.new(0,7)
})

local status = make("TextLabel",panel,{
    Size=UDim2.new(1,-24,0,20),
    Position=UDim2.fromOffset(12,371),
    BackgroundTransparency=1,
    Text="Selected: None",
    TextColor3=white,
    TextSize=12,
    Font=Enum.Font.GothamBold,
    TextXAlignment=Enum.TextXAlignment.Left
})

-- GUN TRANSPARENCY
local alphaText = make("TextLabel",panel,{
    Size=UDim2.new(1,-24,0,20),
    Position=UDim2.fromOffset(12,397),
    BackgroundTransparency=1,
    Text="Gun Transparency: 0%",
    TextColor3=white,
    TextSize=13,
    Font=Enum.Font.GothamBold,
    TextXAlignment=Enum.TextXAlignment.Left
})

local track = make("TextButton",panel,{
    Size=UDim2.new(1,-36,0,14),
    Position=UDim2.fromOffset(18,424),
    BackgroundColor3=C(66,47,91),
    BorderSizePixel=0,
    Text="",
    AutoButtonColor=false
})
round(track,7)

local fill = make("Frame",track,{
    Size=UDim2.fromScale(0,1),
    BackgroundColor3=purple,
    BorderSizePixel=0
})
round(fill,7)

local knob = make("Frame",track,{
    Size=UDim2.fromOffset(20,20),
    AnchorPoint=Vector2.new(0.5,0.5),
    Position=UDim2.fromScale(0,0.5),
    BackgroundColor3=white,
    BorderSizePixel=0
})
round(knob,10)
outline(knob,purple,2)

local sliding = false
local slideTouch = nil

local function updateSlider(input)
    local width = track.AbsoluteSize.X
    if width <= 0 then return end

    local value = math.clamp(
        (input.Position.X-track.AbsolutePosition.X)/width,
        0,1
    )

    fill.Size = UDim2.fromScale(value,1)
    knob.Position = UDim2.fromScale(value,0.5)
    alphaText.Text = "Gun Transparency: "
        .. math.floor(value*100+0.5) .. "%"

    setTransparency(value)
end

bind(track.InputBegan,function(input)
    if input.UserInputType ==
        Enum.UserInputType.MouseButton1
        or input.UserInputType ==
        Enum.UserInputType.Touch then

        sliding = true
        slideTouch = input
        updateSlider(input)
    end
end)

bind(UIS.InputChanged,function(input)
    if not sliding then return end

    if input.UserInputType ==
        Enum.UserInputType.MouseMovement
        or input == slideTouch then

        updateSlider(input)
    end
end)

bind(UIS.InputEnded,function(input)
    if input.UserInputType ==
        Enum.UserInputType.MouseButton1
        or input == slideTouch then

        sliding = false
        slideTouch = nil
    end
end)

-- RESET
local reset = make("TextButton",panel,{
    Size=UDim2.new(1,-24,0,30),
    Position=UDim2.fromOffset(12,445),
    BackgroundColor3=C(91,37,135),
    BorderSizePixel=0,
    Text="RESET GUN + TEXTURE + BEAM",
    TextColor3=white,
    TextSize=12,
    Font=Enum.Font.GothamBlack
})
round(reset,9)

-- SCOPE BUTTONS
local buttons = {}

for index,s in ipairs(skins) do
    local b = make("TextButton",scrolling,{
        Name=s.name,
        Size=UDim2.new(1,-6,0,48),
        BackgroundColor3=buttonColor,
        BorderSizePixel=0,
        Text="",
        LayoutOrder=index
    })
    round(b,11)

    local border = outline(b,C(92,62,132),1.5)

    local name = make("TextLabel",b,{
        Size=UDim2.new(1,-82,1,0),
        Position=UDim2.fromOffset(11,0),
        BackgroundTransparency=1,
        Text=s.name,
        TextColor3=white,
        TextSize=14,
        TextScaled=true,
        Font=Enum.Font.GothamBold,
        TextXAlignment=Enum.TextXAlignment.Left
    })

    make("UITextSizeConstraint",name,{
        MinTextSize=10,
        MaxTextSize=14
    })

    local swatch = make("Frame",b,{
        Size=UDim2.fromOffset(56,20),
        Position=UDim2.new(1,-68,0.5,-10),
        BackgroundColor3=white,
        BorderSizePixel=0
    })
    round(swatch,7)

    make("UIGradient",swatch,{
        Color=gradient(s)
    })

    buttons[s] = {button=b,border=border}

    b.MouseButton1Click:Connect(function()
        if not running then return end

        chooseSkin(s)
        status.Text = "Selected: " .. s.name

        for item,entry in pairs(buttons) do
            local active = item == s

            entry.button.BackgroundColor3 =
                active and C(94,43,153)
                or buttonColor

            entry.border.Color =
                active and C(213,172,255)
                or C(92,62,132)
        end
    end)
end

bind(search:GetPropertyChangedSignal("Text"),function()
    local query = search.Text:lower()

    for s,entry in pairs(buttons) do
        entry.button.Visible =
            query == ""
            or s.name:lower():find(query,1,true) ~= nil
    end
end)

reset.MouseButton1Click:Connect(function()
    selected = nil
    restoreTextures()
    restoreEffects()
    restoreTransparency()

    gunAlpha = 0
    fill.Size = UDim2.fromScale(0,1)
    knob.Position = UDim2.fromScale(0,0.5)
    alphaText.Text = "Gun Transparency: 0%"
    status.Text = "Selected: None"

    for _,entry in pairs(buttons) do
        entry.button.BackgroundColor3 = buttonColor
        entry.border.Color = C(92,62,132)
    end
end)

close.MouseButton1Click:Connect(function()
    panel.Visible = false
end)

-- DRAGGING
local function drag(target,handle,onTap)
    local active = false
    local startPosition
    local startPointer
    local moved = false
    local touchInput = nil

    bind(handle.InputBegan,function(input)
        if input.UserInputType ~=
            Enum.UserInputType.MouseButton1
            and input.UserInputType ~=
            Enum.UserInputType.Touch then
            return
        end

        active = true
        moved = false
        touchInput = input
        startPointer = input.Position
        startPosition = target.Position
    end)

    bind(UIS.InputChanged,function(input)
        if not active then return end

        if input.UserInputType ~=
            Enum.UserInputType.MouseMovement
            and input ~= touchInput then
            return
        end

        local delta = input.Position-startPointer

        if delta.Magnitude > 8 then
            moved = true
        end

        target.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset+delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset+delta.Y
        )
    end)

    bind(UIS.InputEnded,function(input)
        if not active then return end

        if input.UserInputType ==
            Enum.UserInputType.MouseButton1
            or input == touchInput then

            active = false
            touchInput = nil

            if onTap and not moved then
                onTap()
            end
        end
    end)
end

drag(orb,orb,function()
    panel.Visible = not panel.Visible
    if panel.Visible then fitPanel() end
end)

drag(panel,header)

-- KEEP GUN UPDATED
local elapsed = 0

bind(game:GetService("RunService").Heartbeat,function(dt)
    if not running then return end

    elapsed = elapsed+dt
    if elapsed < 0.6 then return end
    elapsed = 0

    if selected or gunAlpha > 0 then
        scanGuns()
    end
end)

-- CLEANUP
local function cleanup()
    if not running then return end
    running = false

    restoreTextures()
    restoreEffects()
    restoreTransparency()

    for _,connection in ipairs(connections) do
        pcall(function()
            connection:Disconnect()
        end)
    end

    gui:Destroy()
end

env.ZyiksRecolorCleanup = cleanup

print("[ZYIKS V12] Loaded "..#skins.." scopes")
print("[ZYIKS V12] Gun transparency ready")

