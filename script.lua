
-- ZYIKS RECOLOR V27 | client-side cosmetics
local P=game:GetService('Players'); local R=game:GetService('RunService'); local U=game:GetService('UserInputService'); local W=game:GetService('Workspace')
local me=P.LocalPlayer; local pg=me:WaitForChild('PlayerGui'); local env=_G
pcall(function() if type(getgenv)=='function' then env=getgenv() end end)
if type(env.ZyiksRecolorCleanup)=='function' then pcall(env.ZyiksRecolorCleanup) end
local old=pg:FindFirstChild('ZyiksRecolorV27'); if old then old:Destroy() end
local alive=true; local conns={}; local function listen(sig,fn) local c=sig:Connect(fn); conns[#conns+1]=c; return c end
local function rgb(r,g,b) return Color3.fromRGB(r,g,b) end
local function skin(n,id,...) return {name=n,id=tostring(id),colors={...}} end
local skins={
skin('Chrome Chains Scope',89011297789911,rgb(170,183,202),rgb(244,247,255),rgb(83,103,127)),
skin('ChromeScope',92721203897057,rgb(255,59,117),rgb(255,179,71),rgb(255,247,138),rgb(87,247,176),rgb(91,203,255),rgb(166,107,255),rgb(255,115,212)),
skin('Cherry Blossom Scope',71388376520884,rgb(255,134,183),rgb(255,225,237),rgb(201,138,255)),
skin('HackerScope',113547863710933,rgb(0,255,101),rgb(0,47,24),rgb(180,255,0)),
skin('RedScope',89421027141827,rgb(255,0,0),rgb(255,128,80),rgb(129,0,0)),
skin('YellowScope',118507091753068,rgb(255,245,0),rgb(255,153,0),rgb(255,251,176)),
skin('CoolScope',106349999686565,rgb(0,223,255),rgb(0,109,255),rgb(197,255,255)),
skin('PurpleScope',91431058867138,rgb(224,174,255),rgb(166,93,224),rgb(73,31,110)),
skin('WhiteScope',138494542305273,rgb(255,255,255),rgb(188,223,255),rgb(228,228,255)),
skin('PurpleBlackHoleScope',100593936768139,rgb(23,0,36),rgb(158,0,255),rgb(0,0,0)),
skin('OrangeScope',96701056575304,rgb(255,106,0),rgb(255,208,0),rgb(255,49,0)),
skin('RoseScope',98671498958418,rgb(255,112,176),rgb(255,224,237),rgb(200,90,152)),
skin('RealVoidScope',138251909648943,rgb(126,54,255),rgb(226,170,255),rgb(49,16,111)),
skin('Blood Moon Scope',77829814616900,rgb(255,22,22),rgb(69,0,0),rgb(255,107,61)),
skin('Cotton Candy Galaxy Scope',89525299941655,rgb(255,138,212),rgb(156,117,255),rgb(116,230,255)),
skin('Abyssal Lightning Scope',87564917363234,rgb(0,234,255),rgb(113,45,255),rgb(4,21,78)),
skin('Frozen Crystal Scope',83555779459860,rgb(255,255,255),rgb(123,220,255),rgb(44,124,255)),
skin('Toxic Slime Scope',135405854735405,rgb(197,255,0),rgb(0,230,83),rgb(30,104,0)),
skin('Rose Gold Scope',96017056259067,rgb(255,187,172),rgb(255,224,161),rgb(215,124,156)),
skin('GreenScope',107785539336433,rgb(0,255,90),rgb(190,255,0),rgb(0,100,55)),
skin('CherryScope',116967488721010,rgb(255,183,210),rgb(255,225,238),rgb(255,115,175)),
skin('HotPinkScope',109569323795920,rgb(255,20,147),rgb(255,105,180),rgb(199,21,133)),
skin('BlueScope',137458554478558,rgb(0,100,255),rgb(0,190,255),rgb(10,25,125)),
skin('CyanScope',118198204691185,rgb(0,255,255),rgb(120,255,245),rgb(0,120,150)),
skin('SpiderScope',106127693338329,rgb(101,0,0),rgb(240,25,41),rgb(18,9,12)),
skin('HalloweenScope',78855076452029,rgb(255,121,0),rgb(140,32,232),rgb(255,177,43)),
skin('ChristmasScope',70567062837178,rgb(217,0,24),rgb(255,255,255),rgb(157,0,24)),
skin('AmericaScope',134320447853136,rgb(215,25,56),rgb(255,255,255),rgb(23,78,166)),
skin('GoldScope',90285221313816,rgb(166,91,0),rgb(255,224,122),rgb(255,174,0)),
skin('GojoScope',118373398983463,rgb(52,0,92),rgb(187,63,255),rgb(240,198,255)),
skin('GoldDiamondScope',137217613360948,rgb(217,154,0),rgb(255,255,255),rgb(255,215,106)),
skin('CrimsonScope',105062792534372,rgb(82,0,11),rgb(220,20,60),rgb(255,82,104)),
skin('LavaScope',116410139676399,rgb(181,0,0),rgb(255,69,0),rgb(255,208,0)),
skin('MeiMeiScope',128578646191684,rgb(255,255,255),rgb(174,181,192),rgb(32,35,43)),
skin('LadybugScope',81799898172130,rgb(255,32,44),rgb(181,0,22),rgb(18,9,12)),
skin('AutumnScope',111008837768377,rgb(214,90,18),rgb(184,115,51),rgb(230,173,85)),
skin('PinkDragonScope',115729260393472,rgb(255,54,213),rgb(165,44,222),rgb(255,255,255)),
skin('WoodScope',137395201108472,rgb(74,36,21),rgb(150,81,45),rgb(200,132,78)),
skin('GlassScope',120196396881002,rgb(245,252,255),rgb(201,217,223),rgb(255,255,255)),
skin('GraveyardScope',94822780469065,rgb(36,17,51),rgb(167,123,217),rgb(241,232,255)),
skin('PurpleVortexScope',128233143427951,rgb(23,6,34),rgb(139,25,255),rgb(193,122,255)),
skin('WhiteVortexScope',73369779872481,rgb(8,8,12),rgb(174,178,191),rgb(255,255,255)),
skin('CosmicScope',139394822253711,rgb(41,16,94),rgb(136,81,245),rgb(244,238,255)),
skin('ChainedGalaxyScope',139286523160275,rgb(16,18,79),rgb(25,124,255),rgb(163,55,255)),
skin('AngelScope',124383569086781,rgb(34,87,181),rgb(145,207,255),rgb(255,255,255)),
skin('HeavenlyScope',136726132031346,rgb(255,212,92),rgb(255,255,255),rgb(120,185,255)),
skin('MoonlightScope',72779774935963,rgb(8,21,45),rgb(71,127,205),rgb(220,234,255)),
skin('NebulaScope',89552795828568,rgb(194,31,255),rgb(18,223,255),rgb(121,51,232)),
skin('BlackChainsScope',71691975025595,rgb(8,8,11),rgb(169,169,181),rgb(255,255,255)),
skin('CyberScope',133896069405310,rgb(0,85,255),rgb(0,229,255),rgb(160,32,240)),
skin('RetrofantasyScope',80473799883435,rgb(133,91,255),rgb(255,130,210),rgb(255,198,107)),
skin('DarkPurpleScope',134774749406354,rgb(22,0,31),rgb(82,0,128),rgb(160,32,240)),
skin('BubblegumScope',93260110013377,rgb(255,0,140),rgb(255,115,203),rgb(255,255,255)),
skin('RainbowCloudScope',74365710518249,rgb(255,48,48),rgb(255,223,0),rgb(39,237,100),rgb(35,138,255),rgb(162,44,255)),
skin('GasolineScope',74498204052075,rgb(255,49,200),rgb(122,24,255),rgb(0,217,255),rgb(255,146,75)),
skin('FutigerAeroScope',118255991818587,rgb(0,107,255),rgb(56,207,255),rgb(255,255,255),rgb(124,230,92)),
skin('RubyScope',72964570850620,rgb(255,16,31),rgb(128,0,16),rgb(17,24,39),rgb(192,202,216)),
skin('LightScope',102549210371348,rgb(201,151,72),rgb(248,228,162),rgb(255,249,218),rgb(248,228,162),rgb(201,151,72)),
skin('Xchampulsescope',102825288638476,rgb(120,0,0),rgb(255,16,31),rgb(255,48,48),rgb(255,16,31),rgb(120,0,0))
}
local function sequence(colors)
    local points={}
    for i,c in ipairs(colors) do points[i]=ColorSequenceKeypoint.new((i-1)/math.max(1,#colors-1),c) end
    return ColorSequence.new(points)
end
local chosen=nil; local alpha=0; local fxColor=rgb(170,75,255); local original={}; local alphaOriginal={}; local beamOriginal={}
local flags={Glow=false,Sparkles=false,Fire=false,Smoke=false,Light=false,Outline=false,Fill=false,Rainbow=false,Pulse=false,Particles=false,Trail=false}
local effectObjects={}; local effectPart=nil; local status=nil; local foundCount=0; local currentGun=nil; local lastShot=0
local function gunName(n) n=n:lower():gsub('%s+',''); return n=='gun' or n=='gundisplay' or n:find('voidscope',1,true)~=nil end
local function candidates()
    local out={}; local seen={}
    local function add(x) if x and not seen[x] then seen[x]=true; out[#out+1]=x end end
    local char=me.Character; local bag=me:FindFirstChildOfClass('Backpack')
    for _,root in ipairs({char,bag}) do
        if root then
            if gunName(root.Name) then add(root) end
            for _,x in ipairs(root:GetDescendants()) do
                if (x:IsA('Tool') or x:IsA('Model') or x:IsA('BasePart')) and gunName(x.Name) then add(x) end
                if x:IsA('ObjectValue') and x.Name:lower()=='displayrefgun' then add(x.Value) end
            end
        end
    end
    if char then
        for _,x in ipairs(char:GetChildren()) do if x:IsA('Tool') then add(x) end end
    end
    return out
end
local function active()
    local char=me.Character; if not char then return nil end
    for _,x in ipairs(char:GetChildren()) do if x:IsA('Tool') and gunName(x.Name) then return x end end
    for _,x in ipairs(char:GetDescendants()) do if x:IsA('ObjectValue') and x.Name:lower()=='displayrefgun' and x.Value then return x.Value end end
    for _,x in ipairs(char:GetDescendants()) do if (x:IsA('Model') or x:IsA('BasePart')) and gunName(x.Name) then return x end end
    for _,x in ipairs(char:GetChildren()) do if x:IsA('Tool') then return x end end
end
local function partOf(g)
    if not g then return nil end
    if g:IsA('BasePart') then return g end
    for _,name in ipairs({'Handle','Barrel','Body','Main','Gun','Muzzle'}) do
        local p=g:FindFirstChild(name,true); if p and p:IsA('BasePart') then return p end
    end
    return g:FindFirstChildWhichIsA('BasePart',true)
end
local function texprop(x)
    if x:IsA('MeshPart') then return 'TextureID'
    elseif x:IsA('SpecialMesh') then return 'TextureId'
    elseif x:IsA('SurfaceAppearance') then return 'ColorMap'
    elseif x:IsA('Decal') or x:IsA('Texture') then return 'Texture' end
end
local function restoreTexture()
    for x,d in pairs(original) do pcall(function() x[d[1]]=d[2] end) end
    table.clear(original)
end
local function restoreAlpha()
    for x,v in pairs(alphaOriginal) do pcall(function() x.LocalTransparencyModifier=v end) end
    table.clear(alphaOriginal)
end
local function applyTextures()
    foundCount=0
    local touched={}
    local function visit(x)
        if touched[x] then return end
        touched[x]=true
        if x:IsA('BasePart') then
            if alphaOriginal[x]==nil then alphaOriginal[x]=x.LocalTransparencyModifier end
            pcall(function() x.LocalTransparencyModifier=alpha end)
        end
        local p=texprop(x)
        if p and chosen then
            local ok,value=pcall(function() return x[p] end)
            if ok and type(value)=='string' then
                if not original[x] then original[x]={p,value} end
                local success=pcall(function() x[p]='rbxassetid://'..chosen.id end)
                if success then foundCount=foundCount+1 end
            end
        end
    end
    for _,g in ipairs(candidates()) do
        visit(g)
        for _,x in ipairs(g:GetDescendants()) do visit(x) end
    end
    if status then status.Text='Texture objects: '..foundCount..' | '..(chosen and chosen.name or 'None') end
end
local function restoreBeams()
    for x,v in pairs(beamOriginal) do pcall(function() x.Color=v end) end
    table.clear(beamOriginal)
end
local function recolorBeams()
    if not chosen then return end
    for _,g in ipairs(candidates()) do
        for _,x in ipairs(g:GetDescendants()) do
            if x:IsA('Beam') or x:IsA('Trail') or x:IsA('ParticleEmitter') then
                if beamOriginal[x]==nil then beamOriginal[x]=x.Color end
                pcall(function() x.Color=sequence(chosen.colors) end)
            end
        end
    end
end
local function clearFX()
    for _,x in ipairs(effectObjects) do pcall(function() x:Destroy() end) end
    table.clear(effectObjects); effectPart=nil
end
local function fx(class,parent,props)
    local x=Instance.new(class)
    for k,v in pairs(props or {}) do pcall(function() x[k]=v end) end
    x.Parent=parent; effectObjects[#effectObjects+1]=x; return x
end
local function fxEnabled()
    for _,v in pairs(flags) do if v then return true end end
    return false
end
local function fxColorNow()
    if flags.Rainbow then return Color3.fromHSV((os.clock()*0.15)%1,1,1) end
    return fxColor
end
local function buildFX()
    clearFX()
    if not fxEnabled() then return end
    local gun=active(); local handle=partOf(gun); if not handle then return end
    effectPart=fx('Part',W,{Name='ZyiksInvisibleEffectPart',Size=Vector3.new(1,1,1),Transparency=1,Anchored=true,CanCollide=false,CanTouch=false,CanQuery=false,CastShadow=false,CFrame=handle.CFrame})
    local c=fxColorNow()
    if flags.Glow or flags.Light or flags.Rainbow or flags.Pulse then fx('PointLight',effectPart,{Name='ZyiksGlow',Color=c,Brightness=3,Range=15}) end
    if flags.Sparkles then fx('Sparkles',effectPart,{Name='ZyiksSparkles',SparkleColor=c,Enabled=true}) end
    if flags.Fire then fx('Fire',effectPart,{Name='ZyiksFire',Color=c,SecondaryColor=c,Size=3,Heat=5,Enabled=true}) end
    if flags.Smoke then fx('Smoke',effectPart,{Name='ZyiksSmoke',Color=c,Size=2,Opacity=0.35,RiseVelocity=2,Enabled=true}) end
    if flags.Outline or flags.Fill then fx('Highlight',effectPart,{Name='ZyiksHighlight',Adornee=effectPart,OutlineColor=c,FillColor=c,OutlineTransparency=flags.Outline and 0 or 1,FillTransparency=flags.Fill and 0.6 or 1,Enabled=true}) end
    if flags.Particles then fx('ParticleEmitter',effectPart,{Name='ZyiksParticles',Color=ColorSequence.new(c),Rate=18,Speed=NumberRange.new(1,4),Lifetime=NumberRange.new(0.2,0.5),Size=NumberSequence.new(0.22),LightEmission=1}) end
    if flags.Trail then
        local a=fx('Attachment',effectPart,{Position=Vector3.new(0,0.5,0)})
        local b=fx('Attachment',effectPart,{Position=Vector3.new(0,-0.5,0)})
        fx('Trail',effectPart,{Attachment0=a,Attachment1=b,Color=ColorSequence.new(c),Lifetime=0.35,LightEmission=1,Enabled=true})
    end
end
local function applyScope(s)
    restoreTexture(); restoreBeams(); chosen=s; applyTextures(); recolorBeams()
end
local function ui(class,parent,props)
    local x=Instance.new(class); for k,v in pairs(props or {}) do x[k]=v end; x.Parent=parent; return x
end
local function round(x,r) ui('UICorner',x,{CornerRadius=UDim.new(0,r)}) end
local function edge(x,c,t) return ui('UIStroke',x,{Color=c,Thickness=t or 1}) end
local bg=rgb(12,10,20); local surface=rgb(25,20,39); local purple=rgb(151,73,238); local white=rgb(246,241,255); local muted=rgb(174,161,195)
local gui=ui('ScreenGui',pg,{Name='ZyiksRecolorV27',ResetOnSpawn=false,IgnoreGuiInset=true,DisplayOrder=250,ZIndexBehavior=Enum.ZIndexBehavior.Sibling})
local launch=ui('TextButton',gui,{Size=UDim2.fromOffset(160,46),Position=UDim2.new(0,22,0.45,0),BackgroundColor3=surface,Text='✦  ZYIKS',TextColor3=white,Font=Enum.Font.GothamBlack,TextSize=17,BorderSizePixel=0})
round(launch,13); edge(launch,purple,2)
local main=ui('Frame',gui,{Size=UDim2.fromOffset(600,400),AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(.5,.5),BackgroundColor3=bg,Visible=false,BorderSizePixel=0,ClipsDescendants=true})
round(main,15); edge(main,purple,1.5)
local scale=ui('UIScale',main,{Scale=1})
local function fit()
    local camera=W.CurrentCamera; if not camera then return end
    local v=camera.ViewportSize; scale.Scale=math.min(1,(v.X-20)/600,(v.Y-30)/400)
end
local head=ui('Frame',main,{Size=UDim2.new(1,0,0,49),BackgroundColor3=surface,BorderSizePixel=0})
ui('TextLabel',head,{Size=UDim2.new(1,-110,1,0),Position=UDim2.fromOffset(17,0),BackgroundTransparency=1,Text='ZYIKS RECOLOR   V27',TextColor3=white,Font=Enum.Font.GothamBlack,TextSize=19,TextXAlignment=Enum.TextXAlignment.Left})
local close=ui('TextButton',head,{Size=UDim2.fromOffset(36,32),Position=UDim2.new(1,-44,0,8),BackgroundColor3=rgb(104,37,67),Text='×',TextColor3=white,Font=Enum.Font.GothamBlack,TextSize=22}); round(close,8)
local side=ui('Frame',main,{Size=UDim2.fromOffset(143,340),Position=UDim2.fromOffset(9,55),BackgroundColor3=surface,BorderSizePixel=0}); round(side,10)
local content=ui('Frame',main,{Size=UDim2.new(1,-167,1,-65),Position=UDim2.fromOffset(159,56),BackgroundTransparency=1})
local pages={}; local tabButtons={}
for i,name in ipairs({'Scopes','Effects','Theme'}) do
    local b=ui('TextButton',side,{Size=UDim2.new(1,-14,0,44),Position=UDim2.fromOffset(7,8+(i-1)*51),BackgroundColor3=rgb(43,33,65),Text=name,TextColor3=white,Font=Enum.Font.GothamBold,TextSize=14})
    round(b,9); tabButtons[name]=b
    pages[name]=ui('Frame',content,{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Visible=name=='Scopes'})
    listen(b.Activated,function()
        for n,p in pairs(pages) do p.Visible=n==name; tabButtons[n].BackgroundColor3=n==name and purple or rgb(43,33,65) end
    end)
end
tabButtons.Scopes.BackgroundColor3=purple
local search=ui('TextBox',pages.Scopes,{Size=UDim2.new(1,-12,0,34),Position=UDim2.fromOffset(5,4),BackgroundColor3=surface,Text='',PlaceholderText='Search all 59 scopes...',TextColor3=white,PlaceholderColor3=muted,Font=Enum.Font.GothamBold,TextSize=13,ClearTextOnFocus=false})
round(search,8)
local list=ui('ScrollingFrame',pages.Scopes,{Size=UDim2.new(1,-12,1,-112),Position=UDim2.fromOffset(5,43),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=4,AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.fromOffset(0,0)})
ui('UIListLayout',list,{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder})
local scopeButtons={}
for i,s in ipairs(skins) do
    local b=ui('TextButton',list,{Size=UDim2.new(1,-5,0,34),BackgroundColor3=rgb(44,35,66),Text=s.name,TextColor3=white,Font=Enum.Font.GothamBold,TextSize=13,LayoutOrder=i})
    round(b,8); scopeButtons[s]=b
    listen(b.Activated,function()
        applyScope(s)
        for sk,btn in pairs(scopeButtons) do btn.BackgroundColor3=sk==s and purple or rgb(44,35,66) end
    end)
end
listen(search:GetPropertyChangedSignal('Text'),function()
    local q=search.Text:lower()
    for s,b in pairs(scopeButtons) do b.Visible=q=='' or s.name:lower():find(q,1,true)~=nil end
end)
status=ui('TextLabel',pages.Scopes,{Size=UDim2.new(1,-12,0,20),Position=UDim2.new(0,5,1,-67),BackgroundTransparency=1,Text='Texture objects: 0 | Select a scope',TextColor3=muted,Font=Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left})
local minus=ui('TextButton',pages.Scopes,{Size=UDim2.fromOffset(40,32),Position=UDim2.new(0,5,1,-41),BackgroundColor3=surface,Text='-',TextColor3=white,TextSize=20}); round(minus,8)
local atext=ui('TextLabel',pages.Scopes,{Size=UDim2.new(1,-104,0,32),Position=UDim2.new(0,52,1,-41),BackgroundTransparency=1,Text='Transparency: 0%',TextColor3=white,Font=Enum.Font.GothamBold,TextSize=12})
local plus=ui('TextButton',pages.Scopes,{Size=UDim2.fromOffset(40,32),Position=UDim2.new(1,-45,1,-41),BackgroundColor3=surface,Text='+',TextColor3=white,TextSize=20}); round(plus,8)
local function changeAlpha(v) alpha=math.clamp(v,0,1); atext.Text='Transparency: '..math.floor(alpha*100+.5)..'%'; applyTextures() end
listen(minus.Activated,function() changeAlpha(alpha-.05) end)
listen(plus.Activated,function() changeAlpha(alpha+.05) end)
local elist=ui('ScrollingFrame',pages.Effects,{Size=UDim2.new(1,-10,1,-8),Position=UDim2.fromOffset(5,4),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=4,AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.fromOffset(0,0)})
ui('UIListLayout',elist,{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder})
local defs={{'Glow','Glow'},{'Sparkles','Sparkles'},{'Fire','Fire'},{'Smoke','Smoke'},{'Point Light','Light'},{'Outline','Outline'},{'Highlight Fill','Fill'},{'Rainbow RGB','Rainbow'},{'Pulse Glow','Pulse'},{'Particles','Particles'},{'Gun Trail','Trail'}}
for i,d in ipairs(defs) do
    local label,key=d[1],d[2]
    local b=ui('TextButton',elist,{Size=UDim2.new(1,-6,0,34),BackgroundColor3=surface,Text=label..' : OFF',TextColor3=white,Font=Enum.Font.GothamBold,TextSize=13,LayoutOrder=i})
    round(b,8)
    listen(b.Activated,function()
        flags[key]=not flags[key]; b.Text=label..(flags[key] and ' : ON' or ' : OFF'); b.BackgroundColor3=flags[key] and purple or surface; buildFX()
    end)
end
local colors={rgb(170,75,255),rgb(255,25,50),rgb(40,160,255),rgb(40,240,100),rgb(255,210,40),rgb(255,255,255),rgb(255,65,190),rgb(0,240,225),rgb(255,130,30),rgb(20,20,25),rgb(180,180,190),rgb(100,45,255)}
local palette=ui('Frame',elist,{Size=UDim2.new(1,-6,0,76),BackgroundTransparency=1,LayoutOrder=20})
ui('UIGridLayout',palette,{CellSize=UDim2.new(1/6,-7,0,32),CellPadding=UDim2.fromOffset(5,5)})
for _,c in ipairs(colors) do
    local b=ui('TextButton',palette,{BackgroundColor3=c,Text=''}); round(b,6)
    listen(b.Activated,function() fxColor=c; buildFX() end)
end
local themes={{'Purple',rgb(151,73,238)},{'Red',rgb(225,50,75)},{'Blue',rgb(50,125,245)},{'Pink',rgb(235,65,175)},{'Green',rgb(40,205,125)}}
for i,t in ipairs(themes) do
    local b=ui('TextButton',pages.Theme,{Size=UDim2.new(1,-15,0,44),Position=UDim2.fromOffset(7,7+(i-1)*51),BackgroundColor3=t[2],Text=t[1]..' Theme',TextColor3=white,Font=Enum.Font.GothamBlack,TextSize=14})
    round(b,9)
    listen(b.Activated,function()
        purple=t[2]; launch.UIStroke.Color=purple; main.UIStroke.Color=purple
        for n,btn in pairs(tabButtons) do if pages[n].Visible then btn.BackgroundColor3=purple end end
    end)
end
local function show(v) main.Visible=v; launch.Visible=not v; if v then fit() end end
listen(close.Activated,function() show(false) end)
local function drag(target,handle,tap)
    local down=false; local moved=false; local pos; local start; local touch
    listen(handle.InputBegan,function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then down=true; moved=false; pos=i.Position; start=target.Position; touch=i end
    end)
    listen(U.InputChanged,function(i)
        if not down or (i.UserInputType~=Enum.UserInputType.MouseMovement and i~=touch) then return end
        local d=i.Position-pos; if d.Magnitude>7 then moved=true end
        target.Position=UDim2.new(start.X.Scale,start.X.Offset+d.X,start.Y.Scale,start.Y.Offset+d.Y)
    end)
    listen(U.InputEnded,function(i)
        if down and (i.UserInputType==Enum.UserInputType.MouseButton1 or i==touch) then down=false; if tap and not moved then tap() end end
    end)
end
drag(launch,launch,function() show(true) end); drag(main,head)
listen(U.InputBegan,function(i,gp)
    if gp then return end
    if i.KeyCode==Enum.KeyCode.RightShift or i.KeyCode==Enum.KeyCode.ButtonY then show(not main.Visible)
    elseif i.KeyCode==Enum.KeyCode.ButtonB and main.Visible then show(false) end
end)
local elapsed=0; local animate=0; local trackedGun=nil
listen(R.Heartbeat,function(dt)
    if not alive then return end
    elapsed+=dt; animate+=dt
    if elapsed>.55 then
        elapsed=0
        if chosen or alpha>0 then applyTextures(); recolorBeams() end
        local g=active(); if g~=trackedGun then trackedGun=g; buildFX() end
    end
    if effectPart and effectPart.Parent then
        local p=partOf(active())
        if p then effectPart.CFrame=p.CFrame; effectPart.Size=p.Size end
    end
    if animate>.08 then
        animate=0
        if flags.Rainbow or flags.Pulse then
            local c=fxColorNow(); local bright=flags.Pulse and (2.4+math.sin(os.clock()*5)*1.5) or 3
            for _,x in ipairs(effectObjects) do
                if x.Parent then pcall(function()
                    if x:IsA('PointLight') then x.Color=c; x.Brightness=bright
                    elseif x:IsA('Sparkles') then x.SparkleColor=c
                    elseif x:IsA('Fire') then x.Color=c; x.SecondaryColor=c
                    elseif x:IsA('Smoke') then x.Color=c
                    elseif x:IsA('Highlight') then x.OutlineColor=c; x.FillColor=c
                    elseif x:IsA('ParticleEmitter') or x:IsA('Trail') then x.Color=ColorSequence.new(c) end
                end) end
            end
        end
    end
end)
listen(me.CharacterAdded,function() trackedGun=nil; task.delay(.6,function() if alive then applyTextures(); buildFX() end end) end)
env.ZyiksRecolorCleanup=function()
    if not alive then return end
    alive=false; restoreTexture(); restoreAlpha(); restoreBeams(); clearFX()
    for _,c in ipairs(conns) do pcall(function() c:Disconnect() end) end
    gui:Destroy()
end
print('[Zyiks V27] Loaded '..#skins..' scopes')
