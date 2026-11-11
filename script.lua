
-- ZYIKS RECOLOR V28.2
-- 59 VoidScopes + 5 GingerScopes
-- Beam Gradient Fix + Effects + Move Trail

local P=game:GetService("Players")
local R=game:GetService("RunService")
local U=game:GetService("UserInputService")
local W=game:GetService("Workspace")
local me=P.LocalPlayer
local pg=me:WaitForChild("PlayerGui")
local env=_G
pcall(function()
    if type(getgenv)=="function" then env=getgenv() end
end)
if type(env.ZyiksRecolorCleanup)=="function" then
    pcall(env.ZyiksRecolorCleanup)
end

for _,n in ipairs({
    "ZyiksRecolorV27","ZyiksRecolorV28",
    "ZyiksRecolorV28_2"
}) do
    local x=pg:FindFirstChild(n)
    if x then x:Destroy() end
end

local alive=true
local conns={}
local function listen(sig,fn)
    local c=sig:Connect(fn)
    table.insert(conns,c)
    return c
end

local function rgb(r,g,b)
    return Color3.fromRGB(r,g,b)
end

local function skin(n,id,...)
    return {name=n,id=tostring(id),colors={...}}
end

local skins={VoidScope={},GingerScope={}}
local V="VoidScope"
local G="GingerScope"

local function add(k,n,id,...)
    table.insert(skins[k],skin(n,id,...))
end

-- ALL 59 VOIDSCOPES

add(V,"Chrome Chains Scope",89011297789911,rgb(170,183,202),rgb(244,247,255),rgb(83,103,127))
add(V,"ChromeScope",92721203897057,rgb(255,59,117),rgb(255,179,71),rgb(255,247,138),rgb(87,247,176),rgb(91,203,255),rgb(166,107,255),rgb(255,115,212))
add(V,"Cherry Blossom Scope",71388376520884,rgb(255,134,183),rgb(255,225,237),rgb(201,138,255))
add(V,"HackerScope",113547863710933,rgb(0,255,101),rgb(0,47,24),rgb(180,255,0))
add(V,"RedScope",89421027141827,rgb(255,0,0),rgb(255,128,80),rgb(129,0,0))
add(V,"YellowScope",118507091753068,rgb(255,245,0),rgb(255,153,0),rgb(255,251,176))
add(V,"CoolScope",106349999686565,rgb(0,223,255),rgb(0,109,255),rgb(197,255,255))
add(V,"PurpleScope",91431058867138,rgb(224,174,255),rgb(166,93,224),rgb(73,31,110))
add(V,"WhiteScope",138494542305273,rgb(255,255,255),rgb(188,223,255),rgb(228,228,255))
add(V,"PurpleBlackHoleScope",100593936768139,rgb(23,0,36),rgb(158,0,255),rgb(0,0,0))
add(V,"OrangeScope",96701056575304,rgb(255,106,0),rgb(255,208,0),rgb(255,49,0))
add(V,"RoseScope",98671498958418,rgb(255,112,176),rgb(255,224,237),rgb(200,90,152))
add(V,"RealVoidScope",138251909648943,rgb(126,54,255),rgb(226,170,255),rgb(49,16,111))
add(V,"Blood Moon Scope",77829814616900,rgb(255,22,22),rgb(69,0,0),rgb(255,107,61))
add(V,"Cotton Candy Galaxy Scope",89525299941655,rgb(255,138,212),rgb(156,117,255),rgb(116,230,255))
add(V,"Abyssal Lightning Scope",87564917363234,rgb(0,234,255),rgb(113,45,255),rgb(4,21,78))
add(V,"Frozen Crystal Scope",83555779459860,rgb(255,255,255),rgb(123,220,255),rgb(44,124,255))
add(V,"Toxic Slime Scope",135405854735405,rgb(197,255,0),rgb(0,230,83),rgb(30,104,0))
add(V,"Rose Gold Scope",96017056259067,rgb(255,187,172),rgb(255,224,161),rgb(215,124,156))
add(V,"GreenScope",107785539336433,rgb(0,255,90),rgb(190,255,0),rgb(0,100,55))
add(V,"CherryScope",116967488721010,rgb(255,183,210),rgb(255,225,238),rgb(255,115,175))
add(V,"HotPinkScope",109569323795920,rgb(255,20,147),rgb(255,105,180),rgb(199,21,133))
add(V,"BlueScope",137458554478558,rgb(0,100,255),rgb(0,190,255),rgb(10,25,125))
add(V,"CyanScope",118198204691185,rgb(0,255,255),rgb(120,255,245),rgb(0,120,150))
add(V,"SpiderScope",106127693338329,rgb(101,0,0),rgb(240,25,41),rgb(18,9,12))
add(V,"HalloweenScope",78855076452029,rgb(255,121,0),rgb(140,32,232),rgb(255,177,43))
add(V,"ChristmasScope",70567062837178,rgb(217,0,24),rgb(255,255,255),rgb(157,0,24))
add(V,"AmericaScope",134320447853136,rgb(215,25,56),rgb(255,255,255),rgb(23,78,166))
add(V,"GoldScope",90285221313816,rgb(166,91,0),rgb(255,224,122),rgb(255,174,0))
add(V,"GojoScope",118373398983463,rgb(52,0,92),rgb(187,63,255),rgb(240,198,255))
add(V,"GoldDiamondScope",137217613360948,rgb(217,154,0),rgb(255,255,255),rgb(255,215,106))
add(V,"CrimsonScope",105062792534372,rgb(82,0,11),rgb(220,20,60),rgb(255,82,104))
add(V,"LavaScope",116410139676399,rgb(181,0,0),rgb(255,69,0),rgb(255,208,0))
add(V,"MeiMeiScope",128578646191684,rgb(255,255,255),rgb(174,181,192),rgb(32,35,43))
add(V,"LadybugScope",81799898172130,rgb(255,32,44),rgb(181,0,22),rgb(18,9,12))
add(V,"AutumnScope",111008837768377,rgb(214,90,18),rgb(184,115,51),rgb(230,173,85))
add(V,"PinkDragonScope",115729260393472,rgb(255,54,213),rgb(165,44,222),rgb(255,255,255))
add(V,"WoodScope",137395201108472,rgb(74,36,21),rgb(150,81,45),rgb(200,132,78))
add(V,"GlassScope",120196396881002,rgb(245,252,255),rgb(201,217,223),rgb(255,255,255))
add(V,"GraveyardScope",94822780469065,rgb(36,17,51),rgb(167,123,217),rgb(241,232,255))
add(V,"PurpleVortexScope",128233143427951,rgb(23,6,34),rgb(139,25,255),rgb(193,122,255))
add(V,"WhiteVortexScope",73369779872481,rgb(8,8,12),rgb(174,178,191),rgb(255,255,255))
add(V,"CosmicScope",139394822253711,rgb(41,16,94),rgb(136,81,245),rgb(244,238,255))
add(V,"ChainedGalaxyScope",139286523160275,rgb(16,18,79),rgb(25,124,255),rgb(163,55,255))
add(V,"AngelScope",124383569086781,rgb(34,87,181),rgb(145,207,255),rgb(255,255,255))
add(V,"HeavenlyScope",136726132031346,rgb(255,212,92),rgb(255,255,255),rgb(120,185,255))
add(V,"MoonlightScope",72779774935963,rgb(8,21,45),rgb(71,127,205),rgb(220,234,255))
add(V,"NebulaScope",89552795828568,rgb(194,31,255),rgb(18,223,255),rgb(121,51,232))
add(V,"BlackChainsScope",71691975025595,rgb(8,8,11),rgb(169,169,181),rgb(255,255,255))
add(V,"CyberScope",133896069405310,rgb(0,85,255),rgb(0,229,255),rgb(160,32,240))
add(V,"RetrofantasyScope",80473799883435,rgb(133,91,255),rgb(255,130,210),rgb(255,198,107))
add(V,"DarkPurpleScope",134774749406354,rgb(22,0,31),rgb(82,0,128),rgb(160,32,240))
add(V,"BubblegumScope",93260110013377,rgb(255,0,140),rgb(255,115,203),rgb(255,255,255))
add(V,"RainbowCloudScope",74365710518249,rgb(255,48,48),rgb(255,223,0),rgb(39,237,100),rgb(35,138,255),rgb(162,44,255))
add(V,"GasolineScope",74498204052075,rgb(255,49,200),rgb(122,24,255),rgb(0,217,255),rgb(255,146,75))
add(V,"FutigerAeroScope",118255991818587,rgb(0,107,255),rgb(56,207,255),rgb(255,255,255),rgb(124,230,92))
add(V,"RubyScope",72964570850620,rgb(255,16,31),rgb(128,0,16),rgb(17,24,39),rgb(192,202,216))
add(V,"LightScope",102549210371348,rgb(201,151,72),rgb(248,228,162),rgb(255,249,218),rgb(248,228,162),rgb(201,151,72))
add(V,"Xchampulsescope",102825288638476,rgb(120,0,0),rgb(255,16,31),rgb(255,48,48),rgb(255,16,31),rgb(120,0,0))

-- ALL 5 GINGERSCOPES

add(G,"Pink Sci-Fi",117227915790509,rgb(255,20,147),rgb(255,105,210),rgb(255,255,255),rgb(255,105,210),rgb(255,20,147))
add(G,"Blue Sci-Fi",128592793058217,rgb(0,59,255),rgb(0,140,255),rgb(200,245,255),rgb(0,140,255),rgb(0,59,255))
add(G,"Championscope",107417008695054,rgb(21,0,0),rgb(160,0,0),rgb(255,16,16),rgb(160,0,0),rgb(21,0,0))
add(G,"Beastscope",100126583443070,rgb(36,0,71),rgb(101,0,184),rgb(160,32,240),rgb(101,0,184),rgb(36,0,71))
add(G,"Kittyscope",138130527508034,rgb(255,74,168),rgb(255,182,223),rgb(255,255,255),rgb(255,182,223),rgb(255,74,168))

-- COLOR GRADIENTS

local function sequence(colors)
    local pts={}
    for i,c in ipairs(colors) do
        pts[i]=ColorSequenceKeypoint.new(
            (i-1)/math.max(#colors-1,1),c
        )
    end
    return ColorSequence.new(pts)
end

local chosen={[V]=nil,[G]=nil}
local selectedCategory=V
local alpha=0
local fxColor=rgb(170,75,255)
local originals={}
local alphaOriginal={}
local beamOriginal={}
local fxObjects={}
local trackedGun=nil
local statusLabels={}

local flags={
    Glow=false,Sparkles=false,Fire=false,
    Smoke=false,Light=false,SpotLight=false,
    SurfaceLight=false,Outline=false,Fill=false,
    Rainbow=false,Pulse=false,Particles=false,
    Trail=false,Beam=false
}

-- GUN DETECTION

local function equipped()
    local char=me.Character
    if not char then return nil end
    for _,x in ipairs(char:GetChildren()) do
        if x:IsA("Tool") then return x end
    end
end

local function categoryOf(g)
    local x=g
    while x do
        local n=x.Name:lower()
        if n:find("ginger",1,true) then return G end
        if n:find("void",1,true) then return V end
        x=x.Parent
    end
    local tool=equipped()
    if tool then
        local n=tool.Name:lower()
        if n:find("ginger",1,true) then return G end
        if n:find("void",1,true) then return V end
    end
    return selectedCategory
end

local function active()
    local char=me.Character
    if not char then return nil end
    local tool=equipped()

    if tool then
        local d=tool:FindFirstChild("GunDisplay",true)
        if d then return d end
    end

    for _,x in ipairs(char:GetDescendants()) do
        if x:IsA("ObjectValue")
            and x.Name:lower()=="displayrefgun"
            and x.Value then
            return x.Value
        end
    end

    local d=char:FindFirstChild("GunDisplay",true)
    if d then return d end

    local cam=W.CurrentCamera
    if cam then
        local c=cam:FindFirstChild("GunDisplay",true)
        if c then return c end
    end
    return tool
end

local function candidates()
    local out,seen={},{}
    local function addCandidate(x)
        if x and not seen[x] then
            seen[x]=true
            out[#out+1]=x
        end
    end

    local char=me.Character
    local bag=me:FindFirstChildOfClass("Backpack")
    local cam=W.CurrentCamera

    for _,root in ipairs({char,bag,cam}) do
        if root then
            for _,x in ipairs(root:GetDescendants()) do
                local n=x.Name:lower()
                if (x:IsA("Tool") or x:IsA("Model")
                    or x:IsA("BasePart"))
                    and (n=="gundisplay" or n=="gun"
                    or n:find("voidscope",1,true)
                    or n:find("gingerscope",1,true)) then
                    addCandidate(x)
                end

                if x:IsA("ObjectValue")
                    and n=="displayrefgun" then
                    addCandidate(x.Value)
                end
            end
        end
    end
    addCandidate(active())
    return out
end

local function partOf(g)
    if not g then return nil end
    if g:IsA("BasePart") then return g end

    for _,n in ipairs({
        "Handle","Barrel","Body","Main","Gun","Muzzle"
    }) do
        local p=g:FindFirstChild(n,true)
        if p and p:IsA("BasePart") then return p end
    end
    return g:FindFirstChildWhichIsA("BasePart",true)
end

local function texprop(x)
    if x:IsA("MeshPart") then return "TextureID" end
    if x:IsA("SpecialMesh") then return "TextureId" end
    if x:IsA("SurfaceAppearance") then return "ColorMap" end
    if x:IsA("Decal") or x:IsA("Texture") then
        return "Texture"
    end
end

-- RESTORE ORIGINAL APPEARANCE

local function restoreTexture()
    for x,d in pairs(originals) do
        pcall(function()
            if x.Parent then x[d[1]]=d[2] end
        end)
    end
    table.clear(originals)
end

local function restoreAlpha()
    for x,v in pairs(alphaOriginal) do
        pcall(function()
            if x.Parent then
                x.LocalTransparencyModifier=v
            end
        end)
    end
    table.clear(alphaOriginal)
end

local function restoreBeams()
    for x,v in pairs(beamOriginal) do
        pcall(function()
            if x.Parent then x.Color=v end
        end)
    end
    table.clear(beamOriginal)
end

local function scopeFor(g)
    return chosen[categoryOf(g)]
end

-- TEXTURE REPLACEMENT

local function applyTextures()
    local seen={}
    local count=0

    for _,g in ipairs(candidates()) do
        local s=scopeFor(g)

        local function visit(x)
            if seen[x] then return end
            seen[x]=true

            if x:IsA("BasePart") then
                if alphaOriginal[x]==nil then
                    alphaOriginal[x]=x.LocalTransparencyModifier
                end
                pcall(function()
                    x.LocalTransparencyModifier=alpha
                end)
            end

            local p=texprop(x)
            if p and s then
                local ok,val=pcall(function()
                    return x[p]
                end)

                if ok and type(val)=="string" then
                    if not originals[x] then
                        originals[x]={p,val}
                    end
                    if pcall(function()
                        x[p]="rbxassetid://"..s.id
                    end) then
                        count+=1
                    end
                end
            end
        end

        visit(g)
        for _,x in ipairs(g:GetDescendants()) do
            visit(x)
        end
    end

    for k,label in pairs(statusLabels) do
        local s=chosen[k]
        label.Text="Texture objects: "..count
            .." | "..(s and s.name or "None")
    end
end

-- BEAM COLOR FIX
-- Effects palette cannot overwrite scope gradients.

local function isBeam(x)
    return x:IsA("Beam")
        or x:IsA("Trail")
        or x:IsA("ParticleEmitter")
end

local function colorBeam(x,g)
    local s=scopeFor(g)
    if not s or not isBeam(x) then return end

    if beamOriginal[x]==nil then
        local ok,v=pcall(function()
            return x.Color
        end)
        if ok then beamOriginal[x]=v end
    end

    pcall(function()
        x.Color=sequence(s.colors)
    end)
end

local function recolorBeams()
    local seen={}
    for _,g in ipairs(candidates()) do
        for _,x in ipairs(g:GetDescendants()) do
            if not seen[x] and isBeam(x) then
                seen[x]=true
                colorBeam(x,g)
            end
        end
    end
end

-- EFFECTS ENGINE

local function clearFX()
    for _,x in ipairs(fxObjects) do
        pcall(function() x:Destroy() end)
    end
    table.clear(fxObjects)
end

local function fx(class,parent,props)
    local x=Instance.new(class)
    for k,v in pairs(props or {}) do
        pcall(function() x[k]=v end)
    end
    x.Parent=parent
    fxObjects[#fxObjects+1]=x
    return x
end

local function fxColorNow()
    if flags.Rainbow then
        return Color3.fromHSV(
            (os.clock()*.15)%1,1,1
        )
    end
    return fxColor
end

local trailOffset=CFrame.new(0,0,-.5)

local function buildFX()
    clearFX()

    local gun=active()
    local handle=partOf(gun)
    if not handle then return end

    local c=fxColorNow()
    local s=scopeFor(gun)
    local grad=s and sequence(s.colors)
        or ColorSequence.new(c)

    if flags.Glow or flags.Light
        or flags.Rainbow or flags.Pulse then
        fx("PointLight",handle,{
            Color=c,Brightness=3,Range=15
        })
    end

    if flags.SpotLight then
        fx("SpotLight",handle,{
            Color=c,Brightness=3,
            Range=20,Angle=75
        })
    end

    if flags.SurfaceLight then
        fx("SurfaceLight",handle,{
            Color=c,Brightness=3,Range=15
        })
    end

    if flags.Sparkles then
        fx("Sparkles",handle,{
            SparkleColor=c
        })
    end

    if flags.Fire then
        fx("Fire",handle,{
            Color=c,SecondaryColor=c,
            Size=3,Heat=5
        })
    end

    if flags.Smoke then
        fx("Smoke",handle,{
            Color=c,Size=2,
            Opacity=.35,RiseVelocity=2
        })
    end

    if flags.Outline or flags.Fill then
        fx("Highlight",gun,{
            Adornee=gun,
            OutlineColor=c,
            FillColor=c,
            OutlineTransparency=flags.Outline and 0 or 1,
            FillTransparency=flags.Fill and .6 or 1
        })
    end

    if flags.Particles then
        fx("ParticleEmitter",handle,{
            Color=grad,
            Rate=18,
            Speed=NumberRange.new(1,4),
            Lifetime=NumberRange.new(.2,.5),
            Size=NumberSequence.new(.22),
            LightEmission=1
        })
    end

    if flags.Trail or flags.Beam then
        local a=fx("Attachment",handle,{
            CFrame=trailOffset*CFrame.new(0,.15,0)
        })
        local b=fx("Attachment",handle,{
            CFrame=trailOffset*CFrame.new(0,-.15,0)
        })

        if flags.Trail then
            fx("Trail",handle,{
                Attachment0=a,
                Attachment1=b,
                Color=grad,
                Lifetime=.4,
                LightEmission=1,
                FaceCamera=true,
                MinLength=.01
            })
        end

        if flags.Beam then
            local e=fx("Attachment",handle,{
                CFrame=trailOffset*CFrame.new(0,0,-3)
            })

            fx("Beam",handle,{
                Attachment0=a,
                Attachment1=e,
                Color=grad,
                Width0=.2,
                Width1=.04,
                FaceCamera=true,
                LightEmission=1
            })
        end
    end
end

local function applyScope(k,s)
    chosen[k]=s
    selectedCategory=k
    restoreTexture()
    restoreBeams()
    applyTextures()
    recolorBeams()
    buildFX()
end

-- UI

local function ui(class,parent,props)
    local x=Instance.new(class)
    for k,v in pairs(props or {}) do
        x[k]=v
    end
    x.Parent=parent
    return x
end

local function round(x,r)
    ui("UICorner",x,{
        CornerRadius=UDim.new(0,r or 8)
    })
end

local function edge(x,c,t)
    return ui("UIStroke",x,{
        Color=c,Thickness=t or 1
    })
end

local bg=rgb(12,10,20)
local surface=rgb(25,20,39)
local purple=rgb(151,73,238)
local white=rgb(246,241,255)
local muted=rgb(174,161,195)

local gui=ui("ScreenGui",pg,{
    Name="ZyiksRecolorV28_2",
    ResetOnSpawn=false,
    IgnoreGuiInset=true,
    DisplayOrder=250,
    ZIndexBehavior=Enum.ZIndexBehavior.Sibling
})

local launch=ui("TextButton",gui,{
    Size=UDim2.fromOffset(160,46),
    Position=UDim2.new(0,22,.45,0),
    BackgroundColor3=surface,
    Text="✦ ZYIKS",
    TextColor3=white,
    Font=Enum.Font.GothamBlack,
    TextSize=17,
    BorderSizePixel=0
})
round(launch,13)
local launchEdge=edge(launch,purple,2)

local main=ui("Frame",gui,{
    Size=UDim2.fromOffset(600,400),
    AnchorPoint=Vector2.new(.5,.5),
    Position=UDim2.fromScale(.5,.5),
    BackgroundColor3=bg,
    Visible=false,
    BorderSizePixel=0,
    ClipsDescendants=true
})
round(main,15)
local mainEdge=edge(main,purple,1.5)

local scale=ui("UIScale",main,{Scale=1})

local function fit()
    local cam=W.CurrentCamera
    if cam then
        local v=cam.ViewportSize
        scale.Scale=math.min(
            1,(v.X-20)/600,(v.Y-30)/400
        )
    end
end

local head=ui("Frame",main,{
    Size=UDim2.new(1,0,0,49),
    BackgroundColor3=surface,
    BorderSizePixel=0
})

ui("TextLabel",head,{
    Size=UDim2.new(1,-110,1,0),
    Position=UDim2.fromOffset(17,0),
    BackgroundTransparency=1,
    Text="ZYIKS RECOLOR V28.2",
    TextColor3=white,
    Font=Enum.Font.GothamBlack,
    TextSize=19,
    TextXAlignment=Enum.TextXAlignment.Left
})

local close=ui("TextButton",head,{
    Size=UDim2.fromOffset(36,32),
    Position=UDim2.new(1,-44,0,8),
    BackgroundColor3=rgb(104,37,67),
    Text="X",
    TextColor3=white,
    Font=Enum.Font.GothamBlack,
    TextSize=22
})
round(close,8)

local side=ui("Frame",main,{
    Size=UDim2.fromOffset(143,340),
    Position=UDim2.fromOffset(9,55),
    BackgroundColor3=surface,
    BorderSizePixel=0
})
round(side,10)

local content=ui("Frame",main,{
    Size=UDim2.new(1,-167,1,-65),
    Position=UDim2.fromOffset(159,56),
    BackgroundTransparency=1
})

local pages={}
local tabButtons={}
local currentTab=V

local function showTab(name)
    currentTab=name
    if name==V or name==G then
        selectedCategory=name
    end

    for n,p in pairs(pages) do
        p.Visible=n==name
        tabButtons[n].BackgroundColor3=
            n==name and purple or rgb(43,33,65)
    end
end

for i,name in ipairs({
    V,G,"Effects","Theme"
}) do
    local b=ui("TextButton",side,{
        Size=UDim2.new(1,-14,0,39),
        Position=UDim2.fromOffset(7,8+(i-1)*45),
        BackgroundColor3=rgb(43,33,65),
        Text=name,
        TextColor3=white,
        Font=Enum.Font.GothamBold,
        TextSize=12
    })
    round(b,9)
    tabButtons[name]=b

    pages[name]=ui("Frame",content,{
        Size=UDim2.fromScale(1,1),
        BackgroundTransparency=1,
        Visible=name==V
    })

    listen(b.Activated,function()
        showTab(name)
        applyTextures()
        recolorBeams()
        buildFX()
    end)
end

local alphaLabels={}

local function makeScopePage(kind)
    local page=pages[kind]

    local search=ui("TextBox",page,{
        Size=UDim2.new(1,-12,0,34),
        Position=UDim2.fromOffset(5,4),
        BackgroundColor3=surface,
        Text="",
        PlaceholderText="Search "..kind.."...",
        TextColor3=white,
        PlaceholderColor3=muted,
        Font=Enum.Font.GothamBold,
        TextSize=13,
        ClearTextOnFocus=false
    })
    round(search,8)

    local list=ui("ScrollingFrame",page,{
        Size=UDim2.new(1,-12,1,-112),
        Position=UDim2.fromOffset(5,43),
        BackgroundTransparency=1,
        BorderSizePixel=0,
        ScrollBarThickness=4,
        AutomaticCanvasSize=Enum.AutomaticSize.Y,
        CanvasSize=UDim2.fromOffset(0,0)
    })

    ui("UIListLayout",list,{
        Padding=UDim.new(0,5),
        SortOrder=Enum.SortOrder.LayoutOrder
    })

    local buttons={}

    for i,s in ipairs(skins[kind]) do
        local b=ui("TextButton",list,{
            Size=UDim2.new(1,-5,0,34),
            BackgroundColor3=rgb(44,35,66),
            Text=s.name,
            TextColor3=white,
            Font=Enum.Font.GothamBold,
            TextSize=13,
            LayoutOrder=i
        })
        round(b,8)
        buttons[s]=b

        listen(b.Activated,function()
            applyScope(kind,s)
            for sk,btn in pairs(buttons) do
                btn.BackgroundColor3=
                    sk==s and purple or rgb(44,35,66)
            end
        end)
    end

    listen(search:GetPropertyChangedSignal("Text"),function()
        local q=search.Text:lower()
        for s,b in pairs(buttons) do
            b.Visible=q==""
                or s.name:lower():find(q,1,true)~=nil
        end
    end)

    statusLabels[kind]=ui("TextLabel",page,{
        Size=UDim2.new(1,-12,0,20),
        Position=UDim2.new(0,5,1,-67),
        BackgroundTransparency=1,
        Text="Select a scope",
        TextColor3=muted,
        Font=Enum.Font.Gotham,
        TextSize=11,
        TextXAlignment=Enum.TextXAlignment.Left
    })

    local minus=ui("TextButton",page,{
        Size=UDim2.fromOffset(40,32),
        Position=UDim2.new(0,5,1,-41),
        BackgroundColor3=surface,
        Text="-",
        TextColor3=white,
        TextSize=20
    })
    round(minus,8)

    local atext=ui("TextLabel",page,{
        Size=UDim2.new(1,-104,0,32),
        Position=UDim2.new(0,52,1,-41),
        BackgroundTransparency=1,
        Text="Transparency: 0%",
        TextColor3=white,
        Font=Enum.Font.GothamBold,
        TextSize=12
    })
    table.insert(alphaLabels,atext)

    local plus=ui("TextButton",page,{
        Size=UDim2.fromOffset(40,32),
        Position=UDim2.new(1,-45,1,-41),
        BackgroundColor3=surface,
        Text="+",
        TextColor3=white,
        TextSize=20
    })
    round(plus,8)

    local function change(v)
        alpha=math.clamp(v,0,1)
        for _,label in ipairs(alphaLabels) do
            label.Text="Transparency: "
                ..math.floor(alpha*100+.5).."%"
        end
        applyTextures()
    end

    listen(minus.Activated,function()
        change(alpha-.05)
    end)
    listen(plus.Activated,function()
        change(alpha+.05)
    end)
end

makeScopePage(V)
makeScopePage(G)

-- EFFECTS PAGE

local elist=ui("ScrollingFrame",pages.Effects,{
    Size=UDim2.new(1,-10,1,-8),
    Position=UDim2.fromOffset(5,4),
    BackgroundTransparency=1,
    BorderSizePixel=0,
    ScrollBarThickness=4,
    AutomaticCanvasSize=Enum.AutomaticSize.Y,
    CanvasSize=UDim2.fromOffset(0,0)
})

ui("UIListLayout",elist,{
    Padding=UDim.new(0,6),
    SortOrder=Enum.SortOrder.LayoutOrder
})

local defs={
    {"Glow","Glow"},
    {"Sparkles","Sparkles"},
    {"Fire","Fire"},
    {"Smoke","Smoke"},
    {"Point Light","Light"},
    {"Spot Light","SpotLight"},
    {"Surface Light","SurfaceLight"},
    {"Outline","Outline"},
    {"Highlight Fill","Fill"},
    {"Rainbow RGB","Rainbow"},
    {"Pulse Glow","Pulse"},
    {"Particles","Particles"},
    {"Gun Trail","Trail"},
    {"Beam","Beam"}
}

for i,d in ipairs(defs) do
    local label,key=d[1],d[2]

    local b=ui("TextButton",elist,{
        Size=UDim2.new(1,-6,0,34),
        BackgroundColor3=surface,
        Text=label.." : OFF",
        TextColor3=white,
        Font=Enum.Font.GothamBold,
        TextSize=13,
        LayoutOrder=i
    })
    round(b,8)

    listen(b.Activated,function()
        flags[key]=not flags[key]
        b.Text=label..(flags[key] and " : ON" or " : OFF")
        b.BackgroundColor3=flags[key] and purple or surface
        buildFX()
    end)
end

-- EFFECT COLOR PALETTE

local palette=ui("Frame",elist,{
    Size=UDim2.new(1,-6,0,76),
    BackgroundTransparency=1,
    LayoutOrder=20
})

ui("UIGridLayout",palette,{
    CellSize=UDim2.new(1/6,-7,0,32),
    CellPadding=UDim2.fromOffset(5,5)
})

for _,c in ipairs({
    rgb(170,75,255),rgb(255,25,50),
    rgb(40,160,255),rgb(40,240,100),
    rgb(255,210,40),rgb(255,255,255),
    rgb(255,65,190),rgb(0,240,225),
    rgb(255,130,30),rgb(20,20,25),
    rgb(180,180,190),rgb(100,45,255)
}) do
    local b=ui("TextButton",palette,{
        BackgroundColor3=c,
        Text=""
    })
    round(b,6)

    listen(b.Activated,function()
        fxColor=c
        buildFX()
    end)
end

-- MOVE TRAIL RED DOT

local placing=false
local previewPart=nil
local previewOffset=nil

local dot=ui("Part",W,{
    Name="ZyiksTrailPlacementDot",
    Shape=Enum.PartType.Ball,
    Size=Vector3.new(.22,.22,.22),
    Color=rgb(255,0,0),
    Material=Enum.Material.Neon,
    Anchored=true,
    CanCollide=false,
    CanTouch=false,
    CanQuery=false,
    Transparency=1
})

local dotLight=ui("PointLight",dot,{
    Color=rgb(255,0,0),
    Brightness=2,
    Range=4,
    Enabled=false
})

local function fxButton(text,order,c)
    local b=ui("TextButton",elist,{
        Size=UDim2.new(1,-6,0,36),
        BackgroundColor3=c or surface,
        Text=text,
        TextColor3=white,
        Font=Enum.Font.GothamBold,
        TextSize=13,
        LayoutOrder=order
    })
    round(b,8)
    return b
end

local moveButton=fxButton(
    "MOVE TRAIL",21,rgb(95,42,164)
)
local confirmButton=fxButton(
    "CONFIRM POSITION",22,rgb(35,140,80)
)
local cancelButton=fxButton(
    "CANCEL",23,rgb(135,40,60)
)

local placementStatus=ui("TextLabel",elist,{
    Size=UDim2.new(1,-6,0,42),
    BackgroundTransparency=1,
    Text="Press Move Trail to reposition.",
    TextColor3=muted,
    Font=Enum.Font.Gotham,
    TextSize=12,
    TextWrapped=true,
    LayoutOrder=24
})

local function updatePlacement()
    moveButton.Text=placing
        and "SELECT POSITION ON GUN"
        or "MOVE TRAIL"

    confirmButton.Visible=placing
    cancelButton.Visible=placing

    placementStatus.Text=placing
        and (previewOffset
            and "Red dot ready. Confirm or reposition."
            or "Tap the desired position on your gun.")
        or "Press Move Trail to reposition."
end

local function cancelPlacement()
    placing=false
    previewPart=nil
    previewOffset=nil
    dot.Transparency=1
    dotLight.Enabled=false
    updatePlacement()
end

local function confirmPlacement()
    local base=partOf(active())

    if not base or not previewPart
        or not previewOffset then
        placementStatus.Text=
            "Equip gun and choose a position first."
        return
    end

    trailOffset=base.CFrame:ToObjectSpace(
        previewPart.CFrame*previewOffset
    )

    cancelPlacement()
    buildFX()
end

local function choosePosition(p)
    local gun=active()
    local part=partOf(gun)
    local camera=W.CurrentCamera

    if not gun or not part or not camera then
        placementStatus.Text="Equip your gun first."
        return
    end

    local ray=camera:ViewportPointToRay(p.X,p.Y)
    local params=RaycastParams.new()
    params.FilterType=Enum.RaycastFilterType.Include
    params.FilterDescendantsInstances={gun}

    local hit=W:Raycast(
        ray.Origin,ray.Direction*1000,params
    )

    local reference=part
    local position

    if hit and hit.Instance:IsA("BasePart") then
        reference=hit.Instance
        position=hit.Position
    else
        local normal=camera.CFrame.LookVector
        local denom=ray.Direction:Dot(normal)
        if math.abs(denom)<.0001 then return end

        local distance=
            (part.Position-ray.Origin):Dot(normal)/denom

        if distance<=0 then return end
        position=ray.Origin+ray.Direction*distance
    end

    previewPart=reference
    previewOffset=reference.CFrame:ToObjectSpace(
        CFrame.new(position)
    )

    dot.Transparency=0
    dotLight.Enabled=true
    updatePlacement()
end

listen(moveButton.Activated,function()
    placing=true
    previewPart=nil
    previewOffset=nil
    updatePlacement()
end)

listen(confirmButton.Activated,confirmPlacement)
listen(cancelButton.Activated,cancelPlacement)
updatePlacement()

listen(U.InputBegan,function(input)
    if not placing then return end
    if input.UserInputType~=Enum.UserInputType.MouseButton1
        and input.UserInputType~=Enum.UserInputType.Touch then
        return
    end

    local p=input.Position
    local pp=main.AbsolutePosition
    local ps=main.AbsoluteSize

    if main.Visible
        and p.X>=pp.X and p.X<=pp.X+ps.X
        and p.Y>=pp.Y and p.Y<=pp.Y+ps.Y then
        return
    end

    choosePosition(p)
end)

-- THEMES

for i,t in ipairs({
    {"Purple",rgb(151,73,238)},
    {"Red",rgb(225,50,75)},
    {"Blue",rgb(50,125,245)},
    {"Pink",rgb(235,65,175)},
    {"Green",rgb(40,205,125)}
}) do
    local b=ui("TextButton",pages.Theme,{
        Size=UDim2.new(1,-15,0,44),
        Position=UDim2.fromOffset(7,7+(i-1)*51),
        BackgroundColor3=t[2],
        Text=t[1].." Theme",
        TextColor3=white,
        Font=Enum.Font.GothamBlack,
        TextSize=14
    })
    round(b,9)

    listen(b.Activated,function()
        purple=t[2]
        launchEdge.Color=purple
        mainEdge.Color=purple
        showTab(currentTab)
    end)
end

-- OPEN / CLOSE

local function show(v)
    main.Visible=v
    launch.Visible=not v
    if v then fit() end
end

listen(launch.Activated,function()
    show(true)
end)

listen(close.Activated,function()
    show(false)
end)

-- DRAGGABLE UI

local function drag(target,handle)
    local down=false
    local pos,start,touch

    listen(handle.InputBegan,function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1
            or i.UserInputType==Enum.UserInputType.Touch then
            down=true
            pos=i.Position
            start=target.Position
            touch=i
        end
    end)

    listen(U.InputChanged,function(i)
        if not down then return end
        if i.UserInputType~=Enum.UserInputType.MouseMovement
            and i~=touch then return end

        local d=i.Position-pos
        target.Position=UDim2.new(
            start.X.Scale,start.X.Offset+d.X,
            start.Y.Scale,start.Y.Offset+d.Y
        )
    end)

    listen(U.InputEnded,function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1
            or i==touch then
            down=false
        end
    end)
end

drag(main,head)

listen(U.InputBegan,function(i,gp)
    if gp then return end
    if i.KeyCode==Enum.KeyCode.RightShift
        or i.KeyCode==Enum.KeyCode.ButtonY then
        show(not main.Visible)
    elseif i.KeyCode==Enum.KeyCode.ButtonB
        and main.Visible then
        show(false)
    end
end)

-- DETECT NEW BEAMS

listen(W.DescendantAdded,function(x)
    if not alive or not isBeam(x) then return end

    task.defer(function()
        if not alive or not x.Parent then return end

        for _,g in ipairs(candidates()) do
            if x:IsDescendantOf(g) then
                colorBeam(x,g)
                break
            end
        end
    end)
end)

-- MAIN UPDATE LOOP

local elapsed=0
local animate=0

listen(R.Heartbeat,function(dt)
    if not alive then return end

    elapsed+=dt
    animate+=dt

    if elapsed>.55 then
        elapsed=0
        local g=active()

        if g~=trackedGun then
            trackedGun=g
            trailOffset=CFrame.new(0,0,-.5)
            cancelPlacement()
            buildFX()
        end

        if chosen[V] or chosen[G] or alpha>0 then
            applyTextures()
            recolorBeams()
        end
    end

    if placing and previewPart and previewOffset
        and previewPart.Parent then
        dot.CFrame=previewPart.CFrame*previewOffset
        dot.Transparency=0
    else
        dot.Transparency=1
    end

    if animate>.08 then
        animate=0
        local c=fxColorNow()
        local brightness=flags.Pulse
            and (2.4+math.sin(os.clock()*5)*1.5)
            or 3

        for _,x in ipairs(fxObjects) do
            if x.Parent then
                pcall(function()
                    if x:IsA("PointLight")
                        or x:IsA("SpotLight")
                        or x:IsA("SurfaceLight") then
                        x.Color=c
                        x.Brightness=brightness

                    elseif x:IsA("Sparkles") then
                        x.SparkleColor=c

                    elseif x:IsA("Fire") then
                        x.Color=c
                        x.SecondaryColor=c

                    elseif x:IsA("Smoke") then
                        x.Color=c

                    elseif x:IsA("Highlight") then
                        x.OutlineColor=c
                        x.FillColor=c

                    elseif isBeam(x) then
                        local s=scopeFor(active())
                        x.Color=s and sequence(s.colors)
                            or ColorSequence.new(c)
                    end
                end)
            end
        end
    end
end)

listen(me.CharacterAdded,function()
    trackedGun=nil
    task.delay(.6,function()
        if alive then
            applyTextures()
            recolorBeams()
            buildFX()
        end
    end)
end)

-- CLEANUP

env.ZyiksRecolorCleanup=function()
    if not alive then return end
    alive=false

    restoreTexture()
    restoreAlpha()
    restoreBeams()
    clearFX()

    for _,c in ipairs(conns) do
        pcall(function() c:Disconnect() end)
    end

    pcall(function() dot:Destroy() end)
    pcall(function() gui:Destroy() end)
    env.ZyiksRecolorCleanup=nil
end

showTab(V)

print(
    "[ZYIKS RECOLOR V28.2] Loaded "
    ..#skins[V].." VoidScopes and "
    ..#skins[G].." GingerScopes"
)
