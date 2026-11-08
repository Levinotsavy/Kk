
-- ZYIKS RECOLOR V14
-- ALL-IN-ONE | 49 SCOPES | PC / MOBILE / XBOX CONTROLLER
-- Client-side cosmetics
-- Intended for Roblox experiences where you have permission
-- to customize the local gun and its effects.

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local GuiService = game:GetService("GuiService")

local player = Players.LocalPlayer
if not player then
    warn("[ZYIKS] Must run from a client LocalScript")
    return
end

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
    "ZyiksRecolorV12",
    "ZyiksRecolorV13",
    "ZyiksRecolorV14"
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
local originalTextures = {}
local originalTransparency = {}
local originalEffects = {}
local effectConnections = {}
local watched = {}

local function bind(signal,callback)
    local connection = signal:Connect(callback)
    table.insert(connections,connection)
    return connection
end

local function gradient(s)
    if s.name == "ChromeScope" then
        local colors = {
            C(255,59,117),C(255,179,71),
            C(255,247,138),C(87,247,176),
            C(91,203,255),C(166,107,255),
            C(255,115,212)
        }
        local keys = {}
        for i,color in ipairs(colors) do
            keys[#keys+1] = ColorSequenceKeypoint.new(
                (i-1)/(#colors-1),color
            )
        end
        return ColorSequence.new(keys)
    end

    return ColorSequence.new({
        ColorSequenceKeypoint.new(0,s.colors[1]),
        ColorSequenceKeypoint.new(0.5,s.colors[2]),
        ColorSequenceKeypoint.new(1,s.colors[3])
    })
end

local function isGun(obj)
    if not obj then return false end
    local n = obj.Name:lower()
    return n == "gun"
        or n == "gundisplay"
        or n:find("voidscope",1,true) ~= nil
end

local function getTextureProperty(obj)
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

local function applyPart(obj)
    if obj:IsA("BasePart") then
        if originalTransparency[obj] == nil then
            originalTransparency[obj] = obj.LocalTransparencyModifier
        end
        pcall(function()
            obj.LocalTransparencyModifier = gunAlpha
        end)
    end

    if not selected then return end

    local prop = getTextureProperty(obj)
    if not prop then return end

    pcall(function()
        local current = obj[prop]
        if type(current) ~= "string" or current == "" then
            return
        end

        if not originalTextures[obj] then
            originalTextures[obj] = {
                property=prop,
                value=current
            }
        end

        obj[prop] = "rbxassetid://" .. selected.id
    end)
end

local function processGun(gun)
    if not gun then return end
    applyPart(gun)
    for _,obj in ipairs(gun:GetDescendants()) do
        applyPart(obj)
    end
end

local function scanGuns()
    if not running then return end

    local function scan(container)
        if not container then return end
        if isGun(container) then
            processGun(container)
            return
        end
        for _,obj in ipairs(container:GetDescendants()) do
            if isGun(obj) then
                processGun(obj)
            end
        end
    end

    scan(player.Character)
    scan(player:FindFirstChildOfClass("Backpack"))

    local char = player.Character
    if char then
        local ref = char:FindFirstChild("DisplayRefGun",true)
        if ref and ref:IsA("ObjectValue") then
            scan(ref.Value)
        end
    end
end

local function restoreTextures()
    for obj,data in pairs(originalTextures) do
        pcall(function()
            obj[data.property] = data.value
        end)
    end
    table.clear(originalTextures)
end

local function restoreTransparency()
    for obj,value in pairs(originalTransparency) do
        pcall(function()
            obj.LocalTransparencyModifier = value
        end)
    end
    table.clear(originalTransparency)
end

local function restoreEffects()
    for _,connection in pairs(effectConnections) do
        pcall(function()
            connection:Disconnect()
        end)
    end
    table.clear(effectConnections)

    for obj,color in pairs(originalEffects) do
        pcall(function()
            obj.Color = color
        end)
    end
    table.clear(originalEffects)
end

local function isEffect(obj)
    return obj:IsA("Beam")
        or obj:IsA("Trail")
        or obj:IsA("ParticleEmitter")
end

local function effectNearPlayer(obj)
    local char = player.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return false end

    if obj:IsDescendantOf(char) then return true end

    local part = obj:FindFirstAncestorWhichIsA("BasePart")
    if part then
        return (root.Position-part.Position).Magnitude <= 30
    end

    if obj:IsA("Beam") then
        for _,attachment in ipairs({
            obj.Attachment0,
            obj.Attachment1
        }) do
            if attachment and
                (root.Position-attachment.WorldPosition).Magnitude <= 30 then
                return true
            end
        end
    end

    return false
end

local function recolorEffect(obj)
    if not selected or not isEffect(obj) then return end

    local ok,current = pcall(function()
        return obj.Color
    end)
    if not ok then return end

    if originalEffects[obj] == nil then
        originalEffects[obj] = current
    end

    local wanted = gradient(selected)

    pcall(function()
        obj.Color = wanted
    end)

    if effectConnections[obj] then
        effectConnections[obj]:Disconnect()
    end

    local busy = false
    effectConnections[obj] =
        obj:GetPropertyChangedSignal("Color"):Connect(function()
            if busy or not running or not selected then return end
            busy = true
            pcall(function()
                obj.Color = wanted
            end)
            busy = false
        end)
end

local function scanEffects()
    if not running or not selected then return end

    local char = player.Character
    if char then
        for _,obj in ipairs(char:GetDescendants()) do
            if isEffect(obj) then
                recolorEffect(obj)
            end
        end
    end

    for _,obj in ipairs(Workspace:GetDescendants()) do
        if isEffect(obj) and effectNearPlayer(obj) then
            recolorEffect(obj)
        end
    end
end

local lastShotScan = 0

local function registerShot()
    if not running or not selected then return end

    shotUntil = os.clock()+1

    if os.clock()-lastShotScan >= 0.15 then
        lastShotScan = os.clock()
        task.defer(scanEffects)
    end
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

-- INPUT: PC, TOUCH, AND XBOX R2
bind(UIS.InputBegan,function(input,processed)
    if processed then return end

    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch
        or input.KeyCode == Enum.KeyCode.ButtonR2 then
        registerShot()
    end
end)

bind(UIS.InputChanged,function(input)
    if input.KeyCode == Enum.KeyCode.ButtonR2
        and input.Position.Z > 0.15 then
        registerShot()
    end
end)

bind(Workspace.DescendantAdded,function(obj)
    if not running or not selected then return end
    if os.clock() > shotUntil then return end
    if not isEffect(obj) then return end

    task.defer(function()
        if running and selected and effectNearPlayer(obj) then
            recolorEffect(obj)
        end
    end)
end)

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
    end
end)

-- SAFE UI CREATION
local function make(class,parent,props)
    local obj = Instance.new(class)
    for key,value in pairs(props or {}) do
        local ok,err = pcall(function()
            obj[key] = value
        end)
        if not ok then
            warn("[ZYIKS UI]",class,key,err)
        end
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
    Name="ZyiksRecolorV14",
    ResetOnSpawn=false,
    IgnoreGuiInset=true,
    DisplayOrder=100
})

local orb = make("ImageButton",gui,{
    Size=UDim2.fromOffset(68,68),
    Position=UDim2.new(0,20,0.43,0),
    BackgroundColor3=dark,
    Image="rbxassetid://93829119988995",
    BorderSizePixel=0,
    Selectable=true
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
    local camera = Workspace.CurrentCamera
    if not camera then return end

    local viewport = camera.ViewportSize
    scale.Scale = math.max(0.4,math.min(
        1,(viewport.X-24)/350,(viewport.Y-70)/480
    ))
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
    Text="ZYIKS RECOLOR V14",
    TextColor3=white,
    TextSize=19,
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
    BorderSizePixel=0,
    Selectable=true
})
round(close,10)

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

local layout = make("UIListLayout",scrolling,{
    SortOrder=Enum.SortOrder.LayoutOrder,
    Padding=UDim.new(0,7)
})

bind(layout:GetPropertyChangedSignal("AbsoluteContentSize"),function()
    scrolling.CanvasSize = UDim2.fromOffset(
        0,layout.AbsoluteContentSize.Y+8
    )
end)

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
    AutoButtonColor=false,
    Selectable=true
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

local function setSlider(value)
    value = math.clamp(value,0,1)
    fill.Size = UDim2.fromScale(value,1)
    knob.Position = UDim2.fromScale(value,0.5)
    alphaText.Text = "Gun Transparency: "
        ..math.floor(value*100+0.5).."%"
    setTransparency(value)
end

local sliding = false
local slideInput = nil

local function updateSlider(input)
    local width = track.AbsoluteSize.X
    if width <= 0 then return end

    setSlider(
        (input.Position.X-track.AbsolutePosition.X)/width
    )
end

bind(track.InputBegan,function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        sliding = true
        slideInput = input
        updateSlider(input)
    end
end)

bind(UIS.InputChanged,function(input)
    if not sliding then return end

    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input == slideInput then
        updateSlider(input)
    end
end)

bind(UIS.InputEnded,function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input == slideInput then
        sliding = false
        slideInput = nil
    end
end)

local reset = make("TextButton",panel,{
    Size=UDim2.new(1,-24,0,30),
    Position=UDim2.fromOffset(12,445),
    BackgroundColor3=C(91,37,135),
    BorderSizePixel=0,
    Text="RESET GUN + TEXTURE + BEAM",
    TextColor3=white,
    TextSize=12,
    Font=Enum.Font.GothamBlack,
    Selectable=true
})
round(reset,9)

local buttons = {}
local firstButton = nil

for index,s in ipairs(skins) do
    local b = make("TextButton",scrolling,{
        Name="Scope_"..index,
        Size=UDim2.new(1,-6,0,48),
        BackgroundColor3=buttonColor,
        BorderSizePixel=0,
        Text="",
        LayoutOrder=index,
        Selectable=true
    })
    round(b,11)

    if not firstButton then firstButton = b end

    local border = outline(b,C(92,62,132),1.5)

    local nameLabel = make("TextLabel",b,{
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

    make("UITextSizeConstraint",nameLabel,{
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

    buttons[s] = {
        button=b,
        border=border
    }

    bind(b.Activated,function()
        if not running then return end

        chooseSkin(s)
        status.Text = "Selected: "..s.name

        for item,entry in pairs(buttons) do
            local active = item == s
            entry.button.BackgroundColor3 =
                active and C(94,43,153) or buttonColor
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

bind(reset.Activated,function()
    selected = nil
    restoreTextures()
    restoreEffects()
    restoreTransparency()
    setSlider(0)
    status.Text = "Selected: None"

    for _,entry in pairs(buttons) do
        entry.button.BackgroundColor3 = buttonColor
        entry.border.Color = C(92,62,132)
    end
end)

local function setPanel(open)
    panel.Visible = open
    if open then
        fitPanel()
        if UIS.GamepadEnabled and firstButton then
            GuiService.SelectedObject = firstButton
        end
    else
        if GuiService.SelectedObject
            and GuiService.SelectedObject:IsDescendantOf(panel) then
            GuiService.SelectedObject = nil
        end
    end
end

bind(close.Activated,function()
    setPanel(false)
end)

bind(UIS.InputBegan,function(input,processed)
    if input.KeyCode == Enum.KeyCode.ButtonY then
        if not processed then
            setPanel(not panel.Visible)
        end
    elseif panel.Visible then
        if input.KeyCode == Enum.KeyCode.ButtonB then
            setPanel(false)
        elseif input.KeyCode == Enum.KeyCode.ButtonL1 then
            setSlider(gunAlpha-0.05)
        elseif input.KeyCode == Enum.KeyCode.ButtonR1 then
            setSlider(gunAlpha+0.05)
        end
    end
end)

-- DRAG SUPPORT
local function drag(target,handle,onTap)
    local active = false
    local startPosition
    local startPointer
    local moved = false
    local touchInput = nil

    bind(handle.InputBegan,function(input)
        if input.UserInputType ~= Enum.UserInputType.MouseButton1
            and input.UserInputType ~= Enum.UserInputType.Touch then
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

        if input.UserInputType ~= Enum.UserInputType.MouseMovement
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

        if input.UserInputType == Enum.UserInputType.MouseButton1
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
    setPanel(not panel.Visible)
end)

drag(panel,header)

local elapsed = 0

bind(RunService.Heartbeat,function(dt)
    if not running then return end

    elapsed = elapsed+dt
    if elapsed < 0.6 then return end
    elapsed = 0

    if selected or gunAlpha > 0 then
        scanGuns()
    end
end)

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

print("[ZYIKS V14] Loaded "..#skins.." scopes")
print("[ZYIKS V14] Controller support initialized")
