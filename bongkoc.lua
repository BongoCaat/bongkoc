getgenv().Star = "⭐"
getgenv().Danger = "⚠️"
getgenv().ExploitSpecific = "📜"

-- API CALLS

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/BongoCaat/bongkoc/main/library.lua"))()
getgenv().api = loadstring(game:HttpGet("https://raw.githubusercontent.com/BongoCaat/bongkoc/main/api.lua"))()
local bssapi = loadstring(game:HttpGet("https://raw.githubusercontent.com/BongoCaat/bongkoc/main/bssapi.lua"))()
if not isfolder("bongkoc") then makefolder("bongkoc") end

-- Morphisto
function enc(data)
	local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    return ((data:gsub('.', function(x) 
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end

function dec(data)
	local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end
-- Morphisto

-- Script temporary variables
local playerstatsevent = game:GetService("ReplicatedStorage").Events.RetrievePlayerStats
local statstable = playerstatsevent:InvokeServer()
local monsterspawners = game:GetService("Workspace").MonsterSpawners
local rarename
function rtsg() tab = game.ReplicatedStorage.Events.RetrievePlayerStats:InvokeServer() return tab end
function maskequip(mask) local ohString1 = "Equip" local ohTable2 = { ["Mute"] = false, ["Type"] = mask, ["Category"] = "Accessory"} game:GetService("ReplicatedStorage").Events.ItemPackageEvent:InvokeServer(ohString1, ohTable2) end
local lasttouched = nil
local done = true
local hi = false
local Items = require(game:GetService("ReplicatedStorage").EggTypes).GetTypes()
local v1 = require(game.ReplicatedStorage.ClientStatCache):Get();

hives = game.Workspace.Honeycombs:GetChildren() for i = #hives, 1, -1 do  v = game.Workspace.Honeycombs:GetChildren()[i] if v.Owner.Value == nil then game.ReplicatedStorage.Events.ClaimHive:FireServer(v.HiveID.Value) end end

--repeat wait() until game.Players.LocalPlayer.Honeycomb
--local plrhive = game.Players.LocalPlayer:FindFirstChild("Honeycomb")

-- Script tables
for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
    if v:IsA("TextLabel") and string.find(v.Text,"bongkoc v") then
        v.Parent.Parent:Destroy()
    end
end
getgenv().temptable = {
    version = "4.0.0",
    blackfield = "Sunflower Field",
	players = {}, -- Morphisto
	oplayers = {}, -- Morphisto
	boostedfield = "", -- Morphisto
	sbready = false, -- Morphisto
	runtime = "", -- Morphisto
    redfields = {},
    bluefields = {},
    whitefields = {},
    shouldiconvertballoonnow = false,
    balloondetected = false,
    puffshroomdetected = false,
	puffshroomboosted = false, -- Morphisto
    magnitude = 60,
    blacklist = {
        ""
    },
    running = false,
    configname = "",
    tokenpath = game:GetService("Workspace").Collectibles,
    started = {
		crab = false, -- Morphisto
		tunnelbear = false, -- Morphisto
		kingbeetle = false, -- Morphisto
		stumpsnail = false, -- Morphisto
		stickbug = false, -- Morphisto
		quests = false, -- Morphisto
		fieldboost = false, -- Morphisto
        vicious = false,
        mondo = false,
        windy = false,
        ant = false,
        monsters = false
    },
    detected = {
        vicious = false,
        windy = false
    },
    tokensfarm = false,
    converting = false,
    consideringautoconverting = false,
    honeystart = 0,
    grib = nil,
    gribpos = CFrame.new(0,0,0),
    honeycurrent = statstable.Totals.Honey,
    dead = false,
    float = false,
    pepsigodmode = false,
    pepsiautodig = false,
    alpha = false,
    beta = false,
    myhiveis = false,
    invis = false,
    windy = nil,
    sprouts = {
        detected = false,
        coords
    },
    cache = {
		farmpuffshrooms = false, -- Morphisto
		farmrares = false, -- Morphisto
		killcrab = false, -- Morphisto
		killtunnelbear = false, -- Morphisto
		killkingbeetle = false, -- Morphisto
		killstumpsnail = false, -- Morphisto
		killstickbug = false, -- Morphisto
		autoant = false, -- Morphisto
		boostaftermondo = false, -- Morphisto
		disableinrange = true, -- Morphisto
        autofarm = false,
        killmondo = false,
        vicious = false,
        windy = false
    },
    allplanters = {},
    planters = {
        planter = {},
        cframe = {},
        activeplanters = {
            type = {},
            id = {}
        }
    },
    monstertypes = {"Ladybug", "Rhino", "Spider", "Scorpion", "Mantis", "Werewolf"},
    ["stopapypa"] = function(path, part)
        local Closest
        for i,v in next, path:GetChildren() do
            if v.Name ~= "PlanterBulb" then
                if Closest == nil then
                    Closest = v.Soil
                else
                    if (part.Position - v.Soil.Position).magnitude < (Closest.Position - part.Position).magnitude then
                        Closest = v.Soil
                    end
                end
            end
        end
        return Closest
    end,
    coconuts = {},
    crosshairs = {},
    crosshair = false,
    coconut = false,
    act = 0,
    act2 = 0,
    ['touchedfunction'] = function(v)
        if lasttouched ~= v then
            if v.Parent.Name == "FlowerZones" then
                if v:FindFirstChild("ColorGroup") then
                    if tostring(v.ColorGroup.Value) == "Red" then
                        maskequip("Demon Mask")
                    elseif tostring(v.ColorGroup.Value) == "Blue" then
                        maskequip("Diamond Mask")
                    end
                else
                    maskequip("Gummy Mask")
                end
                lasttouched = v
            end
        end
    end,
    runningfor = 0,
    oldtool = rtsg()["EquippedCollector"],
    ['gacf'] = function(part, st)
        coordd = CFrame.new(part.Position.X, part.Position.Y+st, part.Position.Z)
        return coordd
    end
}
local planterst = {
    plantername = {},
    planterid = {}
}

for i,v in next, temptable.blacklist do if v == api.nickname then game.Players.LocalPlayer:Kick("You're blacklisted! Get clapped!") end end
if temptable.honeystart == 0 then temptable.honeystart = statstable.Totals.Honey end

for i,v in next, game:GetService("Workspace").MonsterSpawners:GetDescendants() do if v.Name == "TimerAttachment" then v.Name = "Attachment" end end
for i,v in next, game:GetService("Workspace").MonsterSpawners:GetChildren() do if v.Name == "RoseBush" then v.Name = "ScorpionBush" elseif v.Name == "RoseBush2" then v.Name = "ScorpionBush2" end end
for i,v in next, game:GetService("Workspace").FlowerZones:GetChildren() do if v:FindFirstChild("ColorGroup") then if v:FindFirstChild("ColorGroup").Value == "Red" then table.insert(temptable.redfields, v.Name) elseif v:FindFirstChild("ColorGroup").Value == "Blue" then table.insert(temptable.bluefields, v.Name) end else table.insert(temptable.whitefields, v.Name) end end
local flowertable = {}
for _,z in next, game:GetService("Workspace").Flowers:GetChildren() do table.insert(flowertable, z.Position) end
local masktable = {}
for _,v in next, game:GetService("ReplicatedStorage").Accessories:GetChildren() do if string.match(v.Name, "Mask") then table.insert(masktable, v.Name) end end
local collectorstable = {}
for _,v in next, getupvalues(require(game:GetService("ReplicatedStorage").Collectors).Exists) do for e,r in next, v do table.insert(collectorstable, e) end end
local fieldstable = {}
for _,v in next, game:GetService("Workspace").FlowerZones:GetChildren() do table.insert(fieldstable, v.Name) end
local toystable = {}
for _,v in next, game:GetService("Workspace").Toys:GetChildren() do table.insert(toystable, v.Name) end
local spawnerstable = {}
for _,v in next, game:GetService("Workspace").MonsterSpawners:GetChildren() do table.insert(spawnerstable, v.Name) end
local accesoriestable = {}
for _,v in next, game:GetService("ReplicatedStorage").Accessories:GetChildren() do if v.Name ~= "UpdateMeter" then table.insert(accesoriestable, v.Name) end end
for i,v in pairs(getupvalues(require(game:GetService("ReplicatedStorage").PlanterTypes).GetTypes)) do for e,z in pairs(v) do table.insert(temptable.allplanters, e) end end
local donatableItemsTable = {}
local treatsTable = {}
for i,v in pairs(Items) do
    if v.DonatableToWindShrine == true then
        table.insert(donatableItemsTable,i)
    end
end
for i,v in pairs(Items) do
    if v.TreatValue then
        table.insert(treatsTable,i)
    end
end
local buffTable = {
    ["Blue Extract"]={b=false,DecalID="2495936060"};
    ["Red Extract"]={b=false,DecalID="2495935291"};
    ["Oil"]={b=false,DecalID="2545746569"}; --?
    ["Enzymes"]={b=false,DecalID="2584584968"};
    ["Glue"]={b=false,DecalID="2504978518"};
    ["Glitter"]={b=false,DecalID="2542899798"};
    ["Tropical Drink"]={b=false,DecalID="3835877932"};
	["Stinger"]={b=false,DecalID="2314214749"}; -- Morphisto
	["Jelly Bean Sharing Bonus"]={b=false,DecalID="3080919019"}; -- Morphisto
}
-- Morphisto
local fieldboostTable = {
	["Mushroom Field"]={b=false,DecalID="2908769124"};
	["Pineapple Patch"]={b=false,DecalID="2908769153"};
	["Blue Flower Field"]={b=false,DecalID="2908768899"};
	["Sunflower Field"]={b=false,DecalID="2908769405"};
	["Bamboo Field"]={b=false,DecalID="2908768829"};
	["Spider Field"]={b=false,DecalID="2908769301"};
	["Stump Field"]={b=false,DecalID="2908769372"};
	["Mountain Top Field"]={b=false,DecalID="2908769086"};
	["Pine Tree Forest"]={b=false,DecalID="2908769190"};
	["Rose Field"]={b=false,DecalID="2908818982"};
	["Pepper Patch"]={b=false,DecalID="3835712489"};
	["Cactus Field"]={b=false,DecalID="2908768937"};
	["Coconut Field"]={b=false,DecalID="2908769010"};
	["Clover Field"]={b=false,DecalID="2908768973"};
	["Strawberry Field"]={b=false,DecalID="2908769330"};
	["Pumpkin Patcht"]={b=false,DecalID="2908769220"};
}
-- Morphisto

local AccessoryTypes = require(game:GetService("ReplicatedStorage").Accessories).GetTypes()
local MasksTable = {}
for i,v in pairs(AccessoryTypes) do
    if string.find(i,"Mask") then
        if i ~= "Honey Mask" then
        table.insert(MasksTable,i)
        end
    end
end

-- Morphisto
npctable = {
	["Black Bear"] = CFrame.new(-258.1, 5, 299.7),
	["Brown Bear"] = CFrame.new(282, 46, 236),
	["Bucko Bee"] = CFrame.new(302, 62, 105),
	["Honey Bee"] = CFrame.new(-455.6, 103.8, -224.2),
	["Panda Bear"] = CFrame.new(106.3, 35, 50.1),
	["Polar Bear"] = CFrame.new(-106, 119, -77),
	["Riley Bee"] = CFrame.new(-361, 74, 212),
	["Science Bear"] = CFrame.new(267, 103, 20),
	["Mother Bear"] = CFrame.new(-183.8, 4.6, 87.5),
	["Sun Bear"] = CFrame.new(23.25, 14, 360.26),
	["Spirit Bear"] = CFrame.new(-365, 99, 479),
	["Stick Bug"] = CFrame.new(-128, 51, 147),
	["Onett"] = CFrame.new(-8.4, 234, -517.9),
	["Gummy Lair"] = CFrame.new(273, 25261, -745),
	["Bubble Bee Man"] = CFrame.new(89, 312, -278),
	["Meteor Shower"] = CFrame.new(160, 127, -160),
	["Demon Mask"] = CFrame.new(300, 13, 272),
	["Diamond Mask"] = CFrame.new(-336, 132, -385)
}
-- Morphisto

table.sort(fieldstable)
table.sort(accesoriestable)
table.sort(toystable)
table.sort(spawnerstable)
table.sort(masktable)
table.sort(temptable.allplanters)
table.sort(collectorstable)
table.sort(donatableItemsTable)
table.sort(buffTable)
table.sort(MasksTable)

-- float pad

local floatpad = Instance.new("Part", game:GetService("Workspace"))
floatpad.CanCollide = false
floatpad.Anchored = true
floatpad.Transparency = 1
floatpad.Name = "FloatPad"

-- cococrab

local cocopad = Instance.new("Part", game:GetService("Workspace"))
cocopad.Name = "Coconut Part"
cocopad.Anchored = true
cocopad.Transparency = 1
cocopad.Size = Vector3.new(10, 1, 10)
cocopad.Position = Vector3.new(-307.52117919922, 105.91863250732, 467.86791992188)

-- antfarm

local antpart = Instance.new("Part", workspace)
antpart.Name = "Ant Autofarm Part"
antpart.Position = Vector3.new(96, 47, 553)
antpart.Anchored = true
antpart.Size = Vector3.new(128, 1, 50)
antpart.Transparency = 1
antpart.CanCollide = false

-- config

stickbug_time = time() -- Morphisto
sbfirstcheck = false -- Morphisto
chk5min_time = time() -- Morphisto
chk30minreg = time() -- Morphisto

getgenv().bongkoc = {
    rares = {},
	wlplayers = {}, -- Morphisto
    priority = {},
    bestfields = {
        red = "Pepper Patch",
        white = "Coconut Field",
        blue = "Stump Field"
    },
    blacklistedfields = {},
    killerbongkoc = {},
    bltokens = {},
    toggles = {
        autofarm = false,
        farmclosestleaf = false,
        farmbubbles = false,
        autodig = false,
        farmrares = false,
        rgbui = false,
        farmflower = false,
        farmfuzzy = false,
        farmcoco = false,
        farmflame = false,
        farmclouds = false,
        killmondo = false,
        killvicious = false,
        loopspeed = false,
        loopjump = false,
        autoquest = false,
        autoboosters = false,
        autodispense = false,
        clock = false,
        freeantpass = false,
        honeystorm = false,
        autodoquest = false,
        disableseperators = false,
        npctoggle = false,
        loopfarmspeed = false,
        mobquests = false,
        avoidmobs = false,
        farmsprouts = false,
        enabletokenblacklisting = false,
        farmunderballoons = false,
        farmsnowflakes = false,
        collectgingerbreads = false,
        collectcrosshairs = false,
        farmpuffshrooms = false,
        tptonpc = false,
        donotfarmtokens = false,
        convertballoons = false,
        autostockings = false,
        autosamovar = false,
        autoonettart = false,
        autocandles = false,
        autofeast = false,
        autoplanters = false,
        autokillmobs = false,
        autoant = false,
        killwindy = false,
        godmode = false,
        disableconversion = false,
        autodonate = false,
        autouseconvertors = false,
        honeymaskconv = false,
		killstickbug = false, -- Morphisto
		farmboostedfield = false, -- Morphisto
		smartautofarm = false, -- Morphisto
		killstumpsnail = false, -- Morphisto
		killkingbeetle = false, -- Morphisto
		killtunnelbear = false, -- Morphisto
		killcrab = false, -- Morphisto
		swapmaskonfield = false, -- Morphisto
        resetbeeenergy = false
    },
    vars = {
        field = "Ant Field",
        convertat = 100,
        farmspeed = 60,
        prefer = "Tokens",
        walkspeed = 70,
        jumppower = 70,
        npcprefer = "All Quests",
        farmtype = "Walk",
        monstertimer = 3,
        autodigmode = "Normal",
        donoItem = "Coconut",
        donoAmount = 25,
        selectedTreat = "Treat",
        selectedTreatAmount = 0,
        autouseMode = "Just Tickets",
        autoconvertWaitTime = 10,
        defmask = "Demon Mask",
        resettimer = 3,
		resetbeeenergy = false
    },
    dispensesettings = {
        blub = false,
        straw = false,
        treat = false,
        coconut = false,
        glue = false,
        rj = false,
        white = false,
        red = false,
        blue = false
    }
}

local defaultbongkoc = bongkoc


-- functions

function statsget() local StatCache = require(game.ReplicatedStorage.ClientStatCache) local stats = StatCache:Get() return stats end
function farm(trying)
    if bongkoc.toggles.loopfarmspeed then game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = bongkoc.vars.farmspeed end
    api.humanoid():MoveTo(trying.Position) 
    repeat task.wait() until (trying.Position-api.humanoidrootpart().Position).magnitude <=4 or not IsToken(trying) or not temptable.running
end

function disableall()
    if bongkoc.toggles.farmrares then -- Morphisto
		temptable.cache.farmrares = true -- Morphisto
		bongkoc.toggles.farmrares = false -- Morphisto
		uifarmrares:SetState(false)
	end
	if bongkoc.toggles.farmpuffshrooms then -- Morphisto
		temptable.cache.farmpuffshrooms = true -- Morphisto
		bongkoc.toggles.farmpuffshrooms = false -- Morphisto
	end
	if bongkoc.toggles.killcrab and not temptable.started.crab then -- Morphisto
		bongkoc.toggles.killcrab = false -- Morphisto
		temptable.cache.killcrab = true -- Morphisto
	end
	if bongkoc.toggles.killtunnelbear and not temptable.started.tunnelbear then -- Morphisto
		bongkoc.toggles.killtunnelbear = false -- Morphisto
		temptable.cache.killtunnelbear = true -- Morphisto
	end
	if bongkoc.toggles.killkingbeetle and not temptable.started.kingbeetle then -- Morphisto
		bongkoc.toggles.killkingbeetle = false -- Morphisto
		temptable.cache.killkingbeetle = true -- Morphisto
	end
	if bongkoc.toggles.killstumpsnail and not temptable.started.stumpsnail then -- Morphisto
		bongkoc.toggles.killstumpsnail = false -- Morphisto
		temptable.cache.killstumpsnail = true -- Morphisto
	end
	if bongkoc.toggles.killstickbug and not temptable.started.stickbug then -- Morphisto
		bongkoc.toggles.killstickbug = false -- Morphisto
		temptable.cache.killstickbug = true -- Morphisto
	end
	if bongkoc.toggles.autoant and not temptable.started.ant then -- Morphisto
		bongkoc.toggles.autoant = false -- Morphisto
		temptable.cache.autoant = true -- Morphisto
	end
	if bongkoc.toggles.autofarm and not temptable.converting then
        temptable.cache.autofarm = true
        bongkoc.toggles.autofarm = false
    end
    if bongkoc.toggles.killmondo and not temptable.started.mondo then
        bongkoc.toggles.killmondo = false
        temptable.cache.killmondo = true
    end
    if bongkoc.toggles.killvicious and not temptable.started.vicious then
        bongkoc.toggles.killvicious = false
        temptable.cache.vicious = true
    end
    if bongkoc.toggles.killwindy and not temptable.started.windy then
        bongkoc.toggles.killwindy = false
        temptable.cache.windy = true
    end
end

function enableall()
    if temptable.cache.farmrares then -- Morphisto
		bongkoc.toggles.farmrares = true -- Morphisto
		uifarmrares:SetState(true)
		temptable.cache.farmrares = false -- Morphisto
	end
	if temptable.cache.farmpuffshrooms then -- Morphisto
		bongkoc.toggles.farmpuffshrooms = true -- Morphisto
		temptable.cache.farmpuffshrooms = false -- Morphisto
	end
	if temptable.cache.killcrab then -- Morphisto
		bongkoc.toggles.killcrab = true -- Morphisto
		temptable.cache.killcrab = false -- Morphisto
	end
	if temptable.cache.killtunnelbear then -- Morphisto
		bongkoc.toggles.killtunnelbear = true -- Morphisto
		temptable.cache.killtunnelbear = false -- Morphisto
	end
	if temptable.cache.killkingbeetle then -- Morphisto
		bongkoc.toggles.killkingbeetle = true -- Morphisto
		temptable.cache.killkingbeetle = false -- Morphisto
	end
	if temptable.cache.killstumpsnail then -- Morphisto
		bongkoc.toggles.killstumpsnail = true -- Morphisto
		temptable.cache.killstumpsnail = false -- Morphisto
	end
	if temptable.cache.killstickbug then -- Morphisto
		bongkoc.toggles.killstickbug = true -- Morphisto
		temptable.cache.killstickbug = false -- Morphisto
	end
	if temptable.cache.autoant then -- Morphisto
		bongkoc.toggles.autoant = true -- Morphisto
		temptable.cache.autoant = false -- Morphisto
	end
	if temptable.cache.autofarm then
        bongkoc.toggles.autofarm = true
        temptable.cache.autofarm = false
    end
    if temptable.cache.killmondo then
        bongkoc.toggles.killmondo = true
        temptable.cache.killmondo = false
    end
    if temptable.cache.vicious then
        bongkoc.toggles.killvicious = true
        temptable.cache.vicious = false
    end
    if temptable.cache.windy then
        bongkoc.toggles.killwindy = true
        temptable.cache.windy = false
    end
end

function gettoken(v3)
    if not v3 then
        v3 = fieldposition
    end
    task.wait()
    for e,r in next, game:GetService("Workspace").Collectibles:GetChildren() do
        itb = false
        if r:FindFirstChildOfClass("Decal") and bongkoc.toggles.enabletokenblacklisting then
            if api.findvalue(bongkoc.bltokens, string.split(r:FindFirstChildOfClass("Decal").Texture, 'rbxassetid://')[2]) then
                itb = true
            end
        end
        if tonumber((r.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude) <= temptable.magnitude/1.4 and not itb and (v3-r.Position).magnitude <= temptable.magnitude then
            farm(r)
        end
    end
end

function makesprinklers()
    sprinkler = rtsg().EquippedSprinkler
    e = 1
    if sprinkler == "Basic Sprinkler" or sprinkler == "The Supreme Saturator" then
        e = 1
    elseif sprinkler == "Silver Soakers" then
        e = 2
    elseif sprinkler == "Golden Gushers" then
        e = 3
    elseif sprinkler == "Diamond Drenchers" then
        e = 4
    end
    for i = 1, e do
        k = api.humanoid().JumpPower
        if e ~= 1 then api.humanoid().JumpPower = 70 api.humanoid().Jump = true task.wait(.2) end
        game.ReplicatedStorage.Events.PlayerActivesCommand:FireServer({["Name"] = "Sprinkler Builder"})
        if e ~= 1 then api.humanoid().JumpPower = k task.wait(1) end
    end
end

function killmobs()
    for i,v in pairs(game:GetService("Workspace").MonsterSpawners:GetChildren()) do
        if v:FindFirstChild("Territory") then
            if v.Name ~= "Commando Chick" and v.Name ~= "CoconutCrab" and v.Name ~= "StumpSnail" and v.Name ~= "TunnelBear" and v.Name ~= "King Beetle Cave" and not v.Name:match("CaveMonster") and not v:FindFirstChild("TimerLabel", true).Visible then
                if v.Name:match("Werewolf") then
                    monsterpart = game:GetService("Workspace").Territories.WerewolfPlateau.w
                elseif v.Name:match("Mushroom") then
                    monsterpart = game:GetService("Workspace").Territories.MushroomZone.Part
                else
                    monsterpart = v.Territory.Value
                end
                api.humanoidrootpart().CFrame = monsterpart.CFrame
                repeat api.humanoidrootpart().CFrame = monsterpart.CFrame avoidmob() task.wait(1) until v:FindFirstChild("TimerLabel", true).Visible
                for i = 1, 4 do gettoken(monsterpart.Position) end
            end
        end
    end
end

function IsToken(token)
    if not token then
        return false
    end
    if not token.Parent then return false end
    if token then
        if token.Orientation.Z ~= 0 then
            return false
        end
        if token:FindFirstChild("FrontDecal") then
        else
            return false
        end
        if not token.Name == "C" then
            return false
        end
        if not token:IsA("Part") then
            return false
        end
        return true
    else
        return false
    end
end

function check(ok)
    if not ok then
        return false
    end
    if not ok.Parent then return false end
    return true
end

function getplanters()
    table.clear(planterst.plantername)
    table.clear(planterst.planterid)
    for i,v in pairs(debug.getupvalues(require(game:GetService("ReplicatedStorage").LocalPlanters).LoadPlanter)[4]) do 
        if v.GrowthPercent == 1 and v.IsMine then
            table.insert(planterst.plantername, v.Type)
            table.insert(planterst.planterid, v.ActorID)
        end
    end
end

function farmant()
    antpart.CanCollide = true
    temptable.started.ant = true
	disableall()
    anttable = {left = true, right = false}
    temptable.oldtool = rtsg()['EquippedCollector']
    game.ReplicatedStorage.Events.ItemPackageEvent:InvokeServer("Equip",{["Mute"] = true,["Type"] = "Spark Staff",["Category"] = "Collector"})
    game.ReplicatedStorage.Events.ToyEvent:FireServer("Ant Challenge")
    bongkoc.toggles.autodig = true
    acl = CFrame.new(127, 48, 547)
    acr = CFrame.new(65, 48, 534)
    task.wait(1)
    game.ReplicatedStorage.Events.PlayerActivesCommand:FireServer({["Name"] = "Sprinkler Builder"})
    api.humanoidrootpart().CFrame = api.humanoidrootpart().CFrame + Vector3.new(0, 15, 0)
    task.wait(3)
    repeat
        task.wait()
        for i,v in next, game.Workspace.Toys["Ant Challenge"].Obstacles:GetChildren() do
            if v:FindFirstChild("Root") then
                if (v.Root.Position-api.humanoidrootpart().Position).magnitude <= 40 and anttable.left then
                    api.humanoidrootpart().CFrame = acr
                    anttable.left = false anttable.right = true
                    wait(.1)
                elseif (v.Root.Position-api.humanoidrootpart().Position).magnitude <= 40 and anttable.right then
                    api.humanoidrootpart().CFrame = acl
                    anttable.left = true anttable.right = false
                    wait(.1)
                end
            end
        end
    until game:GetService("Workspace").Toys["Ant Challenge"].Busy.Value == false
    task.wait(1)
    game.ReplicatedStorage.Events.ItemPackageEvent:InvokeServer("Equip",{["Mute"] = true,["Type"] = temptable.oldtool,["Category"] = "Collector"})
    temptable.started.ant = false
    antpart.CanCollide = false
	enableall()

end

function collectplanters()
    getplanters()
    for i,v in pairs(planterst.plantername) do
        if api.partwithnamepart(v, game:GetService("Workspace").Planters) and api.partwithnamepart(v, game:GetService("Workspace").Planters):FindFirstChild("Soil") then
            soil = api.partwithnamepart(v, game:GetService("Workspace").Planters).Soil
            api.humanoidrootpart().CFrame = soil.CFrame
            game:GetService("ReplicatedStorage").Events.PlanterModelCollect:FireServer(planterst.planterid[i])
            task.wait(.5)
            game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = v.." Planter"})
            for i = 1, 5 do gettoken(soil.Position) end
            task.wait(2)
        end
    end
end

function getprioritytokens()
    task.wait()
    if temptable.running == false then
        for e,r in next, game:GetService("Workspace").Collectibles:GetChildren() do
            if r:FindFirstChildOfClass("Decal") then
                local aaaaaaaa = string.split(r:FindFirstChildOfClass("Decal").Texture, 'rbxassetid://')[2]
                if aaaaaaaa ~= nil and api.findvalue(bongkoc.priority, aaaaaaaa) then
                    if r.Name == game.Players.LocalPlayer.Name and not r:FindFirstChild("got it") or tonumber((r.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude) <= temptable.magnitude/1.4 and not r:FindFirstChild("got it") then
                        farm(r) local val = Instance.new("IntValue",r) val.Name = "got it" break
                    end
                end
            end
        end
    end
end

function gethiveballoon()
    task.wait()
    result = false
    for i,hive in next, game:GetService("Workspace").Honeycombs:GetChildren() do
        task.wait()
        if hive:FindFirstChild("Owner") and hive:FindFirstChild("SpawnPos") then
            if tostring(hive.Owner.Value) == game.Players.LocalPlayer.Name then
                for e,balloon in next, game:GetService("Workspace").Balloons.HiveBalloons:GetChildren() do
                    task.wait()
                    if balloon:FindFirstChild("BalloonRoot") then
                        if (balloon.BalloonRoot.Position-hive.SpawnPos.Value.Position).magnitude < 15 then
                            result = true
                            break
                        end
                    end
                end
            end
        end
    end
    return result
end

function converthoney()
    task.wait(0)
    if temptable.converting then
        if game.Players.LocalPlayer.PlayerGui.ScreenGui.ActivateButton.TextBox.Text ~= "Stop Making Honey" and game.Players.LocalPlayer.PlayerGui.ScreenGui.ActivateButton.BackgroundColor3 ~= Color3.new(201, 39, 28) or (game:GetService("Players").LocalPlayer.SpawnPos.Value.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 13 then
            api.tween(1, game:GetService("Players").LocalPlayer.SpawnPos.Value * CFrame.fromEulerAnglesXYZ(0, 110, 0) + Vector3.new(0, 0, 9))
            task.wait(.9)
            if game.Players.LocalPlayer.PlayerGui.ScreenGui.ActivateButton.TextBox.Text ~= "Stop Making Honey" and game.Players.LocalPlayer.PlayerGui.ScreenGui.ActivateButton.BackgroundColor3 ~= Color3.new(201, 39, 28) or (game:GetService("Players").LocalPlayer.SpawnPos.Value.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 13 then game:GetService("ReplicatedStorage").Events.PlayerHiveCommand:FireServer("ToggleHoneyMaking") end
            task.wait(.1)
        end
    end
end

-- Morphisto
function killquestmobs(mobsname)
	for i,v in pairs(game:GetService("Workspace").MonsterSpawners:GetChildren()) do
		if v:FindFirstChild("Territory") then
			if v.Name:match(mobsname) and v.Name ~= "Commando Chick" and v.Name ~= "CoconutCrab" and v.Name ~= "StumpSnail" and v.Name ~= "TunnelBear" and v.Name ~= "King Beetle Cave" and not v.Name:match("CaveMonster") and not v:FindFirstChild("TimerLabel", true).Visible then
				if v.Name:match("Werewolf") then
					monsterpart = game:GetService("Workspace").Territories.WerewolfPlateau.w
				else
					monsterpart = v.Territory.Value
				end
				api.humanoidrootpart().CFrame = monsterpart.CFrame
				local count = 0;
				repeat
					api.humanoidrootpart().CFrame = monsterpart.CFrame
					avoidmob()
					task.wait(1)
					count = count + 1
				until v:FindFirstChild("TimerLabel", true).Visible or not bongkoc.toggles.autofarm or count > 30
				if count < 31 then
					for i = 1, 4 do gettoken(monsterpart.Position) end
				end
				if count > 30 then
					api.humanoidrootpart().CFrame = CFrame.new(243.895538, 4.3493037, 320.418457)
					task.wait(15)
					break
				end
			end
		end
	end
end
-- Morphisto

function closestleaf()
    for i,v in next, game.Workspace.Flowers:GetChildren() do
        if temptable.running == false and tonumber((v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude) < temptable.magnitude/1.4 then
            farm(v)
            break
        end
    end
end

function getbubble()
    for i,v in next, game.workspace.Particles:GetChildren() do
        if string.find(v.Name, "Bubble") and temptable.running == false and tonumber((v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude) < temptable.magnitude/1.4 then
            farm(v)
            break
        end
    end
end

function getballoons()
    for i,v in next, game:GetService("Workspace").Balloons.FieldBalloons:GetChildren() do
        if v:FindFirstChild("BalloonRoot") and v:FindFirstChild("PlayerName") then
            if v:FindFirstChild("PlayerName").Value == game.Players.LocalPlayer.Name then
                if tonumber((v.BalloonRoot.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude) < temptable.magnitude/1.4 then
                    api.walkTo(v.BalloonRoot.Position)
                end
            end
        end
    end
end

function getflower()
    flowerrrr = flowertable[math.random(#flowertable)]
    if tonumber((flowerrrr-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude) <= temptable.magnitude/1.4 and tonumber((flowerrrr-fieldposition).magnitude) <= temptable.magnitude/1.4 then 
        if temptable.running == false then 
            if bongkoc.toggles.loopfarmspeed then 
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = bongkoc.vars.farmspeed 
            end 
            api.walkTo(flowerrrr) 
        end 
    end
end

function getcloud()
    for i,v in next, game:GetService("Workspace").Clouds:GetChildren() do
        e = v:FindFirstChild("Plane")
        if e and tonumber((e.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude) < temptable.magnitude/1.4 then
            api.walkTo(e.Position)
        end
    end
end

function getcoco(v)
    if temptable.coconut then repeat task.wait() until not temptable.coconut end
    temptable.coconut = true
    api.tween(.1, v.CFrame)
    repeat task.wait() api.walkTo(v.Position) until not v.Parent
    task.wait(.1)
    temptable.coconut = false
    table.remove(temptable.coconuts, table.find(temptable.coconuts, v))
end

function getfuzzy()
    pcall(function()
        for i,v in next, game.workspace.Particles:GetChildren() do
            if v.Name == "DustBunnyInstance" and temptable.running == false and tonumber((v.Plane.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude) < temptable.magnitude/1.4 then
                if v:FindFirstChild("Plane") then
                    farm(v:FindFirstChild("Plane"))
                    break
                end
            end
        end
    end)
end

function getflame()
    for i,v in next, game:GetService("Workspace").PlayerFlames:GetChildren() do
        if tonumber((v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude) < temptable.magnitude/1.4 then
            farm(v)
            break
        end
    end
end

function avoidmob()
    for i,v in next, game:GetService("Workspace").Monsters:GetChildren() do
        if v:FindFirstChild("Head") then
            if (v.Head.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude < 30 and api.humanoid():GetState() ~= Enum.HumanoidStateType.Freefall then
                game.Players.LocalPlayer.Character.Humanoid.Jump = true
            end
        end
    end
end

function getcrosshairs(v)
    if v.BrickColor ~= BrickColor.new("Lime green") and v.BrickColor ~= BrickColor.new("Flint") then
    if temptable.crosshair then repeat task.wait() until not temptable.crosshair end
    temptable.crosshair = true
    api.walkTo(v.Position)
    repeat task.wait() api.walkTo(v.Position) until not v.Parent or v.BrickColor == BrickColor.new("Forest green")
    task.wait(.1)
    temptable.crosshair = false
    table.remove(temptable.crosshairs, table.find(temptable.crosshairs, v))
    else
        table.remove(temptable.crosshairs, table.find(temptable.crosshairs, v))
    end
end

-- Morphisto
function check5minstasks()
	if not temptable.started.vicious and not temptable.started.windy and not temptable.started.stickbug then
		checksbcooldown()
		if bongkoc.toggles.autoquest and not temptable.started.stickbug then
			makequests()
		end
		if bongkoc.toggles.autoplanters and not temptable.started.stickbug then
			collectplanters()
		end
		if bongkoc.toggles.honeystorm and not temptable.started.stickbug then
			game.ReplicatedStorage.Events.ToyEvent:FireServer("Honeystorm")
		end
	end
	check_reg()
end
-- Morphisto

--[[function check_reg()
	local userid = tostring(game.Players.LocalPlayer.UserId)
	local username = game.Players.LocalPlayer.Name
	local player_str = nil
	local player = enc(username .. '&' .. userid)
	local player_reply = game:HttpPost("https://roblox.servegame.com/roblox_bss/script/uploadreq.php?"..player,"p@ssw0rd123#")
	if dec(player_reply) == "Error Connection" then
		player_str = nil
	else
		player_str = string.split(dec(player_reply),".")
	end
	if player_str ~= nil and #player_str == 3 then
		if temptable.runtime ~= player_str[3] then
			temptable.runtime = player_str[3]
			if player_str[2] == username then
				return 1
			else
				return 0
			end
		else
			return 0
		end
	else
		if player_str == nil then
			local cooldown = math.floor((1800 - (time() - tonumber(chk30minreg)))/60)
			if cooldown > 0 then
				print("You have "..cooldown.." Mins free usage left.")
			else
				game:shutdown()
			end
		elseif player_str ~= nil and player_str[2] ~= "expired" then
			print("You have "..player_str[2].." Mins free usage left.")
		else
			game:shutdown()
		end
		return 0
	end
end]]

function makequests()
	temptable.started.quests = true
    for i,v in next, game:GetService("Workspace").NPCs:GetChildren() do
        if v.Name ~= "Ant Challenge Info" and v.Name ~= "Bubble Bee Man 2" and v.Name ~= "Wind Shrine" and v.Name ~= "Gummy Bear" then if v:FindFirstChild("Platform") then if v.Platform:FindFirstChild("AlertPos") then if v.Platform.AlertPos:FindFirstChild("AlertGui") then if v.Platform.AlertPos.AlertGui:FindFirstChild("ImageLabel") then
            image = v.Platform.AlertPos.AlertGui.ImageLabel
            button = game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.ActivateButton.MouseButton1Click
            if image.ImageTransparency == 0 then
                if bongkoc.toggles.tptonpc then
					game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Platform.Position.X, v.Platform.Position.Y+3, v.Platform.Position.Z)
                else
                    api.tween(2,CFrame.new(v.Platform.Position.X, v.Platform.Position.Y+3, v.Platform.Position.Z))
                end
				task.wait(3)
                for b,z in next, getconnections(button) do
					z.Function()
				end
                task.wait(8)
                if image.ImageTransparency == 0 then
                    for b,z in next, getconnections(button) do
						z.Function() -- bug
					end -- need to fix bug
                end
                task.wait(2)
            end
        end
    end end end end end
	temptable.started.quests = false
end

getgenv().Tvk1 = {true,"💖"}

local function donateToShrine(item,qnt)
    print(qnt)
    local s,e = pcall(function()
    game:GetService("ReplicatedStorage").Events.WindShrineDonation:InvokeServer(item, qnt)
    wait(0.5)
    game.ReplicatedStorage.Events.WindShrineTrigger:FireServer()

    local UsePlatform = game:GetService("Workspace").NPCs["Wind Shrine"].Stage
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = UsePlatform.CFrame + Vector3.new(0,5,0)

    for i = 1,120 do
    wait(0.05)
    for i,v in pairs(game.Workspace.Collectibles:GetChildren()) do
        if (v.Position-UsePlatform.Position).magnitude < 60 and v.CFrame.YVector.Y == 1 then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
        end
    end
    end
    end)
    if not s then print(e) end
end

local function isWindshrineOnCooldown()
    local isOnCooldown = false
    local cooldown = 3600 - (require(game.ReplicatedStorage.OsTime)() - (require(game.ReplicatedStorage.StatTools).GetLastCooldownTime(v1, "WindShrine")))
    if cooldown > 0 then isOnCooldown = true end
    return isOnCooldown
end

local function getTimeSinceToyActivation(name)
    return require(game.ReplicatedStorage.OsTime)() - require(game.ReplicatedStorage.ClientStatCache):Get("ToyTimes")[name]
end

local function getTimeUntilToyAvailable(n)
    return workspace.Toys[n].Cooldown.Value - getTimeSinceToyActivation(n)
end

local function canToyBeUsed(toy)
    local timeleft = tostring(getTimeUntilToyAvailable(toy))
    local canbeUsed = false
    if string.find(timeleft,"-") then canbeUsed = true end
    return canbeUsed
end

function GetItemListWithValue()
    local StatCache = require(game.ReplicatedStorage.ClientStatCache)
    local data = StatCache.Get()
    return data.Eggs
end

local function useConvertors()
    local conv = {"Instant Converter","Instant Converter B","Instant Converter C"}

    local lastWithoutCooldown = nil

    for i,v in pairs(conv) do
        if canToyBeUsed(v) == true then
            lastWithoutCooldown = v
        end
    end
    local converted=false
    if lastWithoutCooldown ~= nil and string.find(bongkoc.vars.autouseMode,"Ticket") or string.find(bongkoc.vars.autouseMode,"All") then
        if converted == false then
        game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer(lastWithoutCooldown)
        converted=true
        end
    end
    if GetItemListWithValue()["Micro-Converter"] > 0 and string.find(bongkoc.vars.autouseMode,"Micro") or string.find(bongkoc.vars.autouseMode,"All") then -- Morphisto
		game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Micro-Converter"}) -- Morphisto
		pollenpercentage = 0 -- Morphisto
	elseif GetItemListWithValue()["Snowflake"] > 0 and string.find(bongkoc.vars.autouseMode,"Snowflak") or string.find(bongkoc.vars.autouseMode,"All") then
        game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Snowflake"})
    end
        if GetItemListWithValue()["Coconut"] > 0 and string.find(bongkoc.vars.autouseMode,"Coconut") or string.find(bongkoc.vars.autouseMode,"All") then
        game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Coconut"})
        end
end

-- Morphisto
function fetchfieldboostTable(stats)
	local stTab = {}
	for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:GetChildren()) do
		if v.Name == "TileGrid" then
			for p,l in pairs(v:GetChildren()) do
				if l:FindFirstChild("BG") then
					if l:FindFirstChild("BG"):FindFirstChild("Icon") then
						local ic = l:FindFirstChild("BG"):FindFirstChild("Icon")
						for field,fdata in pairs(stats) do
							if fdata["DecalID"]~= nil then
								if string.find(ic.Image,fdata["DecalID"]) then
									if ic.Parent:FindFirstChild("Text") then
										if ic.Parent:FindFirstChild("Text").Text == "" then
											stTab[field]=1
										else
											local thing = ""
											thing = string.gsub(ic.Parent:FindFirstChild("Text").Text,"x","")
											stTab[field]=tonumber(thing)
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
	return stTab
end
-- Morphisto

-- Morphisto
function farmboostedfield()
	local boostedfields = fetchfieldboostTable(fieldboostTable)
	if next(boostedfields) == nil then
		if temptable.started.fieldboost then
			temptable.started.fieldboost = false
			fielddropdown:SetOption(temptable.boostedfield)
			bongkoc.toggles.autouseconvertors = false
			uiautouseconverters:SetState(false)
		end
	else
		if not temptable.started.fieldboost then
			temptable.started.fieldboost = true
			temptable.boostedfield = bongkoc.vars.field
			for field,lvl in pairs(boostedfields) do
				if bongkoc.vars.defmask == "Gummy Mask" then
					if api.tablefind(temptable.whitefields, field) then
						fielddropdown:SetOption(field)
					end
				elseif bongkoc.vars.defmask == "Demon Mask" then
					if api.tablefind(temptable.redfields, field) then
						fielddropdown:SetOption(field)
					end
				elseif bongkoc.vars.defmask == "Diamond Mask" then
					if api.tablefind(temptable.bluefields, field) then
						fielddropdown:SetOption(field)
					end
				end
			end
		end
	end
	if temptable.started.fieldboost then
		if not bongkoc.toggles.autouseconvertors then
			uiautouseconverters:SetState(true)
			bongkoc.toggles.autouseconvertors = true
		end
	end
end
-- Morphisto

local function fetchBuffTable(stats)
    local stTab = {}
    if game:GetService("Players").LocalPlayer then
        if game:GetService("Players").LocalPlayer.PlayerGui then
            if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui then
                for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:GetChildren()) do
                    if v.Name == "TileGrid" then
                        for p,l in pairs(v:GetChildren()) do
                            if l:FindFirstChild("BG") then
                                if l:FindFirstChild("BG"):FindFirstChild("Icon") then
                                    local ic = l:FindFirstChild("BG"):FindFirstChild("Icon")
                                    for field,fdata in pairs(stats) do
                                        if fdata["DecalID"]~= nil then
                                            if string.find(ic.Image,fdata["DecalID"]) then
                                                if ic.Parent:FindFirstChild("Text") then
                                                    if ic.Parent:FindFirstChild("Text").Text == "" then
                                                        stTab[field]=1
                                                    else
                                                        local thing = ""
                                                        thing = string.gsub(ic.Parent:FindFirstChild("Text").Text,"x","")
                                                        stTab[field]=tonumber( thing + 1 )
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    return stTab
end

local Config = { WindowName = "bongkoc v"..temptable.version.." Remastered", Color = Color3.fromRGB(164, 84, 255), Keybind = Enum.KeyCode.Semicolon}
local Window = library:CreateWindow(Config, game:GetService("CoreGui"))

local hometab = Window:CreateTab("Home")
local farmtab = Window:CreateTab("Farming")
local combtab = Window:CreateTab("Combat")
local itemstab = Window:CreateTab("Items")
local misctab = Window:CreateTab("Misc")
local setttab = Window:CreateTab("Settings")

local loadingInfo = hometab:CreateSection("Startup")
local loadingFunctions = loadingInfo:CreateLabel("Loading Functions..")
wait(1)
loadingFunctions:UpdateText("Loaded Functions")
local loadingBackend = loadingInfo:CreateLabel("Loading Backend..")


--loadPremium("WindowLoad",Window)

loadingBackend:UpdateText("Loaded Backend")
local loadingUI = loadingInfo:CreateLabel("Loading UI..")

local information = hometab:CreateSection("Information")
information:CreateLabel("Welcome, "..api.nickname.."!")
information:CreateLabel("Script version: "..temptable.version)
information:CreateLabel("Place version: "..game.PlaceVersion)
information:CreateLabel("⚠️ - Not Safe Function")
information:CreateLabel("⚙ - Configurable Function")
information:CreateLabel("📜 - May be exploit specific")
information:CreateLabel("")
information:CreateLabel("Script updated by Morphisto.")
information:CreateLabel("Previously by weuz_, mrdevl and Boxking776")
local gainedhoneylabel = information:CreateLabel("Gained Honey: 0")
information:CreateLabel("")
information:CreateLabel("The script will continue to be updated")
local farmo = farmtab:CreateSection("Farming")
fielddropdown = farmo:CreateDropdown("Field", fieldstable, function(String) bongkoc.vars.field = String end) fielddropdown:SetOption(fieldstable[1])
convertatslider = farmo:CreateSlider("Convert At", 0, 100, 100, false, function(Value) bongkoc.vars.convertat = Value end)
autofarmtoggle = farmo:CreateToggle("Autofarm [⚙]", nil, function(State) bongkoc.toggles.autofarm = State end) autofarmtoggle:CreateKeybind("U", function(Key) end)
uiautodig = farmo:CreateToggle("Autodig", nil, function(State) bongkoc.toggles.autodig = State end)
uiautodigmode = farmo:CreateDropdown("Autodig Mode", {"Normal","Collector Steal"}, function(Option)  bongkoc.vars.autodigmode = Option end)

local contt = farmtab:CreateSection("Container Tools")
uidisableconvert = contt:CreateToggle("Don't Convert Pollen", nil, function(State) bongkoc.toggles.disableconversion = State end)
uiautouseconverters = contt:CreateToggle("Auto Bag Reduction",nil,function(Boole) bongkoc.toggles.autouseconvertors = Boole end)
uiautouseMode = contt:CreateDropdown("Bag Reduction Mode",{"Micro Converters", "Tickets and Micros", "Ticket Converters","Just Snowflakes","Just Coconuts","Snowflakes and Coconuts","Tickets and Snowflakes","Tickets and Coconuts","All"},function(Select) bongkoc.vars.autouseMode = Select end) -- Morphisto
contt:CreateSlider("Reduction Confirmation Time",3,20,10,false,function(tttttttt) bongkoc.vars.autoconvertWaitTime = tonumber(tttttttt) end)

uiautosprinkler = farmo:CreateToggle("Auto Sprinkler", nil, function(State) bongkoc.toggles.autosprinkler = State end)
uifarmbubbles = farmo:CreateToggle("Farm Bubbles", nil, function(State) bongkoc.toggles.farmbubbles = State end)
uifarmflame = farmo:CreateToggle("Farm Flames", nil, function(State) bongkoc.toggles.farmflame = State end)
uifarmcoco = farmo:CreateToggle("Farm Coconuts & Shower", nil, function(State) bongkoc.toggles.farmcoco = State end)
uicollectcrosshair = farmo:CreateToggle("Farm Precise Crosshairs", nil, function(State) bongkoc.toggles.collectcrosshairs = State end)
uifarmfuzzy = farmo:CreateToggle("Farm Fuzzy Bombs", nil, function(State) bongkoc.toggles.farmfuzzy = State end)
uifarmunderballoons = farmo:CreateToggle("Farm Under Balloons", nil, function(State) bongkoc.toggles.farmunderballoons = State end)
uifarmclouds = farmo:CreateToggle("Farm Under Clouds", nil, function(State) bongkoc.toggles.farmclouds = State end)
farmo:CreateLabel("")
uismartautofarm = farmo:CreateToggle("Smart farm when no other players/afk", nil, function(State) bongkoc.toggles.smartautofarm = State end) -- Morphisto
uihoneymaskconv = farmo:CreateToggle("Auto Honey Mask",nil,function(bool)
    bongkoc.toggles.honeymaskconv = bool
end)
uifarmboostedfield = farmo:CreateToggle("Farm Boosted field on Default Mask",nil,function(State) bongkoc.toggles.farmboostedfield = State end) -- Morphisto

uidefmask = farmo:CreateDropdown("Default Mask",MasksTable,function(val)
    bongkoc.vars.defmask = val
end)
--farmo:CreateToggle("Farm Closest Leaves", nil, function(State) bongkoc.toggles.farmclosestleaf = State end)

uimaskonfield = farmo:CreateToggle("Swap Mask on Field", nil, function(State) bongkoc.toggles.swapmaskonfield = State end)

local farmt = farmtab:CreateSection("Farming")
uiautodispense = farmt:CreateToggle("Auto Dispenser [⚙]", nil, function(State) bongkoc.toggles.autodispense = State end)
uiautoboosters = farmt:CreateToggle("Auto Field Boosters [⚙]", nil, function(State) bongkoc.toggles.autoboosters = State end)
uiclock = farmt:CreateToggle("Auto Wealth Clock", nil, function(State) bongkoc.toggles.clock = State end)
-- BEESMAS MARKER farmt:CreateToggle("Auto Gingerbread Bears", nil, function(State) bongkoc.toggles.collectgingerbreads = State end)
-- BEESMAS MARKER farmt:CreateToggle("Auto Samovar", nil, function(State) bongkoc.toggles.autosamovar = State end)
-- BEESMAS MARKER farmt:CreateToggle("Auto Stockings", nil, function(State) bongkoc.toggles.autostockings = State end)
uiautoplanters = farmt:CreateToggle("Auto Planters", nil, function(State) bongkoc.toggles.autoplanters = State end) -- Morphisto
-- BEESMAS MARKER farmt:CreateToggle("Auto Honey Candles", nil, function(State) bongkoc.toggles.autocandles = State end)
-- BEESMAS MARKER farmt:CreateToggle("Auto Beesmas Feast", nil, function(State) bongkoc.toggles.autofeast = State end)
-- BEESMAS MARKER farmt:CreateToggle("Auto Onett's Lid Art", nil, function(State) bongkoc.toggles.autoonettart = State end)
uifreeantpass = farmt:CreateToggle("Auto Free Antpasses", nil, function(State) bongkoc.toggles.freeantpass = State end)
uifarmsprouts = farmt:CreateToggle("Farm Sprouts", nil, function(State) bongkoc.toggles.farmsprouts = State end)
uifarmpuffshrooms = farmt:CreateToggle("Farm Puffshrooms", nil, function(State) bongkoc.toggles.farmpuffshrooms = State end)
-- BEESMAS MARKER farmt:CreateToggle("Farm Snowflakes [⚠️]", nil, function(State) bongkoc.toggles.farmsnowflakes = State end)
uifarmrares = farmt:CreateToggle("Teleport To Rares [⚠️]", nil, function(State) bongkoc.toggles.farmrares = State end)
uiautoquest = farmt:CreateToggle("Auto Accept/Confirm Quests [⚙]", nil, function(State) bongkoc.toggles.autoquest = State end)
uiautodoquest = farmt:CreateToggle("Auto Do Quests [⚙]", nil, function(State) bongkoc.toggles.autodoquest = State end)
uihoneystorm = farmt:CreateToggle("Auto Honeystorm", nil, function(State) bongkoc.toggles.honeystorm = State end)
farmt:CreateLabel(" ")
uiresetbeeenergy = farmt:CreateToggle("Reset Bee Energy after X Conversions",nil,function(bool) bongkoc.vars.resetbeeenergy = bool end)
farmt:CreateTextBox("Conversion Amount", "default = 3", true, function(Value) bongkoc.vars.resettimer = tonumber(Value) end)

local mobkill = combtab:CreateSection("Combat")
uikillcrab = mobkill:CreateToggle("Kill Crab", nil, function(State) bongkoc.toggles.killcrab = State end) -- Morphisto
uikilltunnelbear = mobkill:CreateToggle("Kill Tunnel Bear", nil, function(State) bongkoc.toggles.killtunnelbear = State end) -- Morphisto
uikillkingbeetle = mobkill:CreateToggle("Kill King Beetle", nil, function(State) bongkoc.toggles.killkingbeetle = State end) -- Morphisto
uikillstumpsnail = mobkill:CreateToggle("Kill Stump Snail", nil, function(State) bongkoc.toggles.killstumpsnail = State end) -- Morphisto

uikillmondo = mobkill:CreateToggle("Kill Mondo", nil, function(State) bongkoc.toggles.killmondo = State end)
uikillvicious = mobkill:CreateToggle("Kill Vicious", nil, function(State) bongkoc.toggles.killvicious = State end)
uikillwindy = mobkill:CreateToggle("Kill Windy", nil, function(State) bongkoc.toggles.killwindy = State end)
uikillstickbug = mobkill:CreateToggle("Kill Stick Bug", nil, function(State) bongkoc.toggles.killstickbug = State end) -- Morphisto
mobkill:CreateToggle("Auto Kill Mobs", nil, function(State) bongkoc.toggles.autokillmobs = State end):AddToolTip("Kills mobs after x pollen converting")
mobkill:CreateToggle("Avoid Mobs", nil, function(State) bongkoc.toggles.avoidmobs = State end)
uiautoant = mobkill:CreateToggle("Auto Ant", nil, function(State) bongkoc.toggles.autoant = State end) -- Morphisto

--[[local serverhopkill = combtab:CreateSection("Serverhopping Combat")
serverhopkill:CreateButton("Vicious Bee Serverhopper [⚠️][📜]",function() (loadstring(game:HttpGet("https://raw.githubusercontent.com/BongoCaat/BSSBongo1/main/viciousbeeserverhop.lua"))() end):AddToolTip("Serverhops for rouge vicious bees")
serverhopkill:CreateLabel("")
serverhopkill:CreateLabel("[⚠️] These functions will unload the UI")
serverhopkill:CreateLabel("")]]

local amks = combtab:CreateSection("Auto Kill Mobs Settings")
amks:CreateTextBox('Kill Mobs After x Convertions', 'default = 3', true, function(Value) bongkoc.vars.monstertimer = tonumber(Value) end)
-- Morphisto
local uiwlplayers = combtab:CreateSection("Players") -- Morphisto
for i, v in pairs(game.Players:GetChildren()) do
	uiwlplayers:CreateButton('Player' .. i .. ': ' .. v.Name, function() table.insert(temptable.players, v.Name) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace:FindFirstChild(v.Name).HumanoidRootPart.CFrame end)
end
-- Morphisto


local wayp = misctab:CreateSection("Waypoints")
wayp:CreateDropdown("Field Teleports", fieldstable, function(Option) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").FlowerZones:FindFirstChild(Option).CFrame end)
wayp:CreateDropdown("Monster Teleports", spawnerstable, function(Option) d = game:GetService("Workspace").MonsterSpawners:FindFirstChild(Option) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(d.Position.X, d.Position.Y+3, d.Position.Z) end)
wayp:CreateDropdown("Toys Teleports", toystable, function(Option) d = game:GetService("Workspace").Toys:FindFirstChild(Option).Platform game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(d.Position.X, d.Position.Y+3, d.Position.Z) end)
wayp:CreateButton("Teleport to hive", function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.SpawnPos.Value end)
wayp:CreateButton("print location", function() print(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) end) -- Morphisto
wayp:CreateDropdown("NPC Teleports", {"Black Bear","Brown Bear","Bucko Bee","Honey Bee","Panda Bear","Polar Bear","Riley Bee","Science Bear","Spirit Bear","Science Bear","Mother Bear","Sun Bear","Stick Bug","Onett","Gummy Lair","Bubble Bee Man","Meteor Shower","Demon Mask","Diamond Mask"}, function(Option) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = npctable[Option] end) -- Morphisto
wayp:CreateButton("Test1", function() KillTest() end) -- Morphisto
wayp:CreateButton("Test2", function() KillTest2() end) -- Morphisto

local useitems = itemstab:CreateSection("Use Items")

useitems:CreateButton("Use All Buffs [⚠️]",function() for i,v in pairs(buffTable) do  game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"]=i}) end end)
useitems:CreateLabel("")

for i,v in pairs(buffTable) do 
useitems:CreateButton("Use "..i,function() game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"]=i}) end) 
useitems:CreateToggle("Auto Use "..i,nil,function(bool)
    buffTable[i].b = bool
end)
end


local miscc = misctab:CreateSection("Misc")
miscc:CreateButton("Ant Challenge Semi-Godmode", function() api.tween(1, CFrame.new(93.4228, 32.3983, 553.128)) task.wait(1) game.ReplicatedStorage.Events.ToyEvent:FireServer("Ant Challenge") game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(93.4228, 42.3983, 553.128) task.wait(2) game.Players.LocalPlayer.Character.Humanoid.Name = 1 local l = game.Players.LocalPlayer.Character["1"]:Clone() l.Parent = game.Players.LocalPlayer.Character l.Name = "Humanoid" task.wait() game.Players.LocalPlayer.Character["1"]:Destroy() api.tween(1, CFrame.new(93.4228, 32.3983, 553.128)) task.wait(8) api.tween(1, CFrame.new(93.4228, 32.3983, 553.128)) end)
wstoggle = miscc:CreateToggle("Walk Speed", nil, function(State) bongkoc.toggles.loopspeed = State end) wstoggle:CreateKeybind("K", function(Key) end)
jptoggle = miscc:CreateToggle("Jump Power", nil, function(State) bongkoc.toggles.loopjump = State end) jptoggle:CreateKeybind("L", function(Key) end)
uigodmode = miscc:CreateToggle("Godmode", nil, function(State) bongkoc.toggles.godmode = State if State then bssapi:Godmode(true) else bssapi:Godmode(false) end end)
local misco = misctab:CreateSection("Other")
misco:CreateDropdown("Equip Accesories", accesoriestable, function(Option) local ohString1 = "Equip" local ohTable2 = { ["Mute"] = false, ["Type"] = Option, ["Category"] = "Accessory" } game:GetService("ReplicatedStorage").Events.ItemPackageEvent:InvokeServer(ohString1, ohTable2) end)
misco:CreateDropdown("Equip Masks", masktable, function(Option) local ohString1 = "Equip" local ohTable2 = { ["Mute"] = false, ["Type"] = Option, ["Category"] = "Accessory" } game:GetService("ReplicatedStorage").Events.ItemPackageEvent:InvokeServer(ohString1, ohTable2) end)
misco:CreateDropdown("Equip Collectors", collectorstable, function(Option) local ohString1 = "Equip" local ohTable2 = { ["Mute"] = false, ["Type"] = Option, ["Category"] = "Collector" } game:GetService("ReplicatedStorage").Events.ItemPackageEvent:InvokeServer(ohString1, ohTable2) end)
misco:CreateDropdown("Generate Amulet", {"Supreme Star Amulet", "Diamond Star Amulet", "Gold Star Amulet","Silver Star Amulet","Bronze Star Amulet","Moon Amulet"}, function(Option) local A_1 = Option.." Generator" local Event = game:GetService("ReplicatedStorage").Events.ToyEvent Event:FireServer(A_1) end)
misco:CreateButton("Export Stats Table [📜]", function() local StatCache = require(game.ReplicatedStorage.ClientStatCache)writefile("Stats_"..api.nickname..".json", StatCache:Encode()) end)

if string.find(string.upper(identifyexecutor()),"SYN") or string.find(string.upper(identifyexecutor()),"SCRIP") then
local visu = misctab:CreateSection("Visual")
local alertText = "☢️ A nuke is incoming! ☢️"
local alertDesign = "Purple"
local function pushAlert()
    local alerts = require(game:GetService("ReplicatedStorage").AlertBoxes)
    local chat = function(...)
        alerts:Push(...)
    end
    chat(alertText,nil,alertDesign)
end
visu:CreateButton("Spawn Coconut",function()
    syn.secure_call(function() 
        require(game.ReplicatedStorage.LocalFX.FallingCoconut)({
        Pos = game.Players.LocalPlayer.Character.Humanoid.RootPart.CFrame.p,
        Dur = 0.6,
        Radius = 16,
        Delay = 1.5,
        Friendly = true
    })
end, game.Players.LocalPlayer.PlayerScripts.ClientInit)
end)
visu:CreateButton("Spawn Hostile Coconut",function()
    syn.secure_call(function() 
        require(game.ReplicatedStorage.LocalFX.FallingCoconut)({
        Pos = game.Players.LocalPlayer.Character.Humanoid.RootPart.CFrame.p,
        Dur = 0.6,
        Radius = 16,
        Delay = 1.5,
        Friendly = false
    })
end, game.Players.LocalPlayer.PlayerScripts.ClientInit)
end)
visu:CreateButton("Spawn Mythic Meteor",function()
    syn.secure_call(function() 
        require(game.ReplicatedStorage.LocalFX.MythicMeteor)({
        Pos = game.Players.LocalPlayer.Character.Humanoid.RootPart.CFrame.p,
        Dur = 0.6,
        Radius = 16,
        Delay = 1.5,
        Friendly = true
    })
end, game.Players.LocalPlayer.PlayerScripts.ClientInit)
end)
visu:CreateButton("Spawn Jelly Bean",function()
local jellybeans = {"Navy","Blue","Spoiled","Merigold","Teal","Periwinkle","Pink","Slate","White","Black","Green","Brown","Yellow","Maroon","Red"}
syn.secure_call(function() 
        require(game.ReplicatedStorage.LocalFX.JellyBeanToss)({
        Start = game.Players.LocalPlayer.Character.Humanoid.RootPart.CFrame.p,
        Type = jellybeans[math.random(1,#jellybeans)],
        End = (game.Players.LocalPlayer.Character.Humanoid.RootPart.CFrame * CFrame.new(0,0,-35)).p + Vector3.new(math.random(1,20),0,math.random(1,20))
    })
end, game.Players.LocalPlayer.PlayerScripts.ClientInit)
end)
visu:CreateButton("Spawn Puffshroom Spores",function()
task.spawn(function() syn.secure_call(function()
local field = game:GetService("Workspace").FlowerZones:GetChildren()[math.random(1,#game:GetService("Workspace").FlowerZones:GetChildren())]
local pos = field.CFrame.p
require(game.ReplicatedStorage.LocalFX.PuffshroomSporeThrow)({
      Start = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.p,
      End = pos,
})
end, game.Players.LocalPlayer.PlayerScripts.ClientInit) 
wait(10)
workspace.Particles:FindFirstChild("SporeCloud"):Destroy()
end)
end)
visu:CreateButton("Spawn Party Popper",function()
syn.secure_call(function() 
require(game:GetService("ReplicatedStorage").LocalFX.PartyPopper)({
Pos = game.Players.LocalPlayer.Character.Humanoid.RootPart.CFrame.p,
})
end, game.Players.LocalPlayer.PlayerScripts.ClientInit)
end)
visu:CreateButton("Spawn Flame",function()
syn.secure_call(function()
        require(game.ReplicatedStorage.LocalFX.LocalFlames).AddFlame(
        game.Players.LocalPlayer.Character.Humanoid.RootPart.CFrame.p,
        10,
        1,
        game.Players.LocalPlayer.UserId,
        false
    )
end, game.Players.LocalPlayer.PlayerScripts.ClientInit)
end)
visu:CreateButton("Spawn Dark Flame",function()
syn.secure_call(function()
        require(game.ReplicatedStorage.LocalFX.LocalFlames).AddFlame(
        game.Players.LocalPlayer.Character.Humanoid.RootPart.CFrame.p,
        10,
        1,
        game.Players.LocalPlayer.UserId,
        true
    )
end, game.Players.LocalPlayer.PlayerScripts.ClientInit)
end)
local booolholder = false
visu:CreateToggle("Flame Walk",nil,function(boool)
    if boool == true then
        booolholder = true
        repeat wait(0.1)
            syn.secure_call(function()
                require(game.ReplicatedStorage.LocalFX.LocalFlames).AddFlame(
                game.Players.LocalPlayer.Character.Humanoid.RootPart.CFrame.p,
                10,
                1,
                game.Players.LocalPlayer.UserId,
                false
            )
        end, game.Players.LocalPlayer.PlayerScripts.ClientInit)
        until booolholder == false
    else
        booolholder = false
    end
end)
visu:CreateToggle("Dark Flame Walk",nil,function(boool)
    if boool == true then
        booolholder = true
        repeat wait(0.1)
            syn.secure_call(function()
                require(game.ReplicatedStorage.LocalFX.LocalFlames).AddFlame(
                game.Players.LocalPlayer.Character.Humanoid.RootPart.CFrame.p,
                10,
                1,
                game.Players.LocalPlayer.UserId,
                true
            )
        end, game.Players.LocalPlayer.PlayerScripts.ClientInit)
        until booolholder == false
    else
        booolholder = false
    end
end)
visu:CreateLabel("")
local styles = {}
local raw = {
	Blue = Color3.fromRGB(50, 131, 255), 
	ChaChing = Color3.fromRGB(50, 131, 255), 
	Green = Color3.fromRGB(27, 119, 43), 
	Red = Color3.fromRGB(201, 39, 28), 
	White = Color3.fromRGB(140, 140, 140), 
	Yellow = Color3.fromRGB(218, 216, 31), 
	Gold = Color3.fromRGB(254, 200, 9), 
	Pink = Color3.fromRGB(242, 129, 255), 
	Teal = Color3.fromRGB(33, 255, 171), 
	Purple = Color3.fromRGB(125, 97, 232), 
	TaDah = Color3.fromRGB(254, 200, 9), 
	Festive = Color3.fromRGB(197, 0, 15), 
	Festive2 = Color3.fromRGB(197, 0, 15), 
	Badge = Color3.fromRGB(254, 200, 9), 
	Robo = Color3.fromRGB(34, 255, 64), 
	EggHunt = Color3.fromRGB(236, 227, 158), 
	Vicious = Color3.fromRGB(0, 1, 5), 
	Brown = Color3.fromRGB(82, 51, 43)
}
local alertDesign2 = "Teal"
for i,v in pairs(raw) do table.insert(styles,i) end
visu:CreateDropdown("Notification Style",styles,function(dd) 
    alertDesign2=dd
end)
visu:CreateTextBox("Text","ex. Hello World",false,function(tx)
    alertText = tx
    alertDesign = alertDesign2
    syn.secure_call(pushAlert, game:GetService("Players").LocalPlayer.PlayerScripts.AlertBoxes)
end)

visu:CreateLabel("")
local destroym = true
visu:CreateToggle("Destroy Map", true, function(State) destroym = State end)
local nukeDuration = 10
local nukePosition = Vector3.new(-26.202560424804688, 0.657240390777588, 172.31759643554688)
local spoof = game:GetService("Players").LocalPlayer.PlayerScripts.AlertBoxes
function Nuke()
    require(game.ReplicatedStorage.LocalFX.MythicMeteor)({
        Pos = nukePosition,
        Dur = nukeDuration,
        Radius = 50,
        Delay = 1
    })
end
function DustCloud()
    require(game.ReplicatedStorage.LocalFX.OrbExplode)({
        Color = Color3.new(0.313726, 0.313726, 0.941176);
        Radius = 600;
        Dur = 15;
        Pos = nukePosition;
    })
end
visu:CreateButton("Spawn Nuke",function() 
 alertText = "☢️ A nuke is incoming! ☢️"
syn.secure_call(pushAlert, spoof)
alertText = "☢️ Get somewhere high! ☢️"
wait(1.5)
task.spawn(function()
local Humanoid = game.Players.LocalPlayer.Character.Humanoid
for i = 1, 950 do
    local x = math.random(-100,100)/100
    local y = math.random(-100,100)/100
    local z = math.random(-100,100)/100
    Humanoid.CameraOffset = Vector3.new(x,y,z)
    wait(0.01)
end
end)
syn.secure_call(pushAlert, spoof)
wait(10)
spawn(function() syn.secure_call(Nuke, game.Players.LocalPlayer.PlayerScripts.ClientInit) end)
wait(nukeDuration)
spawn(function() syn.secure_call(DustCloud, game.Players.LocalPlayer.PlayerScripts.ClientInit) end)
wait(1)
local Orb = game:GetService("Workspace").Particles:FindFirstChild("Orb")
if Orb then Orb.CanCollide = true end
if destroym == true then
repeat wait(3)
for i,v in pairs(Orb:GetTouchingParts()) do
  if v.Anchored == true then v.Anchored = false end 
  v:BreakJoints()
  v.Position = v.Position + Vector3.new(0,0,2)
end
until Orb == nil end
end)
end

local autofeed = itemstab:CreateSection("Auto Feed")

local function feedAllBees(treat,amt)
    for L = 1,5 do
        for U = 1,10 do
            game:GetService("ReplicatedStorage").Events.ConstructHiveCellFromEgg:InvokeServer(L, U, treat, amt)
        end
    end
end

autofeed:CreateDropdown("Select Treat",treatsTable,function(option) bongkoc.vars.selectedTreat = option end)
autofeed:CreateTextBox("Treat Amount","10",false,function(Value) bongkoc.vars.selectedTreatAmount = tonumber(Value) end)
autofeed:CreateButton("Feed All Bees",function() feedAllBees(bongkoc.vars.selectedTreat,bongkoc.vars.selectedTreatAmount) end)

local windShrine = itemstab:CreateSection("Wind Shrine")
windShrine:CreateDropdown("Select Item", donatableItemsTable, function(Option)  bongkoc.vars.donoItem = Option end)
windShrine:CreateTextBox("Item Quantity","10",false,function(Value) bongkoc.vars.donoAmount = tonumber(Value) end)
windShrine:CreateButton("Donate",function()
    donateToShrine(bongkoc.vars.donoItem,bongkoc.vars.donoAmount)
    print(bongkoc.vars.donoAmount)
end)
windShrine:CreateToggle("Auto Donate",nil,function(selection)
    bongkoc.toggles.autodonate = selection
end)


local farmsettings = setttab:CreateSection("Autofarm Settings")
farmsettings:CreateTextBox("Autofarming Walkspeed", "Default Value = 60", true, function(Value) bongkoc.vars.farmspeed = Value end)
farmsettings:CreateToggle("^ Loop Speed On Autofarming",nil, function(State) bongkoc.toggles.loopfarmspeed = State end)
farmsettings:CreateToggle("Don't Walk In Field",nil, function(State) bongkoc.toggles.farmflower = State end)
uiconvertballoons = farmsettings:CreateToggle("Convert Hive Balloon",nil, function(State) bongkoc.toggles.convertballoons = State end)
farmsettings:CreateToggle("Don't Farm Tokens",nil, function(State) bongkoc.toggles.donotfarmtokens = State end)
farmsettings:CreateToggle("Enable Token Blacklisting",nil, function(State) bongkoc.toggles.enabletokenblacklisting = State end)
farmsettings:CreateSlider("Walk Speed", 0, 120, 70, false, function(Value) bongkoc.vars.walkspeed = Value end)
farmsettings:CreateSlider("Jump Power", 0, 120, 70, false, function(Value) bongkoc.vars.jumppower = Value end)
local raresettings = setttab:CreateSection("Tokens Settings")
raresettings:CreateTextBox("Asset ID", 'rbxassetid', false, function(Value) rarename = Value end)
raresettings:CreateButton("Add Token To Rares List", function()
    table.insert(bongkoc.rares, rarename)
    game:GetService("CoreGui"):FindFirstChild(_G.windowname).Main:FindFirstChild("Rares List D",true):Destroy()
    raresettings:CreateDropdown("Rares List", bongkoc.rares, function(Option) end)
end)
raresettings:CreateButton("Remove Token From Rares List", function()
    table.remove(bongkoc.rares, api.tablefind(bongkoc.rares, rarename))
    game:GetService("CoreGui"):FindFirstChild(_G.windowname).Main:FindFirstChild("Rares List D",true):Destroy()
    raresettings:CreateDropdown("Rares List", bongkoc.rares, function(Option) end)
end)
raresettings:CreateButton("Add Token To Blacklist", function()
    table.insert(bongkoc.bltokens, rarename)
    game:GetService("CoreGui"):FindFirstChild(_G.windowname).Main:FindFirstChild("Tokens Blacklist D",true):Destroy()
    raresettings:CreateDropdown("Tokens Blacklist", bongkoc.bltokens, function(Option) end)
end)
raresettings:CreateButton("Remove Token From Blacklist", function()
    table.remove(bongkoc.bltokens, api.tablefind(bongkoc.bltokens, rarename))
    game:GetService("CoreGui"):FindFirstChild(_G.windowname).Main:FindFirstChild("Tokens Blacklist D",true):Destroy()
    raresettings:CreateDropdown("Tokens Blacklist", bongkoc.bltokens, function(Option) end)
end)
raresettings:CreateDropdown("Tokens Blacklist", bongkoc.bltokens, function(Option) end)
raresettings:CreateDropdown("Rares List", bongkoc.rares, function(Option) end)
local dispsettings = setttab:CreateSection("Auto Dispenser & Auto Boosters Settings")
uirj = dispsettings:CreateToggle("Royal Jelly Dispenser", nil, function(State) bongkoc.dispensesettings.rj = State end)
uiblub = dispsettings:CreateToggle("Blueberry Dispenser", nil,  function(State) bongkoc.dispensesettings.blub = State end)
uistraw = dispsettings:CreateToggle("Strawberry Dispenser", nil,  function(State) bongkoc.dispensesettings.straw = State end)
uitreat = dispsettings:CreateToggle("Treat Dispenser", nil,  function(State) bongkoc.dispensesettings.treat = State end)
uicoconut = dispsettings:CreateToggle("Coconut Dispenser", nil,  function(State) bongkoc.dispensesettings.coconut = State end)
uiglue = dispsettings:CreateToggle("Glue Dispenser", nil,  function(State) bongkoc.dispensesettings.glue = State end)
uiwhite = dispsettings:CreateToggle("Mountain Top Booster", nil,  function(State) bongkoc.dispensesettings.white = State end)
uiblue = dispsettings:CreateToggle("Blue Field Booster", nil,  function(State) bongkoc.dispensesettings.blue = State end)
uired = dispsettings:CreateToggle("Red Field Booster", nil,  function(State) bongkoc.dispensesettings.red = State end)
local guisettings = setttab:CreateSection("GUI Settings")
local uitoggle = guisettings:CreateToggle("UI Toggle", nil, function(State) Window:Toggle(State) end) uitoggle:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key) Config.Keybind = Enum.KeyCode[Key] end) uitoggle:SetState(true)
guisettings:CreateColorpicker("UI Color", function(Color) Window:ChangeColor(Color) end)
local themes = guisettings:CreateDropdown("Image", {"Default","Hearts","Abstract","Hexagon","Circles","Lace With Flowers","Floral"}, function(Name) if Name == "Default" then Window:SetBackground("2151741365") elseif Name == "Hearts" then Window:SetBackground("6073763717") elseif Name == "Abstract" then Window:SetBackground("6073743871") elseif Name == "Hexagon" then Window:SetBackground("6073628839") elseif Name == "Circles" then Window:SetBackground("6071579801") elseif Name == "Lace With Flowers" then Window:SetBackground("6071575925") elseif Name == "Floral" then Window:SetBackground("5553946656") end end)themes:SetOption("Default")
local bongkocs = setttab:CreateSection("Configs")
bongkocs:CreateTextBox("Config Name", 'ex: stumpconfig', false, function(Value) temptable.configname = Value end)
bongkocs:CreateButton("Load Config", function() bongkoc = game:service'HttpService':JSONDecode(readfile("bongkoc/BSS_"..temptable.configname..".json")) end)
bongkocs:CreateButton("Save Config", function() writefile("bongkoc/BSS_"..temptable.configname..".json",game:service'HttpService':JSONEncode(bongkoc)) end)
bongkocs:CreateButton("Reset Config", function() bongkoc = defaultbongkoc end)
local fieldsettings = setttab:CreateSection("Fields Settings")
uibestwhite = fieldsettings:CreateDropdown("Best White Field", temptable.whitefields, function(Option) bongkoc.bestfields.white = Option end)
uibestred = fieldsettings:CreateDropdown("Best Red Field", temptable.redfields, function(Option) bongkoc.bestfields.red = Option end)
uibestblue = fieldsettings:CreateDropdown("Best Blue Field", temptable.bluefields, function(Option) bongkoc.bestfields.blue = Option end)
fieldsettings:CreateDropdown("Field", fieldstable, function(Option) temptable.blackfield = Option end)
fieldsettings:CreateButton("Add Field To Blacklist", function() table.insert(bongkoc.blacklistedfields, temptable.blackfield) game:GetService("CoreGui"):FindFirstChild(_G.windowname).Main:FindFirstChild("Blacklisted Fields D",true):Destroy() fieldsettings:CreateDropdown("Blacklisted Fields", bongkoc.blacklistedfields, function(Option) end) end)
fieldsettings:CreateButton("Remove Field From Blacklist", function() table.remove(bongkoc.blacklistedfields, api.tablefind(bongkoc.blacklistedfields, temptable.blackfield)) game:GetService("CoreGui"):FindFirstChild(_G.windowname).Main:FindFirstChild("Blacklisted Fields D",true):Destroy() fieldsettings:CreateDropdown("Blacklisted Fields", bongkoc.blacklistedfields, function(Option) end) end)
fieldsettings:CreateDropdown("Blacklisted Fields", bongkoc.blacklistedfields, function(Option) end)
local aqs = setttab:CreateSection("Auto Quest Settings")
uinpcprefer = aqs:CreateDropdown("Do NPC Quests", {'All Quests', 'Bucko Bee', 'Brown Bear', 'Riley Bee', 'Polar Bear'}, function(Option) bongkoc.vars.npcprefer = Option end)
uitptonpc = aqs:CreateToggle("Teleport To NPC", nil, function(State) bongkoc.toggles.tptonpc = State end)
local pts = setttab:CreateSection("Autofarm Priority Tokens")
pts:CreateTextBox("Asset ID", 'rbxassetid', false, function(Value) rarename = Value end)
pts:CreateButton("Add Token To Priority List", function() table.insert(bongkoc.priority, rarename) game:GetService("CoreGui"):FindFirstChild(_G.windowname).Main:FindFirstChild("Priority List D",true):Destroy() pts:CreateDropdown("Priority List", bongkoc.priority, function(Option) end) end)
pts:CreateButton("Remove Token From Priority List", function() table.remove(bongkoc.priority, api.tablefind(bongkoc.priority, rarename)) game:GetService("CoreGui"):FindFirstChild(_G.windowname).Main:FindFirstChild("Priority List D",true):Destroy() pts:CreateDropdown("Priority List", bongkoc.priority, function(Option) end) end)
pts:CreateDropdown("Priority List", bongkoc.priority, function(Option) end)

loadingUI:UpdateText("Loaded UI")
local loadingLoops = loadingInfo:CreateLabel("Loading Loops..")

-- Morphisto - Camera Fixer
task.spawn(function() while task.wait() do
	pcall(function()
		game.Players.LocalPlayer.CameraMinZoomDistance, game.Players.LocalPlayer.CameraMaxZoomDistance = 0x0, 0x400 end)
end end)
-- Morphisto - Camera Fixer

-- script

-- Morphisto
local demontoggleouyfyt = false
task.spawn(function()
	while wait(1) do
		if temptable.started.mondo or temptable.started.vicious or temptable.started.windy or temptable.started.ant or temptable.started.crab or temptable.started.tunnelbear or temptable.started.kingbeetle or temptable.started.stumpsnail or temptable.started.stickbug then
			if demontoggleouyfyt == false then
				demontoggleouyfyt = true
				game:GetService("ReplicatedStorage").Events.ItemPackageEvent:InvokeServer("Equip", {Mute=false;Type="Demon Mask";Category="Accessory"})
			end
		else
			if demontoggleouyfyt == true then
				demontoggleouyfyt = false
				game:GetService("ReplicatedStorage").Events.ItemPackageEvent:InvokeServer("Equip", {Mute=false;Type=bongkoc.vars.defmask;Category="Accessory"})
			end
		end
	end
end)
-- Morphisto

-- Morphisto
currentField = ""
currentMask = ""
local function SwapMaskonField(ifield)
	if bongkoc.toggles.swapmaskonfield and ifield ~= currentField then
		if ifield == "Coconut Field" or ifield == "Spider Field" or ifield == "Pineapple Patch" or ifield == "Dandelion Field" or ifield == "Sunflower Field" or ifield == "Pumpkin Patch" then
			game:GetService("ReplicatedStorage").Events.ItemPackageEvent:InvokeServer("Equip", {Mute=false;Type="Gummy Mask";Category="Accessory"})
			currentMask = "Gummy Mask"
		elseif ifield == "Rose Field" or ifield == "Pepper Patch" or ifield == "Mushroom Field" or ifield == "Strawberry Field" then
			game:GetService("ReplicatedStorage").Events.ItemPackageEvent:InvokeServer("Equip", {Mute=false;Type="Demon Mask";Category="Accessory"})
			currentMask = "Demon Mask"
		elseif ifield == "Blue Flower Field" or ifield == "Pine Tree Forest" or ifield == "Stump Field" or ifield == "Bamboo Field" then
			game:GetService("ReplicatedStorage").Events.ItemPackageEvent:InvokeServer("Equip", {Mute=false;Type="Diamond Mask";Category="Accessory"})
			currentMask = "Diamond Mask"
		else
			game:GetService("ReplicatedStorage").Events.ItemPackageEvent:InvokeServer("Equip", {Mute=false;Type=bongkoc.vars.defmask;Category="Accessory"})
			currentMask = bongkoc.vars.defmask
		end
		currentField = ifield
	end
end
-- Morphisto

local honeytoggleouyfyt = false
task.spawn(function()
    while wait(1) do
        if bongkoc.toggles.honeymaskconv == true then
        if temptable.converting then
            if honeytoggleouyfyt == false then
                honeytoggleouyfyt = true
                    game:GetService("ReplicatedStorage").Events.ItemPackageEvent:InvokeServer("Equip", {Mute=false;Type="Honey Mask";Category="Accessory"})
            end
        else
            if honeytoggleouyfyt == true then
                honeytoggleouyfyt = false
                game:GetService("ReplicatedStorage").Events.ItemPackageEvent:InvokeServer("Equip", {Mute=false;Type=bongkoc.vars.defmask;Category="Accessory"})
            end
        end
        end
    end
end)

task.spawn(function()
    while wait(5) do
        local buffs = fetchBuffTable(buffTable)
        for i,v in pairs(buffTable) do
            if v["b"] == true then
                local inuse = false
                for k,p in pairs(buffs) do
                    if k == i then inuse = true end
                end
                if inuse == false then
                    game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"]=i})
                end
            end
        end
    end
end)

task.spawn(function() while task.wait() do
    if bongkoc.toggles.autofarm then
        --if bongkoc.toggles.farmcoco then getcoco() end
        --if bongkoc.toggles.collectcrosshairs then getcrosshairs() end
        if bongkoc.toggles.farmflame then getflame() end
        if bongkoc.toggles.farmfuzzy then getfuzzy() end
    end
end end)

game.Workspace.Particles.ChildAdded:Connect(function(v)
    if not temptable.started.vicious and not temptable.started.ant then
        if v.Name == "WarningDisk" and not temptable.started.vicious and bongkoc.toggles.autofarm and not temptable.started.ant and bongkoc.toggles.farmcoco and (v.Position-api.humanoidrootpart().Position).magnitude < temptable.magnitude and not temptable.converting then
            table.insert(temptable.coconuts, v)
            getcoco(v)
            gettoken()
        elseif v.Name == "Crosshair" and v ~= nil and v.BrickColor ~= BrickColor.new("Forest green") and not temptable.started.ant and v.BrickColor ~= BrickColor.new("Flint") and (v.Position-api.humanoidrootpart().Position).magnitude < temptable.magnitude and bongkoc.toggles.autofarm and bongkoc.toggles.collectcrosshairs and not temptable.converting then
            if #temptable.crosshairs <= 3 then
                table.insert(temptable.crosshairs, v)
                getcrosshairs(v)
                gettoken()
            end
        end
    end
end)

task.spawn(function() while task.wait() do
        temptable.magnitude = 50
        if game.Players.LocalPlayer.Character:FindFirstChild("ProgressLabel",true) then
        local pollenprglbl = game.Players.LocalPlayer.Character:FindFirstChild("ProgressLabel",true)
        maxpollen = tonumber(pollenprglbl.Text:match("%d+$"))
        local pollencount = game.Players.LocalPlayer.CoreStats.Pollen.Value
        pollenpercentage = pollencount/maxpollen*100
        fieldselected = game:GetService("Workspace").FlowerZones[bongkoc.vars.field]

        if bongkoc.toggles.autouseconvertors == true then
			-- Morphisto
			if tonumber(pollenpercentage) >= (bongkoc.vars.convertat - (bongkoc.vars.autoconvertWaitTime)) then
				if not temptable.consideringautoconverting then
					temptable.consideringautoconverting = true
					useConvertors()
					temptable.consideringautoconverting = false
				end
			end
			-- Morphisto
        end

        if bongkoc.toggles.autofarm then
		if bongkoc.toggles.autodoquest and game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.Menus.Children.Quests.Content:FindFirstChild("Frame") and not bongkoc.toggles.farmboostedfield and not temptable.started.ant then
            for i,v in next, game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.Menus.Children.Quests:GetDescendants() do
                if v.Name == "Description" then
                    if string.match(v.Parent.Parent.TitleBar.Text, bongkoc.vars.npcprefer) or bongkoc.vars.npcprefer == "All Quests" and not string.find(v.Text, "Puffshroom") then
                        pollentypes = {'White Pollen', "Red Pollen", "Blue Pollen", "Blue Flowers", "Red Flowers", "White Flowers"}
                        text = v.Text
						farmfield = false -- Morphisto
                        if api.returnvalue(fieldstable, text) and not string.find(v.Text, "Complete!") and not api.findvalue(bongkoc.blacklistedfields, api.returnvalue(fieldstable, text)) then
                            d = api.returnvalue(fieldstable, text)
                            fieldselected = game:GetService("Workspace").FlowerZones[d]
							SwapMaskonField(d) -- Morphisto
							farmfield = true -- Morphisto
                            break
                        -- Morphisto
						elseif string.find(text, "Rhino") then
							if not string.find(text, 'Complete!') then
								killquestmobs("Rhino")
								SwapMaskonField("Bamboo Field")
							elseif string.find(text, 'Complete!') then
								makequests()
							end
							break
						elseif string.find(text, "Mantis") then
							if not string.find(text, 'Complete!') then
								killquestmobs("Mantis")
								SwapMaskonField("Pine Tree Forest")
							elseif string.find(text, 'Complete!') then
								makequests()
							end
							break
						elseif string.find(text, "Werewol") then
							if not string.find(text, 'Complete!') then
								killquestmobs("Werewolf")
								SwapMaskonField("Pine Tree Forest")
							elseif string.find(text, 'Complete!') then
								makequests()
							end
							break
						elseif string.find(text, "Spider") then
							if not string.find(text, 'Complete!') then
								killquestmobs("Spider")
								SwapMaskonField("Spider Field")
							elseif string.find(text, 'Complete!') then
								makequests()
							end
							break
						elseif string.find(text, "Scorpion") then
							if not string.find(text, 'Complete!') then
								killquestmobs("Scorpion")
								SwapMaskonField("Rose Field")
							elseif string.find(text, 'Complete!') then
								makequests()
							end
							break
						elseif string.find(text, "Lady") then
							if not string.find(text, 'Complete!') then
								killquestmobs("Ladybug")
								SwapMaskonField("Strawberry Field")
							elseif string.find(text, 'Complete!') then
								makequests()
							end
							break
						elseif string.find(text, "Ants") and not string.find(v.Text, "Complete!") then
							if not game:GetService("Workspace").Toys["Ant Challenge"].Busy.Value and rtsg().Eggs.AntPass > 0 then farmant() end
							break
						-- Morphisto
						elseif api.returnvalue(pollentypes, text) and not string.find(v.Text, 'Complete!') then
                            d = api.returnvalue(pollentypes, text)
                            if d == "Blue Flowers" or d == "Blue Pollen" then
                                fieldselected = game:GetService("Workspace").FlowerZones[bongkoc.bestfields.blue]
								SwapMaskonField(bongkoc.bestfields.blue) -- Morphisto
								farmfield = true -- Morphisto
                                break
                            elseif d == "White Flowers" or d == "White Pollen" then
                                fieldselected = game:GetService("Workspace").FlowerZones[bongkoc.bestfields.white]
								SwapMaskonField(bongkoc.bestfields.white) -- Morphisto
								farmfield = true -- Morphisto
                                break
                            elseif d == "Red Flowers" or d == "Red Pollen" then
                                fieldselected = game:GetService("Workspace").FlowerZones[bongkoc.bestfields.red]
								SwapMaskonField(bongkoc.bestfields.red) -- Morphisto
								farmfield = true -- Morphisto
                                break
                            end
                        end
                    end
                end
            end
        else
			fieldselected = game:GetService("Workspace").FlowerZones[bongkoc.vars.field] -- Autofarm field
			-- Morphisto
			if currentMask ~= bongkoc.vars.defmask and not farmfield then
				game:GetService("ReplicatedStorage").Events.ItemPackageEvent:InvokeServer("Equip", {Mute=false;Type=bongkoc.vars.defmask;Category="Accessory"})
			end
			-- Morphisto
        end
        fieldpos = CFrame.new(fieldselected.Position.X, fieldselected.Position.Y+3, fieldselected.Position.Z)
        fieldposition = fieldselected.Position
        if temptable.sprouts.detected and temptable.sprouts.coords and bongkoc.toggles.farmsprouts then
            fieldposition = temptable.sprouts.coords.Position
            fieldpos = temptable.sprouts.coords
        end
        if bongkoc.toggles.farmpuffshrooms and game.Workspace.Happenings.Puffshrooms:FindFirstChildOfClass("Model") then
			temptable.puffshroomdetected = true
			local buffs = fetchBuffTable(buffTable) 
            if api.partwithnamepart("Mythic", game.Workspace.Happenings.Puffshrooms) then
                temptable.magnitude = 25 
                fieldpos = api.partwithnamepart("Mythic", game.Workspace.Happenings.Puffshrooms):FindFirstChild("Puffball Stem").CFrame
                fieldposition = fieldpos.Position
            	if temptable.puffshroomdetected then
					if not tablefind(buffs, "Oil") then
						if GetItemListWithValue()["Oil"] > 0 then
							game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Oil"})
						end					
					end
					if not tablefind(buffs, "Jelly Bean Sharing Bonus") then
						if GetItemListWithValue()["CloudVial"] > 0 then
							game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Cloud Vial"})
						end
						if GetItemListWithValue()["JellyBeans"] > 0 then
							game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Jelly Beans"})
						end	
					end
					if not tablefind(buffs, "Blue Extract") then
						if GetItemListWithValue()["BlueExtract"] > 0 then
							game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Blue Extract"})
						end					
					end
					if not tablefind(buffs, "Red Extract") then
						if GetItemListWithValue()["RedExtract"] > 0 then
							game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Red Extract"})
						end					
					end
					if not tablefind(buffs, "Tropical Drink") then
						if GetItemListWithValue()["TropicalDrink"] > 0 then
							game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Tropical Drink"})
						end					
					end
					if not tablefind(buffs, "Glitter") then
						if GetItemListWithValue()["Glitter"] > 0 then
							game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Glitter"})
						end					
					end
					if not tablefind(buffs, "Glue") then
						if GetItemListWithValue()["Glue"] > 0 then
							game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Glue"})
						end					
					end
				end
			elseif api.partwithnamepart("Legendary", game.Workspace.Happenings.Puffshrooms) then
                temptable.magnitude = 25 
                fieldpos = api.partwithnamepart("Legendary", game.Workspace.Happenings.Puffshrooms):FindFirstChild("Puffball Stem").CFrame
                fieldposition = fieldpos.Position
            	if temptable.puffshroomdetected then
					if not tablefind(buffs, "Oil") then
						if GetItemListWithValue()["Oil"] > 0 then
							game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Oil"})
						end					
					end
					if not tablefind(buffs, "Jelly Bean Sharing Bonus") then
						if GetItemListWithValue()["CloudVial"] > 0 then
							game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Cloud Vial"})
						end
						if GetItemListWithValue()["JellyBeans"] > 0 then
							game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Jelly Beans"})
						end	
					end
					if not tablefind(buffs, "Blue Extract") then
						if GetItemListWithValue()["BlueExtract"] > 0 then
							game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Blue Extract"})
						end					
					end
					if not tablefind(buffs, "Red Extract") then
						if GetItemListWithValue()["RedExtract"] > 0 then
							game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Red Extract"})
						end					
					end
					if not tablefind(buffs, "Tropical Drink") then
						if GetItemListWithValue()["TropicalDrink"] > 0 then
							game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Tropical Drink"})
						end					
					end
					if not tablefind(buffs, "Glitter") then
						if GetItemListWithValue()["Glitter"] > 0 then
							game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Glitter"})
						end					
					end
					if not tablefind(buffs, "Glue") then
						if GetItemListWithValue()["Glue"] > 0 then
							game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Glue"})
						end					
					end
				end
			elseif api.partwithnamepart("Epic", game.Workspace.Happenings.Puffshrooms) then
                temptable.magnitude = 25 
                fieldpos = api.partwithnamepart("Epic", game.Workspace.Happenings.Puffshrooms):FindFirstChild("Puffball Stem").CFrame
                fieldposition = fieldpos.Position
            	if temptable.puffshroomdetected then
					if not tablefind(buffs, "Oil") then
						if GetItemListWithValue()["CloudVial"] > 0 then
							game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Cloud Vial"})
						end
						if GetItemListWithValue()["Oil"] > 0 then
							game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Oil"})
						end
					end
					if not tablefind(buffs, "Jelly Bean Sharing Bonus") then
						if GetItemListWithValue()["JellyBeans"] > 0 then
							game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Jelly Beans"})
						end
					end
				end
            else
                temptable.magnitude = 25 
                fieldpos = api.getbiggestmodel(game.Workspace.Happenings.Puffshrooms):FindFirstChild("Puffball Stem").CFrame
                fieldposition = fieldpos.Position
            end
        elseif temptable.puffshroomdetected and temptable.puffshroomboosted then
			temptable.puffshroomdetected = false
			temptable.puffshroomboosted = false
		end

		if (tonumber(pollenpercentage) < tonumber(bongkoc.vars.convertat)) or (bongkoc.toggles.disableconversion == true) then
		    if not temptable.tokensfarm then
                api.tween(2, fieldpos)
                task.wait(2)
                temptable.tokensfarm = true
                if bongkoc.toggles.autosprinkler then makesprinklers() end
            else
                if bongkoc.toggles.killmondo then
                    while bongkoc.toggles.killmondo and game.Workspace.Monsters:FindFirstChild("Mondo Chick (Lvl 8)") and not temptable.started.vicious and not temptable.started.monsters and not temptable.started.stickbug do
                        temptable.started.mondo = true
						disableall()
						local buffs = fetchBuffTable(buffTable)
						if not tablefind(buffs, "Oil") then
							if GetItemListWithValue()["Oil"] > 0 then
								game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Oil"})
							end
						end
                        while game.Workspace.Monsters:FindFirstChild("Mondo Chick (Lvl 8)") do
							local buffs = fetchBuffTable(buffTable)
							if not tablefind(buffs, "Stinger") then
								if GetItemListWithValue()["Stinger"] > 0 then
									game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Stinger"})
								end
							end
                            game:GetService("Workspace").Map.Ground.HighBlock.CanCollide = false 
                            mondopition = game.Workspace.Monsters["Mondo Chick (Lvl 8)"].Head.Position
                            api.tween(1, CFrame.new(mondopition.x, mondopition.y - 60, mondopition.z))
                            task.wait(1)
                            temptable.float = true
                        end
                        task.wait(.5) game:GetService("Workspace").Map.Ground.HighBlock.CanCollide = true temptable.float = false api.tween(.5, CFrame.new(73.2, 176.35, -167)) task.wait(1)
                        for i = 0, 50 do 
                            gettoken(CFrame.new(73.2, 176.35, -167).Position) 
                        end 
                        enableall() 
                        api.tween(2, fieldpos) 
                        temptable.started.mondo = false
						boostaftermondo = true
                    end
                end
                if bongkoc.toggles.killcrab then KillCoconutCrab() end -- Morphisto
				if bongkoc.toggles.killtunnelbear then KillTunnelBear() end -- Morphisto
				if bongkoc.toggles.killkingbeetle then KillKingBeetle() end -- Morphisto
				if bongkoc.toggles.killstumpsnail then KillStumpSnail() end -- Morphisto
				if bongkoc.toggles.farmboostedfield and not temptable.started.stickbug then farmboostedfield() end -- Morphisto
				if bongkoc.toggles.killstickbug and temptable.sbready and not temptable.cache.disableinrange then
					local event = game.ReplicatedStorage.Events:FindFirstChild("SelectNPCOption")
					if event then
						event:FireServer("StartFreeStickBugEvent")
					end
					temptable.sbready = false
				end
				if (fieldposition-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > temptable.magnitude then
                    api.tween(2, fieldpos) -- Morphisto
                    if bongkoc.toggles.autosprinkler then makesprinklers() end
					-- Morphisto
					if currentMask ~= bongkoc.vars.defmask then
						game:GetService("ReplicatedStorage").Events.ItemPackageEvent:InvokeServer("Equip", {Mute=false;Type=bongkoc.vars.defmask;Category="Accessory"})
					end
					if boostaftermondo and GetItemListWithValue()["LoadedDice"] == 25 then
						print("Mondo Chick Killed. Activate Loaded Dice for boosting..")
						game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Loaded Dice"})
						boostaftermondo = false
					end
					-- Morphisto
                end
                getprioritytokens()
                if bongkoc.toggles.avoidmobs then avoidmob() end
                if bongkoc.toggles.farmclosestleaf then closestleaf() end
                if bongkoc.toggles.farmbubbles then getbubble() end
                if bongkoc.toggles.farmclouds then getcloud() end
                if bongkoc.toggles.farmunderballoons then getballoons() end
                if not bongkoc.toggles.donotfarmtokens and done then gettoken() end
                if not bongkoc.toggles.farmflower then getflower() end
				local cooldown = time() - tonumber(chk5min_time)
				if not sbfirstcheck or cooldown > 300 then chk5min_time = time() check5minstasks() end
            end
        elseif tonumber(pollenpercentage) >= tonumber(bongkoc.vars.convertat) then
            if not bongkoc.toggles.disableconversion then
            temptable.tokensfarm = false
            api.tween(2, game:GetService("Players").LocalPlayer.SpawnPos.Value * CFrame.fromEulerAnglesXYZ(0, 110, 0) + Vector3.new(0, 0, 9))
            task.wait(2)
            temptable.converting = true
            repeat
                converthoney()
            until game.Players.LocalPlayer.CoreStats.Pollen.Value == 0 or not bongkoc.toggles.autofarm -- Morphisto
            if bongkoc.toggles.convertballoons and gethiveballoon() then
                task.wait(6)
                repeat
                    task.wait()
                    converthoney()
                until gethiveballoon() == false or not bongkoc.toggles.convertballoons or not bongkoc.toggles.autofarm -- Morphisto
            end
            temptable.converting = false
            temptable.act = temptable.act + 1
            task.wait(6)
            if bongkoc.toggles.autoant and not game:GetService("Workspace").Toys["Ant Challenge"].Busy.Value and rtsg().Eggs.AntPass > 0 then farmant() end
            if bongkoc.toggles.autokillmobs then 
                if temptable.act >= bongkoc.vars.monstertimer then
                    temptable.started.monsters = true
                    temptable.act = 0
                    killmobs() 
                    temptable.started.monsters = false
                end
            end
            if bongkoc.vars.resetbeeenergy then
            --rconsoleprint("Act2:-"..tostring(temptable.act2))
            if temptable.act2 >= bongkoc.vars.resettimer then
                temptable.started.monsters = true
                temptable.act2 = 0
                repeat wait() until workspace:FindFirstChild(game.Players.LocalPlayer.Name) and workspace:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("Humanoid") and workspace:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("Humanoid").Health > 0
                workspace:FindFirstChild(game.Players.LocalPlayer.Name):BreakJoints()
                task.wait(6.5)
                repeat wait() until workspace:FindFirstChild(game.Players.LocalPlayer.Name)
                workspace:FindFirstChild(game.Players.LocalPlayer.Name):BreakJoints()
                task.wait(6.5)
                repeat wait() until workspace:FindFirstChild(game.Players.LocalPlayer.Name)
                temptable.started.monsters = false
            end
        end
        end
    end
end end end end)

task.spawn(function()
    while task.wait(1) do
		if bongkoc.toggles.killvicious and temptable.detected.vicious and temptable.converting == false and not temptable.started.monsters and not temptable.started.stickbug then
            temptable.started.vicious = true
            disableall()
			local vichumanoid = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
			for i,v in next, game.workspace.Particles:GetChildren() do
				for x in string.gmatch(v.Name, "Vicious") do
					if string.find(v.Name, "Vicious") then
						api.tween(1,CFrame.new(v.Position.x, v.Position.y, v.Position.z)) task.wait(1)
						api.tween(0.5, CFrame.new(v.Position.x, v.Position.y, v.Position.z)) task.wait(.5)
					end
				end
			end
			for i,v in next, game.workspace.Particles:GetChildren() do
				for x in string.gmatch(v.Name, "Vicious") do
                    while bongkoc.toggles.killvicious and temptable.detected.vicious and not temptable.cache.disableinrange do task.wait() if string.find(v.Name, "Vicious") then
                        for i=1, 4 do temptable.float = true vichumanoid.CFrame = CFrame.new(v.Position.x+10, v.Position.y, v.Position.z) task.wait(.3)
                        end
                    end end
                end
			end
            enableall()
			task.wait(1)
			temptable.float = false
            temptable.started.vicious = false
		end
	end
end)

task.spawn(function() while task.wait() do
    if bongkoc.toggles.killwindy and temptable.detected.windy and not temptable.converting and not temptable.started.vicious and not temptable.started.mondo and not temptable.started.monsters and not temptable.started.stickbug and not temptable.started.stumpsnail then
        temptable.started.windy = true
        wlvl = "" aw = false awb = false -- some variable for autowindy, yk?
        --disableall()
        while bongkoc.toggles.killwindy and temptable.detected.windy do
            if not aw then
                for i,v in pairs(workspace.Monsters:GetChildren()) do
                    if string.find(v.Name, "Windy") then wlvl = v.Name aw = true -- we found windy!
                    end
                end
            end
            if aw then
                for i,v in pairs(workspace.Monsters:GetChildren()) do
                    if string.find(v.Name, "Windy") then
                        if v.Name ~= wlvl then
                            temptable.float = false task.wait(5) for i =1, 5 do gettoken(api.humanoidrootpart().Position) end -- collect tokens :yessir:
                            wlvl = v.Name
                        end
                    end
                end
            end

			if typeof(temptable.windy) == "Instance" and temptable.windy:IsA("ObjectValue") then
				print('temptable.windy is an Instance/Object')
			end
			if temptable.windy ~= nil then
				if not awb then
					api.tween(1,temptable.gacf(temptable.windy, 5)) -- tries to bump Windy Bee in Cloud -- Morphisto
					task.wait(1)
					awb = true
				end
			end

			if awb and temptable.windy ~= nil then
				--print(temptable.windy)
				if temptable.windy == "Windy" then
					api.humanoidrootpart().CFrame = temptable.gacf(temptable.windy, 25)
					temptable.float = true
				end
			end
			task.wait()
        end 
        --enableall()
        temptable.float = false
        temptable.started.windy = false
    end
end end)

local function collectorSteal()
    if bongkoc.vars.autodigmode == "Collector Steal" then
        for i,v in pairs(game.Players:GetChildren()) do
            if v.Name ~= game.Players.LocalPlayer.Name then
                if v then
                    if v.Character then
                        if v.Character:FindFirstChildWhichIsA("Tool") then
                            if v.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("ClickEvent") then
                    v.Character:FindFirstChildWhichIsA("Tool").ClickEvent:FireServer()
                end
            end
        end
        end
        end
        end
    end
end

task.spawn(function() while task.wait(0.001) do
    if bongkoc.toggles.farmrares then for k,v in next, game.workspace.Collectibles:GetChildren() do if v.CFrame.YVector.Y == 1 then if v.Transparency == 0 then decal = v:FindFirstChildOfClass("Decal") for e,r in next, bongkoc.rares do if decal.Texture == r or decal.Texture == "rbxassetid://"..r then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame break end end end end end end
    if bongkoc.toggles.autodig then 
	if game.Players.LocalPlayer then 
		if game.Players.LocalPlayer.Character then 
			if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then 
				if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild("ClickEvent", true) then 
				tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") or nil 
				end 
			end 
		end 
	if tool then getsenv(tool.ClientScriptMouse).collectStart(game:GetService("Players").LocalPlayer:GetMouse()) end end collectorSteal() workspace.NPCs.Onett.Onett["Porcelain Dipper"].ClickEvent:FireServer() end
end end)

game:GetService("Workspace").Particles.Folder2.ChildAdded:Connect(function(child)
    if child.Name == "Sprout" then
        temptable.sprouts.detected = true
        temptable.sprouts.coords = child.CFrame
    end
end)
game:GetService("Workspace").Particles.Folder2.ChildRemoved:Connect(function(child)
    if child.Name == "Sprout" then
        task.wait(30)
        temptable.sprouts.detected = false
        temptable.sprouts.coords = ""
    end
end)

Workspace.Particles.ChildAdded:Connect(function(instance)
    if string.find(instance.Name, "Vicious") then
        temptable.detected.vicious = true
    end
end)
Workspace.Particles.ChildRemoved:Connect(function(instance)
    if string.find(instance.Name, "Vicious") then
        temptable.detected.vicious = false
    end
end)
game:GetService("Workspace").NPCBees.ChildAdded:Connect(function(v)
    if v.Name == "Windy" then
        task.wait(3) temptable.windy = v temptable.detected.windy = true
    end
end)
game:GetService("Workspace").NPCBees.ChildRemoved:Connect(function(v)
    if v.Name == "Windy" then
        task.wait(3) temptable.windy = nil temptable.detected.windy = false
    end
end)

task.spawn(function() while task.wait(0.1) do
    if not temptable.converting and not temptable.started.quests and bongkoc.toggles.autofarm then -- Morphisto
        if bongkoc.toggles.autosamovar then
            game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Samovar")
            platformm = game:GetService("Workspace").Toys.Samovar.Platform
            for i,v in pairs(game.Workspace.Collectibles:GetChildren()) do
                if (v.Position-platformm.Position).magnitude < 25 and v.CFrame.YVector.Y == 1 then
                    api.humanoidrootpart().CFrame = v.CFrame
                end
            end
        end
        if bongkoc.toggles.autostockings then
            game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Stockings")
            platformm = game:GetService("Workspace").Toys.Stockings.Platform
            for i,v in pairs(game.Workspace.Collectibles:GetChildren()) do
                if (v.Position-platformm.Position).magnitude < 25 and v.CFrame.YVector.Y == 1 then
                    api.humanoidrootpart().CFrame = v.CFrame
                end
            end
        end
        if bongkoc.toggles.autoonettart then
            game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Onett's Lid Art")
            platformm = game:GetService("Workspace").Toys["Onett's Lid Art"].Platform
            for i,v in pairs(game.Workspace.Collectibles:GetChildren()) do
                if (v.Position-platformm.Position).magnitude < 25 and v.CFrame.YVector.Y == 1 then
                    api.humanoidrootpart().CFrame = v.CFrame
                end
            end
        end
        if bongkoc.toggles.autocandles then
            game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Honeyday Candles")
            platformm = game:GetService("Workspace").Toys["Honeyday Candles"].Platform
            for i,v in pairs(game.Workspace.Collectibles:GetChildren()) do
                if (v.Position-platformm.Position).magnitude < 25 and v.CFrame.YVector.Y == 1 then
                    api.humanoidrootpart().CFrame = v.CFrame
                end
            end
        end
        if bongkoc.toggles.autofeast then
            game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Beesmas Feast")
            platformm = game:GetService("Workspace").Toys["Beesmas Feast"].Platform
            for i,v in pairs(game.Workspace.Collectibles:GetChildren()) do
                if (v.Position-platformm.Position).magnitude < 25 and v.CFrame.YVector.Y == 1 then
                    api.humanoidrootpart().CFrame = v.CFrame
                end
            end
        end
        if bongkoc.toggles.autodonate then
            if isWindshrineOnCooldown() == false then
            donateToShrine(bongkoc.vars.donoItem,bongkoc.vars.donoAmount)
            end
        end
    end
end end)

task.spawn(function() while task.wait(1) do
    temptable.runningfor = temptable.runningfor + 1
    temptable.honeycurrent = statsget().Totals.Honey
    if bongkoc.toggles.collectgingerbreads then game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Gingerbread House") end
    if bongkoc.toggles.autodispense then
        if bongkoc.dispensesettings.rj then local A_1 = "Free Royal Jelly Dispenser" local Event = game:GetService("ReplicatedStorage").Events.ToyEvent Event:FireServer(A_1) end
        if bongkoc.dispensesettings.blub then game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Blueberry Dispenser") end
        if bongkoc.dispensesettings.straw then game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Strawberry Dispenser") end
        if bongkoc.dispensesettings.treat then game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Treat Dispenser") end
        if bongkoc.dispensesettings.coconut then game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Coconut Dispenser") end
        if bongkoc.dispensesettings.glue then game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Glue Dispenser") end
    end
    if bongkoc.toggles.autoboosters then 
        if bongkoc.dispensesettings.white then game.ReplicatedStorage.Events.ToyEvent:FireServer("Field Booster") end
        if bongkoc.dispensesettings.red then game.ReplicatedStorage.Events.ToyEvent:FireServer("Red Field Booster") end
        if bongkoc.dispensesettings.blue then game.ReplicatedStorage.Events.ToyEvent:FireServer("Blue Field Booster") end
    end
    if bongkoc.toggles.clock then game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Wealth Clock") end
    if bongkoc.toggles.freeantpass then game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Free Ant Pass Dispenser") end
    gainedhoneylabel:UpdateText("Gained Honey: "..api.suffixstring(temptable.honeycurrent - temptable.honeystart))
end end)

game:GetService('RunService').Heartbeat:connect(function() 
    if bongkoc.toggles.autoquest and temptable.started.quests then
		local ScreenGui = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("ScreenGui")
		firesignal(ScreenGui.NPC.ButtonOverlay.MouseButton1Click)
	end
    if bongkoc.toggles.loopspeed then
		local Humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
		if Humanoid.WalkSpeed ~= bongkoc.vars.walkspeed then
			Humanoid.WalkSpeed = bongkoc.vars.walkspeed
		end
	end
    if bongkoc.toggles.loopjump then
		local Humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
		if Humanoid.JumpPower ~= bongkoc.vars.jumppower then
			Humanoid.JumpPower = bongkoc.vars.jumppower
		end
	end
end)

game:GetService('RunService').Heartbeat:connect(function()
    for i,v in next, game.Players.LocalPlayer.PlayerGui.ScreenGui:WaitForChild("MinigameLayer"):GetChildren() do for k,q in next, v:WaitForChild("GuiGrid"):GetDescendants() do if q.Name == "ObjContent" or q.Name == "ObjImage" then q.Visible = true end end end
end)

game:GetService('RunService').Heartbeat:connect(function() 
    if temptable.float then game.Players.LocalPlayer.Character.Humanoid.BodyTypeScale.Value = 0 floatpad.CanCollide = true floatpad.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y-3.75, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z) task.wait(0)  else floatpad.CanCollide = false end
end)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function() vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)task.wait(1)vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

task.spawn(function()while task.wait() do
    if bongkoc.toggles.farmsnowflakes then
        task.wait(3)
        for i,v in next, temptable.tokenpath:GetChildren() do
            if v:FindFirstChildOfClass("Decal") and v:FindFirstChildOfClass("Decal").Texture == "rbxassetid://6087969886" and v.Transparency == 0 then
                api.humanoidrootpart().CFrame = CFrame.new(v.Position.X, v.Position.Y+3, v.Position.Z)
                break
            end
        end
    end
end end)

game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    humanoid = char:WaitForChild("Humanoid")
    humanoid.Died:Connect(function()
        if bongkoc.toggles.autofarm then
            temptable.dead = true
            bongkoc.toggles.autofarm = false
            temptable.converting = false
            temptable.farmtoken = false
        end
        if temptable.dead then
            task.wait(25)
            temptable.dead = false
            bongkoc.toggles.autofarm = true local player = game.Players.LocalPlayer
            temptable.converting = false
            temptable.tokensfarm = true
        end
    end)
end)

for _,v in next, game.workspace.Collectibles:GetChildren() do
    if string.find(v.Name,"") then
        v:Destroy()
    end
end 

task.spawn(function() while task.wait() do
    pos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    task.wait(0.00001)
    currentSpeed = (pos-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
    if currentSpeed > 0 then
        temptable.running = true
    else
        temptable.running = false
    end
end end)

loadingLoops:UpdateText("Loaded Loops")

local function getMonsterName(name)
    local newName = nil
    local keywords = {
        ["Mushroom"]="Ladybug";
        ["Rhino"]="Rhino Beetle";
        ["Spider"]="Spider";
        ["Ladybug"]="Ladybug";
        ["Scorpion"]="Scorpion";
        ["Mantis"]="Mantis";
        ["Beetle"]="Rhino Beetle";
        ["Tunnel"]="Tunnel Bear";
        ["Coco"]="Coconut Crab";
        ["King"]="King Beetle";
        ["Stump"]="Stump Snail";
        ["Were"]="Werewolf"
    }
    for i,v in pairs(keywords) do
        if string.find(string.upper(name),string.upper(i)) then
            newName = v
        end
    end
    if newName == nil then newName = name end
    return newName
end

local function getNearestField(part)
    local resultingFieldPos
    local lowestMag = math.huge
    for i,v in pairs(game:GetService("Workspace").FlowerZones:GetChildren()) do
        if (v.Position - part.Position).magnitude < lowestMag then
            lowestMag = (v.Position - part.Position).magnitude
            resultingFieldPos = v.Position
        end
    end
    if lowestMag > 100 then resultingFieldPos = part.Position + Vector3.new(0,0,10) end
    if string.find(part.Name,"Tunnel") then resultingFieldPos = part.Position + Vector3.new(20,-70,0) end
    return resultingFieldPos
end

function fetchVisualMonsterString(v)
    local mobText = nil
            if v:FindFirstChild("Attachment") then
            if v:FindFirstChild("Attachment"):FindFirstChild("TimerGui") then
                if v:FindFirstChild("Attachment"):FindFirstChild("TimerGui"):FindFirstChild("TimerLabel") then
                    if v:FindFirstChild("Attachment"):FindFirstChild("TimerGui"):FindFirstChild("TimerLabel").Visible == true then
                        local splitTimer = string.split(v:FindFirstChild("Attachment"):FindFirstChild("TimerGui"):FindFirstChild("TimerLabel").Text," ")
                        if splitTimer[3] ~= nil then
                            mobText = v.Name .. ": " .. splitTimer[3]
                        elseif splitTimer[2] ~= nil then
                            mobText = v.Name .. ": " .. splitTimer[2]
                        else
                            mobText = v.Name .. ": " .. splitTimer[1]
                        end
                    else
                        mobText = v.Name .. ": Ready"
                    end
                end
            end
        end
    return mobText
end

local function getToyCooldown(toy)
local c = require(game.ReplicatedStorage.ClientStatCache):Get()
local name = toy
local t = workspace.OsTime.Value - c.ToyTimes[name]
local cooldown = workspace.Toys[name].Cooldown.Value
local u = cooldown - t
local canBeUsed = false
if string.find(tostring(u),"-") then canBeUsed = true end
return u,canBeUsed
end

task.spawn(function()
    pcall(function()
    loadingInfo:CreateLabel("")
    loadingInfo:CreateLabel("Script loaded!")
    wait(2)
    pcall(function()
    for i,v in pairs(game.CoreGui:GetDescendants()) do
        if v.Name == "Startup S" then
            v.Parent.Parent.RightSide["Information S"].Parent = v.Parent
            v:Destroy()
        end
    end
    end)
    local panel = hometab:CreateSection("Mob Panel")
    local statusTable = {}
    for i,v in pairs(game:GetService("Workspace").MonsterSpawners:GetChildren()) do
        if not string.find(v.Name,"CaveMonster") then
        local mobText = nil
        mobText = fetchVisualMonsterString(v)
        if mobText ~= nil then
            local mob = panel:CreateButton(mobText,function()
                api.tween(1,CFrame.new(getNearestField(v)))
            end)
            table.insert(statusTable,{mob,v})
        end
        end
    end
    local mob2 = panel:CreateButton("Mondo Chick: 00:00",function() api.tween(1,game:GetService("Workspace").FlowerZones["Mountain Top Field"].CFrame) end)
    mobsb = panel:CreateButton("Stick Bug: 00:00",function() end) -- Morphisto
	local panel2 = hometab:CreateSection("Utility Panel")
    local windUpd = panel2:CreateButton("Wind Shrine: 00:00",function() api.tween(1,CFrame.new(game:GetService("Workspace").NPCs["Wind Shrine"].Circle.Position + Vector3.new(0,5,0))) end)
    local rfbUpd = panel2:CreateButton("Red Field Booster: 00:00",function() api.tween(1,CFrame.new(game:GetService("Workspace").Toys["Red Field Booster"].Platform.Position + Vector3.new(0,5,0))) end)
    local bfbUpd = panel2:CreateButton("Blue Field Booster: 00:00",function() api.tween(1,CFrame.new(game:GetService("Workspace").Toys["Blue Field Booster"].Platform.Position + Vector3.new(0,5,0))) end)
    local wfbUpd = panel2:CreateButton("White Field Booster: 00:00",function() api.tween(1,CFrame.new(game:GetService("Workspace").Toys["Field Booster"].Platform.Position + Vector3.new(0,5,0))) end)
    local cocoDispUpd = panel2:CreateButton("Coconut Dispenser: 00:00",function() api.tween(1,CFrame.new(game:GetService("Workspace").Toys["Coconut Dispenser"].Platform.Position + Vector3.new(0,5,0))) end)
    local ic1 = panel2:CreateButton("Instant Converter A: 00:00",function() api.tween(1,CFrame.new(game:GetService("Workspace").Toys["Instant Converter"].Platform.Position + Vector3.new(0,5,0))) end)
    local ic2 = panel2:CreateButton("Instant Converter B: 00:00",function() api.tween(1,CFrame.new(game:GetService("Workspace").Toys["Instant Converter B"].Platform.Position + Vector3.new(0,5,0))) end)
    local ic3 = panel2:CreateButton("Instant Converter C: 00:00",function() api.tween(1,CFrame.new(game:GetService("Workspace").Toys["Instant Converter C"].Platform.Position + Vector3.new(0,5,0))) end)
    local utilities = {
        ["Red Field Booster"]=rfbUpd;
        ["Blue Field Booster"]=bfbUpd;
        ["Field Booster"]=wfbUpd;
        ["Coconut Dispenser"]=cocoDispUpd;
        ["Instant Converter"]=ic1;
        ["Instant Converter B"]=ic2;
        ["Instant Converter C"]=ic3;
    }
    while wait(1) do
        for i,v in pairs(statusTable) do
            if v[1] and v[2] then
                v[1]:UpdateText(
                fetchVisualMonsterString(
                v[2]
                ))
            end
        end
        if workspace:FindFirstChild("Clock") then if workspace.Clock:FindFirstChild("SurfaceGui") then if workspace.Clock.SurfaceGui:FindFirstChild("TextLabel") then
            if workspace.Clock.SurfaceGui:FindFirstChild("TextLabel").Text == "! ! !" then
                mob2:UpdateText("Mondo Chick: Ready")
            else
                mob2:UpdateText("Mondo Chick: " .. string.gsub(
                string.gsub(workspace.Clock.SurfaceGui:FindFirstChild("TextLabel").Text,"\n","")
                ,"Mondo Chick: ",""))
            end
        end 
        end end
        local cooldown = require(game.ReplicatedStorage.TimeString)(3600 - (require(game.ReplicatedStorage.OsTime)() - (require(game.ReplicatedStorage.StatTools).GetLastCooldownTime(v1, "WindShrine") or 0)))
        if cooldown == "" then windUpd:UpdateText("Wind Shrine: Ready") else windUpd:UpdateText("Wind Shrine: " .. cooldown) end
        for i,v in pairs(utilities) do
            local cooldown,isUsable = getToyCooldown(i)
            if cooldown ~= nil and isUsable ~= nil then
                if isUsable then
                    v:UpdateText(i..": Ready")
                else
                    v:UpdateText(i..": "..require(game.ReplicatedStorage.TimeString)(cooldown))
                end
            end
        end
    end
    end)
end)

if _G.autoload then if isfile("bongkoc/BSS_".._G.autoload..".json") then bongkoc = game:service'HttpService':JSONDecode(readfile("bongkoc/BSS_".._G.autoload..".json")) end end
if bongkoc.vars.field ~= "" then fielddropdown:SetOption(bongkoc.vars.field) end -- Morphisto
if bongkoc.toggles.autofarm then autofarmtoggle:SetState(true) end -- Morphisto
if bongkoc.toggles.autodig then uiautodig:SetState(true) end -- Morphisto
if bongkoc.toggles.swapmaskonfield then uimaskonfield:SetState(true) end -- Morphisto
if bongkoc.vars.autodigmode ~= "" then uiautodigmode:SetOption(bongkoc.vars.autodigmode) end -- Morphisto
if bongkoc.toggles.disableconversion then uidisableconvert:SetState(true) end -- Morphisto
if bongkoc.toggles.autouseconvertors then uiautouseconverters:SetState(true) end -- Morphisto
if bongkoc.vars.autouseMode ~= "" then uiautouseMode:SetOption(bongkoc.vars.autouseMode) end -- Morphisto
if bongkoc.toggles.autosprinkler then uiautosprinkler:SetState(true) end -- Morphisto
if bongkoc.toggles.farmbubbles then uifarmbubbles:SetState(true) end -- Morphisto
if bongkoc.toggles.farmflame then uifarmflame:SetState(true) end -- Morphisto
if bongkoc.toggles.farmcoco then uifarmcoco:SetState(true) end -- Morphisto
if bongkoc.toggles.collectcrosshairs then uicollectcrosshair:SetState(true) end -- Morphisto
if bongkoc.toggles.farmfuzzy then uifarmfuzzy:SetState(true) end -- Morphisto
if bongkoc.toggles.farmunderballoons then uifarmunderballoons:SetState(true) end -- Morphisto
if bongkoc.toggles.farmclouds then uifarmclouds:SetState(true) end -- Morphisto
if bongkoc.toggles.honeymaskconv then uihoneymaskconv:SetState(true) end -- Morphisto
if bongkoc.vars.defmask ~= "" then uidefmask:SetOption(bongkoc.vars.defmask) end -- Morphisto
if bongkoc.toggles.autodispense then uiautodispense:SetState(true) end -- Morphisto
if bongkoc.toggles.autoboosters then uiautoboosters:SetState(true) end -- Morphisto
if bongkoc.toggles.clock then uiclock:SetState(true) end -- Morphisto
if bongkoc.toggles.autoplanters then uiautoplanters:SetState(true) end -- Morphisto
if bongkoc.toggles.freeantpass then uifreeantpass:SetState(true) end -- Morphisto
if bongkoc.toggles.farmsprouts then uifarmsprouts:SetState(true) end -- Morphisto
if bongkoc.toggles.farmpuffshrooms then uifarmpuffshrooms:SetState(true) end -- Morphisto
if bongkoc.toggles.farmrares then uifarmrares:SetState(true) end -- Morphisto
if bongkoc.toggles.autoquest then uiautoquest:SetState(true) end -- Morphisto
if bongkoc.toggles.autodoquest then uiautodoquest:SetState(true) end -- Morphisto
if bongkoc.toggles.honeystorm then uihoneystorm:SetState(true) end -- Morphisto
if bongkoc.vars.resetbeeenergy then uiresetbeeenergy:SetState(true) end -- Morphisto
if bongkoc.toggles.killmondo then uikillmondo:SetState(true) end -- Morphisto
if bongkoc.toggles.killvicious then uikillvicious:SetState(true) end -- Morphisto
if bongkoc.toggles.killwindy then uikillwindy:SetState(true) end -- Morphisto
if bongkoc.toggles.autoant then uiautoant:SetState(true) end -- Morphisto
if bongkoc.toggles.loopspeed then wstoggle:SetState(true) end -- Morphisto
if bongkoc.toggles.loopjump then jptoggle:SetState(true) end -- Morphisto
if bongkoc.toggles.godmode then uigodmode:SetState(true) end -- Morphisto
if bongkoc.toggles.convertballoons then uiconvertballoons:SetState(true) end -- Morphisto
if bongkoc.dispensesettings.rj then uirj:SetState(true) end -- Morphisto
if bongkoc.dispensesettings.blub then uiblub:SetState(true) end -- Morphisto
if bongkoc.dispensesettings.straw then uistraw:SetState(true) end -- Morphisto
if bongkoc.dispensesettings.treat then uitreat:SetState(true) end -- Morphisto
if bongkoc.dispensesettings.coconut then uicoconut:SetState(true) end -- Morphisto
if bongkoc.dispensesettings.glue then uiglue:SetState(true) end -- Morphisto
if bongkoc.dispensesettings.white then uiwhite:SetState(true) end -- Morphisto
if bongkoc.dispensesettings.blue then uiblue:SetState(true) end -- Morphisto
if bongkoc.dispensesettings.red then uired:SetState(true) end -- Morphisto
if bongkoc.bestfields.white ~= "" then uibestwhite:SetOption(bongkoc.bestfields.white) end -- Morphisto
if bongkoc.bestfields.red ~= "" then uibestred:SetOption(bongkoc.bestfields.red) end -- Morphisto
if bongkoc.bestfields.blue ~= "" then uibestblue:SetOption(bongkoc.bestfields.blue) end -- Morphisto
if bongkoc.vars.npcprefer ~= "" then uinpcprefer:SetOption(bongkoc.vars.npcprefer) end -- Morphisto
if bongkoc.toggles.tptonpc then uitptonpc:SetState(true) end -- Morphisto
if bongkoc.toggles.killcrab then uikillcrab:SetState(true) end -- Morphisto
if bongkoc.toggles.killtunnelbear then uikilltunnelbear:SetState(true) end -- Morphisto
if bongkoc.toggles.killkingbeetle then uikillkingbeetle:SetState(true) end -- Morphisto
if bongkoc.toggles.killstumpsnail then uikillstumpsnail:SetState(true) end -- Morphisto
if bongkoc.toggles.killstickbug then uikillstickbug:SetState(true) end -- Morphisto
if bongkoc.toggles.smartautofarm then uismartautofarm:SetState(true) end -- Morphisto
if bongkoc.toggles.farmboostedfield then uifarmboostedfield:SetState(true) end -- Morphisto
if bongkoc.vars.defmask ~= "" then game:GetService("ReplicatedStorage").Events.ItemPackageEvent:InvokeServer("Equip", {Mute=false;Type=bongkoc.vars.defmask;Category="Accessory"}) end -- Morphisto

-- Morphisto
function KillCoconutCrab()
	local crabisready = false
	for i,v in pairs(game:GetService("Workspace").MonsterSpawners:GetChildren()) do
		if not string.find(v.Name,"CaveMonster") then
			local mobText = nil
			mobText = fetchVisualMonsterString(v)
			if mobText ~= nil then
				if mobText == "CoconutCrab: Ready" then
					crabisready = true
				end
			end
		end
	end
	if crabisready then
		temptable.started.crab = true
		disableall()
		api.humanoidrootpart().CFrame = CFrame.new(-307.52117919922, 107.91863250732, 467.86791992188)
		task.wait(10)
		if not game.Workspace.Monsters:FindFirstChild("Coconut Crab (Lvl 12)") then
			print("Coconut Crab is not sprawning, killing self..")
			api.humanoidrootpart().CFrame = CFrame.new(243.895538, 4.3493037, 320.418457)
			task.wait(15)
		else
			local buffs = fetchBuffTable(buffTable)
			if not tablefind(buffs, "Oil") then
				if GetItemListWithValue()["Oil"] > 0 then
					game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Oil"})
				end					
			end
			if not tablefind(buffs, "Stinger") then
				if GetItemListWithValue()["Stinger"] > 0 then
					game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Stinger"})
				end					
			end

			while game.Workspace.Monsters:FindFirstChild("Coconut Crab (Lvl 12)") and not temptable.started.vicious and not temptable.started.monsters do
				local buffs = fetchBuffTable(buffTable)
				if not tablefind(buffs, "Stinger") then
					if GetItemListWithValue()["Stinger"] > 0 then
						game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Stinger"})
					end					
				end
				task.wait(1)
			end
			api.tween(1, CFrame.new(-259.4, 71.9, 462.1))
			task.wait(1)
			if bongkoc.toggles.autosprinkler then makesprinklers() end
			for i = 0, 50 do
				gettoken(CFrame.new(-259.4, 71.9, 462.1).Position)
			end
		end
		enableall()
		temptable.started.crab = false
	end
end
-- Morphisto
-- Morphisto
function KillTunnelBear()
	local tunnelbearisready = false
	for i,v in pairs(game:GetService("Workspace").MonsterSpawners:GetChildren()) do
		if not string.find(v.Name,"CaveMonster") then
			local mobText = nil
			mobText = fetchVisualMonsterString(v)
			if mobText ~= nil then
				if mobText == "TunnelBear: Ready" then
					tunnelbearisready = true
				end
			end
		end
	end
	if tunnelbearisready then
		temptable.started.tunnelbear = true
		disableall()
		api.humanoidrootpart().CFrame = CFrame.new(283.4128112792969, 6.783041000366211, -39.41004943847656)
		task.wait(15)
		api.humanoidrootpart().CFrame = CFrame.new(400.4, 6.783, -39.41)
		task.wait(5)
		if not game.Workspace.Monsters:FindFirstChild("Tunnel Bear (Lvl 9)") then
			print("Tunnel Bear is not sprawning, killing self..")
			api.humanoidrootpart().CFrame = CFrame.new(243.895538, 4.3493037, 320.418457)
			task.wait(15)
		else
			local buffs = fetchBuffTable(buffTable)
			if not tablefind(buffs, "Stinger") then
				if GetItemListWithValue()["Stinger"] > 0 then
					game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Stinger"})
				end					
			end
			while game.Workspace.Monsters:FindFirstChild("Tunnel Bear (Lvl 9)") and not temptable.started.vicious and not temptable.started.monsters and not temptable.started.mondo and not temptable.started.crab and not temptable.started.kingbeetle do
				api.humanoidrootpart().CFrame = CFrame.new(350.4128112792969, 33.783041000366211, -39.41004943847656)
				temptable.float = true
				task.wait(1)
			end
			task.wait(0.5)
			temptable.float = false
			api.tween(1, CFrame.new(400.4, 6.783, -39.41))
			for i = 0, 60 do
				gettoken(CFrame.new(400.4, 6.783, -39.41).Position)
			end
		end
		enableall()
		temptable.started.tunnelbear = false
	end
end
-- Morphisto
-- Morphisto
function KillKingBeetle()
	local kingbeetleisready = false
	for i,v in pairs(game:GetService("Workspace").MonsterSpawners:GetChildren()) do
		if not string.find(v.Name,"CaveMonster") then
			local mobText = nil
			mobText = fetchVisualMonsterString(v)
			if mobText ~= nil then
				if mobText == "King Beetle Cave: Ready" then
					kingbeetleisready = true
				end
			end
		end
	end
	if kingbeetleisready then
		temptable.started.kingbeetle = true
		disableall()
		api.humanoidrootpart().CFrame = CFrame.new(148.34913635253906, 34.24530792236328, 182.07960510253906)
		task.wait(15)
		api.humanoidrootpart().CFrame = CFrame.new(186.95, 4.845, 138.24)
		task.wait(3)
		if not game.Workspace.Monsters:FindFirstChild("King Beetle (Lvl 7)") then
			print("King Beetle is not sprawning, killing self..")
			api.humanoidrootpart().CFrame = CFrame.new(243.895538, 4.3493037, 320.418457)
			task.wait(15)
		else	
			while game.Workspace.Monsters:FindFirstChild("King Beetle (Lvl 7)") and not temptable.started.vicious and not temptable.started.monsters do
				task.wait(1)
			end
			task.wait(0.5)
			api.tween(1, CFrame.new(180.1517, 4.845, 184.5))
			for i = 0, 50 do
				gettoken(CFrame.new(180.1517, 4.845, 184.5).Position)
			end
		end
		enableall()
		temptable.started.kingbeetle = false
	end
end
-- Morphisto
-- Morphisto
function KillStumpSnail()
	local stumpsnailisready = false
	for i,v in pairs(game:GetService("Workspace").MonsterSpawners:GetChildren()) do
		if not string.find(v.Name,"CaveMonster") then
			local mobText = nil
			mobText = fetchVisualMonsterString(v)
			if mobText ~= nil then
				if mobText == "StumpSnail: Ready" then
					stumpsnailisready = true
				end
			end
		end
	end
	if stumpsnailisready then
		temptable.started.stumpsnail = true
		disableall()
		fd = game.Workspace.FlowerZones['Stump Field']
		api.humanoidrootpart().CFrame = CFrame.new(fd.Position.X, fd.Position.Y-6, fd.Position.Z)
		task.wait(15)
		if not game.Workspace.Monsters:FindFirstChild("Stump Snail (Lvl 6)") then
			print("Stump Snail is not sprawning, killing self..")
			api.humanoidrootpart().CFrame = CFrame.new(243.895538, 4.3493037, 320.418457)
			task.wait(15)
		else
			while game.Workspace.Monsters:FindFirstChild("Stump Snail (Lvl 6)") and not temptable.started.windy and not temptable.started.vicious and not temptable.started.monsters and bongkoc.toggles.autofarm do
				game:GetService("Workspace").Map.Ground.HighBlock.CanCollide = false
				task.wait(1)
			end
			task.wait(0.5)
			game:GetService("Workspace").Map.Ground.HighBlock.CanCollide = true
			api.humanoidrootpart().CFrame = CFrame.new(fd.Position.X, fd.Position.Y+2, fd.Position.Z)
			task.wait(1)
		end
		enableall()
		temptable.started.stumpsnail = false
	end
end
-- Morphisto
-- Morphisto
task.spawn(function()
    while task.wait(1) do
		local count = 1
		local newplayers = false
		local playerschanged = {}
		local newotherplayers = {}
		temptable.cache.disableinrange = false

		for i,v in pairs(game.Players:GetChildren()) do
			if not api.tablefind(temptable.players, v.Name) then
				newplayers = true
				temptable.oplayers = {}
			end
			table.insert(playerschanged, v.Name)
		end
		if newplayers or #temptable.players ~= #playerschanged then
			temptable.players = playerschanged
			for i,v in pairs(game:GetService("CoreGui"):GetDescendants()) do
				if v:IsA("TextLabel") and string.find(v.Text,"Player" .. count) then
					v.Parent:Destroy()
					if count > 6 then
						break
					else
						count += 1
					end
				end		
			end
			for i,v in next, temptable.players do
				uiwlplayers:CreateButton('Player' .. i .. ': ' .. v, function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace:FindFirstChild(v).HumanoidRootPart.CFrame end)
			end
		end

		for j,k in pairs(game:GetService("CoreGui"):GetDescendants()) do
			if k:IsA("TextLabel") and string.find(k.Text,"This player") then
				k.Parent:Destroy()
			end
		end

		for i,v in next, playerschanged do
			for j,k in pairs(game:GetService("Workspace"):GetChildren()) do
				local playerpos
				if k.Name == v and not api.tablefind(bongkoc.wlplayers, k.Name) then
					table.insert(newotherplayers, k.Name)
					playerpos = game.Workspace:FindFirstChild(k.Name).HumanoidRootPart.Position
					if next(temptable.oplayers) == nil then
						temptable.oplayers[k.Name] = playerpos.magnitude
						temptable.cache.disableinrange = true
					else
						if tablefind(temptable.oplayers, k.Name) then
							if temptable.oplayers[k.Name] ~= playerpos.magnitude then -- when other players has moved around
								temptable.oplayers[k.Name] = playerpos.magnitude
								temptable.cache.disableinrange = true
							end
						else
							-- when other player not found in temptable.oplayers table
							temptable.oplayers[k.Name] = playerpos.magnitude
							temptable.cache.disableinrange = true
						end
					end

					if playerpos ~= nil then
						if (playerpos-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude < 150 then
							uiwlplayers:CreateButton('This player ' .. k.Name .. ' is in range.', function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace:FindFirstChild(k.Name).HumanoidRootPart.CFrame end)
						end
					end
				end
			end
		end

		if next(temptable.oplayers) ~= nil then
			for i,v in pairs(temptable.oplayers) do
				--print(i,v)
				if next(newotherplayers) ~= nil then
					for j,k in next, newotherplayers do
						--print('k=' .. k)
						if i ~= k then
							--print(i .. ' is not in newotherplayers')
							tableremovekey(temptable.oplayers, i)
						end
					end
				else
					temptable.oplayers = {}
				end
			end
		end

		if bongkoc.toggles.smartautofarm then
			if temptable.cache.disableinrange then -- disable when other players in range
				if bongkoc.toggles.killwindy then
					bongkoc.toggles.killwindy = false
					uikillwindy:SetState(false)
				end
				if bongkoc.toggles.farmsprouts then
					bongkoc.toggles.farmsprouts = false
					uifarmsprouts:SetState(false)
				end
				if bongkoc.toggles.killstickbug then
					bongkoc.toggles.killstickbug = false
					uikillstickbug:SetState(false) 
				end		
			else
				if not bongkoc.toggles.killwindy then
					bongkoc.toggles.killwindy = true -- enable Windy Bee when no other players in game
					uikillwindy:SetState(true)
				end
				if not bongkoc.toggles.farmsprouts then
					bongkoc.toggles.farmsprouts = true
					uifarmsprouts:SetState(true) 
				end	
				if not bongkoc.toggles.killstickbug then
					bongkoc.toggles.killstickbug = true
					uikillstickbug:SetState(true)
				end			
			end
		end
	end
end)
-- Morphisto
function tablefind(tt, va)
	for i,v in pairs(tt) do
		if i == va then
			return i
		end
	end
end
-- Morphisto
function tableremovekey(tbl, key)
   local element = tbl[key]
   tbl[key] = nil
   return element
end
-- Morphisto
-- Morphisto
function checksbcooldown()
	local cooldown = time() - tonumber(stickbug_time)
	if not sbfirstcheck or cooldown > 1800 and not temptable.started.vicious and not temptable.started.windy then
		sbfirstcheck = true
		for i,v in next, game:GetService("Workspace").NPCs:GetChildren() do
			if v.Name == "Stick Bug" then
				if v:FindFirstChild("Platform") then
					if v.Platform:FindFirstChild("AlertPos") then
						if v.Platform.AlertPos:FindFirstChild("AlertGui") then
							if v.Platform.AlertPos.AlertGui:FindFirstChild("ImageLabel") then
								image = v.Platform.AlertPos.AlertGui.ImageLabel
								button = game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.ActivateButton.MouseButton1Click
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Platform.Position.X, v.Platform.Position.Y+3, v.Platform.Position.Z)
								task.wait(1)					
								for b,z in next, getconnections(button) do
									z.Function()
								end
								task.wait(1)
								break
							end
						end
					end
				end
			end
		end
		task.wait(1)
		local ScreenGui = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("ScreenGui")	
		firesignal(ScreenGui.NPC.OptionFrame.Option3.MouseButton1Click)
		task.wait(1)
		firesignal(ScreenGui.NPC.ButtonOverlay.MouseButton1Click)
		task.wait(1)
		local sbReady = game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.NPC.OptionFrame:FindFirstChild("Option1").Text	
		local sbtime = string.match(sbReady, "[%d:]+")
		if sbtime ~= nil then
			temptable.sbready = false
			mobsb:UpdateText("Stick Bug: "..tostring(sbtime))
		else
			temptable.sbready = true
			mobsb:UpdateText("Stick Bug: Ready")
		end
		stickbug_time = time()
	end
end
-- Morphisto
-- Morphisto
function DefenseTotemHP()
	local dtHP = 0
	for i,v in pairs(game:GetService("Workspace").Particles.StickBugTotem:GetChildren()) do
		--print(v.Name)
		if v:FindFirstChild("GuiPos") then
			if v:FindFirstChild("GuiPos"):FindFirstChild("Gui") then
				if v:FindFirstChild("GuiPos"):FindFirstChild("Gui"):FindFirstChild("Frame") then
					if v:FindFirstChild("GuiPos"):FindFirstChild("Gui"):FindFirstChild("Frame"):FindFirstChild("TextLabel") then
						local GuiText = v:FindFirstChild("GuiPos"):FindFirstChild("Gui"):FindFirstChild("Frame"):FindFirstChild("TextLabel")
						dtHP = tonumber(GuiText.Text)
						return dtHP
					end
				end
			end
		end
	end
end
-- Morphisto
-- Morphisto - Auto Stick Bug
task.spawn(function()
    while task.wait(1) do
		if bongkoc.toggles.killstickbug and not temptable.started.windy and not temptable.started.vicious and not temptable.started.mondo and not temptable.started.monsters then
			local sbTime = 99
			local sbTimer = game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.ChallengeInfo.SBChallengeInfo:FindFirstChild("TimeValue").Text
			if string.find(sbTimer, "s") then
				sbTime = string.gsub(sbTimer,"s","")
			end
			if tonumber(sbTime) < 15 then
				print('Stick Bug Chellenge has finished ' .. sbTimer)
				game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.ChallengeInfo.SBChallengeInfo:FindFirstChild("TimeValue").Text = "10:00"
				if temptable.started.stickbug then
					enableall()
					temptable.started.stickbug = false
					--print('Inside of sbTimer = 10:00')
					if bongkoc.toggles.godmode then
						print('disabling godmode')
						bongkoc.toggles.godmode = false
						uigodmode:SetState(false)
						bssapi:Godmode(false)
					end
				end

			elseif sbTimer ~= "10:00" then
				if not temptable.started.stickbug then
					temptable.started.stickbug = true
					disableall()
					if not bongkoc.toggles.godmode then
						print('enabling godmode')
						bongkoc.toggles.godmode = true
						bssapi:Godmode(true)
						uigodmode:SetState(true)
					end

				end

				for i,v in pairs(workspace.Monsters:GetChildren()) do
					if string.find(v.Name,"Stick Bug") then
						print('Now attacking ' .. v.Name)
						if game.Workspace.Particles:FindFirstChild("PollenHealthBar") then
							local sbpollenpos = game.Workspace.Particles:FindFirstChild("PollenHealthBar").Position
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(sbpollenpos.x,sbpollenpos.y,sbpollenpos.z)
							task.wait(1)
							temptable.magnitude = 25
							while game.Workspace.Particles:FindFirstChild("PollenHealthBar") do
								sbpollenpos = game.Workspace.Particles:FindFirstChild("PollenHealthBar").Position
								if (sbpollenpos-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > temptable.magnitude then
									api.tween(1, CFrame.new(sbpollenpos.x, sbpollenpos.y, sbpollenpos.z))
								end
								gettoken(sbpollenpos)

								--game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(sbpollenpos.x,sbpollenpos.y,sbpollenpos.z)
								task.wait()					
							end
							for i = 1, 2 do gettoken(api.humanoidrootpart().Position) end
						end

						if game.Workspace.Monsters:FindFirstChild(v.Name) then
							local sbexists = game.Workspace.Monsters[v.Name]
							local sbposition = game.Workspace.Monsters[v.Name].Head.Position
							api.tween(1, CFrame.new(sbposition.x, sbposition.y - 5, sbposition.z))
							task.wait(1)
							if bongkoc.toggles.autosprinkler then makesprinklers() end

							local sblvl = v.Name:gsub("%D+", "")
							if tonumber(sblvl) > 6 then 
								local buffs = fetchBuffTable(buffTable)
								if not tablefind(buffs, "Oil") then
									if GetItemListWithValue()["Oil"] > 0 then
										game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Oil"})
									end					
								end
								if not tablefind(buffs, "Jelly Bean Sharing Bonus") then
									if GetItemListWithValue()["JellyBeans"] > 0 then
										game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Jelly Beans"})
									end					
								end
							end							
						end

						while game.Workspace.Monsters:FindFirstChild(v.Name) and not game.Workspace.Particles:FindFirstChild("StickBugTotem") do
							sbposition = game.Workspace.Monsters[v.Name].Head.Position
							if tonumber(sbposition.y) > 1000 then
								break
							end
							if (sbposition-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > temptable.magnitude then
								api.tween(1, CFrame.new(sbposition.x, sbposition.y - 5, sbposition.z))
							end
							gettoken(sbposition)

							local buffs = fetchBuffTable(buffTable)
							if not tablefind(buffs, "Jelly Bean Sharing Bonus") then
								if GetItemListWithValue()["JellyBeans"] > 0 then
									game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Jelly Beans"})
								end					
							end
							if not tablefind(buffs, "Stinger") then
								if GetItemListWithValue()["Stinger"] > 0 then
									game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"] = "Stinger"})
								end					
							end
							task.wait()
						end
						temptable.float = false

						if game.Workspace.Particles:FindFirstChild("StickBugTotem") then
							for j,k in pairs(game:GetService("Workspace").Particles.StickBugTotem:GetChildren()) do
								if k:FindFirstChild("NamePos") then
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(k.Position.x,k.Position.y,k.Position.z)
									break
								end				
							end
							task.wait(1)
							if bongkoc.toggles.autosprinkler then makesprinklers() end
							while game.Workspace.Particles:FindFirstChild("StickBugTotem") do
								gettoken(api.humanoidrootpart().Position)
								task.wait()
							end				
							for i = 1, 2 do gettoken(api.humanoidrootpart().Position) end
						else
							task.wait(1)
							if bongkoc.toggles.autosprinkler then makesprinklers() end
							for i =1, 3 do gettoken(api.humanoidrootpart().Position) end			
						end
						break
					end
				end
			end
		end
	end
end)

-- Morphisto
function KillTest()
	for i,v in pairs(temptable.oplayers) do
		print(i,v)
	end

end
-- Morphisto
function KillTest2()

	for i,v in pairs(temptable.oplayers) do
		print(i,v)
		for j,k in next, newotherplayers do
			print('k=' .. k)
			if i ~= k then
				print(i .. ' is not in newotherplayers')
				tableremovekey(temptable.oplayers, i)
			end
		end
	end
end


for _, part in next, workspace:FindFirstChild("FieldDecos"):GetDescendants() do if part:IsA("BasePart") then part.CanCollide = false part.Transparency = part.Transparency < 0.5 and 0.5 or part.Transparency task.wait() end end
for _, part in next, workspace:FindFirstChild("Decorations"):GetDescendants() do if part:IsA("BasePart") and (part.Parent.Name == "Bush" or part.Parent.Name == "Blue Flower") then part.CanCollide = false part.Transparency = part.Transparency < 0.5 and 0.5 or part.Transparency task.wait() end end
for i,v in next, workspace.Decorations.Misc:GetDescendants() do if v.Parent.Name == "Mushroom" then v.CanCollide = false v.Transparency = 0.5 end end