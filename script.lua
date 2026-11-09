
-- ZYIKS RECOLOR V15
-- Mobile / PC / Xbox Controller
-- 49 scopes + beam detection + diagnostic status

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local WS = game:GetService("Workspace")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
if not player then return end
local pg = player:WaitForChild("PlayerGui")

local old = pg:FindFirstChild("ZyiksRecolorV15")
if old then old:Destroy() end

local function C(r,g,b)
    return Color3.fromRGB(r,g,b)
end

local function S(n,id,a,b,c)
    return {
        name=n,
        id=tostring(id),
        colors={
            C(unpack(a)),
            C(unpack(b)),
            C(unpack(c))
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

local selected
local transparency = 0
local shotUntil = 0
local shots = 0
local foundEffects = 0
local connections = {}
local originalTextures = {}
local originalAlpha = {}
local originalColors = {}
local running = true

local function bind(signal,fn)
    local c = signal:Connect(fn)
    connections[#connections+1] = c
    return c
end

local function sequence(s)
    if s.name == "ChromeScope" then
        local colors = {
            C(255,59,117),C(255,179,71),
            C(255,247,138),C(87,247,176),
            C(91,203,255),C(166,107,255),
            C(255,115,212)
        }
        local keys = {}
        for i,color in ipairs(colors) do
            keys[i] = ColorSequenceKeypoint.new(
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
    local n = obj.Name:lower()
    return n == "gun" or n == "gundisplay"
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

local function applyGunObject(obj)
    if obj:IsA("BasePart") then
        if originalAlpha[obj] == nil then
            originalAlpha[obj] =
                obj.LocalTransparencyModifier
        end
        pcall(function()
            obj.LocalTransparencyModifier = transparency
        end)
    end

    if not selected then return end

    local prop = textureProperty(obj)
    if not prop then return end

    pcall(function()
        local oldValue = obj[prop]
        if type(oldValue) ~= "string"
            or oldValue == "" then return end

        if not originalTextures[obj] then
            originalTextures[obj] = {
                property=prop,value=oldValue
            }
        end

        obj[prop] = "rbxassetid://"..selected.id
    end)
end

local function scanGuns()
    local function scan(container)
        if not container then return end
        for _,obj in ipairs(container:GetDescendants()) do
            if isGun(obj) then
                applyGunObject(obj)
                for _,child in ipairs(obj:GetDescendants()) do
                    applyGunObject(child)
                end
            end
        end
    end

    scan(player.Character)
    scan(player:FindFirstChildOfClass("Backpack"))
end

local function effectType(obj)
    return obj:IsA("Beam")
        or obj:IsA("Trail")
        or obj:IsA("ParticleEmitter")
end

local function nearPlayer(obj)
    local char = player.Character
    local root = char and char:FindFirstChild(
        "HumanoidRootPart"
    )
    if not root then return false end

    if obj:IsDescendantOf(char) then
        return true
    end

    if obj:IsA("Beam") then
        for _,a in ipairs({
            obj.Attachment0,obj.Attachment1
        }) do
            if a and
                (a.WorldPosition-root.Position).Magnitude < 80 then
                return true
            end
        end
    end

    local parent = obj.Parent
    while parent do
        if parent:IsA("Attachment") then
            return (parent.WorldPosition-root.Position).Magnitude < 80
        elseif parent:IsA("BasePart") then
            return (parent.Position-root.Position).Magnitude < 80
        end
        parent = parent.Parent
    end

    return false
end

local function recolorEffect(obj)
    if not selected or not effectType(obj) then return end
    if not nearPlayer(obj) then return end

    if originalColors[obj] == nil then
        local ok,value = pcall(function()
            return obj.Color
        end)
        if not ok then return end
        originalColors[obj] = value
    end

    local ok = pcall(function()
        obj.Color = sequence(selected)
    end)

    if ok then
        foundEffects = foundEffects+1
    end
end

local function scanEffects()
    if not selected then return end

    for _,obj in ipairs(WS:GetDescendants()) do
        if effectType(obj) then
            recolorEffect(obj)
        end
    end
end

local lastShot = 0

local function registerShot()
    if not selected then return end

    local now = os.clock()
    if now-lastShot < 0.18 then return end

    lastShot = now
    shotUntil = now+1.5
    shots = shots+1

    task.defer(scanEffects)
end

bind(UIS.InputBegan,function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch
        or input.KeyCode == Enum.KeyCode.ButtonR2 then
        registerShot()
    end
end)

bind(UIS.InputChanged,function(input)
    if input.KeyCode == Enum.KeyCode.ButtonR2
        and input.Position.Z > 0.35 then
        registerShot()
    end
end)

bind(WS.DescendantAdded,function(obj)
    if os.clock() > shotUntil then return end
    if not effectType(obj) then return end

    task.defer(function()
        if running and obj.Parent then
            recolorEffect(obj)
        end
    end)
end)

local function restore()
    for obj,data in pairs(originalTextures) do
        pcall(function()
            obj[data.property] = data.value
        end)
    end

    for obj,value in pairs(originalAlpha) do
        pcall(function()
            obj.LocalTransparencyModifier = value
        end)
    end

    for obj,value in pairs(originalColors) do
        pcall(function()
            obj.Color = value
        end)
    end

    table.clear(originalTextures)
    table.clear(originalAlpha)
    table.clear(originalColors)
end

local function make(class,parent,props)
    local obj = Instance.new(class)
    for k,v in pairs(props) do
        pcall(function()
            obj[k] = v
        end)
    end
    obj.Parent = parent
    return obj
end

local function round(obj,r)
    make("UICorner",obj,{
        CornerRadius=UDim.new(0,r)
    })
end

local gui = make("ScreenGui",pg,{
    Name="ZyiksRecolorV15",
    ResetOnSpawn=false,
    DisplayOrder=100
})

local orb = make("TextButton",gui,{
    Size=UDim2.fromOffset(65,65),
    Position=UDim2.new(0,15,0.4,0),
    BackgroundColor3=C(110,45,180),
    Text="ZYIKS",
    TextColor3=C(255,255,255),
    TextSize=14,
    Font=Enum.Font.GothamBlack
})
round(orb,32)

local panel = make("Frame",gui,{
    Size=UDim2.fromOffset(320,460),
    Position=UDim2.new(0.5,-160,0.5,-230),
    BackgroundColor3=C(20,13,32),
    Visible=false
})
round(panel,14)

local scale = make("UIScale",panel,{Scale=1})

local function fit()
    local camera = WS.CurrentCamera
    if not camera then return end
    local size = camera.ViewportSize
    scale.Scale = math.min(
        1,(size.X-20)/320,(size.Y-60)/460
    )
end

local title = make("TextLabel",panel,{
    Size=UDim2.new(1,-50,0,42),
    BackgroundTransparency=1,
    Text="ZYIKS RECOLOR V15",
    TextColor3=C(255,255,255),
    TextSize=18,
    Font=Enum.Font.GothamBlack
})

local close = make("TextButton",panel,{
    Size=UDim2.fromOffset(35,35),
    Position=UDim2.new(1,-40,0,4),
    BackgroundColor3=C(110,45,180),
    Text="X",
    TextColor3=C(255,255,255),
    TextSize=18
})
round(close,8)

local search = make("TextBox",panel,{
    Size=UDim2.new(1,-20,0,36),
    Position=UDim2.fromOffset(10,48),
    BackgroundColor3=C(42,29,63),
    Text="",
    PlaceholderText="Search scopes...",
    TextColor3=C(255,255,255),
    TextSize=14,
    ClearTextOnFocus=false
})
round(search,8)

local scroll = make("ScrollingFrame",panel,{
    Size=UDim2.new(1,-20,0,260),
    Position=UDim2.fromOffset(10,90),
    BackgroundTransparency=1,
    ScrollBarThickness=4,
    CanvasSize=UDim2.fromOffset(0,0),
    AutomaticCanvasSize=Enum.AutomaticSize.Y
})

make("UIListLayout",scroll,{
    Padding=UDim.new(0,5),
    SortOrder=Enum.SortOrder.LayoutOrder
})

local status = make("TextLabel",panel,{
    Size=UDim2.new(1,-20,0,35),
    Position=UDim2.fromOffset(10,354),
    BackgroundTransparency=1,
    Text="RT Shots: 0 | Effects: 0",
    TextColor3=C(210,170,255),
    TextSize=12,
    TextWrapped=true
})

local alpha = make("TextLabel",panel,{
    Size=UDim2.new(1,-20,0,22),
    Position=UDim2.fromOffset(10,391),
    BackgroundTransparency=1,
    Text="Transparency: 0%",
    TextColor3=C(255,255,255),
    TextSize=13
})

local minus = make("TextButton",panel,{
    Size=UDim2.fromOffset(42,34),
    Position=UDim2.fromOffset(10,416),
    BackgroundColor3=C(100,45,160),
    Text="-",
    TextSize=24,
    TextColor3=C(255,255,255)
})
round(minus,8)

local plus = make("TextButton",panel,{
    Size=UDim2.fromOffset(42,34),
    Position=UDim2.new(1,-52,0,416),
    BackgroundColor3=C(100,45,160),
    Text="+",
    TextSize=24,
    TextColor3=C(255,255,255)
})
round(plus,8)

local reset = make("TextButton",panel,{
    Size=UDim2.new(1,-116,0,34),
    Position=UDim2.fromOffset(58,416),
    BackgroundColor3=C(75,35,120),
    Text="RESET",
    TextSize=14,
    TextColor3=C(255,255,255)
})
round(reset,8)

local buttons = {}

for i,s in ipairs(skins) do
    local b = make("TextButton",scroll,{
        Size=UDim2.new(1,-6,0,42),
        BackgroundColor3=C(45,30,70),
        Text=s.name,
        TextColor3=C(255,255,255),
        TextSize=13,
        Font=Enum.Font.GothamBold,
        LayoutOrder=i,
        Selectable=true
    })
    round(b,8)
    buttons[s] = b

    bind(b.Activated,function()
        restore()
        selected = s
        scanGuns()
        scanEffects()

        for item,button in pairs(buttons) do
            button.BackgroundColor3 =
                item == s and C(125,55,190)
                or C(45,30,70)
        end
    end)
end

bind(search:GetPropertyChangedSignal("Text"),function()
    local q = search.Text:lower()
    for s,b in pairs(buttons) do
        b.Visible = q == ""
            or s.name:lower():find(q,1,true) ~= nil
    end
end)

local function updateAlpha(amount)
    transparency = math.clamp(
        transparency+amount,0,1
    )
    alpha.Text = "Transparency: "..
        math.floor(transparency*100+0.5).."%"
    scanGuns()
end

bind(minus.Activated,function()
    updateAlpha(-0.05)
end)

bind(plus.Activated,function()
    updateAlpha(0.05)
end)

bind(reset.Activated,function()
    restore()
    selected = nil
    transparency = 0
    alpha.Text = "Transparency: 0%"
    for _,b in pairs(buttons) do
        b.BackgroundColor3 = C(45,30,70)
    end
end)

local function toggle()
    panel.Visible = not panel.Visible
    if panel.Visible then fit() end
end

bind(orb.Activated,toggle)
bind(close.Activated,toggle)

bind(UIS.InputBegan,function(input,processed)
    if processed then return end

    if input.KeyCode == Enum.KeyCode.ButtonY then
        toggle()
    elseif panel.Visible then
        if input.KeyCode == Enum.KeyCode.ButtonB then
            toggle()
        elseif input.KeyCode == Enum.KeyCode.ButtonL1 then
            updateAlpha(-0.05)
        elseif input.KeyCode == Enum.KeyCode.ButtonR1 then
            updateAlpha(0.05)
        end
    end
end)

local elapsed = 0

bind(RunService.Heartbeat,function(dt)
    if not running then return end

    elapsed = elapsed+dt
    if elapsed < 0.5 then return end
    elapsed = 0

    if selected then
        scanGuns()
    end

    status.Text = string.format(
        "RT Shots: %d | Effects: %d",
        shots,foundEffects
    )
end)

print("[ZYIKS V15] Loaded "..#skins.." scopes")
