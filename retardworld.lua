local function LoadUI()
    local loading = Instance.new("ScreenGui")
    loading.IgnoreGuiInset = false
    loading.ResetOnSpawn = true
    loading.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    loading.Name = "Loading"
    loading.Parent = game.CoreGui

    local main = Instance.new("Frame")
    main.AnchorPoint = Vector2.new(0.5, 0.5)
    main.BackgroundColor3 = Color3.new(0.172549, 0.172549, 0.172549)
    main.BorderSizePixel = 0
    main.Position = UDim2.new(0.5, 0, 0.5, 0)
    main.Size = UDim2.new(0, 433, 0, 433)
    main.Visible = true
    main.Name = "Main"
    main.Parent = loading

    local monkey = Instance.new("ImageLabel")
    monkey.Image = "http://www.roblox.com/asset/?id=4275313474"
    monkey.AnchorPoint = Vector2.new(0.5, 0)
    monkey.BackgroundColor3 = Color3.new(1, 1, 1)
    monkey.BackgroundTransparency = 1
    monkey.BorderSizePixel = 0
    monkey.Position = UDim2.new(0.5, 0, 0, 25)
    monkey.Size = UDim2.new(0.692840636, 0, 0.692840636, 0)
    monkey.Visible = true
    monkey.Name = "Monkey"
    monkey.Parent = main

    local uicorner = Instance.new("UICorner")
    uicorner.CornerRadius = UDim.new(0.15000000596046448, 0)
    uicorner.Parent = main

    local loading_2 = Instance.new("TextLabel")
    loading_2.Font = Enum.Font.GothamBold
    loading_2.Text = "Loading..."
    loading_2.TextColor3 = Color3.new(1, 1, 1)
    loading_2.TextScaled = true
    loading_2.TextSize = 14
    loading_2.TextWrapped = true
    loading_2.AnchorPoint = Vector2.new(0.5, 1)
    loading_2.BackgroundColor3 = Color3.new(1, 1, 1)
    loading_2.BackgroundTransparency = 1
    loading_2.Position = UDim2.new(0.5, 0, 0.921478033, 0)
    loading_2.Size = UDim2.new(0.808314085, 0, 0.120092377, 0)
    loading_2.Visible = true
    loading_2.Name = "Loading"
    loading_2.Parent = main

    local uistroke = Instance.new("UIStroke")
    uistroke.Color = Color3.new(0.141176, 0.141176, 0.141176)
    uistroke.Thickness = 8
    uistroke.Parent = loading_2

    local title = Instance.new("TextLabel")
    title.Font = Enum.Font.GothamBold
    title.Text = "Retards!"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.TextScaled = true
    title.TextSize = 14
    title.TextWrapped = true
    title.AnchorPoint = Vector2.new(0.5, 1)
    title.BackgroundColor3 = Color3.new(1, 1, 1)
    title.BackgroundTransparency = 1
    title.Position = UDim2.new(0.167436481, 0, 0.0946882218, 0)
    title.Rotation = -15
    title.Size = UDim2.new(0.808314085, 0, 0.143187061, 0)
    title.Visible = true
    title.Name = "Title"
    title.Parent = main

    local uistroke_2 = Instance.new("UIStroke")
    uistroke_2.Color = Color3.new(0.141176, 0.141176, 0.141176)
    uistroke_2.Thickness = 8
    uistroke_2.Parent = title

    local uistroke_3 = Instance.new("UIStroke")
    uistroke_3.Color = Color3.new(0.219608, 0.219608, 0.219608)
    uistroke_3.Thickness = 8
    uistroke_3.Parent = main

    local local_script = Instance.new("LocalScript")
    local_script.Parent = main

    task.spawn(function()
        local script = local_script

        local Monkey = script.Parent.Monkey
        local Loading = script.Parent.Loading

        local LoadingAmount = 0

        while LoadingAmount < 15 do
            LoadingAmount = LoadingAmount + 1
            game:GetService("TweenService"):Create(Monkey, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                Rotation = Monkey.Rotation + 25,
            }):Play()

            if Loading.Text == "Loading..." then
                Loading.Text = "Loading."
            elseif Loading.Text == "Loading." then
                Loading.Text = "Loading.."
            elseif Loading.Text == "Loading.." then
                Loading.Text = "Loading..."
            end
            wait(0.5)
        end

        Loading.Text = "Retarded Completed!"
        wait(0.7)
        script.Parent:TweenSize(UDim2.new(0, 0, 0, 0), "In", "Quint", 0.5, true)
        wait(0.5)
        script.Parent:Destroy()
    end)
end

LoadUI()
wait(9)

--// Retard WRLD
local Finity = loadstring(game:HttpGet("https://pastebin.com/raw/RJfmtcyK"))()
local FinityWindow = Finity.new(true, "Bee Swarm Simulator | Retard WRLD ")
FinityWindow.ChangeToggleKey(Enum.KeyCode.RightControl)

--// Info
local InfoCategory = FinityWindow:Category("Info")
local InfoSector = InfoCategory:Sector("Bee Swarm Simulator")

--// Farming
local FarmingCategory = FinityWindow:Category("Farming")
local FarmingSector = FarmingCategory:Sector("Farming")
local FarmingSector2 = FarmingCategory:Sector("Farming")

--// WayPoints
local WayPointsCategory = FinityWindow:Category("WayPoints")
local FieldSector = WayPointsCategory:Sector("Field")
local ShopSector = WayPointsCategory:Sector("Shop")
local NPCSector = WayPointsCategory:Sector("NPC")

--// Extras
local ExtrasCategory = FinityWindow:Category("Extras")
local ExtrasSector = ExtrasCategory:Sector("Extras")
local UseItemsSector = ExtrasCategory:Sector("Auto Use Items")

--// Misc
local MiscCategory = FinityWindow:Category("Misc")
local FeedBeesSector = MiscCategory:Sector("Feed Bees")
local WindShrineSector = MiscCategory:Sector("Wind Shrine")
local BlenderSector = MiscCategory:Sector("Blender")
local AmuletSector = MiscCategory:Sector("Amulet")
local InventorySector = MiscCategory:Sector("Inventory")

--// Statistics
local StatisticsCategory = FinityWindow:Category("Statistics")
local StatisticsSector = StatisticsCategory:Sector("Statistics")
local TimersSector = StatisticsCategory:Sector("Timers")
local TimersSector2 = StatisticsCategory:Sector("Monsters")

--// Settings
local SettingsCategory = FinityWindow:Category("Settings")
local SettingsSector = SettingsCategory:Sector("Farming Settings")
local SettingsSector2 = SettingsCategory:Sector("Settings")

--// Variables \\--

local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HumRoot = Character.PrimaryPart
local Humanoid = Character.Humanoid

--// Services
local Tween = game:GetService("TweenService")
local RunService = game:GetService("RunService")

--// Object Variables
local FieldZones = workspace.FlowerZones
local Flowers = workspace.Flowers
local Tokens = workspace.Collectibles

--// Variables #2
local SpawnCFrame = Player:WaitForChild("SpawnPos")
local CollectedTokens = {}

--// Farm Variables
local TeleportSpeed = 175
local CoreStats = Player.CoreStats

--// Remotes Variables
local PlayerHiveCommand = game:GetService("ReplicatedStorage").Events.PlayerHiveCommand
local PlayerActivesCommand = game:GetService("ReplicatedStorage").Events.PlayerActivesCommand
local ToyEvent = game:GetService("ReplicatedStorage").Events.ToyEvent
local ItemPackageEvent = game:GetService("ReplicatedStorage").Events.ItemPackageEvent
local BadgeEvent = game:GetService("ReplicatedStorage").Events.BadgeEvent

--// UI Variables
local PollenBar = Player.PlayerGui.ScreenGui.MeterHUD.PollenMeter.Bar.FillBar

--// _G Variables
_G.FarmingField = "Sunflower Field"
_G.SavedFarmingField = "Sunflower Field"
_G.Farming = false
_G.FarmingMode = "Walk"
_G.ConvertingPollen = false
_G.AutoDiging = false
_G.AutoMobsKill = false
_G.FarmingSprouts = false
_G.HuntGuidingStar = false
_G.AutoPlanter = false
_G.AutoPuffshrooms = false
_G.PlanterSelected = "Paper Planter"
_G.WalkSpeed = false
_G.JumpPower = false
_G.HipHeight = false
_G.AutoDispensers = false
_G.RemoteQuests = false
_G.RemoteBadges = false
_G.UpdateStats = false
_G.AutoKillVicious = false
_G.HuntWindy = false
_G.HuntMondo = false
_G.HuntCommando = false
_G.HuntAnyCommandoChick = false
_G.TrainCrab = false
_G.AutoCollectBubbles = false
_G.AutoCollectFuzzyBombs = false
_G.CollectFlames = false
_G.CollectFireflys = false
_G.CollectSparkles = false
_G.CollectMeteor = false
_G.AutoWealthClock = false
_G.AutoSprinkler = false
_G.GodMode = false
_G.CollectTickets = false
_G.Sprinkler = "The Supreme Saturator"
_G.WalkSpeedAmount = 65
_G.JumpPowerAmount = 65
_G.HipHeightAmount = 2.48
_G.MasksMode = "5B"
_G.MaskForFarm = "Diamond Mask"
_G.FeedingBee = false
_G.DebugGlider = false
_G.AutoWindShrineDonate = false
_G.AutoWindShrineSpawnRewards = false
_G.CollectLeaves = false
_G.AutoStickBug = false
_G.AutoFarmStickBugTotems = false
_G.AutoAnt = false

ConvertedPollenForMobs = 0
NeedConvertPollenForMobs = 0

ViciousNow = nil
WindyNow = nil
PlanterNow = nil

CommandoReady = false
MondoReady = false
CrabReady = false

SproutNow = nil
SproutField = nil

GuidingStarNow = nil
GuidingStarField = nil

KillingMobs = false
KillingVicious = false
KillingCommando = false
KillingMondo = false
KillingCrab = false
KillingStickBug = false
CollectingFireflys = false
CollectingSprout = false
CollectingTickets = false
FarmingGuidingStar = false
CollectingSproutWithoutFarm = false
CollectingSparkles = false
CollectingPlanter = false
CollectingPuffshrooms = false
CollectingMeteor = false
CollectingLeaves = false
FarmingAnts = false

NeedToCollectTickets = false

ElapsedTime = 0
HoneyCollected = 0
TicketsCollected = 0
KilledMobs = 0
SproutsCollected = 0
KilledVicious = 0
KilledWindy = 0
KilledMondo = 0
KilledCommando = 0
KilledCrabs = 0
KilledStickBugs = 0
CollectedStickBugTotems = 0

local DeletedObjects = {}
local Gates = {
    ["5 Bees"] = workspace.Gates["5 Bee Gate"].Door,
    ["10 Bees"] = workspace.Gates["10 Bee Gate"].Door,
    ["15 Bees"] = workspace.Gates["15 Bee Gate"].Door,
    ["20 Bees"] = workspace.Gates["20 Bee Gate"].Door,
    ["25 Bees"] = workspace.Gates["25 Bee Gate"].Door,
    ["30 Bees"] = workspace.Gates["30 Bee Gate"].Door,
    ["35 Bees"] = workspace.Gates["35 Bee Gate"].Door,
}

local FieldsGates = {
    ["Sunflower Field"] = "0 Bees",
    ["Mushroom Field"] = "0 Bees",
    ["Dandelion Field"] = "0 Bees",
    ["Clover Field"] = "0 Bees",
    ["Blue Flower Field"] = "0 Bees",
    ["Bamboo Field"] = "5 Bees",
    ["Spider Field"] = "5 Bees",
    ["Strawberry Field"] = "5 Bees",
    ["Pineapple Patch"] = "10 Bees",
    ["Stump Field"] = "10 Bees",
    ["Cactus Field"] = "15 Bees",
    ["Pumpkin Patch"] = "15 Bees",
    ["Pine Tree Forest"] = "15 Bees",
    ["Rose Field"] = "15 Bees",
    ["Mountain Top Field"] = "25 Bees",
    ["Coconut Field"] = "35 Bees",
    ["Peper Patch"] = "35 Bees",
}

local NPCsGates = {
    ["Black Bear"] = "0 Bees",
    ["Brown Bear"] = "0 Bees",
    ["Mother Bear"] = "0 Bees",
    ["Bucko Bee"] = "0 Bees",
    ["Stick Bug"] = "0 Bees",
    ["Panda Bear"] = "5 Bees",
    ["Science Bear"] = "10 Bees",
    ["Polar Bear"] = "15 Bees",
    ["Riley Bee"] = "15 Bees",
    ["Honey Bee"] = "15 Bees",
    ["Onett"] = "30 Bees",
    ["Spirit Bear"] = "35 Bees",
}

--// Auto Farm

local function GetCommas(Text)
	Text = math.floor(Text)
	local left,num,right = string.match(Text,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end

local Suffixes = {'','K','M','B','T','qd','Qn','sx','Sp','O','N','de','Ud','DD','tdD','qdD','QnD','sxD','SpD','OcD','NvD','Vgn','UVg','DVg','TVg','qtV','QnV','SeV','SPG','OVG','NVG','TGN','UTG','DTG','tsTG','qtTG','QnTG','ssTG','SpTG','OcTG','NoAG','UnAG','DuAG','TeAG','QdAG','QnAG','SxAG','SpAG','OcAG','NvAG','CT'}
function GetSuffix(Text)
	for i = 1, #Suffixes do
		if tonumber(Text) < 10 ^ (i * 3) then
			return math.floor(Text / ((10 ^ ((i - 1) * 3)) / 100)) / (100)..Suffixes[i]
		end
	end
end

local SprinklerPositions = {
    ["Silver Soakers"] = {
        ["Sunflower Field"] = {Vector3.new(-208.984, 4.44638, 146.114), Vector3.new(-210.086, 4.44638, 193.143)},
        ["Dandelion Field"] = {Vector3.new(-58, 4, 220), Vector3.new(-9, 4, 220)},
        ["Mushroom Field"] = {Vector3.new(-123, 4, 115), Vector3.new(-63, 4, 115)},
        ["Blue Flower Field"] = {Vector3.new(107, 4, 98), Vector3.new(168, 4, 98)},
        ["Clover Field"] = {Vector3.new(130, 33, 193), Vector3.new(174, 33, 196)},
        ["Spider Field"] = {Vector3.new(-19, 20, -12), Vector3.new(-70, 20, -10)},
        ["Bamboo Field"] = {Vector3.new(103, 20, -28), Vector3.new(166, 20, -28)},
        ["Strawberry Field"] = {Vector3.new(-152, 20, -8), Vector3.new(-204, 20, -10)},
        ["Pineapple Field"] = {Vector3.new(285, 68, -207), Vector3.new(233, 68, -211)},
        ["Stump Field"] = {Vector3.new(396, 96, -176), Vector3.new(444, 96, -175)},
        ["Cactus Field"] = {Vector3.new(-162, 68, -102), Vector3.new(-222, 68, -104)},
        ["Pumpkin Patch"] = {Vector3.new(-216, 68, -185), Vector3.new(-165, 68, -184)},
        ["Pine Tree Forest"] = {Vector3.new(-330, 68, -162), Vector3.new(-330, 68, -220)},
        ["Rose Field"] = {Vector3.new(-303, 20, 124), Vector3.new(-358, 20, 122)},
        ["Mountain Top Field"] = {Vector3.new(77, 176, -197), Vector3.new(75, 176, -141)},
        ["Coconut Field"] = {Vector3.new(-287, 71, 466), Vector3.new(-232, 71, 462)},
        ["Peper Patch"] = {Vector3.new(-492, 123, 559), Vector3.new(-491, 123, 510)},
    },
    ["Golden Gushers"] = {
        ["Sunflower Field"] = {Vector3.new(-214, 4, 225), Vector3.new(-213, 4, 181), Vector3.new(-213, 4, 126)},
        ["Dandelion Field"] = {Vector3.new(24, 4, 221), Vector3.new(-30, 4, 220), Vector3.new(-80, 4, 220)},
        ["Mushroom Field"] = {Vector3.new(-40, 4, 115), Vector3.new(-93, 4, 115), Vector3.new(-144, 4, 116)},
        ["Blue Flower Field"] = {Vector3.new(215, 4, 99), Vector3.new(150, 4, 96), Vector3.new(78, 4, 97)},
        ["Clover Field"] = {Vector3.new(112, 33, 196), Vector3.new(156, 33, 196), Vector3.new(201, 33, 198)},
        ["Spider Field"] = {Vector3.new(-92, 20, -6), Vector3.new(-44, 20, -6), Vector3.new(3, 20, -5)},
        ["Bamboo Field"] = {Vector3.new(72, 20, -26), Vector3.new(133, 20, -28), Vector3.new(188, 20, -27)},
        ["Strawberry Field"] = {Vector3.new(-181, 20, 33), Vector3.new(-179, 20, -13), Vector3.new(-180, 20, -59)},
        ["Pineapple Field"] = {Vector3.new(200, 68, -207), Vector3.new(256, 68, -206), Vector3.new(301, 68, -206)},
        ["Stump Field"] = {Vector3.new(420, 96, -217), Vector3.new(421, 96, -172), Vector3.new(419, 96, -131)},
        ["Cactus Field"] = {Vector3.new(-248, 68, -105), Vector3.new(-190, 68, -104), Vector3.new(-139, 68, -104)},
        ["Pumpkin Patch"] = {Vector3.new(-140, 68, -185), Vector3.new(-191, 68, -185), Vector3.new(-246, 68, -184)},
        ["Pine Tree Forest"] = {Vector3.new(-326, 68, -239), Vector3.new(-327, 68, -195), Vector3.new(-326, 68, -143)},
        ["Rose Field"] = {Vector3.new(-278, 20, 125), Vector3.new(-335, 20, 124), Vector3.new(-384, 20, 123)},
        ["Mountain Top Field"] = {Vector3.new(72, 176, -121), Vector3.new(73, 176, -168), Vector3.new(72, 176, -215)},
        ["Coconut Field"] = {Vector3.new(-206, 71, 461), Vector3.new(-261, 71, 464), Vector3.new(-306, 71, 464)},
        ["Peper Patch"] = {Vector3.new(-488, 123, 487), Vector3.new(-489, 123, 530), Vector3.new(-489, 123, 581)},
    },
    ["Diamond Drenchers"] = {
        ["Sunflower Field"] = {Vector3.new(-189, 4, 206), Vector3.new(-236, 4, 205), Vector3.new(-236, 4, 152), Vector3.new(-188, 4, 154)},
        ["Dandelion Field"] = {Vector3.new(-71, 4, 249), Vector3.new(-71, 4, 191), Vector3.new(-3, 4, 193), Vector3.new(-5, 4, 251)},
        ["Mushroom Field"] = {Vector3.new(-52, 4, 135), Vector3.new(-121, 4, 136), Vector3.new(-122, 4, 87), Vector3.new(-56, 4, 89)},
        ["Blue Flower Field"] = {Vector3.new(106, 4, 71), Vector3.new(115, 4, 126), Vector3.new(193, 4, 126), Vector3.new(176, 4, 69)},
        ["Clover Field"] = {Vector3.new(183, 33, 226), Vector3.new(185, 33, 167), Vector3.new(126, 33, 163), Vector3.new(127, 33, 228)},
        ["Spider Field"] = {Vector3.new(-7, 20, 18), Vector3.new(-81, 20, 15), Vector3.new(-78, 20, -36), Vector3.new(-9, 20, -34)},
        ["Bamboo Field"] = {Vector3.new(163, 20, 0), Vector3.new(161, 20, -58), Vector3.new(90, 20, -54), Vector3.new(92, 20, -1)},
        ["Strawberry Field"] = {Vector3.new(-154, 20, -41), Vector3.new(-205, 20, -39), Vector3.new(-207, 20, 15), Vector3.new(-152, 20, 16)},
        ["Pineapple Field"] = {Vector3.new(285, 68, -183), Vector3.new(285, 68, -232), Vector3.new(227, 68, -233), Vector3.new(224, 68, -181)},
        ["Stump Field"] = {Vector3.new(398, 96, -149), Vector3.new(445, 96, -150), Vector3.new(446, 96, -201), Vector3.new(396, 96, -202)},
        ["Cactus Field"] = {Vector3.new(-157, 68, -74), Vector3.new(-158, 68, -135), Vector3.new(-221, 68, -133), Vector3.new(-211, 68, -76)},
        ["Pumpkin Patch"] = {Vector3.new(-225, 68, -157), Vector3.new(-226, 68, -217), Vector3.new(-163, 68, -216), Vector3.new(-166, 68, -159)},
        ["Pine Tree Forest"] = {Vector3.new(-303, 68, -151), Vector3.new(-302, 68, -224), Vector3.new(-346, 68, -223), Vector3.new(-351, 68, -152)},
        ["Rose Field"] = {Vector3.new(-300, 20, 102), Vector3.new(-300, 20, 154), Vector3.new(-362, 20, 153), Vector3.new(-364, 20, 101)},
        ["Mountain Top Field"] = {Vector3.new(45, 176, -200), Vector3.new(105, 176, -200), Vector3.new(108, 176, -140), Vector3.new(41, 176, -142)},
        ["Coconut Field"] = {Vector3.new(-287, 71, 440), Vector3.new(-287, 71, 492), Vector3.new(-227, 71, 489), Vector3.new(-225, 71, 439)},
        ["Peper Patch"] = {Vector3.new(-465, 123, 561), Vector3.new(-519, 123, 561), Vector3.new(-520, 123, 508), Vector3.new(-463, 123, 510)},
    }
}

for _, Part in pairs(workspace:GetChildren()) do
    if Part.Name == "MondoPart" or Part.Name == "CommandoPart" or Part.Name == "ViciousPlatform" then
        Part:Destroy()
    end
end

local Planters = {}
local function CheckForPlanters()
    local PlantersToCollect = 0
    local PlanterOnField = false
    for _, Planter in pairs(debug.getupvalues(require(game:GetService("ReplicatedStorage").LocalPlanters).LoadPlanter)[4]) do 
        if Planter.GrowthPercent == 1 and Planter.IsMine then
            local Planter = {
                CFrame = Planter.BulbPart.CFrame,
                Id = Planter.ActorID
            }
            Planters[#Planters + 1] = Planter
            PlantersToCollect = PlantersToCollect + 1
        else
            local _Ray = Ray.new(Planter.BulbPart.CFrame.Position + Vector3.new(0, 5, 0), Vector3.new(0, -25, 0))
            local Field = workspace:FindPartOnRayWithWhitelist(_Ray, {FieldZones})
            if Field then
                if Field.Name == _G.SavedFarmingField then
                    PlanterOnField = true
                end
            end
        end
        if not PlanterOnField then
            if Planter.PotModel.Name == _G.PlanterSelected then
                PlanterOnField = true
            end
        end
    end
    if PlantersToCollect >= 1 then
        return true
    else
        if PlanterOnField then
            return "PlanterOnField"
        end
    end
    return false
end

local function EquipMask(Mask)
    if _G.MasksMode == "5B" then
        ItemPackageEvent:InvokeServer("Equip", {Type = Mask, Category = "Accessory"})
        return
    end
    if Mask == "Demon Mask" then Mask = "Fire Mask" end
    if Mask == "Diamond Mask" then Mask = "Bubble Mask" end
    if Mask == "Gummy Mask" then Mask = "Honey Mask" end
    ItemPackageEvent:InvokeServer("Equip", {Type = Mask, Category = "Accessory"})
end

local function SetSprinkler()
    if _G.AutoSprinkler then
        if _G.Sprinkler == "The Supreme Saturator" or _G.Sprinkler == "Basic Sprinkler" then
            PlayerActivesCommand:FireServer({Name = "Sprinkler Builder"})
        else
            for _, Position in pairs(SprinklerPositions[_G.Sprinkler][_G.FarmingField]) do
                HumRoot.CFrame = CFrame.new(Position)
                wait(0.5)
                PlayerActivesCommand:FireServer({Name = "Sprinkler Builder"})
                wait(0.5)
            end
        end
    end
end

local function CheckForAnyQuests()
    for _, NPC in pairs(workspace.NPCs:GetChildren()) do
        if NPC:FindFirstChild("Platform") then
            if NPC.Platform.AlertPos.AlertGui.ImageLabel.ImageTransparency == 0 and NPC.Name ~= "Bubble Bee Man 2" then
                return true
            end
        end
    end
    return false
end

local function CheckForSprout()
    if SproutNow then return end
    for _, Object in pairs(workspace.Particles.Folder2:GetChildren()) do
        if Object.Name == "Sprout" then
            local _Ray = Ray.new(Object.Position + Vector3.new(0, 5, 0), Vector3.new(0, -200, 0))
            local Field = workspace:FindPartOnRayWithWhitelist(_Ray, {FieldZones})

            if Field then
                local Gate = FieldsGates[Field.Name]
                if Gate ~= "0 Bees" then
                    if Gates[Gate].CanCollide then
                        return nil
                    end
                end
            else
                return nil
            end

            if Field then
                SproutField = Field
                SproutNow = Object
                return Object, Field
            end
        end
    end
    return nil
end

local function CheckForGuidingStar()
    if GuidingStarNow then return end
    for _, Object in pairs(workspace.Particles:GetChildren()) do
        if Object.Name == "Guiding Star" then
            local _Ray = Ray.new(Object.Position, Vector3.new(0, -200, 0))
            local Field = workspace:FindPartOnRayWithWhitelist(_Ray, {FieldZones})

            if Field then
                local Gate = FieldsGates[Field.Name]
                if Gate ~= "0 Bees" then
                    if Gates[Gate].CanCollide then
                        return nil
                    end
                end
            else
                return nil
            end

            if Field then
                GuidingStarField = Field
                GuidingStarNow = Object
                return Object, Field
            end
        end
    end
    return nil
end

local function TeleportToField()
    HumRoot.CFrame = FieldZones[_G.FarmingField].CFrame * CFrame.new(0, 2, 0)
    EquipMask(_G.MaskForFarm)
end

local function TeleportToCFrame(NeedCFrame)
    HumRoot.CFrame = NeedCFrame
end

local function CheckForCollectTokens(Action)
    if Action == "WithoutFarm" then
        return true
    end
    if not _G[Action] then
        return false
    end
    return true
end

local function CollectBubbles()
    for _, Object in pairs(workspace.Particles:GetChildren()) do
        if Object.Name == "Bubble" and (HumRoot.Position - Object.Position).Magnitude <= 50 then
            local Position = Object.Position
           --[[if _G.FarmingMode == "Walk" then
                repeat wait()
                    Humanoid:MoveTo(Position)
                    if not _G.Farming then
                        break
                    end
                until ((HumRoot.Position - Position).Magnitude <= 4 and Humanoid.MoveDirection.Magnitude <= 0.5) or not Object.Parent or Humanoid.Health <= 0 or PollenBar.Size.X.Scale >= 1
            elseif _G.FarmingMode == "Tween" then
                TeleportToCFrame(CFrame.new(Position + Vector3.new(0, 1, 0)))
                wait(0.15)
            elseif _G.FarmingMode == "Teleport" then
                HumRoot.CFrame = CFrame.new(Position + Vector3.new(0, 1, 0))
                wait(0.15)
            end--]]
            HumRoot.CFrame = CFrame.new(Position + Vector3.new(0, 1, 0))
            wait(0.15)
            if not _G.Farming then
                break
            end
            if PollenBar.Size.X.Scale >= 1 then
                break
            end
        end
    end
end

local function CollectFuzzyBombs()
    for _, Object in pairs(workspace.Particles:GetChildren()) do
        if Object.Parent and Object.Name == "DustBunnyInstance" and (HumRoot.Position - Object.Plane.Position).Magnitude <= 50 then
            local Plane = Object:FindFirstChild("Plane")
            if Plane then
                HumRoot.CFrame = CFrame.new(Plane.Position + Vector3.new(0, 2, 0))
                wait(0.15)
                if not _G.Farming then
                    break
                end
                if PollenBar.Size.X.Scale >= 1 then
                    break
                end
            end
        end
    end
end

function CollectFlames()
    if not _G.CollectFlames then
        return false
    end
    for _, Object in pairs(workspace.PlayerFlames:GetChildren()) do
        if Object.Parent and (Object.Position - HumRoot.Position).Magnitude <= 50 then
            local Particle = Object:FindFirstChildOfClass("ParticleEmitter")
            repeat wait()
                HumRoot.CFrame = CFrame.new(Object.Position + Vector3.new(0, 1, 0))
                if Particle and not Particle.Enabled then
                    break
                end
            until not Object.Parent or not _G.CollectFlames or Humanoid.Health <= 0
            if Humanoid.Health <= 0 then
                break
            end
        end
    end
end

local CoconutsTable = {}
function CollectCoconuts()
    if not _G.CollectCoconuts then
        return false
    end
    for Id, Coconut in pairs(CoconutsTable) do
        if Coconut.Parent then
            repeat wait()
                HumRoot.CFrame = CFrame.new(Coconut.Position + Vector3.new(0, 2, 0))
            until not Coconut.Parent or not _G.CollectCoconuts or Humanoid.Health <= 0
            if Humanoid.Health <= 0 then
                break
            end
            CoconutsTable[Id] = nil
        else
            CoconutsTable[Id] = nil
        end
    end
end

--// Collecting Meteor

local MeteorsTable = {}
function CollectMeteor()
    CollectingMeteor = true
    for _ = 1, 50 do
        for Id, Meteor in pairs(MeteorsTable) do
            if Meteor.Parent then
                repeat wait()
                    HumRoot.CFrame = CFrame.new(Meteor.Position + Vector3.new(0, 2, 0))
                until not Meteor.Parent or not _G.CollectMeteor or Humanoid.Health <= 0
                if Humanoid.Health <= 0 then
                    break
                end
                if _G.CollectMeteor then
                    wait(1.5)
                    CollectTokens("CollectMeteor", 120, true, {
                        ["rbxassetid://1838129169"] = true,
                        ["rbxassetid://2028574353"] = true,
                        ["rbxassetid://2306224708"] = true,
                        ["rbxassetid://4483236276"] = true,
                        ["rbxassetid://4483267595"] = true,
                        ["rbxassetid://1471882621"] = true,
                        ["rbxassetid://2863468407"] = true,
                        ["rbxassetid://1674871631"] = true,
                        ["rbxassetid://2545746569"] = true,
                        ["rbxassetid://2584584968"] = true,
                        ["rbxassetid://2542899798"] = true,
                        ["rbxassetid://2504978518"] = true,
                        ["rbxassetid://4935580111"] = true,
                        ["rbxassetid://2319943273"] = true,
                        ["rbxassetid://4520736128"] = true,
                        ["rbxassetid://1471850677"] = true,
                        ["rbxassetid://5144657109"] = true,
                        ["rbxassetid://4520739302"] = true,
                        ["rbxassetid://2028603146"] = true,
                        ["rbxassetid://2007771339"] = true,
                        ["rbxassetid://2676715441"] = true,
                    })
                    wait(0.5)
                end
                if not _G.CollectMeteor then
                    break
                end
                MeteorsTable[Id] = nil
            else
                MeteorsTable[Id] = nil
            end
        end
        if not _G.CollectMeteor then
            break
        end
    end
    CollectingMeteor = false
end

workspace.Particles.ChildAdded:Connect(function(Child)
    wait(0.05)
    if Child.Name == "WarningDisk" and Child.BrickColor == BrickColor.new("Royal purple") then
        MeteorsTable[#MeteorsTable + 1] = Child
    end
end)

workspace.Particles.ChildAdded:Connect(function(Child)
    wait(0.05)
    if Child.Name == "WarningDisk" and Child.BrickColor == BrickColor.new("Lime green") then
        CoconutsTable[#CoconutsTable + 1] = Child
    end
end)

function CollectTokens(Action, Distance, WithoutFarm, Icons)
    for _, Token in pairs(Tokens:GetChildren()) do
        if (HumRoot.Position - Token.Position).Magnitude <= (Distance or 50) and Token.Transparency < 0.85 and not CollectedTokens[Token] and Token:FindFirstChild("FrontDecal") then
            if Icons and not Icons[Token.FrontDecal.Texture] then
                continue
            end
            local SavedField = _G.FarmingField
            local Position = Token.Position
            if _G.FarmingMode == "Walk" then
                repeat wait()
                    Humanoid:MoveTo(Position)
                    if not CheckForCollectTokens(Action) then
                        break
                    end
                    if (_G.Farming or WithoutFarm) and not KillingStickBug and not CollectingMeteor and not CollectingPuffshrooms and not CollectingPlanter and not KillingCrab and not KillingWindy and not CollectingSparkles and not CollectingFireflys and not KillingCommando and not KillingMondo and not KillingMobs and not KillingVicious and ((HumRoot.Position.Y - FieldZones[_G.FarmingField].CFrame.Position.Y) >= 5 or (FieldZones[_G.FarmingField].CFrame.Position.Y - HumRoot.Position.Y) >= 5 or (HumRoot.Position - FieldZones[_G.FarmingField].CFrame.Position).Magnitude >= 90) then
                        HumRoot.CFrame = CFrame.new(FieldZones[_G.FarmingField].CFrame.Position + Vector3.new(0, 2, 0))
                    end
                until ((HumRoot.Position - Position).Magnitude <= 3 and Humanoid.MoveDirection.Magnitude <= 0.5) or (_G.SavedFarmingField ~= SavedField and (not SproutNow or not _G.FarmingSprouts)) or not Token.Parent or Humanoid.Health <= 0 or (PollenBar.Size.X.Scale >= 1 and (_G.Farming or WithoutFarm))
            elseif _G.FarmingMode == "Tween" then
                TeleportToCFrame(CFrame.new(Position))
                wait(0.15)
            elseif _G.FarmingMode == "Teleport" then
                HumRoot.CFrame = CFrame.new(Position)
                wait(0.15)
            end
            CollectedTokens[Token] = true
            if not CheckForCollectTokens(Action) then
                break
            end

            if NeedToCollectTickets and _G.CollectTickets then
                for _ = 1, 15 do
                    CollectTickets()
                end
                NeedToCollectTickets = false
            end
            if (_G.Farming or WithoutFarm) and not KillingStickBug and not CollectingMeteor and not CollectingPuffshrooms and not CollectingPlanter and not KillingCrab and not KillingWindy and not CollectingSparkles and not CollectingFireflys and not KillingCommando and not KillingMondo and not KillingMobs and not KillingVicious and ((HumRoot.Position.Y - FieldZones[_G.FarmingField].CFrame.Position.Y) >= 5 or (FieldZones[_G.FarmingField].CFrame.Position.Y - HumRoot.Position.Y) >= 5 or (HumRoot.Position - FieldZones[_G.FarmingField].CFrame.Position).Magnitude >= 120) then
                HumRoot.CFrame = CFrame.new(FieldZones[_G.FarmingField].CFrame.Position + Vector3.new(0, 2, 0))
            end
            if #MeteorsTable >= 1 and _G.CollectMeteor then
                CollectMeteor()
            end
            if _G.Farming and _G.CollectCoconuts and (not KillingMobs and not KillingWindy and not KillingMondo and not KillingVicious) then
                CollectCoconuts()
            end
            if _G.Farming and _G.AutoCollectBubbles and (not KillingMobs and not KillingWindy and not KillingMondo and not KillingVicious) then
                CollectBubbles()
            end
            if _G.Farming and _G.AutoCollectFuzzyBombs and (not KillingMobs and not KillingWindy and not KillingMondo and not KillingVicious) then
                CollectFuzzyBombs()
            end
            if _G.Farming and _G.CollectFlames and (not KillingMobs and not KillingWindy and not KillingMondo and not KillingVicious) then
                CollectFlames()
            end

            local SavedPosition = HumRoot.CFrame.Position
            if ViciousNow and _G.AutoKillVicious and not KillingWindy then
                KillVicious()
                TeleportToCFrame(CFrame.new(SavedPosition))
            end
            if WindyNow and _G.HuntWindy and not KillingWindy and not KillingVicious then
                KillWindy()
                TeleportToCFrame(CFrame.new(SavedPosition))
            end

            if PollenBar.Size.X.Scale >= 1 then
                break
            end

            if Humanoid.Health <= 0 then
                if (_G.Farming or WithoutFarm) then
                    repeat wait() until Humanoid.Health > 0 or (not _G.Farming or _G[Action])
                    if (_G.Farming or WithoutFarm) then
                        TeleportToField()
                        wait(0.3)
                        SetSprinkler()
                    end
                    break
                else
                    break
                end
            end
        end
    end
end

local SavedHoney = CoreStats.Honey.Value
CoreStats.Honey:GetPropertyChangedSignal("Value"):Connect(function()
    if CoreStats.Honey.Value > SavedHoney then
        local Increase = CoreStats.Honey.Value - SavedHoney
        HoneyCollected += Increase
    end
    SavedHoney = CoreStats.Honey.Value
end)

local ActionButton = Player.PlayerGui.ScreenGui.ActivateButton
local StickBugUI = Player.PlayerGui.ScreenGui.ChallengeInfo

local WaitingForSproutCollected = false
local DiedFarmConnection
function Farm(Data)
    if DiedFarmConnection then
        DiedFarmConnection:Disconnect()
    end
    if CollectingSproutWithoutFarm then
        if Data.Action == "Stop Farm" then
            WaitingForSproutCollected = false
            return false
        end
        if Data.Action == "Start Farm" then
            WaitingForSproutCollected = true
            repeat wait() until not CollectingSproutWithoutFarm or not WaitingForSproutCollected
            if not WaitingForSproutCollected then
                return false
            end
        end
    end
    if Data.Action == "Start Farm" then
        _G.Farming = true

        if KillingMobs then repeat wait() until not KillingMobs or not _G.Farming end
        if KillingVicious then repeat wait() until not KillingVicious or not _G.Farming end
        if KillingWindy then repeat wait() until not KillingWindy or not _G.Farming end
        if KillingCommando then repeat wait() until not KillingCommando or not _G.Farming end
        if KillingMondo then repeat wait() until not KillingMondo or not _G.Farming end
        if KillingCrab then repeat wait() until not KillingCrab or not _G.Farming end
        if KillingStickBug then repeat wait() until not KillingStickBug or not _G.Farming end
        if CollectingPuffshrooms then repeat wait() until not CollectingPuffshrooms or not _G.Farming end
        if CollectingMeteor then repeat wait() until not CollectingMeteor or not _G.Farming end
        if CollectingFireflys then repeat wait() until not CollectingFireflys or not _G.Farming end
        if CollectingSprout then repeat wait() until not CollectingSprout or not _G.Farming end
        if CollectingTickets then repeat wait() until not CollectingTickets or not _G.Farming end
        if FarmingGuidingStar then repeat wait() until not FarmingGuidingStar or not _G.Farming end
        if FarmingAnts then repeat wait() until not FarmingAnts or not _G.Farming end
        if not _G.Farming then
            return
        end

        if Data.CollectSprout then
            CollectingSproutWithoutFarm = true
        end
        if Data.FarmGuiding then
            FarmingGuidingStar = true
        end

        local CharacterDead = false
        DiedFarmConnection = Humanoid.Died:Connect(function()
            CharacterDead = true
        end)
       	local SavedField = _G.FarmingField
        local OnField = false
        while _G.Farming do
            RunService.RenderStepped:Wait()
            if SproutNow then
                if not SproutNow.Parent then
                    SproutNow = nil
                    SproutField = nil
                    _G.FarmingField = _G.SavedField
                end
            else
                if SavedField ~= _G.FarmingField then
                    OnField = false
                    SavedField = _G.FarmingField
                end
            end
            if PollenBar.Size.X.Scale < 1 and not OnField then
                TeleportToField()
                OnField = true
                wait(0.3)
                SetSprinkler()
            end
            if PollenBar.Size.X.Scale >= 1 then
                TeleportToCFrame(SpawnCFrame.Value * CFrame.new(0, 2, 0))
                wait(0.5)
                Humanoid:MoveTo((SpawnCFrame.Value * CFrame.new(0, 2, 0)).Position)
                OnField = false
                wait(1)
                ConvertPollen()
            end
            if OnField then
                repeat RunService.RenderStepped:Wait()
                    if not Data.WithoutFarm then
                        CollectTokens("Farming")
                    else
                        if Data.CollectSprout then
                            CollectTokens("FarmingSprouts", 35, true)
                        end
                        if Data.FarmGuiding then
                            CollectTokens("HuntGuidingStar", 35, true)
                        end
                    end
                    if (_G.Farming or _G.WithoutFarm) then
                        if not SproutNow and not GuidingStarNow then
                            if SavedField ~= _G.FarmingField then
                                OnField = false
                                SavedField = _G.FarmingField
                                TeleportToField()
                                OnField = true
                                wait(0.3)
                                SetSprinkler()
                            end
                        end

                        if _G.FarmingMode == "Walk" then
                            local FieldPosition = FieldZones[_G.FarmingField].CFrame.Position
                            repeat wait()
                                FieldPosition = FieldZones[_G.FarmingField].CFrame.Position
                                Humanoid:MoveTo(FieldPosition)
                                if (_G.Farming or _G.WithoutFarm) and not KillingStickBug and not CollectingMeteor and not CollectingPuffshrooms and not CollectingPlanter and not KillingCrab and not KillingWindy and not CollectingSparkles and not CollectingFireflys and not KillingCommando and not KillingMondo and not KillingMobs and not KillingVicious and ((HumRoot.Position.Y - FieldZones[_G.FarmingField].CFrame.Position.Y) >= 5 or (FieldZones[_G.FarmingField].CFrame.Position.Y - HumRoot.Position.Y) >= 5 or (HumRoot.Position - FieldZones[_G.FarmingField].CFrame.Position).Magnitude >= 90) then
                                    HumRoot.CFrame = CFrame.new(FieldZones[_G.FarmingField].CFrame.Position + Vector3.new(0, 2, 0))
                                end
                                if CharacterDead then
                                    CharacterDead = false
                                    repeat wait() until Humanoid.Health > 0 or (not _G.Farming and not _G.WithoutFarm)
                                    DiedFarmConnection = Humanoid.Died:Connect(function()
                                        CharacterDead = true
                                    end)
                                    if (_G.Farming or _G.WithoutFarm) then
                                        TeleportToField()
                                        OnField = true
                                        wait(0.3)
                                        SetSprinkler()  
                                    end
                                    break
                                end
                                if SproutNow and SproutField then
                                    if not _G.FarmingSprouts then
                                        break
                                    end
                                end
                            until (HumRoot.Position - FieldPosition).Magnitude <= 6 or Humanoid.Health <= 0 or not _G.Farming or PollenBar.Size.X.Scale >= 1
                        elseif _G.FarmingMode == "Tween" then
                            TeleportToCFrame(FieldZones[_G.FarmingField].CFrame * CFrame.new(0, 1.5, 0))
                        elseif _G.FarmingMode == "Teleport" then
                            HumRoot.CFrame = FieldZones[_G.FarmingField].CFrame * CFrame.new(0, 1.5, 0)
                        end

                        if not SproutNow then
                            if not GuidingStarNow and _G.HuntGuidingStar then
                                local GuidingStarNow, GSField = CheckForGuidingStar()
                                if GuidingStarNow and GSField then
                                    _G.FarmingField = GSField.Name
                                    TeleportToField()
                                    wait(0.3)
                                    SetSprinkler()
                                end
                            else
                                if GuidingStarNow and not GuidingStarNow.Parent and _G.HuntGuidingStar then
                                    GuidingStarNow = nil
                                    GuidingStarField = nil
                                    if _G.Farming then
                                        _G.FarmingField = _G.SavedFarmingField
                                        if Data.FarmGuiding then
                                            FarmingGuidingStar = false
                                            return
                                        end
                                        if not SproutNow then
                                            _G.Farming = false
                                            _G.ConvertingPollen = false
                                            return
                                        end
                                        TeleportToField()
                                        wait(0.3)
                                        SetSprinkler()
                                    end
                                end
                            end
                        end

                        if not SproutNow and _G.FarmingSprouts then
                            local Sprout, SPField = CheckForSprout()
                            if Sprout and SPField then
                                _G.SavedField = _G.FarmingField
                                _G.FarmingField = SPField.Name
                                TeleportToField()
                                wait(0.3)
                                SetSprinkler()
                            end
                        else
                            if SproutNow and not SproutNow.Parent and _G.FarmingSprouts then
                                for _ = 1, 10 do
                                    CollectTokens("FarmingSprouts", 50, true)
                                end
                                SproutNow = nil
                                SproutField = nil
                                SproutsCollected = SproutsCollected + 1
                                if _G.Farming then
                                    if _G.HuntGuidingStar and GuidingStarNow then
                                        _G.FarmingField = GuidingStarField.Name
                                        if Data.CollectSprout or Data.FarmingGuiding then
                                            FarmingGuidingStar = true
                                        end
                                    else
                                        _G.FarmingField = _G.SavedFarmingField
                                        if Data.CollectSprout or Data.FarmingGuiding then
                                            FarmingGuidingStar = false
                                        end
                                        if Data.CollectSprout then
                                            CollectingSproutWithoutFarm = false
                                            _G.Farming = false
                                            _G.ConvertingPollen = false
                                            return
                                        end
                                    end
                                    TeleportToField()
                                    wait(0.3)
                                    SetSprinkler()
                                end
                            end
                        end

                        if not _G.FarmingSprouts and SproutNow then
                            SproutNow = nil
                            SproutField = nil
                            if _G.Farming then
                                if _G.HuntGuidingStar and GuidingStarNow then
                                    _G.FarmingField = GuidingStarField.Name
                                    if Data.CollectSprout or Data.FarmingGuiding then
                                        FarmingGuidingStar = true
                                    end
                                else
                                    _G.FarmingField = _G.SavedFarmingField
                                    FarmingGuidingStar = false
                                    if Data.CollectSprout then
                                        CollectingSproutWithoutFarm = false
                                        _G.Farming = false
                                        _G.ConvertingPollen = false
                                        return
                                    end
                                end
                                TeleportToField()
                                wait(0.3)
                                SetSprinkler()
                            end
                        end
                        if not _G.HuntGuidingStar and GuidingStarNow then
                            GuidingStarNow = nil
                            GuidingStarField = nil
                            if _G.Farming then
                                _G.FarmingField = _G.SavedFarmingField
                                TeleportToField()
                                wait(0.3)
                                SetSprinkler()
                            end
                        end

                        if _G.AutoPlanter and ((not SproutNow and not GuidingStarNow) or (not _G.FarmingSprouts and not _G.HuntGuidingStar)) then
                            local CheckForPlanter = CheckForPlanters()
                            if CheckForPlanter == true then
                                CollectingPlanter = true
                                for Id, Planter in pairs(Planters) do
                                    HumRoot.CFrame = CFrame.new(Planter.CFrame.Position)
                                    Humanoid:MoveTo(Planter.CFrame.Position)
                                    wait(2.5)
                                    game:GetService("ReplicatedStorage").Events.PlanterModelCollect:FireServer(Planter.Id)
                                    wait(2)
                                    for _ = 1, 5 do
                                        CollectTokens("AutoPlanter", 35, true)
                                    end
                                    Planters[Id] = nil
                                end
                                CollectingPlanter = false
                            elseif CheckForPlanter == false then
                                PlayerActivesCommand:FireServer({Name = _G.PlanterSelected})
                            end
                        end

                        if StickBugUI.Visible and _G.AutoStickBug then
                            KillStickBug()
                        end

                        if #workspace.Happenings.Puffshrooms:GetChildren() >= 1 and _G.AutoPuffshrooms then
                            CollectPuffshrooms()
                        end

                        if workspace.NPCBees:FindFirstChild("Firefly") and _G.CollectFireflys then
                            CollectFireflys()
                        end
                        if MondoReady and _G.HuntMondo then
                            KillMondo()
                        end
                        if CommandoReady and _G.HuntCommando then
                            KillCommando()
                        end
                        if CrabReady and _G.TrainCrab then
                            KillCrab()
                        end
                        if Flowers:FindFirstChild("Sparkles", true) and _G.CollectSparkles then
                            CollectSparkles()
                        end
                        if _G.AutoAnt then
                            FarmAnts()
                        end
                    end
                until not OnField or PollenBar.Size.X.Scale >= 1 or Humanoid.Health <= 0 or not _G.Farming
            end
        end
    elseif Data.Action == "Stop Farm" then
    	 _G.Farming = false
         _G.ConvertingPollen = false
    end
end

function ConvertPollen()
    _G.ConvertingPollen = true
    PlayerHiveCommand:FireServer("ToggleHoneyMaking")
    EquipMask("Honey Mask")
    repeat wait()
        if Humanoid.Health <= 0 then
            repeat wait() until Humanoid.Health > 0 or not _G.ConvertingPollen
        end
        if ViciousNow and _G.AutoKillVicious and not KillingStickBug then
            KillVicious()
            TeleportToCFrame(SpawnCFrame.Value * CFrame.new(0, 2, 0))
            wait(1)
            PlayerHiveCommand:FireServer("ToggleHoneyMaking")
        end
    until PollenBar.Size.X.Scale <= 0 or not _G.ConvertingPollen
    if _G.ConvertingPollen then
        wait(5)
        if CheckForAnyQuests() and _G.RemoteQuests and not KillingStickBug then
            RemoteQuests()
        end
        if _G.AutoMobsKill and not KillingStickBug then
            ConvertedPollenForMobs = ConvertedPollenForMobs + 1
            if ConvertedPollenForMobs >= NeedConvertPollenForMobs then
                ConvertedPollenForMobs = 0
                MonstersFarm()
            end
        end
        _G.ConvertingPollen = false
    end
end

local OnettDipperEvent = workspace.NPCs.Onett.Onett["Porcelain Dipper"].ClickEvent
function AutoDig()
    if _G.AutoDiging then
        _G.AutoDiging = false
        return
    end

    coroutine.wrap(function()
        _G.AutoDiging = true
        while _G.AutoDiging do
            RunService.RenderStepped:Wait()
            for _, Object in pairs(Character:GetDescendants()) do
                if Object.Name == "ClickEvent" then
                    Object:FireServer()
                end
            end
            OnettDipperEvent:FireServer()
        end
    end)()
end

--// Auto Mobs Kill

local MonsterFlowerNow = nil
local BlockedMonsters = {
    ["Commando Chick"] = true,
    ["Coconut Crab"] = true,
    ["Stump Snail"] = true,
    ["Tunnel Bear"] = true,
    ["King Beetle"] = true,
    ["Cave Monster"] = true,
}

local function FindTimerLabel(Zone)
    for _, Object in pairs(Zone:GetDescendants()) do
        if Object.Name == "TimerLabel" then
            return Object
        end
    end
    return nil
end

function ToggleMonstersFarm()
    if _G.AutoMobsKill then
        _G.AutoMobsKill = false
        ConvertedPollenForMobs = 0
        return
    end

    _G.AutoMobsKill = true
    ConvertedPollenForMobs = 0
end

local TwoMobs = {
    -- Clover
    ["Ladybug Bush"] = "Rhino Bush",
    ["Rhino Bush"] = "Ladybug Bush",
    -- Bamboo
    ["Rhino Cave 2"] = "Rhino Cave 3",
    ["Rhino Cave 3"] = "Rhino Cave 2",
    -- Strawberry
    ["Ladybug Bush 2"] = "Ladybug Bush 3",
    ["Ladybug Bush 3"] = "Ladybug Bush 2",
    -- Rose
    ["RoseBush"] = "RoseBush2",
    ["RoseBush2"] = "RoseBush",
    -- Pineapple
    ["PineappleMantis1"] = "PineappleBeetle",
    ["PineappleBeetle"] = "PineappleMantis1",
    -- Pine Tree
    ["ForestMantis1"] = "ForestMantis2",
    ["ForestMantis2"] = "ForestMantis1",
}
local MonstersTable = {workspace.MonsterSpawners.MushroomBush, workspace.MonsterSpawners["Rhino Cave 1"], workspace.MonsterSpawners["Ladybug Bush"], workspace.MonsterSpawners["Rhino Bush"], workspace.MonsterSpawners["Rhino Cave 2"], workspace.MonsterSpawners["Rhino Cave 3"], workspace.MonsterSpawners["Spider Cave"], workspace.MonsterSpawners["Ladybug Bush 2"], workspace.MonsterSpawners["Ladybug Bush 3"], workspace.MonsterSpawners["PineappleBeetle"], workspace.MonsterSpawners["PineappleMantis1"], workspace.MonsterSpawners["WerewolfCave"], workspace.MonsterSpawners["ForestMantis1"], workspace.MonsterSpawners["ForestMantis2"], workspace.MonsterSpawners["RoseBush"], workspace.MonsterSpawners["RoseBush2"]}
local SpecialPositions = {
    ["Pine Tree Forest"] = {Vector3.new(-290.86, 68.4759, -234.026), Vector3.new(-290.902, 68.4759, -134.099), Vector3.new(-355.806, 68.4759, -231.365)},
    ["Pineapple Patch"] = {Vector3.new(296.007, 68.4759, -177.341), Vector3.new(302.722, 68.4759, -249.966), Vector3.new(210.442, 68.4759, -238.823), Vector3.new(215.405, 68.4759, -173.224)}
}
local MonsterFarmConnection
function MonstersFarm(WithoutFarm)
    if not _G.AutoMobsKill then
        if MonsterFarmConnection then
            MonsterFarmConnection:Disconnect()
        end
        return
    end

    TurnOff({"AutoMobsKill"})
    KillingMobs = true
    EquipMask("Demon Mask")
    local WaitForCharacterAdded = false
    MonsterFarmConnection = Humanoid.Died:Connect(function()
        WaitForCharacterAdded = true
    end)
    --for _, Object in pairs(MonstersTable) do
    for Id = 1, #MonstersTable do
        local Object = MonstersTable[Id]
        local TimerLabel = FindTimerLabel(Object)
        if TimerLabel and not BlockedMonsters[Object.MonsterType.Value] then
            if not TimerLabel.Visible then
                local SavedPosition = nil
                local Territory = Object.Territory.Value
                local TerritoryName = Territory.Name
                if Territory.Name == "WerewolfPlateau" then
                    Territory = Territory.w
                elseif Territory.Name == "MushroomZone" then
                    Territory = Territory.Part
                end
                local _Ray = Ray.new(Territory.Position + Vector3.new(0, 5, 0), Vector3.new(0, -200, 0))
                local Field = workspace:FindPartOnRayWithWhitelist(_Ray, {FieldZones})
                if Field then
                    local Gate = FieldsGates[Field.Name]
                    if Gate ~= "0 Bees" then
                        if Gates[Gate].CanCollide then
                            continue
                        end
                    end
                else
                    if TerritoryName == "WerewolfPlateau" then
                        if Gates["15 Bees"].CanCollide then
                            continue
                        end
                    else
                        continue
                    end
                end

                local Timer2 = TimerLabel
                local NextPosition = 0
                if TwoMobs[Object.Name] then
                    Timer2 = FindTimerLabel(workspace.MonsterSpawners[TwoMobs[Object.Name]])
                end
                repeat
                    if WaitForCharacterAdded then
                        repeat wait() until Humanoid.Health > 0
                        WaitForCharacterAdded = false
                    end
                    if SavedPosition then
                        --[[if Territory.Name == "Pine Tree Forest" or Territory.Name == "Pineapple Patch" then
                            NextPosition = NextPosition + 1
                            if NextPosition > #SpecialPositions[Territory.Name] then
                                NextPosition = 1
                            end
                            HumRoot.CFrame = CFrame.new(SpecialPositions[Territory.Name][NextPosition])
                        else
                            HumRoot.CFrame = Territory.CFrame * CFrame.new(0, 25, 0)
                        end-]]
                        HumRoot.CFrame = Territory.CFrame * CFrame.new(0, 35, 0)
                    else
                        HumRoot.CFrame = Territory.CFrame
                    end
                    SavedPosition = HumRoot.CFrame.Position
                    if NeedToCollectTickets and _G.CollectTickets then
                        for _ = 1, 15 do
                            CollectTickets()
                        end
                        NeedToCollectTickets = false
                    end
                    if ViciousNow and _G.AutoKillVicious then
                        KillVicious()
                        wait(0.5)
                        HumRoot.CFrame = CFrame.new(SavedPosition)
                    end
                    if WindyNow and _G.HuntWindy then
                        KillWindy()
                    end
                    if #MeteorsTable >= 1 and _G.CollectMeteor then
                        CollectMeteor()
                    end
                    wait(3)
                until (TimerLabel.Visible == true and Timer2.Visible == true) or not _G.AutoMobsKill
                if _G.AutoMobsKill and not WaitForCharacterAdded then
                    wait(0.3)
                    CollectTokens("AutoMobsKill", 45, true, {
                        ["rbxassetid://1674871631"] = true,
                        ["rbxassetid://1952740625"] = true,
                        ["rbxassetid://1838129169"] = true,
                        ["rbxassetid://2028574353"] = true,
                        ["rbxassetid://1471882621"] = true,
                        ["rbxassetid://2529092020"] = true,
                        ["rbxassetid://2495935291"] = true,
                        ["rbxassetid://2863468407"] = true,
                        ["rbxassetid://8277901755"] = true,
                        ["rbxassetid://4483236276"] = true,
                        ["rbxassetid://4483267595"] = true,
                        ["rbxassetid://1952682401"] = true,
                        ["rbxassetid://1952796032"] = true,
                        ["rbxassetid://2504978518"] = true,
                        ["rbxassetid://2863122826"] = true,
                        ["rbxassetid://2584584968"] = true,
                        ["rbxassetid://2542899798"] = true,
                        ["rbxassetid://2545746569"] = true,
                        ["rbxassetid://8055428094"] = true,
                        ["rbxassetid://2319943273"] = true,
                        ["rbxassetid://2676671613"] = true,
                        ["rbxassetid://1471850677"] = true,
                        ["rbxassetid://1987253833"] = true,
                        ["rbxassetid://1471849394"] = true,
                        ["rbxassetid://2314214749"] = true,
                        ["rbxassetid://8058047989"] = true,
                        ["rbxassetid://2306224708"] = true,
                        ["rbxassetid://8054996680"] = true,
                        ["rbxassetid://8058049243"] = true,
                        ["rbxassetid://2495936060"] = true,
                        ["rbxassetid://2028453802"] = true,
                    })
                    wait(0.15)
                end
                if not _G.AutoMobsKill then
                    break
                end
                if WaitForCharacterAdded then
                    repeat wait() until Humanoid.Health > 0
                    WaitForCharacterAdded = false
                end
            end
        end
    end
    --end
    TurnAllOn()
    KillingMobs = false
end

--// Auto Use Items

function UseItem(ItemName, Cooldown)
    if _G["Auto "..ItemName] then
        _G["Auto "..ItemName] = false
        return
    end

    _G["Auto "..ItemName] = true
    while _G["Auto "..ItemName] do
        PlayerActivesCommand:FireServer({Name = ItemName})

        local WaitForNext = Cooldown or 600
        repeat wait(0.1)
            WaitForNext = WaitForNext - 0.1
        until WaitForNext <= 0 or not _G["Auto "..ItemName]
        if not _G["Auto "..ItemName] then
            break
        end
    end
end

--// Auto Use Dispensers

function AutoUseDispensers()
    if _G.AutoDispensers then
        _G.AutoDispensers = false
        return
    end

    _G.AutoDispensers = true
    while _G.AutoDispensers do
        wait(0.1)
        ToyEvent:FireServer("Honey Dispenser")
        ToyEvent:FireServer("Blueberry Dispenser")
        ToyEvent:FireServer("Strawberry Dispenser")
        ToyEvent:FireServer("Treat Dispenser")
        ToyEvent:FireServer("Free Royal Jelly Dispenser")
        ToyEvent:FireServer("Free Ant Pass Dispenser")
        ToyEvent:FireServer("Coconut Dispenser")
        ToyEvent:FireServer("Glue Dispenser")
        if _G.AutoWealthClock then
            ToyEvent:FireServer("Wealth Clock")
        end
    end
end

--// Auto Kill Vicious

local ViciousPlatform = Instance.new("Part", workspace)
ViciousPlatform.Name = "ViciousPlatform"
ViciousPlatform.Transparency = 1
ViciousPlatform.Anchored = true
ViciousPlatform.Size = Vector3.new(5, 2, 5)
ViciousPlatform.Position = Vector3.new(0, -500, 0)

function KillVicious(WithoutFarm)
    local Vicious = workspace.Particles:FindFirstChild("Vicious")
    if Vicious then
        TurnOff({"AutoKillVicious"})
        KillingVicious = true
        if Humanoid.Health <= 0 then
            repeat wait() until Humanoid.Health > 0
        end
        EquipMask("Demon Mask")

        HumRoot.CFrame = CFrame.new(Vicious.Position)
        wait(0.5)
        repeat wait()
            ViciousPlatform.CFrame = CFrame.new(Vicious.Position + Vector3.new(0, 18, 0))
            HumRoot.CFrame = CFrame.new(Vicious.Position + Vector3.new(0, 20, 0))
            if NeedToCollectTickets and _G.CollectTickets then
                for _ = 1, 15 do
                    CollectTickets()
                end
                NeedToCollectTickets = false
            end
            if #MeteorsTable >= 1 and _G.CollectMeteor then
                CollectMeteor()
            end
        until not workspace.Particles:FindFirstChild("Vicious") or not _G.AutoKillVicious
        if not workspace.Particles:FindFirstChild("Vicious") and _G.AutoKillVicious then
            KilledVicious = KilledVicious + 1
        end
        TurnAllOn()
        KillingVicious = false
    end
end

function ToggleKillVicious()
    if _G.AutoKillVicious then
        _G.AutoKillVicious = false
        return
    end
    _G.AutoKillVicious = true
end

--// Auto Kill Windy

local WindyPlatform = Instance.new("Part", workspace)
WindyPlatform.Name = "WindyPlatform"
WindyPlatform.Transparency = 1
WindyPlatform.Anchored = true
WindyPlatform.Size = Vector3.new(5, 2, 5)
WindyPlatform.Position = Vector3.new(0, -500, 0)

function KillWindy(WithoutFarm)
    if WindyNow then
        TurnOff({"HuntWindy"})
        KillingWindy = true
        if Humanoid.Health <= 0 then
            repeat wait() until Humanoid.Health > 0
        end
        EquipMask("Demon Mask")

        local WindyActive = true
        local WindyLevel = nil
        for _, Monster in pairs(workspace.Monsters:GetChildren()) do
            if string.find(Monster.Name, "Windy") then
                WindyLevel = Monster.Name
            end
        end
        HumRoot.CFrame = CFrame.new(WindyNow.Position)
        wait(0.5)
        repeat wait(0.05)
            if WindyNow and WindyNow.Parent then
                WindyPlatform.CFrame = CFrame.new(WindyNow.Position + Vector3.new(0, 18, 0))
                HumRoot.CFrame = CFrame.new(WindyNow.Position + Vector3.new(0, 20, 0))

                local CheckForWindy = false
                for _, Monster in pairs(workspace.Monsters:GetChildren()) do
                    if string.find(Monster.Name, "Windy") then
                        CheckForWindy = true
                        WindyNow = workspace.NPCBees:FindFirstChild("Windy")
                    end
                    if string.find(Monster.Name, "Windy") and WindyLevel ~= Monster.Name then
                        wait(5)
                        WindyLevel = Monster.Name
                        WindyPlatform.CFrame = CFrame.new(0, -500, 0)
                        wait(0.5)
                        CollectTokens("HuntWindy", 70, true, {
                            ["rbxassetid://1472135114"] = true,
                            ["rbxassetid://2028574353"] = true,
                            ["rbxassetid://1952682401"] = true,
                            ["rbxassetid://3030569073"] = true,
                            ["rbxassetid://1674871631"] = true,
                            ["rbxassetid://1471882621"] = true,
                            ["rbxassetid://2863468407"] = true,
                            ["rbxassetid://2545746569"] = true,
                            ["rbxassetid://2529092020"] = true,
                            ["rbxassetid://2542899798"] = true,
                            ["rbxassetid://3835877932"] = true,
                            ["rbxassetid://2319943273"] = true,
                            ["rbxassetid://2676671613"] = true,
                        })
                        wait(0.3)
                    end
                end
                if CheckForWindy then
                    WindyActive = true
                else
                    WindyActive = false
                end
                if NeedToCollectTickets and _G.CollectTickets then
                    for _ = 1, 15 do
                        CollectTickets()
                    end
                    NeedToCollectTickets = false
                end
                wait(0.05)
            end
        until not _G.HuntWindy or not workspace.NPCBees:FindFirstChild("Windy")
        if _G.HuntWindy then
            KilledWindy = KilledWindy + 1
        end
        TurnAllOn()
        KillingWindy = false
    end
end

--// Auto Kill Commando

local CommandoPart = Instance.new("Part", workspace)
CommandoPart.Name = "CommandoPart"
CommandoPart.Anchored = true
CommandoPart.CanCollide = true
CommandoPart.Transparency = 1
CommandoPart.Size = Vector3.new(5, 2, 5)
CommandoPart.CFrame = CFrame.new(0, -500, 0)

function KillCommando(WithoutFarm)
    KillingCommando = true
    TurnOff({"HuntCommando"})
    HumRoot.CFrame = CFrame.new(Vector3.new(500, 47, 167))
    wait(1)
    for _, Monster in pairs(workspace.Monsters:GetChildren()) do
        if string.find(Monster.Name, "Commando Chick") and (Monster.Target.Value.Name == Player.Name or _G.HuntAnyCommandoChick) then
            local Primary = Monster.PrimaryPart
            repeat wait()
                CommandoPart.CFrame = CFrame.new(Primary.Position + Vector3.new(0, 15, 0))
                HumRoot.CFrame = CommandoPart.CFrame * CFrame.new(0, CommandoPart.Size.Y / 2 + 1, 0)
                if NeedToCollectTickets and _G.CollectTickets then
                    for _ = 1, 15 do
                        CollectTickets()
                    end
                    NeedToCollectTickets = false
                end
                if ViciousNow and _G.AutoKillVicious then
                    KillVicious()
                    wait(0.5)
                end
                if #MeteorsTable >= 1 and _G.CollectMeteor then
                    CollectMeteor()
                end
            until not Monster.Parent or not _G.HuntCommando
            CommandoPart.CFrame = CFrame.new(0, -500, 0)
            if _G.HuntCommando then
                wait(2.5)
                KilledCommando = KilledCommando + 1
                CollectTokens("HuntCommando", 75, true)
            end
        end
    end
    TurnAllOn()
    KillingCommando = false
end

--// Auto Kill Mondo

local MondoPart = Instance.new("Part", workspace)
MondoPart.Name = "MondoPart"
MondoPart.Anchored = true
MondoPart.CanCollide = true
MondoPart.Transparency = 1
MondoPart.Size = Vector3.new(5, 2, 5)
MondoPart.CFrame = CFrame.new(0, -500, 0)

local MondoDrop = {
    ["rbxassetid://2028574353"] = true,
    ["rbxassetid://4483236276"] = true,
    ["rbxassetid://4483267595"] = true,
    ["rbxassetid://2863468407"] = true,
    ["rbxassetid://2863122826"] = true,
    ["rbxassetid://2529092020"] = true,
    ["rbxassetid://2319943273"] = true,
    ["rbxassetid://4520739302"] = true,
    ["rbxassetid://2028603146"] = true,
    ["rbxassetid://1472135114"] = true,
}

function KillMondo(WithoutFarm)
    KillingMondo = true
    TurnOff({"HuntMondo"})
    for _, Monster in pairs(workspace.Monsters:GetChildren()) do
        if string.find(Monster.Name, "Mondo Chick") then
            local Primary = Monster.PrimaryPart
            if Primary and Monster.Parent then
                repeat wait()
                    MondoPart.CFrame = CFrame.new(Primary.Position + Vector3.new(0, 25, 0))
                    HumRoot.CFrame = MondoPart.CFrame * CFrame.new(0, MondoPart.Size.Y / 2 + 1, 0)
                    if NeedToCollectTickets and _G.CollectTickets then
                        for _ = 1, 15 do
                            CollectTickets()
                        end
                        NeedToCollectTickets = false
                    end
                    if ViciousNow and _G.AutoKillVicious then
                        KillVicious()
                        wait(0.5)
                    end
                    if #MeteorsTable >= 1 and _G.CollectMeteor then
                        CollectMeteor()
                    end
                until not Monster.Parent or not _G.HuntMondo
                MondoPart.CFrame = CFrame.new(0, -500, 0)
                if _G.HuntMondo then
                    wait(1)
                    KilledMondo = KilledMondo + 1
                    for _ = 1, 15 do
                        CollectTokens("HuntMondo", 45, true, MondoDrop)
                    end
                end
            end
        end
    end
    TurnAllOn()
    KillingMondo = false
end

--// Train Coconut Crab

local CrabPart = Instance.new("Part", workspace)
CrabPart.Name = "CrabPart"
CrabPart.Anchored = true
CrabPart.CanCollide = true
CrabPart.Transparency = 1
CrabPart.Size = Vector3.new(5, 2, 5)
CrabPart.CFrame = CFrame.new(0, -500, 0)

local CrabDrop = {
    ["rbxassetid://3012679515"] = true,
    ["rbxassetid://2863122826"] = true,
    ["rbxassetid://3835877932"] = true,
    ["rbxassetid://4483236276"] = true,
    ["rbxassetid://2319943273"] = true,
    ["rbxassetid://6077173317"] = true,
    ["rbxassetid://2542899798"] = true,
    ["rbxassetid://2545746569"] = true,
    ["rbxassetid://2529092020"] = true,
    ["rbxassetid://2504978518"] = true,
    ["rbxassetid://1471850677"] = true,
    ["rbxassetid://2676671613"] = true,
    ["rbxassetid://4483267595"] = true,
    ["rbxassetid://5144657109"] = true,
    ["rbxassetid://4520736128"] = true,
    ["rbxassetid://4520739302"] = true,
    ["rbxassetid://1987255318"] = true,
    ["rbxassetid://1987257040"] = true,
    ["rbxassetid://2028603146"] = true,
}

function KillCrab(WithoutFarm)
    KillingCrab = true
    HumRoot.CFrame = FieldZones["Coconut Field"].CFrame * CFrame.new(0, 2, 0)
    TurnOff({"TrainCrab"})
    wait(1.5)
    for _, Monster in pairs(workspace.Monsters:GetChildren()) do
        if string.find(Monster.Name, "Coconut Crab") and Monster.Target.Value.Name == Player.Name then
            local Primary = Monster.PrimaryPart
            if Primary and Monster.Parent then
                repeat wait()
                    CrabPart.CFrame = CFrame.new(-259, 111.8, 496.4)--CFrame.new(Primary.Position + Vector3.new(0, 2532, 0))
                    HumRoot.CFrame = CrabPart.CFrame * CFrame.new(0, CrabPart.Size.Y / 2 + 1, 0)
                    if NeedToCollectTickets and _G.CollectTickets then
                        for _ = 1, 15 do
                            CollectTickets()
                        end
                        NeedToCollectTickets = false
                    end
                    if ViciousNow and _G.AutoKillVicious then
                        KillVicious()
                        wait(0.5)
                    end
                    if #MeteorsTable >= 1 and _G.CollectMeteor then
                        CollectMeteor()
                    end
                until not Monster.Parent or not _G.TrainCrab
                CrabPart.CFrame = CFrame.new(0, -500, 0)
                if _G.TrainCrab then
                    wait(1)
                    KilledCrabs = KilledCrabs + 1
                    for _ = 1, 15 do
                        CollectTokens("TrainCrab", 100, true, CrabDrop)
                        wait(0.1)
                    end
                end
            end
        end
    end
    TurnAllOn()
    KillingCrab = false
end

--// Auto Stick Bug

local StickBugPositions = {
    ["Sunflower Field"] = {Vector3.new(-245, 4, 176), Vector3.new(-181, 4, 176)},
    ["Clover Field"] = {Vector3.new(120, 33, 196), Vector3.new(193, 33, 196)},
    ["Strawberry Field"] = {Vector3.new(-217, 20, -12), Vector3.new(-142, 20, -11)},
    ["Bamboo Field"] = {Vector3.new(85, 20, -26), Vector3.new(183, 20, -27)},
    ["Pineapple Patch"] = {Vector3.new(213, 68, -208), Vector3.new(295, 68, -208)},
    ["Cactus Field"] = {Vector3.new(-229, 68, -104), Vector3.new(-146, 68, -102)},
    ["Pumpkin Patch"] = {Vector3.new(-230, 68, -184), Vector3.new(-150, 68, -184)},
    ["Mountain Top Field"] = {Vector3.new(44, 176, -166), Vector3.new(111, 176, -166)}
}

local StickBugAmulets = {"Bronze Stick Bug Amulet", "Silver Stick Bug Amulet", "Gold Stick Bug Amulet", "Diamond Stick Bug Amulet"}

local StickBugPart = Instance.new("Part", workspace)
StickBugPart.Name = "StickBugPart"
StickBugPart.Anchored = true
StickBugPart.CanCollide = true
StickBugPart.Transparency = 1
StickBugPart.Size = Vector3.new(5, 2, 5)
StickBugPart.CFrame = CFrame.new(0, -500, 0)

local function GetStickBugField(Model)
    if not Model then return nil end
    local Primary = Model.PrimaryPart
    if Primary then
        local _Ray = Ray.new(Primary.Position + Vector3.new(0, 5, 0), Vector3.new(0, -200, 0))
        local Field = workspace:FindPartOnRayWithWhitelist(_Ray, {FieldZones})
        if Field then
            return Field
        end
    end
    return nil
end

local StickBugDrop = {
    ["rbxassetid://1471882621"] = true,
    ["rbxassetid://1838129169"] = true,
    ["rbxassetid://2028574353"] = true,
    ["rbxassetid://2529092020"] = true,
    ["rbxassetid://2584584968"] = true,
    ["rbxassetid://2545746569"] = true,
    ["rbxassetid://2319943273"] = true,
    ["rbxassetid://1952796032"] = true,
    ["rbxassetid://1952682401"] = true,
}
local StickBugUI = Player.PlayerGui.ScreenGui.ChallengeInfo
local Monsters = workspace.Monsters
local Particles = workspace.Particles

local function GetTotemField(Primary)
    if not Primary then return nil end
    local _Ray = Ray.new(Primary.Position + Vector3.new(0, 5, 0), Vector3.new(0, -200, 0))
    local Field = workspace:FindPartOnRayWithWhitelist(_Ray, {FieldZones})
    if Field then
        return Field
    end
    return nil
end

local function CollectTokensForTotem(TokenDistance, Totem, NotBreakedTotem)
    for _, Token in pairs(Tokens:GetChildren()) do
        local Distance = (Token.Position - HumRoot.Position).Magnitude
        if Token:FindFirstChild("FrontDecal") and Distance <= (TokenDistance or 150) then
            if StickBugDrop[Token.FrontDecal.Texture] or NotBreakedTotem then
                if (HumRoot.Position.Y - Token.Position.Y) >= 5 or (Token.Position.Y - HumRoot.Position.Y) >= 5 then
                    continue
                end
                local Time = Distance / 130
                Tween:Create(HumRoot, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                    CFrame = CFrame.new(Token.Position)
                }):Play()
                task.wait(Time + 0.15)
                if not _G.AutoFarmStickBugTotems then
                    break
                end
                if Totem and not Totem.Parent then
                    break
                end
            end
        end
    end
end

function FarmStickBugTotem()
    local Totem = Particles:FindFirstChild("StickBugTotem")
    if Totem then
        local Primary = Totem:FindFirstChild("Part")
        if Primary then
            local Field = GetTotemField(Primary)
            if Field then
                HumRoot.CFrame = CFrame.new(Primary.Position + Vector3.new(0, -6, 0))
                wait(0.5)
                SetSprinkler()
                wait(0.5)
                repeat wait()
                    CollectTokensForTotem(75, Totem, true)
                    HumRoot.CFrame = CFrame.new(Primary.Position + Vector3.new(0, -6, 0))
                until not _G.AutoFarmStickBugTotems or not Totem.Parent
                if _G.AutoFarmStickBugTotems and not Totem.Parent then
                    wait(3)
                    CollectedStickBugTotems = CollectedStickBugTotems + 1
                    CollectTokensForTotem(90)
                end
            end
        end
    end
end

local StickBugModel
local StickBugField
function KillStickBug()
    KillingStickBug = true
    TurnOff({"AutoStickBug", "AutoStickBugTotems"})

    EquipMask("Demon Mask")
    local StickBugLevel
    repeat wait()
        if StickBugModel then
            local Field = GetStickBugField(StickBugModel)
            if Field then
                StickBugField = Field
            end
        end
        if not _G.GodMode then
            _G.GodMode = true
            GodMode(true)
        end
        for _, Monster in pairs(Monsters:GetChildren()) do
            if string.find(Monster.Name, "Stick Bug") then
                if not StickBugModel or not StickBugLevel then
                    StickBugModel = Monster
                    StickBugLevel = Monster.Name
                elseif StickBugLevel ~= Monster.Name then
                    KilledStickBugs = KilledStickBugs + 1
                    wait(0.5)
                    StickBugPart.CFrame = CFrame.new(0, -500, 0)
                    wait(3)
                    for _, Token in pairs(Tokens:GetChildren()) do
                        local Distance = (Token.Position - HumRoot.Position).Magnitude
                        if Token:FindFirstChild("FrontDecal") and Distance <= 150 then
                            if StickBugDrop[Token.FrontDecal.Texture] then
                                local Time = Distance / 130
                                Tween:Create(HumRoot, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                    CFrame = CFrame.new(Token.Position)
                                }):Play()
                                task.wait(Time + 0.15)
                                if not _G.AutoStickBug then
                                    break
                                end
                            end
                        end
                    end
                    wait(0.5)
                    StickBugModel = Monster
                    StickBugLevel = Monster.Name
                end
            end
        end

        if StickBugModel then
            local Primary = StickBugModel.PrimaryPart
            if Primary then
                if _G.AutoFarmStickBugTotems then
                    if Particles:FindFirstChild("StickBugTotem") then
                        FarmStickBugTotem() 
                    end
                end
                local StickBugHealthBar = Particles:FindFirstChild("PollenHealthBar")
                if StickBugHealthBar then
                    local _Ray = Ray.new(StickBugHealthBar.Position + Vector3.new(0, 5, 0), Vector3.new(0, -200, 0))
                    local Field = workspace:FindPartOnRayWithWhitelist(_Ray, {FieldZones})
                    if Field then
                        StickBugField = Field
                    end
                end
                if StickBugField then
                    local Distance = (StickBugField.Position - Primary.Position).Magnitude
                    local PositionNow = 0
                    if Distance >= 230 then
                        StickBugPartCFrame = CFrame.new(0, -500, 0)
                        HumRoot.CFrame = CFrame.new(StickBugField.Position + Vector3.new(0, 2, 0))
                        repeat wait()
                            Distance = (StickBugField.Position - Primary.Position).Magnitude
                            PositionNow = PositionNow + 1
                            if PositionNow > 2 then
                                PositionNow = 1
                            end

                            local Position = StickBugPositions[StickBugField.Name][PositionNow]
                            repeat wait()
                                if StickBugModel then
                                    local Field = GetStickBugField(StickBugModel)
                                    if Field then
                                        StickBugField = Field
                                    end
                                end
                                Distance = (StickBugField.Position - Primary.Position).Magnitude
                                if Distance >= 230 then
                                    Humanoid:MoveTo(Position)
                                end
                            until (HumRoot.Position - Position).Magnitude <= 5 or Distance < 230 or not _G.AutoStickBug or not StickBugUI.Visible
                        until Distance < 230 or not _G.AutoStickBug or not StickBugUI.Visible
                    end
                end
                if _G.AutoStickBug then
                    StickBugPart.CFrame = CFrame.new(Primary.Position + Vector3.new(0, 20, 0))
                    HumRoot.CFrame = StickBugPart.CFrame * CFrame.new(0, StickBugPart.Size.Y / 2 + 1, 0)
                end
            end
        end
    until not _G.AutoStickBug or not StickBugUI.Visible
    for _, Amulet in pairs(StickBugAmulets) do
        game:GetService("ReplicatedStorage").Events.ClientRejectAmulet:FireServer("Stick Bug", Amulet)
    end
    if _G.GodMode then
        _G.GodMode = false
        GodMode(false)
        wait(5)
    end
    TurnAllOn()
    StickBugPart.CFrame = CFrame.new(0, -500, 0)
    StickBugModel = nil
    StickBugField = nil
    KillingStickBug = false
end

--// Auto Farming Ants

local AntPart = Instance.new("Part", workspace)
AntPart.Name = "AntPart"
AntPart.Anchored = true
AntPart.CanCollide = true
AntPart.Transparency = 1
AntPart.Size = Vector3.new(5, 2, 5)
AntPart.CFrame = CFrame.new(0, -500, 0)

local AntChallenge = workspace.Toys["Ant Challenge"]
function FarmAnts()
    FarmingAnts = true

    local RetrievePlayerStats = game:GetService("ReplicatedStorage").Events.RetrievePlayerStats
    local StatsTable = RetrievePlayerStats:InvokeServer()
    if StatsTable.Eggs.AntPass > 0 and not AntChallenge.Busy.Value then
        local OldTool = StatsTable["EquippedCollector"]
        ItemPackageEvent:InvokeServer("Equip", {["Mute"] = true, ["Type"] = "Spark Staff", ["Category"] = "Collector"})
        ToyEvent:FireServer("Ant Challenge")
        wait(3)
        PlayerActivesCommand:FireServer({["Name"] = "Sprinkler Builder"})

        local LeftPos = CFrame.new(127, 48, 547)
		local RightPos = CFrame.new(65, 48, 534)

        AntPart.CFrame = RightPos
        HumRoot.CFrame = AntPart.CFrame * CFrame.new(0, AntPart.Size.Y / 2 + 1, 0)

        local Left = true
        local Right = false
        local Debounce = false
        repeat wait()
            for _, Monster in pairs(AntChallenge.Obstacles:GetChildren()) do
                local Root = Monster:FindFirstChild("Root")
                if Root then
                    if (Root.Position - HumRoot.Position).Magnitude <= 40 and Left and not Debounce then
                        AntPart.CFrame = RightPos
                        Right = true
                        Left = false
                        Debounce = true
                        wait(.1)
                    elseif (Root.Position - HumRoot.Position).Magnitude <= 40 and Right and not Debounce then
                        AntPart.CFrame = LeftPos
                        Right = false
                        Left = true
                        Debounce = true
                        wait(.1)
                    end
                    HumRoot.CFrame = AntPart.CFrame * CFrame.new(0, AntPart.Size.Y / 2 + 1, 0)
                    Debounce = false
                end
            end  
        until not AntChallenge.Busy.Value or not _G.AutoAnt
        AntPart.CFrame = CFrame.new(0, -500, 0)
        if not _G.AutoAnt then
            HumRoot.CFrame = SpawnCFrame.Value
        end
        wait(2)
        game.ReplicatedStorage.Events.ItemPackageEvent:InvokeServer("Equip", {["Mute"] = true, ["Type"] = OldTool, ["Category"] = "Collector"})
    end
    FarmingAnts = false
end

--// Collecting Puffshrooms

function CollectPuffshrooms()
    CollectingPuffshrooms = true
    TurnOff({"AutoPuffshrooms"})
    repeat wait()
        if not _G.AutoPuffshrooms then
            break
        end
        for _, Object in pairs(workspace.Happenings.Puffshrooms:GetChildren()) do
            if not _G.AutoPuffshrooms then
                break
            end
            local Stem = Object:FindFirstChild("Puffball Stem")
            if Stem then
                HumRoot.CFrame = CFrame.new(Stem.Position)
                Humanoid:MoveTo(Stem.Position)
                wait(1)
                PlayerActivesCommand:FireServer({Name = "Sprinkler Builder"})
                repeat wait()
                    for _, Object in pairs(Character:GetDescendants()) do
                        if Object.Name == "ClickEvent" then
                            Object:FireServer()
                        end
                    end
                    wait(0.5)
                until not Object.Parent or not _G.AutoPuffshrooms
                if _G.AutoPuffshrooms then
                    wait(1.5)
                    CollectTokens("AutoPuffshrooms", 45, true, {
                        ["rbxassetid://1472135114"] = true,
                        ["rbxassetid://2028574353"] = true,
                        ["rbxassetid://1838129169"] = true,
                        ["rbxassetid://1471882621"] = true,
                        ["rbxassetid://1952740625"] = true,
                        ["rbxassetid://2028453802"] = true,
                        ["rbxassetid://1952682401"] = true,
                        ["rbxassetid://1952796032"] = true,
                        ["rbxassetid://1674871631"] = true,
                        ["rbxassetid://4483267595"] = true,
                        ["rbxassetid://4483236276"] = true,
                        ["rbxassetid://8277778300"] = true,
                        ["rbxassetid://3012679515"] = true,
                        ["rbxassetid://2504978518"] = true,
                        ["rbxassetid://2863468407"] = true,
                        ["rbxassetid://8054996680"] = true,
                        ["rbxassetid://8277780065"] = true,
                        ["rbxassetid://8277781666"] = true,
                        ["rbxassetid://8277783113"] = true,
                        ["rbxassetid://8055428094"] = true,
                        ["rbxassetid://2542899798"] = true,
                        ["rbxassetid://2319943273"] = true,
                    })
                    wait(0.2)
                end
            end
        end
    until #workspace.Happenings.Puffshrooms:GetChildren() <= 0 or not _G.AutoPuffshrooms
    TurnAllOn()
    CollectingPuffshrooms = false
end

--// Collecting Fireflys

function CollectFireflys()
    CollectingFireflys = true
    local Firefly = workspace.NPCBees:FindFirstChild("Firefly")
    repeat wait()
        local ChangedPosition = false
        for _, Bee in pairs(workspace.NPCBees:GetChildren()) do
            if Bee.Name == "Firefly" and Bee.Velocity.Magnitude < 1.5 then
                HumRoot.CFrame = CFrame.new(Bee.Position + Vector3.new(0, 2, 0))
                ChangedPosition = true
                wait(0.2)
            end
        end
        if ChangedPosition then
            wait(2)
            CollectTokens("CollectFireflys", 50, true, {["rbxassetid://2306224708"] = true})
            wait(4)
        end
    until not _G.CollectFireflys or not Firefly.Parent
    CollectingFireflys = false
end

--// Collecting Sparkles

function CollectSparkles()
    CollectingSparkles = true
    for _, Object in pairs(Flowers:GetDescendants()) do
        if Object.Name == "Sparkles" and Object.Parent then
            HumRoot.CFrame = CFrame.new(Object.Parent.Position + Vector3.new(0, 2, 0))
            for _ = 1, 5 do
                for _, Object in pairs(Character:GetDescendants()) do
                    if Object.Name == "ClickEvent" then
                        Object:FireServer()
                    end
                end
                wait(0.5)
            end
            CollectTokens("CollectSparkles", 15, true)
            if not _G.CollectSparkles then
                break
            end
        end
    end
    CollectingSparkles = false
end

--// Collecting Leaves

function CollectLeaves()
    if _G.CollectLeaves then
        _G.CollectLeaves = false
        return
    end

    _G.CollectLeaves = true
    if _G.Farming then repeat wait() until not _G.Farming or not _G.CollectLeaves end
    if _G.AutoMobsKill then repeat wait() until not _G.AutoMobsKill or not _G.CollectLeaves end
    if _G.AutoKillVicious then repeat wait() until not _G.AutoKillVicious or not _G.CollectLeaves end
    if _G.HuntWindy then repeat wait() until not _G.HuntWindy or not _G.CollectLeaves end
    if _G.HuntCommando then repeat wait() until not _G.HuntCommando or not _G.CollectLeaves end
    if _G.HuntMondo then repeat wait() until not _G.HuntMondo or not _G.CollectLeaves end
    if _G.TrainCrab then repeat wait() until not _G.TrainCrab or not _G.CollectLeaves end
    if _G.AutoStickBug then repeat wait() until not _G.AutoStickBug or not _G.CollectLeaves end
    if _G.AutoPuffshrooms then repeat wait() until not _G.AutoPuffshrooms or not _G.CollectLeaves end
    if _G.CollectMeteor then repeat wait() until not _G.CollectMeteor or not _G.CollectLeaves end
    if _G.CollectFireflys then repeat wait() until not _G.CollectFireflys or not _G.CollectLeaves end
    if _G.FarmingSprouts then repeat wait() until not _G.FarmingSprouts or not _G.CollectLeaves end
    if _G.CollectTickets then repeat wait() until not _G.CollectTickets or not _G.CollectLeaves end
    if _G.HuntGuidingStar then repeat wait() until not _G.HuntGuidingStar or not _G.CollectLeaves end
    if _G.CollectSparkles then repeat wait() until not _G.CollectSparkles or not _G.CollectLeaves end
    if not _G.CollectLeaves then
        return
    end

    local WaitForCharacter = false
    local Connection
    Connection = Humanoid.Died:Connect(function()
        WaitForCharacter = true
    end)
    while _G.CollectLeaves do
        for _, Object in pairs(workspace:GetDescendants()) do
            if string.find(Object.Name, "LeafBurst") then
                local Flower = Object.Parent
                if Flower then
                    local Distance = (HumRoot.Position - Flower.Position).Magnitude
                    Tween:Create(HumRoot, TweenInfo.new(Distance / 120, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {CFrame = CFrame.new(Flower.Position + Vector3.new(20, 1, 0))}):Play()
                    repeat wait()
                        Humanoid:MoveTo(Flower.Position)
                        Humanoid.WalkSpeed = 30
                        if (HumRoot.Position - Flower.Position).Magnitude <= 3 then
                            for _, Object in pairs(Character:GetDescendants()) do
                                if Object.Name == "ClickEvent" then
                                    Object:FireServer()
                                end
                            end
                        end
                        if WaitForCharacter then
                            repeat wait() until Humanoid.Health > 0
                            WaitForCharacter = false
                            Connection = Humanoid.Died:Connect(function()
                                WaitForCharacter = true
                            end)
                            break
                        end
                    until not Object.Parent or not _G.CollectLeaves
                    wait(1.5)
                    break
                end
            end
        end
    end
end

--// Bring Tornado

local Particles = workspace.Particles
function BringTornado()
    if _G.BringTornado then
        _G.BringTornado = false
        return
    end

    local Part1 = "Root"
    local Part2 = "Plane"

    _G.BringTornado = true
    while wait(0.2) do
        if not _G.BringTornado then
            break
        end
        if not KillingWindy then
            for _, Object in pairs(Particles:GetDescendants()) do
                if (Object.Name == Part1 or Object.Name == Part2) and Object.Parent.Name ~= "DustBunnyInstance" then
                    for _, Token in pairs(game.workspace.Collectibles:GetChildren()) do
                        if tostring(Token) == tostring(Player.Name) or tostring(Token) == "C" then
                            if (Token.Position - HumRoot.Position).Magnitude <= 60 then
                                Tween:Create(Object, TweenInfo.new(0.2), {CFrame = CFrame.new(Token.Position.X, HumRoot.Position.Y, Token.Position.Z)}):Play()
                            end
                        end
                    end
                end
            end
        end
    end
end

--// Remote Quests

local DialogueButton = Player.PlayerGui.ScreenGui.NPC.ButtonOverlay
local ActionButton = Player.PlayerGui.ScreenGui.ActivateButton

function RemoteQuests()
    for _, NPC in pairs(workspace.NPCs:GetChildren()) do
        if NPC:FindFirstChild("Platform") then
            if NPC.Platform.AlertPos.AlertGui.ImageLabel.ImageTransparency == 0 and NPC.Name ~= "Bubble Bee Man 2" and NPC.Name ~= "Gummy Bear" then
                local Gate = NPCsGates[NPC.Name]
                if Gate ~= "0 Bees" then
                    if Gates[Gate].CanCollide then
                        continue
                    end
                end
                local Platform = NPC.Platform
                HumRoot.CFrame = CFrame.new(Platform.Position + Vector3.new(0, 2, 0))
                wait(1)
                for _, Connection in pairs(getconnections(ActionButton.MouseButton1Click)) do
                    Connection.Function()
                end
                repeat wait() until DialogueButton.Parent.Visible
                repeat wait()
                    for _, Connection in pairs(getconnections(DialogueButton.MouseButton1Click)) do
                        Connection.Function()
                    end
                until not DialogueButton.Parent.Visible
            end
        end
    end
end

function ToggleRemoteQuests()
    if _G.RemoteQuests then
        _G.RemoteQuests = false
        return
    end

    _G.RemoteQuests = true
end

--// Remote Badges

local Badges = {"Playtime", "Honey", "Quest", "Battle", "Ability", "Goo", "Sunflower", "Dandelion", "Mushroom", "Blue Flower", "Clover", "Spider", "Bamboo", "Strawberry", "Pineapple", "Pumpkin", "Cactus", "Rose", "Pine Tree", "Stump", "Coconut", "Pepper"}
function RemoteBadges()
    if _G.RemoteBadges then
        _G.RemoteBadges = false
        return
    end

    _G.RemoteBadges = true
    while _G.RemoteBadges do
        for _, Badge in pairs(Badges) do
            BadgeEvent:FireServer("Collect", Badge)
            wait(0.25)
        end
        wait(15)
    end
end

--// God Mode

function GodMode(State)
    local PLCharacter = Player.Character or workspace:FindFirstChild(Player.Name)
    local PLHumanoid = Character.Humanoid
    local CharacterClone = Humanoid:Clone()
    if State == "Enable" or State == true then
        Player.Character = nil
        CharacterClone:SetStateEnabled(15, false)
        CharacterClone:SetStateEnabled(0, false)
        CharacterClone:SetStateEnabled(1, false)
        CharacterClone.Parent = PLCharacter
        PLHumanoid:Destroy()
        Player.Character = PLCharacter
        PLCharacter.Animate.Disabled = true
        PLCharacter.Animate.Disabled = false
        PLCharacter.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
        -- Give Tool
        local Tool = PLCharacter:FindFirstChildOfClass("Tool")
        if Tool then
            Tool.Parent = workspace
            Tool.Parent = PLCharacter
        end
        -- Give Glider
        game:GetService("UserInputService").InputBegan:Connect(function(Input, GPE)
            if Input.KeyCode == Enum.KeyCode.Space and not GPE then
                if PLCharacter.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
                    if not PLCharacter:FindFirstChild("Glider") then
                        game:GetService("ReplicatedStorage").Events.ParachuteCommand:FireServer("Open")
                    else
                        game:GetService("ReplicatedStorage").Events.ParachuteCommand:FireServer("Close")
                    end
                end
            end
        end)
        PLCharacter.ChildAdded:Connect(function(Child)
            if Child.Name == "Glider" then
                repeat game:GetService("RunService").RenderStepped:Wait()
                    PLCharacter.
                    PrimaryPart.Velocity = PLCharacter.PrimaryPart.CFrame.LookVector * 80
                    PLCharacter.PrimaryPart.CFrame = PLCharacter.PrimaryPart.CFrame:Lerp(PLCharacter.PrimaryPart.CFrame * CFrame.new(0, -0.3, 0), 0.8)
                until not Child.Parent or PLCharacter.Humanoid.FloorMaterial ~= Enum.Material.Air
                game:GetService("ReplicatedStorage").Events.ParachuteCommand:FireServer("Close")
            end
        end)
    elseif State == "Disable" or State == false then
        PLHumanoid:SetStateEnabled(15, true)
        CharacterClone:SetStateEnabled(0, true)
        CharacterClone:SetStateEnabled(1, true)
        Player.Character = nil
        PLHumanoid:ChangeState(15)
        Player.Character = PLCharacter
    end
end

function ToggleGodMode()
    if KillingStickBug then
        return false
    end
    if _G.GodMode then
        _G.GodMode = false
        GodMode(false)
        return
    end

    _G.GodMode = true
    GodMode(true)
end

--// Auto Collect Tickets

function CollectTickets(WithoutFarm)
    CollectingTickets = true
    wait(0.1)
    for _, Token in pairs(Tokens:GetChildren()) do
        if Token.Transparency <= 0.2 and Token:FindFirstChild("FrontDecal") then
            if Token.FrontDecal.Texture == "rbxassetid://1674871631" then
                HumRoot.CFrame = CFrame.new(Token.Position) * CFrame.new(20, 0, 0)
                wait(0.1)
                repeat wait()
                    Humanoid.WalkSpeed = 30
                    Humanoid:MoveTo(Token.Position)
                until not Token.Parent or Humanoid.Health <= 0 or not _G.CollectTickets
                if not _G.CollectTickets then
                    break
                end
                wait(0.15)
                if Humanoid.Health <= 0 then
                    repeat wait() until Humanoid.Health > 0 or not _G.CollectTickets
                    if not _G.CollectTickets then
                        break
                    end
                end
            end
        end
    end
    CollectingTickets = false
end

function ToggleCollectTickets()
    if _G.CollectTickets then
        _G.CollectTickets = false
        return
    end 

    _G.CollectTickets = true
    while _G.CollectTickets do
        wait()
        ToyEvent:FireServer("Honeystorm")
    end
end

--// UI \\--

--// Home Category

InfoSector:Cheat("Label", "Created by: Fake#5860 & Darkness🌙#2212")
InfoSector:Cheat("Label", "Thanks: Pepsi#5229 | Dinoz#2787")
InfoSector:Cheat("Button", "Discord Invite", function()
	setclipboard("https://discord.gg/2tnUywMFD5")
end, {text = "Copy"})

--// Farming Category

FarmingSector:Cheat("Dropdown", "Field:", function(Option)
    if not GuidingStarNow and not SproutNow then
        _G.FarmingField = Option
    end
    _G.SavedFarmingField = Option
end, {
	options = {
		"Sunflower Field",
        "Dandelion Field",
        "Mushroom Field",
        "Blue Flower Field",
        "Clover Field",
        "Spider Field",
        "Strawberry Field",
        "Bamboo Field",
        "Pineapple Patch",
        "Stump Field",
        "Pumpkin Patch",
        "Cactus Field",
        "Rose Field",
        "Pine Tree Forest",
        "Mountain Top Field",
        "Coconut Field",
        "Pepper Patch",
        "Ant Field"
	}
})

FarmingSector:Cheat("Checkbox", "Auto Farm", function(State)
    if State then
		Farm({Action = "Start Farm"})
	else
		Farm({Action = "Stop Farm"})
	end
end)

FarmingSector:Cheat("Checkbox", "Auto Dig", function(State)
    AutoDig()
end)

FarmingSector:Cheat("Checkbox", "Auto Sprinkler", function(State)
    _G.AutoSprinkler = State
end)

FarmingSector:Cheat("Checkbox", "Auto Planter", function(State)
    _G.AutoPlanter = State
end)

FarmingSector:Cheat("Checkbox", "Auto Puffshrooms", function(State)
    _G.AutoPuffshrooms = State
end)

FarmingSector:Cheat("Checkbox", "Monster Killer", function(State)
    ToggleMonstersFarm()
end)

FarmingSector:Cheat("Checkbox", "Hunt Windy", function(State)
    _G.HuntWindy = State
end)

FarmingSector:Cheat("Checkbox", "Farm Sprouts", function(State)
    _G.FarmingSprouts = State
end)

FarmingSector:Cheat("Checkbox", "Hunt Vicious", function(State)
    ToggleKillVicious()
end)

FarmingSector:Cheat("Checkbox", "Hunt Mondo", function(State)
    _G.HuntMondo = State
end)

FarmingSector:Cheat("Checkbox", "Hunt Commando", function(State)
    _G.HuntCommando = State
end)

FarmingSector:Cheat("Checkbox", "Hunt Any Commando Chick", function(State)
    _G.HuntAnyCommandoChick = State
end)

FarmingSector:Cheat("Checkbox", "Train Coconut Crab", function(State)
    _G.TrainCrab = State
end)

FarmingSector:Cheat("Checkbox", "Hunt Aphid (Not Working)", function(State)

end)

FarmingSector:Cheat("Checkbox", "Auto Ant", function(State)
    _G.AutoAnt = State
end)

FarmingSector:Cheat("Checkbox", "Auto Stick Bug", function(State)
    _G.AutoStickBug = State
end)

FarmingSector:Cheat("Checkbox", "Auto Stick Bug Totems", function(State)
    _G.AutoFarmStickBugTotems = State
end)

FarmingSector2:Cheat("Checkbox", "Collect Tickets", function(State)
    ToggleCollectTickets()
end)

FarmingSector2:Cheat("Checkbox", "Auto Treats", function(State)
    AutoUseDispensers()
end)

FarmingSector2:Cheat("Checkbox", "Bring Tornado", function(State)
    BringTornado()
end)

FarmingSector2:Cheat("Checkbox", "Wealth Clock", function(State)
    _G.AutoWealthClock = State
end)

FarmingSector2:Cheat("Checkbox", "Remote Quest", function(State)
    ToggleRemoteQuests()
end)

FarmingSector2:Cheat("Checkbox", "Remote Badges", function(State)
    RemoteBadges()
end)

FarmingSector2:Cheat("Checkbox", "Pursue Firefly", function(State)
    _G.CollectFireflys = State
end)

FarmingSector2:Cheat("Checkbox", "Teleport To Leaves", function(State)
    CollectLeaves()
end)

FarmingSector2:Cheat("Checkbox", "Teleport To Sparkles", function(State)
    _G.CollectSparkles = State
end)

FarmingSector2:Cheat("Checkbox", "Collect Bubbles", function(State)
    _G.AutoCollectBubbles = State
end)

FarmingSector2:Cheat("Checkbox", "Collect Fuzzy Bombs", function(State)
    _G.AutoCollectFuzzyBombs = State
end)

FarmingSector2:Cheat("Checkbox", "Collect Meteor", function(State)
    _G.CollectMeteor = State
end)

FarmingSector2:Cheat("Checkbox", "Collect Flames", function(State)
    _G.CollectFlames = State
end)

FarmingSector2:Cheat("Checkbox", "Collect Coconuts", function(State)
    _G.CollectCoconuts = State
end)

FarmingSector2:Cheat("Checkbox", "Hunt Guiding Star", function(State)
    _G.HuntGuidingStar = State
end)

--// WayPoints Category

FieldSector:Cheat("Dropdown", "Field:", function(Option)
	HumRoot.CFrame = CFrame.new(workspace.FlowerZones[Option].Position + Vector3.new(0, 2, 0))
end, {
	options = {
		"Sunflower Field",
        "Dandelion Field",
        "Mushroom Field",
        "Blue Flower Field",
        "Clover Field",
        "Spider Field",
        "Strawberry Field",
        "Bamboo Field",
        "Pineapple Patch",
        "Stump Field",
        "Pumpkin Patch",
        "Cactus Field",
        "Rose Field",
        "Pine Tree Forest",
        "Mountain Top Field",
        "Coconut Field",
        "Pepper Patch",
        "Ant Field"
	}
})

ShopSector:Cheat("Dropdown", "Shop:", function(Option)
    if Option == 'Noob Shop' then
        HumRoot.CFrame = CFrame.new(98, 4, 289)
    elseif Option == "Pro Shop" then
        HumRoot.CFrame = CFrame.new(159, 69, -170)
    elseif Option == "Mountain Top Shop" then
        HumRoot.CFrame = CFrame.new(-21, 176, -139)
    elseif Option == "Petal Shop" then
        HumRoot.CFrame = CFrame.new(-500, 51, 470)
    elseif Option == "Coconut Cave" then
        HumRoot.CFrame = CFrame.new(-144, 72, 509)
    elseif Option == "Gummy Bear's Lair" then
        HumRoot.CFrame = CFrame.new(272, 25270, -787)
    elseif Option == "Blue HQ" then
        HumRoot.CFrame = CFrame.new(291, 4, 98)
    elseif Option == "Red HQ" then
        HumRoot.CFrame = CFrame.new(-334, 20, 213)
    elseif Option == "Dapper Bear's Shop" then
        HumRoot.CFrame = CFrame.new(514, 138, -343)
    elseif Option == "Badge Bearer's Guild" then
        HumRoot.CFrame = CFrame.new(-410, 68, -3)
    elseif Option == "Basic Egg Shop" then
        HumRoot.CFrame = CFrame.new(-137, 4, 243)
    elseif Option == "Royal Jelly Shop" then
        HumRoot.CFrame = CFrame.new(-296, 52, 66)
    elseif Option == "Treat Shop" then
        HumRoot.CFrame = CFrame.new(-231, 5, 88)
    elseif Option == "Stinger Shop" then
        HumRoot.CFrame = CFrame.new(85, 33, 451)
    elseif Option == "Magic Bean Shop" then
        HumRoot.CFrame = CFrame.new(352, 92, -85)
    elseif Option == "Gumdrop Shop" then
        HumRoot.CFrame = CFrame.new(66, 21, 35)
    elseif Option == "Ticket Tent" then
        HumRoot.CFrame = CFrame.new(-234, 17, 405)
    elseif Option == "Motivating Nectar" then
        HumRoot.CFrame = CFrame.new(160, 175, -304)
    elseif Option == "Demon Mask Shop" then
        HumRoot.CFrame = CFrame.new(295, 27, 273)
    elseif Option == "Diamond Mask Shop" then
        HumRoot.CFrame = CFrame.new(-336, 132, -391)
    elseif Option == "Moon Charm Shop" then
        HumRoot.CFrame = CFrame.new(21, 87, -54)
    elseif Option == "Star Amulet Shop" then
        HumRoot.CFrame = CFrame.new(134, 65, 326)
    end
end, {
	options = {
		"Noob Shop",
        "Pro Shop",
        "Mountain Top Shop",
        "Petal Shop",
        "Coconut Cave",
        "Gummy Bear's Lair",
        "Blue HQ",
        "Red HQ",
        "Dapper Bear's Shop",
        "Badge Bearer's Guild",
        "Basic Egg Shop",
        "Royal Jelly Shop",
        "Treat Shop",
        "Stinger Shop",
        "Magic Bean Shop",
        "Gumdrop Shop",
        "Ticket Tent",
        "Motivating Nectar",
        "Demon Mask Shop",
        "Diamond Mask Shop",
        "Moon Charm Shop",
        "Star Amulet Shop"
	}
})

NPCSector:Cheat("Dropdown", "NPC:", function(Option)
	HumRoot.CFrame = CFrame.new(workspace.NPCs[Option].Platform.Position + Vector3.new(0, 3, 0))
end, {
	options = {
		"Black Bear",
        "Mother Bear",
        "Brown Bear",
        "Bucko Bee",
        "Panda Bear",
        "Science Bear",
        "Riley Bee",
        "Honey Bee",
        "Polar Bear",
        "Onett",
        "Bubble Bee Man 2",
        "Spirit Bear"
	}
})

--// Extras Category

local Codes = {"BFCM2022", "PlushFriday", "BANNED", "Teespring", "BeesBuzz123", "Marshmallow", "ClubConverters", "Sure", "GumdropsForScience", "SecretProfileCode", "ClubBean", "Wink", "38217", "Bopmaster", "Buzz", "Cog", "Connoisseur", "Crawlers", "Nectar", "Roof", "Wax", "2Billion", "DarzethDoodads", "Thnxcyastoybox", "WalmartToys", "FourYearFiesta", "10mMembers", "1MLikes", "Cubly", "500mil"}
ExtrasSector:Cheat("Button", "Redeem Codes", function()
    for _, Code in pairs(Codes) do
        game:GetService("ReplicatedStorage").Events.PromoCodeEvent:FireServer(Code)
    end
end, {text = "Redeem"})

ExtrasSector:Cheat("Button", "Buy Hive Slot", function()
    ItemPackageEvent:InvokeServer("Purchase", {
        Type = "Hive Slot",
        Category = "HiveSlot",
        Mute = false,
        Amount = 0X1
    })
end, {text = "Buy"})

ExtrasSector:Cheat("Button", "Summon Meteor Shower", function()
    ToyEvent:FireServer("Mythic Meteor Shower")
end, {text = "Summon"})

ExtrasSector:Cheat("Button", "Summon Special Sprout", function()
    ToyEvent:FireServer("Sprout Summoner")
end, {text = "Summon"})

ExtrasSector:Cheat("Button", "Summon Stick Bug", function()
    game:GetService("ReplicatedStorage").Events.SelectNPCOption:FireServer("StartFreeStickBugEvent")
end, {text = "Summon"})

ExtrasSector:Cheat("Button", "Summon Honeystorm", function()
    ToyEvent:FireServer("Honeystorm")
end, {text = "Summon"})

ExtrasSector:Cheat("Checkbox", "WalkSpeed", function(State)
    if State then
        _G.WalkSpeed = true
        while _G.WalkSpeed do
            RunService.RenderStepped:Wait()
            if not CollectingTickets then
                Humanoid.WalkSpeed = _G.WalkSpeedAmount
            end
        end
        Humanoid.WalkSpeed = 33
    else
        _G.WalkSpeed = false
    end
end)

ExtrasSector:Cheat("Checkbox", "JumpPower", function(State)
    if State then
        _G.JumpPower = true
        while _G.JumpPower do
            RunService.RenderStepped:Wait()
            Humanoid.JumpPower = _G.JumpPowerAmount
        end
        Humanoid.JumpPower = 65
    else
        _G.JumpPower = false
    end
end)

ExtrasSector:Cheat("Checkbox", "HipHeight", function(State)
    if State then
        _G.HipHeight = true
        while _G.HipHeight do
            RunService.RenderStepped:Wait()
            Humanoid.HipHeight = _G.HipHeightAmount
        end
        Humanoid.HipHeight = 2.48
    else
        _G.HipHeight = false
    end
end)

ExtrasSector:Cheat("Checkbox", "God Mode", function(State)
    ToggleGodMode()
end)

local GliderModule = require(game:GetService("ReplicatedStorage").Parachutes)
ExtrasSector:Cheat("Checkbox", "Debug Glider", function(State)
    if _G.DebugGlider then
        _G.DebugGlider = false
        for _,v in pairs(GliderModule)do
            local uv = getupvalues(v)
            for _,v in pairs(uv[1])do
                if type(v) == "table" then
                    uv[1]["Parachute"].Float = -30
                    uv[1]["Glider"].Float = -30
                end
            end
        end
        return
    end

    _G.DebugGlider = true
    for _,v in pairs(GliderModule)do
        local uv = getupvalues(v)
        for _,v in pairs(uv[1])do
            if type(v) == "table" then
                uv[1]["Parachute"].Float = 30
                uv[1]["Glider"].Float = 30
            end
        end
    end
end)

UseItemsSector:Cheat("Checkbox", "Red Extract", function(State)
    UseItem("Red Extract")
end)

UseItemsSector:Cheat("Checkbox", "Blue Extract", function(State)
    UseItem("Blue Extract")
end)

UseItemsSector:Cheat("Checkbox", "Glitter", function(State)
    UseItem("Glitter")
end)

UseItemsSector:Cheat("Checkbox", "Glue", function(State)
    UseItem("Glue")
end)

UseItemsSector:Cheat("Checkbox", "Oil", function(State)
    UseItem("Oil")
end)

UseItemsSector:Cheat("Checkbox", "Enzymes", function(State)
    UseItem("Enzymes")
end)

UseItemsSector:Cheat("Checkbox", "Tropical Drink", function(State)
    UseItem("Tropical Drink")
end)

UseItemsSector:Cheat("Checkbox", "Marshmallow Bee", function(State)
    UseItem("Marshmallow Bee")
end)

UseItemsSector:Cheat("Checkbox", "Sprout", function(State)
    UseItem("Magic Bean", 1)
end)

UseItemsSector:Cheat("Checkbox", "Stinger", function(State)
    UseItem("Stinger", 30)
end)

UseItemsSector:Cheat("Checkbox", "Gumdrops", function(State)
    UseItem("Gumdrops", 1)
end)

UseItemsSector:Cheat("Checkbox", "Coconut", function(State)
    UseItem("Coconut", 1)
end)

--// Misc Category

local YBee = 1
local XBee = 1
local FeedBeeAmount = 1
local FeedBeeFood = "Treat"

FeedBeesSector:Cheat("Textbox", "Up:", function(Value)
	YBee = tonumber(Value) or 1
end, {placeholder = "Example: 1"})

FeedBeesSector:Cheat("Textbox", "Left:", function(Value)
	XBee = tonumber(Value) or 1
end, {placeholder = "Example: 1"})

FeedBeesSector:Cheat("Textbox", "Amount:", function(Value)
	FeedBeeAmount = tonumber(Value) or 1
end, {placeholder = "Example: 100"})

FeedBeesSector:Cheat("Dropdown", "Eat:", function(Option)
    FeedBeeFood = Option
end, {
	options = {
        "Treat",
        "Blueberry",
        "Pineapple",
        "Strawberry",
        "SunflowerSeed",
		"MoonCharm",
		"BitterBerry",
		"NeonBerry"
	}
})

FeedBeesSector:Cheat("Checkbox", "Feed", function(State)
    if _G.FeedingBee then
        _G.FeedingBee = false
        return
    end

    _G.FeedingBee = true
    while _G.FeedingBee do
        game:GetService("ReplicatedStorage").Events.ConstructHiveCellFromEgg:InvokeServer(XBee, YBee, FeedBeeFood, FeedBeeAmount, false)
        wait(0.1)
    end
end)

local WindShrineItems = {}
for Name, _ in pairs(game:GetService("ReplicatedStorage").Events.RetrievePlayerStats:InvokeServer().Eggs) do
    table.insert(WindShrineItems, Name)
end

local WindShrineItem = "Treat"
local WindShrineAmount = 1
WindShrineSector:Cheat("Textbox", "Amount:", function(Value)
	WindShrineAmount = tonumber(Value) or 1
end, {placeholder = "Example: 1"})

WindShrineSector:Cheat("Dropdown", "Item:", function(Option)
	WindShrineItem = Option
end, {
	options = WindShrineItems
})

WindShrineSector:Cheat("Checkbox", "Donate", function(State)
    if _G.AutoWindShrineDonate then
        _G.AutoWindShrineDonate = false
        return
    end

    _G.AutoWindShrineDonate = true
    while _G.AutoWindShrineDonate do
        wait(0.1)
        game:GetService("ReplicatedStorage").Events.WindShrineDonation:InvokeServer(WindShrineItem, WindShrineAmount)
    end
end)

WindShrineSector:Cheat("Checkbox", "Spawn Rewards", function(State)
    if _G.AutoWindShrineSpawnRewards then
        _G.AutoWindShrineSpawnRewards = false
        return
    end

    _G.AutoWindShrineSpawnRewards = true
    while _G.AutoWindShrineSpawnRewards do
        wait(0.1)
        game:GetService("ReplicatedStorage").Events.WindShrineTrigger:FireServer()
    end
end)

local BlenderItem = "RedExtract"
BlenderSector:Cheat("Dropdown", "Item:", function(Option)
	BlenderItem = Option
end, {
	options = {
        "RedExtract",
        "BlueExtract",
        "Enzymes",
        "Oil",
        "Glue",
		"TropicalDrink",
		"Gumdrops",
		"MoonCharm",
		"Glitter",
		"StarJelly",
		"PurplePotion",
		"SoftWax",
		"HardWax",
		"SwirledWax",
		"CausticWax",
		"FieldDice",
		"SmoothDice",
		"LoadedDice",
		"SuperSmoothie",
		"Turpentine"
	}
})

local BlenderAmount = 1
BlenderSector:Cheat("Textbox", "Amount:", function(Value)
	BlenderAmount = tonumber(Value) or 1
end, {placeholder = "Example: 1"})

BlenderSector:Cheat("Button", "Start Blending", function()
    game.ReplicatedStorage.Events.BlenderCommand:InvokeServer("PlaceOrder", {Recipe = BlenderItem, Count = BlenderAmount})
end, {text = "Start"})

BlenderSector:Cheat("Button", "Cancel Blending", function()
    game.ReplicatedStorage.Events.BlenderCommand:InvokeServer("StopOrder")
end, {text = "Cancel"})

AmuletSector:Cheat("Button", "Craft Moon Amulet", function()
    ToyEvent:FireServer("Moon Amulet Generator")
end, {text = "Craft"})

local StarAmulet = "Bronze Star Amulet"
AmuletSector:Cheat("Button", "Craft Star Amulet", function()
    ToyEvent:FireServer(StarAmulet.." Generator")
end, {text = "Craft"})

AmuletSector:Cheat("Dropdown", "Amulet:", function(Option)
	StarAmulet = Option
end, {
	options = {
        "Bronze Star Amulet",
        "Silver Star Amulet",
        "Gold Star Amulet",
        "Diamond Star Amulet",
        "Supreme Star Amulet"
	}
})

local InventoryItemToBuyOrEquip = "Petal Wand"
InventorySector:Cheat("Textbox", "Item:", function(Value)
	InventoryItemToBuyOrEquip = Value
end, {placeholder = "Example: Petal Wand"})

InventorySector:Cheat("Button", "Equip", function()
    ItemPackageEvent:InvokeServer("Equip", {Type = InventoryItemToBuyOrEquip, Category = "Accessory"})
    ItemPackageEvent:InvokeServer("Equip", {Type = InventoryItemToBuyOrEquip, Category = "Collector"})
end, {text = "Equip"})

InventorySector:Cheat("Button", "Buy", function()
    ItemPackageEvent:InvokeServer("Buy", {Type = InventoryItemToBuyOrEquip, Category = "Accessory"})
    ItemPackageEvent:InvokeServer("Buy", {Type = InventoryItemToBuyOrEquip, Category = "Collector"})
end, {text = "Buy"})

--// Statistics Category

StatisticsSector:Cheat("Label", "⏳ Elapsed Time: ")
StatisticsSector:Cheat("Label", "🍯 Honey: ")
StatisticsSector:Cheat("Label", "🎫 Collected Tickets: ")
StatisticsSector:Cheat("Label", "🕷️ Killed Mobs: ")
StatisticsSector:Cheat("Label", "🌱 Sprouts Collected: ")
StatisticsSector:Cheat("Label", "⚠️ Killed Vicious: ")
StatisticsSector:Cheat("Label", "🌪️ Killed Windy: ")
StatisticsSector:Cheat("Label", "🐥 Killed Mondo: ")
StatisticsSector:Cheat("Label", "🐣 Killed Commando: ")
StatisticsSector:Cheat("Label", "🦀 Killed Coconut Crab: ")
StatisticsSector:Cheat("Label", "🐛 Killed Stick Bug: ")
StatisticsSector:Cheat("Label", "📍 Collected Stickbug Totems: ")

TimersSector:Cheat("Label", "Clover Beetle: Alive! ")
TimersSector:Cheat("Label", "Clover Ladybug: Alive! ")
TimersSector:Cheat("Label", "Blue Flower Beetle: Alive! ")
TimersSector:Cheat("Label", "Bamboo Beetle: Alive! ")
TimersSector:Cheat("Label", "Bamboo Beetle 2: Alive! ")
TimersSector:Cheat("Label", "Pineapple Beetle: Alive! ")
TimersSector:Cheat("Label", "Pineapple Mantis: Alive! ")
TimersSector:Cheat("Label", "Spider: Alive! ")
TimersSector:Cheat("Label", "Mushroom Ladybug: Alive! ")
TimersSector:Cheat("Label", "Strawberry Ladybug: Alive! ")
TimersSector:Cheat("Label", "Strawberry Ladybug 2: Alive! ")
TimersSector:Cheat("Label", "Rose Scorpion: Alive! ")
TimersSector:Cheat("Label", "Rose Scorpion 2: Alive! ")
TimersSector:Cheat("Label", "Werewolf: Alive! ")
TimersSector:Cheat("Label", "Pine Tree Mantis: Alive! ")
TimersSector:Cheat("Label", "Pine Tree Mantis 2: Alive! ")
TimersSector2:Cheat("Label", "King Beetle: Alive! ")
TimersSector2:Cheat("Label", "Tunnel Bear: Alive! ")
TimersSector2:Cheat("Label", "Snail: Alive! ")
TimersSector2:Cheat("Label", "Coconut Crab: Alive! ")

local ElapsedLabel = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.L.Statistics.Container["⏳ Elapsed Time: "].Title
local HoneyLabel = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.L.Statistics.Container["🍯 Honey: "].Title
local TicketsLabel = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.L.Statistics.Container["🎫 Collected Tickets: "].Title
local MobsLabel = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.L.Statistics.Container["🕷️ Killed Mobs: "].Title
local SproutsLabel = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.L.Statistics.Container["🌱 Sprouts Collected: "].Title
local ViciousLabel = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.L.Statistics.Container["⚠️ Killed Vicious: "].Title
local WindyLabel = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.L.Statistics.Container["🌪️ Killed Windy: "].Title
local MondoLabel = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.L.Statistics.Container["🐥 Killed Mondo: "].Title
local CommandoLabel = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.L.Statistics.Container["🐣 Killed Commando: "].Title
local CrabLabel = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.L.Statistics.Container["🦀 Killed Coconut Crab: "].Title
local StickBugLabel = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.L.Statistics.Container["🐛 Killed Stick Bug: "].Title
local StickBugTotemsLabel = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.L.Statistics.Container["📍 Collected Stickbug Totems: "].Title
local CloverBeetle = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.R.Timers.Container["Clover Beetle: Alive! "].Title
local CloverLadybug = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.R.Timers.Container["Clover Ladybug: Alive! "].Title
local BlueFlowerBeetle = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.R.Timers.Container["Blue Flower Beetle: Alive! "].Title
local BambooBeetle = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.R.Timers.Container["Bamboo Beetle: Alive! "].Title
local BambooBeetle2 = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.R.Timers.Container["Bamboo Beetle 2: Alive! "].Title
local PineappleBeetle = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.R.Timers.Container["Pineapple Beetle: Alive! "].Title
local PineappleMantis = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.R.Timers.Container["Pineapple Mantis: Alive! "].Title
local Spider = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.R.Timers.Container["Spider: Alive! "].Title
local MushroomLadybug = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.R.Timers.Container["Mushroom Ladybug: Alive! "].Title
local StrawberryLadybug = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.R.Timers.Container["Strawberry Ladybug: Alive! "].Title
local StrawberryLadybug2 = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.R.Timers.Container["Strawberry Ladybug 2: Alive! "].Title
local RoseScorpion = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.R.Timers.Container["Rose Scorpion: Alive! "].Title
local RoseScorpion2 = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.R.Timers.Container["Rose Scorpion 2: Alive! "].Title
local Werewolf = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.R.Timers.Container["Werewolf: Alive! "].Title
local PineTreeMantis = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.R.Timers.Container["Pine Tree Mantis: Alive! "].Title
local PineTreeMantis2 = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.R.Timers.Container["Pine Tree Mantis 2: Alive! "].Title

local KingBeetle = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.L.Monsters.Container["King Beetle: Alive! "].Title
local TunnelBear = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.L.Monsters.Container["Tunnel Bear: Alive! "].Title
local Snail = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.L.Monsters.Container["Snail: Alive! "].Title
local CoconutCrab = game:GetService("CoreGui").FinityUI.Container.Categories.Statistics.L.Monsters.Container["Coconut Crab: Alive! "].Title

local SavedTexts = {}
local function UpdateTimer(UI, Timer)
    Timer = FindTimerLabel(Timer)
    if Timer.Visible then
        if not SavedTexts[UI] then
            SavedTexts[UI] = UI.Text
        end
        UI.Text = Timer.Text
        UI.TextColor3 = Color3.fromRGB(255,35,0)
    else
        UI.TextColor3 = Color3.fromRGB(132,255,130)
        if SavedTexts[UI] then
            UI.Text = SavedTexts[UI]
            SavedTexts[UI] = nil
        end
    end
end

local function FixTime(Time)
	if string.len(tostring(Time)) == 1 then
		Time = "0"..math.floor(Time)
	else
		Time = math.floor(Time)
	end
	return Time
end

local function ConvertToTime(Time)
	if typeof(Time) == "number" then
		local seconds = Time % 60
		local minutes = math.floor(Time / 60) % 60
		local hours = math.floor(Time / 3600) % 24
		local days = math.floor(Time / 86400)
		--[[ Fix Time ]]--
		seconds = FixTime(seconds)
		minutes = FixTime(minutes)
		hours = FixTime(hours)
		days = FixTime(days)
		--[[ Get Normal Time ]]--
		if tonumber(days) ~= 0 then
			return days..":"..hours..":"..minutes..":"..seconds
		else
			if tonumber(hours) ~= 0 then
				return hours..":"..minutes..":"..seconds
			else
				if tonumber(minutes) ~= 0 then
					return minutes..":"..seconds
				else
					return seconds.." Seconds"
				end
			end
		end
	end
end

coroutine.wrap(function()
    wait(1)
    _G.UpdateStats = true
    while _G.UpdateStats do
        wait(0.1)
        ElapsedTime = ElapsedTime + 0.1
        local HoneyAmount = GetCommas(HoneyCollected)
        if HoneyCollected >= 10000000 then
            HoneyAmount = GetSuffix(HoneyCollected)
        end

        HoneyLabel.Text = "🍯 Honey: "..HoneyAmount

        ElapsedLabel.Text = "⏳ Elapsed Time: "..ConvertToTime(ElapsedTime)
        TicketsLabel.Text = "🎫 Collected Tickets: "..GetCommas(TicketsCollected)
        MobsLabel.Text = "🕷️ Killed Mobs: "..GetCommas(KilledMobs)
        ViciousLabel.Text = "⚠️ Killed Vicious: "..GetCommas(KilledVicious)
        SproutsLabel.Text = "🌱 Sprouts Collected: "..GetCommas(SproutsCollected)
        WindyLabel.Text = "🌪️ Killed Windy: "..GetCommas(KilledWindy)
        MondoLabel.Text = "🐥 Killed Mondo: "..GetCommas(KilledMondo)
        CommandoLabel.Text = "🐣 Killed Commando: "..GetCommas(KilledCommando)
        CrabLabel.Text = "🦀 Killed Coconut Crab: "..GetCommas(KilledCrabs)
        StickBugLabel.Text = "🐛 Killed Stick Bug: "..GetCommas(KilledStickBugs)
        StickBugTotemsLabel.Text = "📍 Collected Stickbug Totems: "..GetCommas(CollectedStickBugTotems)

        UpdateTimer(CloverBeetle, workspace.MonsterSpawners["Rhino Bush"])
        UpdateTimer(CloverLadybug, workspace.MonsterSpawners["Ladybug Bush"])
        UpdateTimer(BlueFlowerBeetle, workspace.MonsterSpawners["Rhino Cave 1"])
        UpdateTimer(BambooBeetle, workspace.MonsterSpawners["Rhino Cave 2"])
        UpdateTimer(BambooBeetle2, workspace.MonsterSpawners["Rhino Cave 3"])
        UpdateTimer(PineappleBeetle, workspace.MonsterSpawners.PineappleBeetle)
        UpdateTimer(PineappleMantis, workspace.MonsterSpawners.PineappleMantis1)
        UpdateTimer(Spider, workspace.MonsterSpawners["Spider Cave"])
        UpdateTimer(MushroomLadybug, workspace.MonsterSpawners.MushroomBush)
        UpdateTimer(StrawberryLadybug, workspace.MonsterSpawners["Ladybug Bush 2"])
        UpdateTimer(StrawberryLadybug2, workspace.MonsterSpawners["Ladybug Bush 3"])
        UpdateTimer(RoseScorpion, workspace.MonsterSpawners.RoseBush)
        UpdateTimer(RoseScorpion2, workspace.MonsterSpawners.RoseBush2)
        UpdateTimer(Werewolf, workspace.MonsterSpawners.WerewolfCave)
        UpdateTimer(PineTreeMantis, workspace.MonsterSpawners.ForestMantis1)
        UpdateTimer(PineTreeMantis2, workspace.MonsterSpawners.ForestMantis2)

        UpdateTimer(KingBeetle, workspace.MonsterSpawners["King Beetle Cave"])
        UpdateTimer(TunnelBear, workspace.MonsterSpawners.TunnelBear)
        UpdateTimer(Snail, workspace.MonsterSpawners.StumpSnail)
        UpdateTimer(CoconutCrab, workspace.MonsterSpawners.CoconutCrab)
    end
end)()

--// Settings Category

SettingsSector:Cheat("Dropdown", "Planter:", function(Option)
	_G.PlanterSelected = Option
end, {
	options = {
		"Paper Planter",
		"Ticket Planter",
		"Festive Planter",
		"Plastic Planter",
		"Candy Planter",
        "Red Clay Planter",
		"Blue Clay Planter",
		"Tacky Planter",
		"Pesticide Planter",
		"Petal Planter",
        "The Planter Of Plenty"
	}
})

SettingsSector:Cheat("Dropdown", "Sprinkler Mode:", function(Option)
	_G.Sprinkler = Option
end, {
	options = {
		"Basic Sprinkler",
		"Silver Soakers",
		"Golden Gushers",
		"Diamond Drenchers",
		"The Supreme Saturator"
	}
})

SettingsSector:Cheat("Dropdown", "Mask For Farm:", function(Option)
	_G.MaskForFarm = Option
    EquipMask(_G.MaskForFarm)
end, {
	options = {
		"Diamond Mask",
		"Demon Mask",
		"Gummy Mask"
	}
})

SettingsSector:Cheat("Dropdown", "Mask Cost:", function(Option)
    _G.MasksMode = Option
end, {
	options = {
		"100M",
		"5B"
	}
})

SettingsSector2:Cheat("Slider", "WalkSpeed", function(Amount)
    _G.WalkSpeedAmount = Amount
end, {min = 16, max = 150, suffix = " studs"})

SettingsSector2:Cheat("Slider", "JumpPower", function(Amount)
    _G.JumpPowerAmount = Amount
end, {min = 16, max = 300, suffix = " studs"})

SettingsSector2:Cheat("Slider", "HipHeight", function(Amount)
    _G.HipHeightAmount = Amount
end, {min = 2.48, max = 300, suffix = " studs"})

SettingsSector2:Cheat("Slider", "Glider Speed", function(Amount)
    for _,v in pairs(GliderModule)do
        local uv = getupvalues(v)
        for _,v in pairs(uv[1])do
            if type(v) == "table" then
                uv[1]["Parachute"].Speed = Amount
                uv[1]["Glider"].Speed = Amount
            end
        end
    end
end, {min = 10, max = 200, suffix = " studs"})

local ChangeNickname = false
local ChangeNicknameConnection
local NicknameObjects = {}
SettingsSector2:Cheat("Checkbox", "Hide Your Name", function(State)
    local Name = Player.Name
    ChangeNickname = false
    if ChangeNicknameConnection then
        ChangeNicknameConnection:Disconnect()
    end
	if State then
        Name = "SuckONETT"
        ChangeNickname = true
    end

    for _, Object in pairs(game:GetDescendants()) do
        if Object:IsA("TextLabel") or Object:IsA("TextButton") or Object:IsA("TextBox") then
            if Object.Text == Player.Name or Object.Text == Player.DisplayName or Object.Text == "SuckONETT" then
                Object.Text = Name
            end
        end
    end
    if State then
        ChangeNicknameConnection = Player.PlayerGui.ScreenGui.Alerts.ChildAdded:Connect(function(Object)
            wait(0.05)
            if Object:IsA("TextLabel") or Object:IsA("TextButton") or Object:IsA("TextBox") then
                if Object.Text == Player.Name or Object.Text == Player.DisplayName or Object.Text == "SuckONETT" then
                    Object.Text = Name
                end
                if string.find(Object.Text, Player.Name) or string.find(Object.Text, Player.DisplayName) then
                    Object.Text = "SUCK ONETT"
                end
            end
        end)
    end
    for _, Object in pairs(game.CoreGui:GetDescendants()) do
        if Object:IsA("TextLabel") or Object:IsA("TextButton") or Object:IsA("TextBox") then
            if Object.Text == Player.Name or Object.Text == "@"..Player.Name or Object.Text == Player.DisplayName or Object.Text == "SuckONETT" then
                coroutine.wrap(function()
                    while ChangeNickname do
                        RunService.RenderStepped:Wait()
                        Object.Text = Name
                    end
                end)()
            end
        end
    end
end)

SettingsSector2:Cheat("Button", "Fix Cobalt Guard", function()
    for _, Object in pairs(Character:GetChildren()) do
        if Object.Name == "Cobalt Guard" then
            Object.Handle.TrailWhite.MinLength = 0.2
            Object.Handle.TrailBlue.MinLength = 0.2
        end
    end
end, {text = "Fix"})

SettingsSector2:Cheat("Button", "Destroy UI", function()
    for _, Data in pairs(DeletedObjects) do
        if Data.Type == "Delete" then
            Data.Object.Parent = Data.Parent
        elseif Data.Type == "CanCollide" then
            Data.Object.CanCollide = true
            Data.Object.Transparency = 0
        end
    end
    for _, Object in pairs(game.CoreGui:GetChildren()) do
        if Object.Name == "FinityUI" then
            Object:Destroy()
        end
    end
end, {text = "Destroy"})

-- Stats

Player.PlayerGui.ScreenGui.Alerts.ChildAdded:Connect(function(Object)
    wait(0.03)
    if Object:IsA("TextLabel") or Object:IsA("TextButton") or Object:IsA("TextBox") then
        if string.find(Object.Text, "Defeated") then
            KilledMobs = KilledMobs + 1
        elseif string.find(Object.Text, "Honeystorm") then
            NeedToCollectTickets = true
        elseif string.find(Object.Text, "Ticket") then
            local Amount = tonumber(string.sub(Object.Text, 2, 2)) or 1
            TicketsCollected = TicketsCollected + Amount
        end
    end
end)

-- Main Function

coroutine.wrap(function()
    local CommandoTimer = workspace.MonsterSpawners["Commando Chick"].TimerAttachment.TimerGui.TimerLabel
    local CrabTimer = workspace.MonsterSpawners.CoconutCrab.TimerAttachment.TimerGui.TimerLabel
    local Particles = workspace.Particles
    local StickBugUI = Player.PlayerGui.ScreenGui.ChallengeInfo
    wait(2)
    while _G.UpdateStats do
        wait()
        local Mondo = false
        local Vicious = Particles:FindFirstChild("Vicious")
        if Vicious then
            local _Ray = Ray.new(Vicious.Position + Vector3.new(0, 15, 0), Vector3.new(0, -150, 0))
            local Field = workspace:FindPartOnRayWithWhitelist(_Ray, {FieldZones})
            local Gate = FieldsGates[Field.Name]
            if Field and Gates[Gate] then
                if Gate ~= "0 Bees" then
                    if not Gates[Gate].CanCollide then
                        ViciousNow = Vicious
                    end
                end
            end
        else
            ViciousNow = nil
        end
        local Windy = nil
        for _, Bee in pairs(workspace.NPCBees:GetChildren()) do
            if string.find(Bee.Name, "Windy") then
                Windy = Bee
                break
            end
        end
        if not WindyNow and Windy then
            WindyNow = Windy
        end
        if WindyNow and not Windy then
            WindyNow = nil
        end
        for _, Monster in pairs(workspace.Monsters:GetChildren()) do
            if string.find(Monster.Name, "Mondo Chick") then
                Mondo = true
            end
        end
        if Mondo then
            MondoReady = true
        else
            MondoReady = false
        end

        if not CommandoTimer.Visible then
            CommandoReady = true
        else
            CommandoReady = false
        end

        if not CrabTimer.Visible then
            CrabReady = true
        else
            CrabReady = false
        end

        for _, Monster in pairs(workspace.Monsters:GetChildren()) do
            if string.find(Monster.Name, "Commando Chick") and _G.HuntAnyCommandoChick then
                CommandoReady = true
            end
        end

        for _, Monster in pairs(Monsters:GetChildren()) do
            if string.find(Monster.Name, "Stick Bug") then
                if not StickBugModel then
                    StickBugModel = Monster
                end
            end
        end
        if StickBugModel then
            local Field = GetStickBugField(StickBugModel)
            if Field then
                StickBugField = Field
            end
        end
        local StickBugHealthBar = Particles:FindFirstChild("PollenHealthBar")
        if StickBugHealthBar then
            local _Ray = Ray.new(StickBugHealthBar.Position + Vector3.new(0, 5, 0), Vector3.new(0, -200, 0))
            local Field = workspace:FindPartOnRayWithWhitelist(_Ray, {FieldZones})
            if Field then
                StickBugField = Field
            end
        end

        --// Using Functions

        if not _G.Farming and not _G.CollectLeaves then
            if _G.AutoStickBug and StickBugUI.Visible then
                KillStickBug()
            end
            if not SproutNow and _G.FarmingSprouts then
                local Sprout, Field = CheckForSprout()
                if Sprout and Field then
                    _G.FarmingField = Field.Name
                    Farm({Action = "Start Farm", CollectSprout = true, WithoutFarm = true})
                end
            end
            if NeedToCollectTickets and _G.CollectTickets then
                CollectTickets()
            end
            if ViciousNow and _G.AutoKillVicious and not KillingVicious then
                KillVicious()
            end
            if WindyNow and _G.HuntWindy and not KillingWindy then
                KillWindy()
            end
            if workspace.NPCBees:FindFirstChild("Firefly") and _G.CollectFireflys then
                CollectFireflys()
            end
            if #MeteorsTable >= 1 and _G.CollectMeteor then
                CollectMeteor()
            end
            if _G.HuntMondo and MondoReady then
                KillMondo()
            end
            if #workspace.Happenings.Puffshrooms:GetChildren() >= 1 and _G.AutoPuffshrooms then
                CollectPuffshrooms()
            end
            if _G.HuntCommando and CommandoReady then
                KillCommando()
            end
            if _G.TrainCrab and CrabReady then
                KillCrab()
            end
            if Flowers:FindFirstChild("Sparkles", true) and _G.CollectSparkles then
                CollectSparkles()
            end
            if _G.AutoMobsKill and not KillingMobs then
                MonstersFarm()
            end
            if _G.AutoAnt then
                FarmAnts()
            end
        end
    end
end)()

local FarmingContainer = game:GetService("CoreGui").FinityUI.Container.Categories.Farming.L.Farming.Container
local UILabels = {
    Farming = FarmingContainer["Auto Farm"].Title,
    AutoPuffshrooms = FarmingContainer["Auto Puffshrooms"].Title,
    AutoMobsKill = FarmingContainer["Monster Killer"].Title,
    HuntWindy = FarmingContainer["Hunt Windy"].Title,
    FarmingSprouts = FarmingContainer["Farm Sprouts"].Title,
    AutoKillVicious = FarmingContainer["Hunt Vicious"].Title,
    HuntMondo = FarmingContainer["Hunt Mondo"].Title,
    HuntCommando = FarmingContainer["Hunt Commando"].Title,
    TrainCrab = FarmingContainer["Train Coconut Crab"].Title,
    AutoStickBug = FarmingContainer["Auto Stick Bug"].Title,
    AutoFarmStickBugTotems = FarmingContainer["Auto Stick Bug Totems"].Title,
}

function TurnAllOn()
    for _, Label in pairs(UILabels) do
        Label.Text = Label.Parent.Name
        Label.TextColor3 = Color3.fromRGB(206, 206, 206)
    end
end

function TurnOff(Functions)
    for Name, Label in pairs(UILabels) do
        if table.find(Functions, Name) or table.find(Functions, Label.Parent.Name) then
            Label.Text = Label.Parent.Name..": WORKING"
            Label.TextColor3 = Color3.fromRGB(132,255,130)
        elseif _G[Name] then
            Label.Text = Label.Parent.Name..": PAUSED"
            Label.TextColor3 = Color3.fromRGB(255, 35, 0)
        else
            Label.Text = Label.Parent.Name
            Label.TextColor3 = Color3.fromRGB(206, 206, 206)
        end
    end
end

-- Remove Decors

for _, Object in pairs(workspace.FieldDecos:GetDescendants()) do
    if Object:IsA("BasePart") or Object:IsA("MeshPart") then
        Object.CanCollide = false
        Object.Transparency = 0.5
        DeletedObjects[#DeletedObjects + 1] = {Type = "CanCollide", Object = Object}
    end
end

for _, Model in pairs(workspace.Decorations.Misc:GetChildren()) do
    if Model.Name == "Mushroom" and Model:IsA("Model") then
        for _, Object in pairs(Model:GetChildren()) do
            if Object:IsA("BasePart") or Object:IsA("MeshPart") then
                Object.CanCollide = false
                Object.Transparency = 0.5
                DeletedObjects[#DeletedObjects + 1] = {Type = "CanCollide", Object = Object}
            end
        end
    end
end

for _, Object in pairs(workspace.Decorations.JumpGames.Mushroom:GetChildren()) do
    DeletedObjects[#DeletedObjects + 1] = {Type = "Delete", Object = Object, Parent = Object.Parent}
    Object.Parent = game.ReplicatedStorage
end

-- Delete tokens

for _, Token in pairs(game.workspace.Collectibles:GetChildren()) do
    Token:Destroy()
end 

-- Memory Match

game:GetService("RunService").Heartbeat:Connect(function()
    for _, ListObject in pairs(game.Players.LocalPlayer.PlayerGui.ScreenGui:WaitForChild("MinigameLayer"):GetChildren()) do
        for _, Object in pairs(ListObject:WaitForChild("GuiGrid"):GetDescendants()) do
            if Object.Name == "ObjContent" or Object.Name == "ObjImage" then
                Object.Visible = true
            end
        end
    end
end)

-- New character setting (when player died)
Player.CharacterAdded:Connect(function(NewCharacter)
    Character = NewCharacter
    HumRoot = NewCharacter:WaitForChild("HumanoidRootPart")
    Humanoid = NewCharacter:WaitForChild("Humanoid")
    PollenBar = Player.PlayerGui.ScreenGui.MeterHUD.PollenMeter.Bar.FillBar
end)

-- Anti AFK
local VirtualUser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

-- Claim hives
local ClaimId = 7
for Id = 1, 6 do
    ClaimId -= 1
    game:GetService("ReplicatedStorage").Events.ClaimHive:FireServer(ClaimId)
end

print("Retarded Completed!")