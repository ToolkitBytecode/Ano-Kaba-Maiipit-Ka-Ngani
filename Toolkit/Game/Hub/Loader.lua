local Config = {
    Discord = "https://discord.gg/vcpQ4Myyw",
    Webhook = "https://discord.com/api/webhooks/1567569810873786492/rZYwT1GZnzHd1hWpaW8SSKS_HHPTHfpOJYd2ltFzTKQft1F6zBqazbYZOficeKnkndGS",
    Name = "ToolkitLoader",
    Tagline = "Access Beyond Ordinary",
    Version = "v2.7",
    ToggleKey = Enum.KeyCode.RightShift,
    ShowIntro = true,
    RequestCooldown = 3600,
    IntroDelayMin = 0.8,
    IntroDelayMax = 1.4,
    LoadTimeout = 8,
    IntroWatchdog = 7,
    Status = true,
    UseGradients = false,
    Contours = true,
    AnimateContours = true,
    OwnerMessage = "Please wait while I fix and update the issue. For the meantime, please join our Discord below.",
}

local Games = {
    {
        Name = "Karinderya",
        PlaceId = 116497287371701,
        Premium = "https://api.jnkie.com/api/v1/luascripts/public/51f8541bf425b9feb765caaa9364b1a2d250436a35732a2f10c30153888ca976/download",
        Freemium = "https://api.jnkie.com/api/v1/luascripts/public/51f8541bf425b9feb765caaa9364b1a2d250436a35732a2f10c30153888ca976/download",
        Changelogs = {
            { Version = "Major Update", Changes = {
                "Fixed Auto Wash and Auto Pan.",
                "Added Workers System and Auto Wake Workers and Roll Cost display.",
                "Added Auto Hire Selected Rarity Workers.",
                "Added Mayor's Permit automation.",
                "Added Piso Event automation.",
                "Added Event Status and Auto Codes.",
                "Added Appliance Upgrades.",
                "And more fixes and improvements!",
            } },
            { Version = "v1.1.0", Changes = { "Improved script stability.", "Minor interface fixes." } },
            { Version = "v1.0.0", Changes = { "Initial release." } },
        },
    },
    {
        Name = "Run a Sari Sari Store",
        PlaceId = 104178853788462,
        Premium = "https://api.jnkie.com/api/v1/luascripts/public/7f511b650d4aa36024470a6f64e9d4848b18db531585cadbaea6878a94047ee4/download",
        Freemium = "https://api.jnkie.com/api/v1/luascripts/public/7f511b650d4aa36024470a6f64e9d4848b18db531585cadbaea6878a94047ee4/download",
        Changelogs = {
            { Version = "Major Update", Changes = {
                "Fixed Auto Exchange.",
                "Improved Auto-Restock.",
                "Added Prioritize High Value Products.",
                "Added Smart Fill Blank Shelves.",
                "Added Auto Buy Low Stock and Selected Items.",
                "Added Auto-Reject Utang and Auto Donate Beggar.",
                "Improved Thief Defense and Auto Awake Staff.",
                "Improved delivery and restocking.",
                "And more fixes and improvements!",
            } },
            { Version = "v1.1.0", Changes = { "Improved script stability.", "Minor interface fixes." } },
            { Version = "v1.0.0", Changes = { "Initial release." } },
        },
    },
    {
        Indev = true,
        Name = "Merkado",
        PlaceId = 89720771756768,
        Premium = "https://api.jnkie.com/api/v1/luascripts/public/6365bb4f49aabfb9900065b1722df3d5f7883310d185cb21502e64961eac39e3/download",
        Freemium = "https://api.jnkie.com/api/v1/luascripts/public/6365bb4f49aabfb9900065b1722df3d5f7883310d185cb21502e64961eac39e3/download",
        Changelogs = {
            { Version = "Preview", Changes = { "In development. No public release yet." } },
        },
    },
    {
        Indev = true,
        Name = "Bahay Kubo Garden",
        PlaceId = 81403703556465,
        Premium = "",
        Freemium = "",
        Changelogs = {
            { Version = "Preview", Changes = { "In development. No public release yet." } },
        },
    },
    {
        Name = "Paupahan",
        PlaceId = 95042285620072,
        Premium = "https://api.jnkie.com/api/v1/luascripts/public/b88788d1816504f04daa1caecde7088038a6d20f893ce93271e184e958d75b30/download",
        Freemium = "https://api.jnkie.com/api/v1/luascripts/public/b88788d1816504f04daa1caecde7088038a6d20f893ce93271e184e958d75b30/download",
        Changelogs = {
            { Version = "v1.1.0", Changes = { "Improved script stability.", "Minor interface fixes." } },
            { Version = "v1.0.0", Changes = { "Initial release." } },
        },
    },
    {
        Name = "Pa Deliver",
        PlaceId = 115305706413475,
        Premium = "https://api.jnkie.com/api/v1/luascripts/public/7cda51cc9ba55ad81b726b00e10905d3c7f8a5f3551825a26c8279062a65c7d4/download",
        Freemium = "https://api.jnkie.com/api/v1/luascripts/public/7cda51cc9ba55ad81b726b00e10905d3c7f8a5f3551825a26c8279062a65c7d4/download",
        Changelogs = {
            { Version = "v1.1.0", Changes = { "Improved script stability.", "Minor interface fixes." } },
            { Version = "v1.0.0", Changes = { "Initial release." } },
        },
    },
    {
        Name = "Huss Valley",
        PlaceId = 107535308163741,
        Premium = "https://api.jnkie.com/api/v1/luascripts/public/0858084d4c5d970e0404f4c685044676f4129d385ae4e44f47d77f0c2f734429/download",
        Freemium = "https://api.jnkie.com/api/v1/luascripts/public/0858084d4c5d970e0404f4c685044676f4129d385ae4e44f47d77f0c2f734429/download",
        Changelogs = {
            { Version = "v1.1.0", Changes = { "Improved script stability.", "Minor interface fixes." } },
            { Version = "v1.0.0", Changes = { "Initial release." } },
        },
    },
}

for _, G in ipairs(Games) do
    G.PlaceId = tonumber(G.PlaceId) or 0
end

local function IsDev(Game)
    return Game.Indev == true
end

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = Players.LocalPlayer

local White = Color3.new(1, 1, 1)

local Palettes = {
    Dark = {
        Bg = Color3.fromRGB(0, 0, 0),
        Bg2 = Color3.fromRGB(0, 0, 0),
        Surface = Color3.fromRGB(12, 12, 18),
        SurfaceHi = Color3.fromRGB(26, 26, 40),
        Border = Color3.fromRGB(112, 120, 175),
        StrokeAlpha = 0.25,
        Line = Color3.fromRGB(150, 155, 178),
        LineAlpha = 0.55,
        Text = Color3.fromRGB(255, 255, 255),
        Muted = Color3.fromRGB(176, 182, 212),
        AccentA = Color3.fromRGB(157, 78, 255),
        AccentB = Color3.fromRGB(0, 229, 255),
        GlowAlpha = 0.6,
        OrbAlpha = 0.6,
        Good = Color3.fromRGB(0, 255, 136),
        Bad = Color3.fromRGB(255, 64, 87),
        Warn = Color3.fromRGB(255, 200, 0),
        Info = Color3.fromRGB(0, 229, 255),
        Hot = Color3.fromRGB(255, 46, 166),
    },
}

local T = {}
do
    for Key, Value in pairs(Palettes.Dark) do
        T[Key] = Value
    end
end

local BASE_W, BASE_H = 460, 500
local MAIN_RADIUS = 16
local ANIM_STEP = 1 / 30

local QuartOut = Enum.EasingStyle.Quart
local DirOut = Enum.EasingDirection.Out

local function New(Class, Props, Parent)
    local Object = Instance.new(Class)
    for Key, Value in pairs(Props or {}) do
        Object[Key] = Value
    end
    Object.Parent = Parent
    return Object
end

local function Tween(Object, Time, Props, Style, Direction)
    local Tw = TweenService:Create(
        Object,
        TweenInfo.new(Time, Style or QuartOut, Direction or DirOut),
        Props
    )
    Tw:Play()
    return Tw
end

local function Corner(Parent, Radius)
    return New("UICorner", { CornerRadius = UDim.new(0, Radius or 10) }, Parent)
end

local function Pad(Parent, L, Tp, R, B)
    return New("UIPadding", {
        PaddingLeft = UDim.new(0, L),
        PaddingTop = UDim.new(0, Tp),
        PaddingRight = UDim.new(0, R),
        PaddingBottom = UDim.new(0, B),
    }, Parent)
end

local function Pulse(Object, Prop, A, B, Time)
    Object[Prop] = A
    TweenService:Create(
        Object,
        TweenInfo.new(Time or 1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
        { [Prop] = B }
    ):Play()
end

local function IdStr(Number)
    return string.format("%.0f", Number)
end

local function Commify(Number)
    local S = tostring(math.floor(Number + 0.5))
    local Out = S:reverse():gsub("(%d%d%d)", "%1,"):reverse()
    return (Out:gsub("^,", ""))
end

local function Short(Number)
    if Number >= 1e9 then
        return string.format("%.1fB", Number / 1e9)
    elseif Number >= 1e6 then
        return string.format("%.1fM", Number / 1e6)
    elseif Number >= 1e3 then
        return string.format("%.1fK", Number / 1e3)
    end
    return tostring(Number)
end

local function Esc(Text)
    return (Text:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"))
end

local function Hl(Text)
    return '<font color="#' .. T.Text:ToHex() .. '"><b>' .. Text .. "</b></font>"
end

local function Tint(Key, Text)
    return '<font color="#' .. T[Key]:ToHex() .. '">' .. Text .. "</font>"
end

local function LiveText(Playing, Visits)
    local Out = Hl(Commify(Playing)) .. " playing"
    if Visits then
        Out ..= "  •  " .. Short(Visits) .. " visits"
    end
    return Out
end

local function CopyText(Text)
    local Fn = setclipboard or toclipboard or (syn and syn.write_clipboard)
    if not Fn then
        return false
    end
    return (pcall(Fn, Text))
end

local function HttpGet(Url)
    local Ok, Res = pcall(function()
        return game:HttpGet(Url)
    end)
    if Ok and type(Res) == "string" and Res ~= "" then
        return Res
    end

    local Req = (syn and syn.request) or request or http_request or (http and http.request)
    if Req then
        local Ok2, R = pcall(Req, { Url = Url, Method = "GET" })
        if Ok2 and type(R) == "table" and type(R.Body) == "string" and R.Body ~= ""
            and (R.StatusCode == nil or R.StatusCode == 200) then
            return R.Body
        end
    end
    return nil
end

local function GetJSON(Url)
    local Body = HttpGet(Url)
    if not Body then
        return nil
    end
    local Ok, Data = pcall(function()
        return HttpService:JSONDecode(Body)
    end)
    return Ok and Data or nil
end

local Hosts = { "roblox.com", "roproxy.com" }

local function ResolveUniverse(PlaceId)
    if PlaceId == game.PlaceId and game.GameId ~= 0 then
        return game.GameId
    end
    for _, Host in ipairs(Hosts) do
        local Data = GetJSON("https://apis." .. Host .. "/universes/v1/places/" .. IdStr(PlaceId) .. "/universe")
        if Data and Data.universeId then
            return Data.universeId
        end
    end
    return nil
end

local function FetchGameInfo(UniverseId)
    for _, Host in ipairs(Hosts) do
        local Data = GetJSON("https://games." .. Host .. "/v1/games?universeIds=" .. IdStr(UniverseId))
        local Item = Data and Data.data and Data.data[1]
        if Item and Item.playing ~= nil then
            return Item
        end
    end
    return nil
end

pcall(function()
    local Containers = { CoreGui }
    local PG = LocalPlayer:FindFirstChildOfClass("PlayerGui")
    if PG then
        table.insert(Containers, PG)
    end
    if gethui then
        local Ok, H = pcall(gethui)
        if Ok and H then
            table.insert(Containers, H)
        end
    end
    for _, C in ipairs(Containers) do
        for _, N in ipairs({ Config.Name, "KnorkzNexus", "PremiumScriptLoader" }) do
            local Old = C:FindFirstChild(N)
            if Old then
                Old:Destroy()
            end
        end
    end
end)

local ScreenGui = New("ScreenGui", {
    Name = Config.Name,
    ResetOnSpawn = false,
    IgnoreGuiInset = true,
    DisplayOrder = 2147483647,
    OnTopOfCoreBlur = true,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
})

do
    local Ok = pcall(function()
        if gethui then
            ScreenGui.Parent = gethui()
        else
            ScreenGui.Parent = CoreGui
        end
    end)
    if not Ok or not ScreenGui.Parent then
        ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui", 10)
    end
end

local Bound = {}
local Hooks = {}

local function Resolve(Src)
    if type(Src) == "function" then
        return Src()
    end
    return T[Src]
end

local function Bind(Object, Prop, Src)
    local function Apply(Animate)
        local Value = Resolve(Src)
        if Animate and (typeof(Value) == "Color3" or type(Value) == "number") then
            Tween(Object, 0.25, { [Prop] = Value }, Enum.EasingStyle.Sine)
        else
            Object[Prop] = Value
        end
    end
    Apply(false)
    Bound[#Bound + 1] = { Obj = Object, Fn = Apply }
    return Apply
end

local function BindGrad(Grad, A, B, C)
    local Parent = Grad.Parent
    local function Apply()
        if Config.UseGradients then
            Grad.Enabled = true
            if C then
                Grad.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Resolve(A)),
                    ColorSequenceKeypoint.new(0.5, Resolve(B)),
                    ColorSequenceKeypoint.new(1, Resolve(C)),
                })
            else
                Grad.Color = ColorSequence.new(Resolve(A), Resolve(B))
            end
            return
        end

        Grad.Enabled = false
        if not Parent then
            return
        end
        local Col = Resolve(A):Lerp(Resolve(B), 0.5)
        if Parent:IsA("UIStroke") then
            Parent.Color = Col
        elseif (Parent:IsA("TextLabel") or Parent:IsA("TextButton")) and Parent.BackgroundTransparency >= 1 then
            Parent.TextColor3 = Col
        elseif Parent:IsA("GuiObject") then
            Parent.BackgroundColor3 = Col
        end
    end
    Apply()
    Bound[#Bound + 1] = { Obj = Grad, Fn = Apply }
end

local function Stroke(Parent, Strong, Thickness)
    local S = New("UIStroke", {
        Color = White,
        Thickness = Thickness or (Strong and 1.5 or 1.2),
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    }, Parent)
    Bind(S, "Color", "Border")
    Bind(S, "Transparency", function()
        return Strong and 0.08 or T.StrokeAlpha
    end)
    return S
end

local function GradStroke(Parent, Thickness, Alpha, Rotation)
    local S = New("UIStroke", {
        Color = White,
        Thickness = Thickness or 1.2,
        Transparency = Alpha or 0.15,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    }, Parent)
    local G = New("UIGradient", { Rotation = Rotation or 45 }, S)
    BindGrad(G, "AccentA", "AccentB")
    return S, G
end

local function Surface(Object, Radius, Strong, NoStroke)
    Object.BackgroundColor3 = White
    Object.BorderSizePixel = 0
    Corner(Object, Radius)
    local G = New("UIGradient", { Rotation = 90 }, Object)
    BindGrad(G, "SurfaceHi", "Surface")
    local S = nil
    if not NoStroke then
        S = Stroke(Object, Strong)
    end
    return G, S
end

local function Label(Props, Parent, Key)
    if Props.BackgroundTransparency == nil then
        Props.BackgroundTransparency = 1
    end
    local L = New("TextLabel", Props, Parent)
    Bind(L, "TextColor3", Key or "Text")
    return L
end

local Destroyed, Busy = false, false
local Started = false
local SelectedGame, PendingAction, PendingURL
local DiscordBusy = false
local NotifiedUnsupported = false
local ModalToken = 0
local Connections = {}
local Entries = {}
local AllCards = {}
local UnsupportedUI
local UpdateSupportState

local Clock = 0
local Timers = {}

local function After(Delay, Fn)
    Timers[#Timers + 1] = { At = Clock + Delay, Fn = Fn }
end

local function Defer(Fn)
    RunService.Heartbeat:Once(function()
        Fn()
    end)
end

local function Connect(Signal, Fn)
    local C = Signal:Connect(Fn)
    table.insert(Connections, C)
    return C
end

local function ComputeScale()
    local Camera = workspace.CurrentCamera
    local V = Camera and Camera.ViewportSize or Vector2.new(1280, 720)
    return math.clamp(math.min((V.X - 24) / BASE_W, (V.Y - 24) / BASE_H), 0.5, 1.1)
end

local TargetScale = ComputeScale()

local Root = New("Frame", {
    Name = "Root",
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.fromOffset(BASE_W, BASE_H),
    BackgroundTransparency = 1,
    Visible = false,
}, ScreenGui)

local RootScale = New("UIScale", { Scale = TargetScale * 0.85 }, Root)

local GlowImage = New("ImageLabel", {
    Name = "Glow",
    BackgroundTransparency = 1,
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.new(1, 70, 1, 70),
    Image = "rbxassetid://6014261993",
    ScaleType = Enum.ScaleType.Slice,
    SliceCenter = Rect.new(49, 49, 450, 450),
    ZIndex = 1,
}, Root)
Bind(GlowImage, "ImageColor3", "AccentB")
Bind(GlowImage, "ImageTransparency", "GlowAlpha")

local MainFrame = New("Frame", {
    Name = "MainFrame",
    Size = UDim2.fromScale(1, 1),
    BackgroundColor3 = T.Bg,
    BackgroundTransparency = 0,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    ZIndex = 2,
}, Root)
Corner(MainFrame, MAIN_RADIUS)
BindGrad(New("UIGradient", { Rotation = 135 }, MainFrame), "Bg", "Bg2")

local BorderStroke = New("UIStroke", {
    Color = White,
    Thickness = 1.5,
    Transparency = 0.05,
    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
}, MainFrame)
local BorderGrad = New("UIGradient", {}, BorderStroke)
BindGrad(BorderGrad, "AccentA", "AccentB", "AccentA")

local Background = New("Frame", {
    Name = "Background",
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    ZIndex = 1,
}, MainFrame)
Corner(Background, MAIN_RADIUS)

local ContourSegs = {
    -10,34,16,-47.7,-1,21,19,-62.3,7,2,24,-72.8,-14,104,19,-8.9,4,98,20,-26.5,18,87,19,-48.4,
    26,75,14,-68.0,30,62,15,-81.1,33,-2,116,-88.1,560,517,12,105.8,559,537,31,90.9,557,560,17,98.0,
    545,598,64,111.2,-6,148,25,-12.9,13,141,19,-28.4,29,131,21,-37.2,44,118,21,-45.0,55,104,17,-55.6,
    62,91,16,-69.3,66,76,17,-84.9,60,34,69,-100.5,53,-30,62,-91.3,564,475,53,-171.2,532,471,12,171.9,
    524,475,10,140.2,519,481,7,106.1,519,488,10,85.1,527,515,48,69.9,537,550,26,82.0,537,572,22,98.3,
    528,607,52,107.4,217,548,19,-19.3,230,540,15,-51.8,233,527,15,-95.1,228,513,19,-126.1,215,501,20,-147.8,
    197,494,20,-167.8,179,493,19,170.6,163,499,17,146.0,154,508,12,122.0,150,518,11,99.4,150,528,10,75.9,
    155,536,11,52.7,162,543,12,32.9,173,548,14,18.4,186,551,16,7.0,201,551,16,-3.4,-7,225,14,-50.7,
    10,200,48,-57.9,48,153,76,-46.5,81,115,27,-56.9,91,94,21,-73.9,94,75,21,-88.8,92,56,19,-100.1,
    83,20,57,-105.3,556,450,55,-158.9,523,438,18,-166.2,510,436,11,179.9,500,438,11,164.3,491,442,10,146.4,
    485,448,10,127.8,481,458,16,104.1,480,473,17,79.4,485,488,17,63.9,501,514,48,57.1,518,547,29,72.1,
    522,571,23,91.5,516,606,51,103.7,222,574,20,-7.9,238,570,17,-16.4,252,565,15,-28.3,262,557,13,-45.2,
    269,548,12,-66.5,271,537,13,-88.4,269,524,15,-106.7,263,511,17,-120.6,253,498,18,-132.0,241,486,19,-142.3,
    226,477,19,-152.6,210,470,19,-162.8,192,466,18,-173.2,176,466,17,175.7,160,469,17,163.5,146,475,16,150.1,
    133,486,22,132.9,122,504,23,111.8,117,525,23,91.0,121,545,21,67.2,131,559,17,41.1,146,568,20,20.8,
    168,573,28,7.8,197,575,32,-0.5,-10,281,15,-21.2,2,274,16,-37.4,15,259,25,-54.7,31,228,48,-66.7,
    46,196,23,-60.8,58,178,23,-51.5,81,154,46,-45.5,102,128,24,-56.9,112,108,25,-71.9,117,82,28,-85.1,
    118,56,26,-94.3,112,15,60,-99.1,553,427,63,-150.9,516,409,23,-163.8,497,407,17,175.8,482,410,17,159.8,
    467,417,18,145.6,455,428,17,129.6,448,439,12,112.6,446,449,11,97.2,447,465,24,77.3,456,486,24,59.5,
    479,517,55,50.9,501,550,27,66.6,507,574,24,87.5,503,608,49,100.5,209,594,57,-5.1,248,589,22,-13.5,
    266,583,18,-22.2,280,575,17,-34.1,291,565,15,-50.1,298,554,14,-68.1,301,541,15,-85.4,300,525,20,-101.4,
    294,507,21,-114.6,284,490,21,-126.3,271,476,20,-138.4,254,464,24,-149.8,232,453,27,-159.0,208,446,26,-167.2,
    185,442,23,-177.1,164,443,20,171.5,146,448,19,159.7,130,456,19,148.0,116,467,20,135.1,106,481,18,121.5,
    98,496,19,109.1,94,515,21,98.9,92,536,23,90.9,94,562,31,80.1,99,580,10,61.5,105,587,10,41.2,
    113,592,12,20.2,125,595,15,8.2,157,596,51,0.2,-3,320,22,-31.2,14,306,25,-47.4,29,286,28,-59.2,
    47,249,57,-66.2,64,214,23,-60.2,77,196,24,-49.2,101,172,46,-39.8,125,150,22,-55.5,135,125,34,-74.6,
    143,75,70,-84.1,150,31,22,-71.5,160,14,20,-46.7,184,-2,40,-26.2,353,89,15,-26.0,362,81,12,-63.4,
    363,70,14,-104.4,355,58,17,-135.1,340,48,23,-155.3,318,41,26,-168.3,298,39,18,177.8,284,43,14,148.9,
    277,50,8,105.6,278,57,10,73.9,282,66,11,53.0,290,74,14,39.2,308,84,31,24.6,328,92,14,10.1,
    341,92,13,-3.3,571,146,24,145.6,552,161,26,137.7,536,178,21,130.2,525,193,20,120.6,518,209,18,108.4,
    514,226,19,95.6,515,248,26,83.7,519,276,34,77.3,526,300,18,68.8,533,313,13,51.1,541,319,10,24.8,
    550,322,10,3.8,575,318,44,-9.5,566,412,25,-140.6,543,390,42,-132.4,522,371,17,-151.4,510,367,12,-179.1,
    497,369,16,166.4,458,384,70,156.1,415,401,26,168.1,394,402,20,-168.1,362,389,52,-155.8,315,370,52,-160.1,
    286,358,13,-144.5,278,349,14,-123.2,262,310,73,-109.5,244,262,31,-115.4,230,241,21,-134.2,219,233,10,-160.2,
    211,232,9,175.1,205,234,8,148.2,200,238,8,126.4,195,252,23,105.3,191,280,36,92.6,193,311,30,81.3,
    198,333,19,65.8,207,347,17,48.8,218,356,15,32.8,237,366,30,23.6,254,375,11,39.4,260,384,14,68.4,
    261,397,16,99.7,256,408,11,133.2,248,414,13,162.9,214,414,56,-176.9,172,415,33,172.0,140,423,35,158.0,
    112,439,33,144.4,92,456,22,129.7,81,474,22,114.6,75,492,21,102.7,69,526,50,97.4,63,560,22,107.8,
    55,578,20,125.7,35,597,38,139.4,276,599,26,-19.8,297,590,21,-30.0,312,578,20,-44.2,323,564,19,-59.7,
    330,549,18,-72.7,336,524,37,-80.5,342,499,16,-66.4,348,488,11,-47.0,356,482,13,-32.1,367,477,14,-20.0,
    378,474,12,-7.3,392,475,17,12.1,407,481,20,32.7,441,509,70,41.2,476,543,30,51.0,488,562,17,68.3,
    492,577,17,83.4,489,620,72,95.7,532,142,84,146.1,486,177,35,135.3,459,212,57,121.9,439,249,29,113.5,
    432,273,25,94.8,435,306,44,78.1,439,332,12,104.5,434,342,13,127.9,422,350,20,151.5,404,356,21,173.1,
    382,355,27,-170.9,354,348,32,-160.7,332,339,20,-151.8,317,329,17,-142.1,306,319,17,-131.2,296,306,19,-120.0,
    287,282,35,-106.7,280,238,58,-95.6,272,199,23,-113.8,264,185,13,-133.7,255,177,15,-145.5,223,161,59,-154.9,
    190,142,21,-135.9,180,130,13,-114.0,176,117,15,-100.6,176,94,32,-86.2,179,73,13,-70.8,184,63,12,-54.8,
    191,57,10,-30.5,200,54,10,0.4,210,58,14,32.7,229,77,43,47.2,255,100,29,34.6,286,117,45,24.6,
    314,128,19,13.4,332,131,18,3.7,356,129,33,-8.8,382,121,26,-27.2,397,111,12,-47.6,403,102,11,-63.8,
    406,92,12,-79.7,406,81,13,-94.8,404,69,14,-108.3,399,58,14,-120.7,391,47,15,-132.7,381,38,15,-143.9,
    364,29,26,-156.0,322,14,65,-163.2,280,-1,26,-151.0,-3,438,18,-42.4,7,425,19,-62.3,19,392,52,-73.5,
    40,328,85,-70.5,65,265,55,-65.7,82,232,22,-51.7,96,219,19,-33.2,112,213,17,-7.8,127,215,17,23.9,
    138,222,13,48.1,145,233,15,61.2,154,256,37,74.1,160,300,56,86.5,161,338,21,93.4,159,355,16,103.0,
    154,368,14,118.4,146,378,16,134.7,106,405,83,147.9,66,432,17,141.1,55,442,14,129.2,48,456,20,107.2,
    46,494,58,88.9,44,536,31,100.2,36,562,25,118.4,9,597,66,129.8,310,607,30,-27.4,333,590,30,-41.6,
    360,559,55,-53.2,382,534,15,-32.3,395,529,15,-10.6,411,529,19,9.6,430,535,24,24.5,450,546,22,36.5,
    464,560,19,51.6,472,573,14,67.9,475,586,16,81.8,475,624,62,92.9,567,84,64,145.4,528,109,31,151.3,
    501,120,30,163.3,481,125,13,176.3,470,124,11,-169.6,462,122,8,-150.0,456,116,10,-128.5,444,88,56,-111.1,
    429,54,19,-121.0,419,40,20,-130.1,406,27,20,-140.5,390,16,20,-151.2,352,3,64,-163.3,358,310,14,-176.9,
    344,306,17,-156.1,332,298,16,-137.4,322,287,16,-120.3,316,272,17,-104.9,314,256,18,-92.5,315,238,22,-83.1,
    319,216,24,-76.4,327,194,25,-63.7,340,178,23,-37.3,365,166,35,-16.0,390,161,18,-4.7,404,161,13,7.1,
    414,164,10,29.4,419,170,10,62.4,422,180,13,88.7,420,193,16,102.8,408,226,58,112.9,389,274,47,108.3,
    378,301,14,128.5,369,308,12,157.6,94,354,12,-174.1,85,350,12,-134.9,79,339,16,-106.5,77,322,20,-90.2,
    79,303,22,-77.9,85,284,20,-65.4,94,271,16,-47.3,104,264,13,-15.1,115,265,12,26.5,123,272,15,55.8,
    129,286,18,74.8,132,303,19,89.3,130,320,18,102.9,124,334,16,118.3,116,346,15,136.4,106,353,13,157.2,
    -11,498,22,13.1,3,503,10,32.3,9,508,10,49.0,15,521,20,72.3,18,538,17,94.7,14,554,18,111.0,
    -14,596,85,125.6,367,595,60,-41.4,396,572,16,-28.6,409,567,15,-10.1,422,567,13,8.5,433,570,12,24.6,
    442,576,13,40.8,450,584,12,57.5,455,600,24,76.8,
}

local CONTOUR_M = 48
local ContourLayer
if Config.Contours then
    ContourLayer = New("Frame", {
        Name = "Contours",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromOffset(BASE_W / 2, BASE_H / 2),
        Size = UDim2.fromOffset(BASE_W + CONTOUR_M * 2, BASE_H + CONTOUR_M * 2),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 1,
    }, Background)
    for I = 1, #ContourSegs, 4 do
        New("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromOffset(ContourSegs[I], ContourSegs[I + 1]),
            Size = UDim2.fromOffset(ContourSegs[I + 2], 1),
            Rotation = ContourSegs[I + 3],
            BackgroundColor3 = T.Line,
            BackgroundTransparency = T.LineAlpha,
            BorderSizePixel = 0,
            ZIndex = 1,
        }, ContourLayer)
    end
end

local function StepContours(Time)
    if not ContourLayer or not Config.AnimateContours then return end
    ContourLayer.Position = UDim2.fromOffset(
        BASE_W / 2 + math.sin(Time * 0.33) * 22,
        BASE_H / 2 + math.cos(Time * 0.25) * 20
    )
    ContourLayer.Rotation = math.sin(Time * 0.11) * 2
end

local function OrbMoving(Parent, Cfg)
    local Size = Cfg.Size
    local Start = UDim2.fromScale(Cfg.X, Cfg.Y)

    local Halo = New("ImageLabel", {
        Name = "OrbHalo",
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = Start,
        Size = UDim2.fromOffset(Size * 2, Size * 2),
        Image = "rbxassetid://6014261993",
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(49, 49, 450, 450),
        ZIndex = 1,
    }, Parent)
    Bind(Halo, "ImageColor3", Cfg.Col or "AccentB")
    Bind(Halo, "ImageTransparency", function()
        return math.clamp(T.OrbAlpha + 0.1, 0, 1)
    end)

    local Core = New("Frame", {
        Name = "OrbMoving",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = Start,
        Size = UDim2.fromOffset(Size, Size),
        BackgroundColor3 = White,
        BorderSizePixel = 0,
        ZIndex = 1,
    }, Parent)
    Bind(Core, "BackgroundTransparency", "OrbAlpha")
    Corner(Core, math.floor(Size * 0.3))

    local Grad = New("UIGradient", { Rotation = 45 }, Core)
    BindGrad(Grad, Cfg.Col or "AccentA", Cfg.Col or "AccentB")

    New("UIStroke", {
        Color = White,
        Thickness = 1,
        Transparency = 0.75,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    }, Core)

    return {
        Halo = Halo,
        Core = Core,
        Grad = Grad,
        X = Cfg.X,
        Y = Cfg.Y,
        AX = Cfg.AX or 0.06,
        AY = Cfg.AY or 0.05,
        FX = Cfg.FX or 0.5,
        FY = Cfg.FY or 0.4,
        Phase = Cfg.Phase or 0,
        Speed = Cfg.Speed or 60,
    }
end

local function StepOrbs(List, Time)
    for _, O in ipairs(List) do
        local Pos = UDim2.fromScale(
            O.X + math.sin(Time * O.FX + O.Phase) * O.AX,
            O.Y + math.cos(Time * O.FY + O.Phase) * O.AY
        )
        O.Core.Position = Pos
        O.Halo.Position = Pos
    end
end

local function SpinOrbs(List, Time)
    for _, O in ipairs(List) do
        O.Grad.Rotation = (Time * O.Speed + O.Phase * 57.3) % 360
    end
end

local Orbs = {
    OrbMoving(Background, { Col = "AccentA", X = 0.1, Y = 0.12, Size = 150, AX = 0.07, AY = 0.06, FX = 0.5, FY = 0.4, Phase = 0 }),
    OrbMoving(Background, { Col = "AccentB", X = 0.94, Y = 0.5, Size = 120, AX = 0.05, AY = 0.08, FX = 0.38, FY = 0.46, Phase = 2.1 }),
    OrbMoving(Background, { Col = "Hot", X = 0.2, Y = 0.94, Size = 140, AX = 0.07, AY = 0.05, FX = 0.45, FY = 0.35, Phase = 4.2 }),
}

local Rng = Random.new()

local function MakeParticles(Parent, Count)
    local List = {}
    for I = 1, Count do
        local S = Rng:NextInteger(2, 3)
        local X, Y = Rng:NextNumber(), Rng:NextNumber()
        local P = New("Frame", {
            Size = UDim2.fromOffset(S, S),
            Position = UDim2.fromScale(X, Y),
            BackgroundTransparency = Rng:NextNumber(0.6, 0.9),
            BorderSizePixel = 0,
            ZIndex = 1,
        }, Parent)
        Bind(P, "BackgroundColor3", (I % 2 == 0) and "AccentA" or "AccentB")
        Corner(P, 2)
        List[I] = {
            Obj = P,
            X = X,
            Y = Y,
            Speed = Rng:NextNumber(0.01, 0.03),
            Drift = Rng:NextNumber(0, 6.28),
        }
    end
    return List
end

local Particles = MakeParticles(Background, 14)

local BTN_FILL = Color3.fromRGB(0, 0, 0)
local BTN_FILL_HOVER = Color3.fromRGB(22, 22, 34)

local function GradButton(Parent, Text, Size, Position, TextSize, StrokeKey)
    local Key = StrokeKey or "AccentA"
    local HoverKey = StrokeKey and "Warn" or "AccentB"
    local Holder = New("Frame", {
        Size = Size,
        Position = Position,
        BackgroundColor3 = BTN_FILL,
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
    }, Parent)
    Corner(Holder, 10)

    local S = New("UIStroke", {
        Thickness = 1.6,
        Transparency = 0,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    }, Holder)
    Bind(S, "Color", Key)

    local Button = New("TextButton", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        AutoButtonColor = false,
        Text = Text,
        TextSize = TextSize or 12,
        TextColor3 = White,
        Font = Enum.Font.GothamBold,
    }, Holder)

    local function Rest()
        Tween(Holder, 0.15, { BackgroundColor3 = BTN_FILL })
        Tween(S, 0.15, { Color = T[Key] })
    end
    Button.MouseEnter:Connect(function()
        Tween(Holder, 0.15, { BackgroundColor3 = BTN_FILL_HOVER })
        Tween(S, 0.15, { Color = T[HoverKey] })
    end)
    Button.MouseLeave:Connect(Rest)
    Button.MouseButton1Down:Connect(function()
        Tween(Holder, 0.08, { BackgroundColor3 = Color3.new(0, 0, 0) })
        Tween(S, 0.08, { Color = White })
    end)
    Button.MouseButton1Up:Connect(Rest)

    return Button, Holder
end

local function IconButton(Parent, Text, Position, HoverKey)
    local B = New("TextButton", {
        Size = UDim2.fromOffset(28, 28),
        Position = Position,
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Text = Text,
        TextSize = 16,
        Font = Enum.Font.GothamBold,
    }, Parent)
    Bind(B, "BackgroundColor3", "Surface")
    Bind(B, "TextColor3", "Muted")
    Corner(B, 8)
    Stroke(B, false, 1)
    B.MouseEnter:Connect(function()
        Tween(B, 0.15, { BackgroundColor3 = T[HoverKey], TextColor3 = T.Text })
    end)
    B.MouseLeave:Connect(function()
        Tween(B, 0.15, { BackgroundColor3 = T.Surface, TextColor3 = T.Muted })
    end)
    return B
end

local TopBar = New("Frame", {
    Name = "TopBar",
    Size = UDim2.new(1, 0, 0, 66),
    BackgroundTransparency = 1,
    ZIndex = 5,
}, MainFrame)

local Logo = New("ImageLabel", {
    Size = UDim2.fromOffset(40, 40),
    Position = UDim2.fromOffset(16, 13),
    BorderSizePixel = 0,
    Image = "rbxthumb://type=Asset&id=88492989421310&w=768&h=432",
    ScaleType = Enum.ScaleType.Crop,
}, TopBar)
Bind(Logo, "BackgroundColor3", "SurfaceHi")
Corner(Logo, 12)
New("UIStroke", {
    Color = White,
    Thickness = 1,
    Transparency = 0.75,
    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
}, Logo)

local TitleLabel = Label({
    Position = UDim2.fromOffset(66, 12),
    Size = UDim2.new(1, -200, 0, 24),
    RichText = true,
    Text = "",
    TextSize = 18,
    Font = Enum.Font.GothamBlack,
    TextXAlignment = Enum.TextXAlignment.Left,
}, TopBar)
Bind(TitleLabel, "Text", function()
    return "TOOLKIT " .. Tint("AccentB", "LOADER")
end)

Label({
    Position = UDim2.fromOffset(66, 37),
    Size = UDim2.new(1, -200, 0, 14),
    Text = Config.Tagline .. "  •  " .. Config.Version,
    TextSize = 10,
    Font = Enum.Font.GothamMedium,
    TextXAlignment = Enum.TextXAlignment.Left,
}, TopBar, "Muted")

local CloseButton = IconButton(TopBar, "×", UDim2.new(1, -44, 0, 19), "Bad")
local MinButton = IconButton(TopBar, "–", UDim2.new(1, -78, 0, 19), "SurfaceHi")

local Divider = New("Frame", {
    Position = UDim2.fromOffset(16, 65),
    Size = UDim2.new(1, -32, 0, 1),
    BackgroundColor3 = White,
    BorderSizePixel = 0,
    ZIndex = 5,
}, MainFrame)
do
    local G = New("UIGradient", { Transparency = NumberSequence.new(0.1, 1) }, Divider)
    BindGrad(G, "AccentA", "AccentB")
    if not Config.UseGradients then
        Divider.BackgroundTransparency = 0.55
    end
end

local TabBar = New("Frame", {
    Name = "Tabs",
    Position = UDim2.fromOffset(16, 74),
    Size = UDim2.new(1, -32, 0, 32),
    ZIndex = 5,
}, MainFrame)
Surface(TabBar, 10, false)

local TabPill = New("Frame", {
    Position = UDim2.new(0, 2, 0, 2),
    Size = UDim2.new(0.5, -3, 1, -4),
    BackgroundColor3 = White,
    BorderSizePixel = 0,
    ZIndex = 6,
}, TabBar)
Corner(TabPill, 8)
do
    local G = New("UIGradient", { Rotation = 90 }, TabPill)
    BindGrad(G, function()
        return T.SurfaceHi:Lerp(T.AccentA, 0.14)
    end, function()
        return T.Surface:Lerp(T.AccentB, 0.12)
    end)
    GradStroke(TabPill, 1.2, 0.1, 45)
end

local function MakeTab(Text, Position)
    return New("TextButton", {
        Position = Position,
        Size = UDim2.new(0.5, -2, 1, 0),
        BackgroundTransparency = 1,
        AutoButtonColor = false,
        Text = Text,
        TextSize = 11,
        Font = Enum.Font.GothamBold,
        ZIndex = 7,
    }, TabBar)
end

local TabGames = MakeTab("GAMES", UDim2.new(0, 1, 0, 0))
local TabChangelogs = MakeTab("CHANGELOGS", UDim2.new(0.5, 1, 0, 0))

local ActiveTab = "Games"
local function UpdateTabs(Animate)
    local IsGames = ActiveTab == "Games"
    local Target = IsGames and UDim2.new(0, 2, 0, 2) or UDim2.new(0.5, 1, 0, 2)
    if Animate then
        Tween(TabPill, 0.3, { Position = Target })
    else
        TabPill.Position = Target
    end
    local function Colorize(Button, On)
        local Value = On and T.Text or T.Muted
        if Animate then
            Tween(Button, 0.2, { TextColor3 = Value })
        else
            Button.TextColor3 = Value
        end
    end
    Colorize(TabGames, IsGames)
    Colorize(TabChangelogs, not IsGames)
end
Hooks[#Hooks + 1] = UpdateTabs
UpdateTabs(false)

local Pages = New("Frame", {
    Name = "Pages",
    Position = UDim2.fromOffset(0, 112),
    Size = UDim2.new(1, 0, 1, -180),
    BackgroundTransparency = 1,
    ClipsDescendants = true,
    ZIndex = 5,
}, MainFrame)

local HomePage = New("Frame", {
    Name = "Games",
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
}, Pages)

local VersionPage = New("Frame", {
    Name = "Versions",
    Size = UDim2.fromScale(1, 1),
    Position = UDim2.fromScale(1, 0),
    BackgroundTransparency = 1,
    Visible = false,
}, Pages)

local ChangelogPage = New("Frame", {
    Name = "Changelogs",
    Size = UDim2.fromScale(1, 1),
    Position = UDim2.fromScale(1, 0),
    BackgroundTransparency = 1,
    Visible = false,
}, Pages)

local StatusBar = New("Frame", {
    Position = UDim2.new(0, 16, 1, -60),
    Size = UDim2.new(1, -32, 0, 46),
    BackgroundColor3 = White,
    BorderSizePixel = 0,
    ZIndex = 5,
}, MainFrame)
Corner(StatusBar, 12)
local StatusGrad = New("UIGradient", { Rotation = 90 }, StatusBar)
local StatusStroke = New("UIStroke", {
    Thickness = 1.5,
    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
}, StatusBar)

local StatusDot = New("Frame", {
    Size = UDim2.fromOffset(14, 14),
    Position = UDim2.new(0, 14, 0.5, -7),
    BorderSizePixel = 0,
}, StatusBar)
Corner(StatusDot, 7)
Pulse(StatusDot, "BackgroundTransparency", 0, 0.5, 0.8)

local Status = Label({
    Position = UDim2.fromOffset(38, 0),
    Size = UDim2.new(1, -50, 1, 0),
    Text = "Ready  •  Choose a supported game",
    TextSize = 14,
    Font = Enum.Font.GothamBold,
    TextWrapped = true,
    TextXAlignment = Enum.TextXAlignment.Left,
}, StatusBar)

local StatusKind = "Good"
local function ApplyStatus(Animate)
    local C = T[StatusKind]
    local FillA, FillB = T.SurfaceHi:Lerp(C, 0.2), T.Surface:Lerp(C, 0.07)
    if Config.UseGradients then
        StatusGrad.Enabled = true
        StatusGrad.Color = ColorSequence.new(FillA, FillB)
    else
        StatusGrad.Enabled = false
        StatusBar.BackgroundColor3 = FillA:Lerp(FillB, 0.5)
    end
    if Animate then
        Tween(StatusDot, 0.2, { BackgroundColor3 = C })
        Tween(StatusStroke, 0.2, { Color = C })
    else
        StatusDot.BackgroundColor3 = C
        StatusStroke.Color = C
    end
end
Hooks[#Hooks + 1] = ApplyStatus
ApplyStatus(false)

local function SetStatus(Text, Kind)
    StatusKind = Kind or "Good"
    Status.Text = Text
    ApplyStatus(true)
    StatusStroke.Thickness = 3.5
    Tween(StatusStroke, 0.6, { Thickness = 1.5 })
end

Label({
    Position = UDim2.fromOffset(18, 2),
    Size = UDim2.fromOffset(200, 14),
    Text = "SUPPORTED GAMES",
    TextSize = 10,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left,
}, HomePage, "Muted")

local DevCount = 0
for _, G in ipairs(Games) do
    if IsDev(G) then
        DevCount += 1
    end
end

Label({
    Position = UDim2.new(1, -218, 0, 2),
    Size = UDim2.fromOffset(200, 14),
    Text = tostring(#Games - DevCount) .. " AVAILABLE"
        .. (DevCount > 0 and ("  •  " .. tostring(DevCount) .. " IN DEV") or ""),
    TextSize = 10,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Right,
}, HomePage, "AccentB")

local GameList = New("ScrollingFrame", {
    Position = UDim2.fromOffset(16, 22),
    Size = UDim2.new(1, -32, 1, -22),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ScrollBarThickness = 3,
    CanvasSize = UDim2.new(),
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    ScrollingDirection = Enum.ScrollingDirection.Y,
}, HomePage)
Bind(GameList, "ScrollBarImageColor3", "AccentB")
Pad(GameList, 3, 3, 14, 3)
New("UIListLayout", {
    Padding = UDim.new(0, 10),
    SortOrder = Enum.SortOrder.LayoutOrder,
}, GameList)

local DEV_ORDER_START = 100

local DevDivider = New("Frame", {
    Name = "DevDivider",
    LayoutOrder = DEV_ORDER_START - 1,
    Size = UDim2.new(1, 0, 0, 34),
    BackgroundTransparency = 1,
    Visible = false,
}, GameList)

Label({
    AnchorPoint = Vector2.new(0, 0.5),
    Position = UDim2.new(0, 2, 0.5, 0),
    Size = UDim2.fromOffset(112, 14),
    Text = "IN DEVELOPMENT",
    TextSize = 10,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left,
}, DevDivider, "Warn")

do
    local Line = New("Frame", {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 116, 0.5, 0),
        Size = UDim2.new(1, -116, 0, 1),
        BackgroundTransparency = 0.7,
        BorderSizePixel = 0,
    }, DevDivider)
    Bind(Line, "BackgroundColor3", "Warn")
end

local CARD_H = 92

local function SetDot(UI, Kind)
    UI.DotKind = Kind
    UI.Dot.BackgroundColor3 = T[Kind]
end

local function CreateGameCard(Game, Order, Opts)
    Opts = Opts or {}
    local Big = Opts.Big == true
    local DX = Big and 12 or 0
    local DY = Big and 12 or 0
    local TW = Big and 232 or 200
    local UI = { Game = Game, DotKind = "Muted", Here = false }

    local Card = New("Frame", {
        Name = "Game_" .. IdStr(Game.PlaceId),
        LayoutOrder = Order,
        Size = UDim2.new(1, -4, 0, Big and (CARD_H + 26) or CARD_H),
    }, GameList)
    local _, CardStroke = Surface(Card, 14, false)
    if Opts.StrokeKey then
        Card.BackgroundColor3 = T.Surface:Lerp(T[Opts.StrokeKey], 0.16)
    end

    local Icon = New("ImageLabel", {
        Position = UDim2.fromOffset(12, Big and 20 or 14),
        Size = Big and UDim2.fromOffset(76, 76) or UDim2.fromOffset(64, 64),
        BorderSizePixel = 0,
        Image = "",
        ScaleType = Enum.ScaleType.Crop,
    }, Card)
    Bind(Icon, "BackgroundColor3", "SurfaceHi")
    Corner(Icon, 12)
    Stroke(Icon, false, 1)

    local NameLabel = Label({
        Position = UDim2.fromOffset(88 + DX, 9 + DY),
        Size = UDim2.new(1, -TW, 0, 20),
        Text = Game.Name,
        TextSize = Big and 17 or 15,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
    }, Card)

    local IdLabel = Label({
        Position = UDim2.fromOffset(88 + DX, 30 + DY),
        Size = UDim2.new(1, -TW, 0, 12),
        Text = "ID  " .. IdStr(Game.PlaceId),
        TextSize = 10,
        Font = Enum.Font.GothamMedium,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
    }, Card, "Muted")

    local Dot = New("Frame", {
        Position = UDim2.fromOffset(89 + DX, 52 + DY),
        Size = UDim2.fromOffset(8, 8),
        BorderSizePixel = 0,
    }, Card)
    Corner(Dot, 4)

    local PlayersLabel = Label({
        Position = UDim2.fromOffset(103 + DX, 47 + DY),
        Size = UDim2.new(1, -(TW + 15), 0, 18),
        RichText = true,
        Text = "Fetching live players...",
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
    }, Card, "Muted")

    local Badges = New("Frame", {
        Position = UDim2.fromOffset(88 + DX, 68 + DY),
        Size = UDim2.new(1, -TW, 0, 18),
        BackgroundTransparency = 1,
    }, Card)
    New("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        Padding = UDim.new(0, 6),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    }, Badges)

    local Badge = New("TextLabel", {
        LayoutOrder = 1,
        Size = UDim2.fromOffset(0, 18),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 0.86,
        BorderSizePixel = 0,
        Text = "NOT IN THIS GAME",
        TextSize = 9,
        Font = Enum.Font.GothamBold,
    }, Badges)
    Corner(Badge, 6)
    Pad(Badge, 8, 0, 8, 0)

    local DevBadge = New("TextLabel", {
        LayoutOrder = 2,
        Size = UDim2.fromOffset(0, 18),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 0.84,
        BorderSizePixel = 0,
        Text = "IN DEVELOPMENT",
        TextSize = 9,
        Font = Enum.Font.GothamBold,
        Visible = false,
    }, Badges)
    Corner(DevBadge, 6)
    Pad(DevBadge, 8, 0, 8, 0)

    local Select = GradButton(
        Card, Opts.ButtonText or "SELECT",
        Big and UDim2.fromOffset(112, 46) or UDim2.fromOffset(92, 36),
        Big and UDim2.new(1, -126, 0.5, -23) or UDim2.new(1, -104, 0.5, -18),
        Big and 14 or 12,
        Opts.StrokeKey
    )

    UI.Card = Card
    UI.Stroke = CardStroke
    UI.Icon = Icon
    UI.Dot = Dot
    UI.Players = PlayersLabel
    UI.Badge = Badge
    UI.DevBadge = DevBadge
    UI.Select = Select
    UI.Name = NameLabel
    UI.Id = IdLabel

    UI.Restyle = function()
        local Here = UI.Here
        local C = UI.BadgeKey and T[UI.BadgeKey] or (Here and T.Good or T.Muted)
        Badge.TextColor3 = C
        Badge.BackgroundColor3 = C
        DevBadge.TextColor3 = T.Warn
        DevBadge.BackgroundColor3 = T.Warn
        Dot.BackgroundColor3 = T[UI.DotKind]
        CardStroke.Color = Here and T.Good or (Opts.StrokeKey and T[Opts.StrokeKey]) or T.Border
        CardStroke.Transparency = Here and 0.05 or (Opts.StrokeKey and 0) or T.StrokeAlpha
        CardStroke.Thickness = Here and 2 or (Opts.StrokeKey and 2.4) or 1.2
        if UI.LiveValue then
            PlayersLabel.Text = LiveText(UI.LiveValue, UI.LiveVisits)
        end
    end

    Card.MouseEnter:Connect(function()
        Tween(CardStroke, 0.2, { Color = T.AccentA, Transparency = 0.05 })
    end)
    Card.MouseLeave:Connect(function()
        Tween(CardStroke, 0.2, {
            Color = UI.Here and T.Good or (Opts.StrokeKey and T[Opts.StrokeKey]) or T.Border,
            Transparency = UI.Here and 0.05 or (Opts.StrokeKey and 0) or T.StrokeAlpha,
        })
    end)

    UI.Restyle()
    AllCards[#AllCards + 1] = UI
    return UI
end

Hooks[#Hooks + 1] = function()
    for _, UI in ipairs(AllCards) do
        UI.Restyle()
    end
end

local VP, Md, Ui = {}, {}, {}

do
    local Back = New("TextButton", {
        Position = UDim2.fromOffset(16, 4),
        Size = UDim2.fromOffset(84, 30),
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Text = "<  BACK",
        TextSize = 11,
        Font = Enum.Font.GothamBold,
    }, VersionPage)
    Bind(Back, "BackgroundColor3", "Surface")
    Bind(Back, "TextColor3", "Muted")
    Corner(Back, 8)
    Stroke(Back, false, 1)
    Back.MouseEnter:Connect(function()
        Tween(Back, 0.15, { TextColor3 = T.Text })
    end)
    Back.MouseLeave:Connect(function()
        Tween(Back, 0.15, { TextColor3 = T.Muted })
    end)
    VP.Back = Back

    local Header = New("Frame", {
        Name = "SelectedHeaderCard",
        Position = UDim2.fromOffset(16, 40),
        Size = UDim2.new(1, -32, 0, 78),
    }, VersionPage)
    Surface(Header, 14, false)

    VP.Icon = New("ImageLabel", {
        Position = UDim2.fromOffset(8, 7),
        Size = UDim2.fromOffset(64, 64),
        BorderSizePixel = 0,
        ScaleType = Enum.ScaleType.Crop,
    }, Header)
    Bind(VP.Icon, "BackgroundColor3", "SurfaceHi")
    Corner(VP.Icon, 12)
    GradStroke(VP.Icon, 1.5, 0.1, 45)

    VP.Name = Label({
        Position = UDim2.fromOffset(82, 12),
        Size = UDim2.new(1, -92, 0, 24),
        Text = "",
        TextSize = 18,
        Font = Enum.Font.GothamBlack,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
    }, Header)

    VP.Sub = Label({
        Position = UDim2.fromOffset(82, 38),
        Size = UDim2.new(1, -92, 0, 28),
        Text = "",
        TextSize = 12,
        Font = Enum.Font.GothamMedium,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
    }, Header)
    VP.SubKey = "Text"

    local function CreateEdition(Title, Chip, ChipKey, DescFn, X)
        local Card = New("Frame", {
            Name = Title .. "Card",
            Position = UDim2.fromOffset(X, 128),
            Size = UDim2.fromOffset(209, 182),
        }, VersionPage)
        Surface(Card, 14, false, true)
        GradStroke(Card, 1.5, 0.1, 45)

        local ChipLabel = New("TextLabel", {
            Position = UDim2.fromOffset(14, 12),
            Size = UDim2.fromOffset(0, 20),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundTransparency = 0.82,
            BorderSizePixel = 0,
            Text = Chip,
            TextSize = 9,
            Font = Enum.Font.GothamBold,
        }, Card)
        Bind(ChipLabel, "BackgroundColor3", ChipKey)
        Bind(ChipLabel, "TextColor3", ChipKey)
        Corner(ChipLabel, 6)
        Pad(ChipLabel, 8, 0, 8, 0)

        Label({
            Position = UDim2.fromOffset(14, 38),
            Size = UDim2.new(1, -28, 0, 26),
            Text = Title,
            TextSize = 20,
            Font = Enum.Font.GothamBlack,
            TextXAlignment = Enum.TextXAlignment.Left,
        }, Card)

        local Desc = Label({
            Position = UDim2.fromOffset(14, 68),
            Size = UDim2.new(1, -28, 0, 52),
            RichText = true,
            Text = "",
            TextSize = 13,
            Font = Enum.Font.GothamBold,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
        }, Card)
        Bind(Desc, "Text", DescFn)

        local Button = GradButton(
            Card, "LOAD " .. string.upper(Title),
            UDim2.new(1, -28, 0, 38), UDim2.new(0, 14, 1, -50), 11
        )
        return Button, Card
    end

    local PremiumCard
    VP.Premium, PremiumCard = CreateEdition("Premium", "VIP ACCESS", "Warn", function()
        return "• Key Required\n• " .. Tint("AccentB", "Buy on Discord")
    end, 16)

    VP.Freemium = CreateEdition("Freemium", "PUBLIC", "Info", function()
        return "• Key Required\n• " .. Tint("AccentB", "Get Key Link")
    end, 235)

    VP.Notice = New("TextButton", {
        Position = UDim2.new(1, -34, 0, 10),
        Size = UDim2.fromOffset(22, 22),
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Text = "i",
        TextSize = 11,
        Font = Enum.Font.GothamBold,
    }, PremiumCard)
    Bind(VP.Notice, "BackgroundColor3", "SurfaceHi")
    Bind(VP.Notice, "TextColor3", "Text")
    Corner(VP.Notice, 11)
    GradStroke(VP.Notice, 1, 0.2, 45)
end

do
    local ChangelogGame = nil
    local DropOpen = false
    local DropToken = 0
    local DROP_ROW = 32
    local DROP_MAX = 164
    local DropOptions = {}

    local DropCatcher = New("TextButton", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = "",
        AutoButtonColor = false,
        Visible = false,
        ZIndex = 25,
    }, ChangelogPage)

    local DropButton = New("TextButton", {
        Name = "GameDropdown",
        Position = UDim2.fromOffset(16, 4),
        Size = UDim2.new(1, -32, 0, 38),
        AutoButtonColor = false,
        Text = "",
        ZIndex = 31,
    }, ChangelogPage)
    Surface(DropButton, 10, false)

    local DropLabel = Label({
        Position = UDim2.fromOffset(14, 0),
        Size = UDim2.new(1, -54, 1, 0),
        Text = "Select a game",
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Active = false,
    }, DropButton, "Muted")

    local DropArrow = New("Frame", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -14, 0.5, 0),
        Size = UDim2.fromOffset(16, 16),
        BackgroundTransparency = 1,
    }, DropButton)
    for _, Arm in ipairs({ { 5.2, 45 }, { 10.8, -45 } }) do
        local Piece = New("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromOffset(Arm[1], 8),
            Size = UDim2.fromOffset(9, 2),
            Rotation = Arm[2],
            BorderSizePixel = 0,
        }, DropArrow)
        Bind(Piece, "BackgroundColor3", "Text")
        Corner(Piece, 1)
    end

    local DropList = New("ScrollingFrame", {
        Name = "GameOptions",
        Position = UDim2.fromOffset(16, 46),
        Size = UDim2.new(1, -32, 0, 0),
        ScrollBarThickness = 3,
        CanvasSize = UDim2.new(),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        Visible = false,
        ZIndex = 30,
    }, ChangelogPage)
    Surface(DropList, 10, true)
    Bind(DropList, "ScrollBarImageColor3", "AccentB")
    Pad(DropList, 4, 4, 4, 4)
    New("UIListLayout", { Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder }, DropList)

    local Scroll = New("ScrollingFrame", {
        Name = "Entries",
        Position = UDim2.fromOffset(16, 52),
        Size = UDim2.new(1, -32, 1, -52),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        CanvasSize = UDim2.new(),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ZIndex = 1,
    }, ChangelogPage)
    Bind(Scroll, "ScrollBarImageColor3", "AccentB")
    Pad(Scroll, 3, 3, 14, 3)
    New("UIListLayout", { Padding = UDim.new(0, 10), SortOrder = Enum.SortOrder.LayoutOrder }, Scroll)

    local Hint = Label({
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 20),
        Size = UDim2.new(1, -80, 0, 50),
        Text = "Select a game to view its changelogs.",
        TextSize = 13,
        Font = Enum.Font.GothamMedium,
        TextWrapped = true,
        ZIndex = 1,
    }, ChangelogPage, "Muted")

    local function UpdateDropdown()
        DropLabel.TextColor3 = ChangelogGame and T.Text or T.Muted
        for _, Option in ipairs(DropOptions) do
            Option.Btn.BackgroundTransparency = (Option.Game == ChangelogGame) and 0.86 or 1
        end
    end
    Hooks[#Hooks + 1] = UpdateDropdown

    local function SetDropdown(Open)
        if Open == DropOpen then return end
        DropOpen = Open
        DropToken += 1
        local My = DropToken
        local Height = math.min(#Games * (DROP_ROW + 2) + 8, DROP_MAX)
        if Open then
            DropCatcher.Visible = true
            DropList.Visible = true
            DropList.Size = UDim2.new(1, -32, 0, 0)
            Tween(DropList, 0.25, { Size = UDim2.new(1, -32, 0, Height) })
            Tween(DropArrow, 0.25, { Rotation = 180 })
        else
            DropCatcher.Visible = false
            Tween(DropList, 0.18, { Size = UDim2.new(1, -32, 0, 0) })
            Tween(DropArrow, 0.25, { Rotation = 0 })
            After(0.2, function()
                if not Destroyed and DropToken == My then
                    DropList.Visible = false
                end
            end)
        end
    end
    Ui.CloseDropdown = function()
        SetDropdown(false)
    end

    local function ClearEntries()
        for _, Child in ipairs(Scroll:GetChildren()) do
            if Child:IsA("GuiObject") then
                Child:Destroy()
            end
        end
    end

    local function RenderChangelogs(Game)
        ClearEntries()
        Scroll.CanvasPosition = Vector2.zero

        local List = Game.Changelogs
        if type(List) ~= "table" or #List == 0 then
            Label({
                Name = "Empty",
                LayoutOrder = 1,
                Size = UDim2.new(1, -4, 0, 40),
                Text = "No changelogs for this game yet.",
                TextSize = 12,
                Font = Enum.Font.GothamMedium,
            }, Scroll, "Muted")
            return
        end

        for Index, Entry in ipairs(List) do
            local Card = New("Frame", {
                Name = "Entry",
                LayoutOrder = Index,
                Size = UDim2.new(1, -4, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
            }, Scroll)
            Surface(Card, 14, false)
            Pad(Card, 14, 12, 14, 12)
            New("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, Card)

            local Head = New("Frame", {
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 0, 20),
                BackgroundTransparency = 1,
            }, Card)

            local Chip = New("TextLabel", {
                Size = UDim2.fromOffset(0, 20),
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundTransparency = 0.78,
                BorderSizePixel = 0,
                Text = tostring(Entry.Version or "?"),
                TextSize = 11,
                Font = Enum.Font.GothamBold,
            }, Head)
            Bind(Chip, "BackgroundColor3", "AccentB")
            Bind(Chip, "TextColor3", "Text")
            Corner(Chip, 6)
            Pad(Chip, 8, 0, 8, 0)

            if Entry.Date then
                Label({
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, 0, 0.5, 0),
                    Size = UDim2.fromOffset(140, 14),
                    Text = tostring(Entry.Date),
                    TextSize = 10,
                    Font = Enum.Font.GothamMedium,
                    TextXAlignment = Enum.TextXAlignment.Right,
                }, Head, "Muted")
            end

            local Lines = {}
            for _, Change in ipairs(Entry.Changes or {}) do
                Lines[#Lines + 1] = "•  " .. tostring(Change)
            end

            Label({
                LayoutOrder = 2,
                Size = UDim2.new(1, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                Text = table.concat(Lines, "\n"),
                TextSize = 12,
                Font = Enum.Font.GothamMedium,
                TextWrapped = true,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
            }, Card)
        end
    end

    local function SelectGame(Game)
        ChangelogGame = Game
        DropLabel.Text = Game.Name .. (IsDev(Game) and "  (in development)" or "")
        Hint.Visible = false
        RenderChangelogs(Game)
        UpdateDropdown()
        SetDropdown(false)
        SetStatus("Viewing changelogs  •  " .. Game.Name, "Info")
    end
    Ui.ChangelogGame = function()
        return ChangelogGame
    end

    for Index, Game in ipairs(Games) do
        local Btn = New("TextButton", {
            LayoutOrder = Index,
            Size = UDim2.new(1, 0, 0, DROP_ROW),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AutoButtonColor = false,
            Text = "",
            ZIndex = 31,
        }, DropList)
        Bind(Btn, "BackgroundColor3", "AccentB")
        Corner(Btn, 8)

        Label({
            Position = UDim2.fromOffset(10, 0),
            Size = UDim2.new(1, -150, 1, 0),
            Text = Game.Name .. (IsDev(Game) and "  (dev)" or ""),
            TextSize = 12,
            Font = Enum.Font.GothamBold,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            ZIndex = 32,
            Active = false,
        }, Btn)

        Label({
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, -8, 0.5, 0),
            Size = UDim2.fromOffset(132, 14),
            Text = "ID  " .. IdStr(Game.PlaceId),
            TextSize = 9,
            Font = Enum.Font.GothamMedium,
            TextXAlignment = Enum.TextXAlignment.Right,
            ZIndex = 32,
            Active = false,
        }, Btn, "Muted")

        Btn.MouseEnter:Connect(function()
            Tween(Btn, 0.12, { BackgroundTransparency = 0.88 })
        end)
        Btn.MouseLeave:Connect(function()
            Tween(Btn, 0.12, { BackgroundTransparency = (ChangelogGame == Game) and 0.86 or 1 })
        end)
        Btn.MouseButton1Click:Connect(function()
            if Destroyed then return end
            SelectGame(Game)
        end)

        DropOptions[#DropOptions + 1] = { Btn = Btn, Game = Game }
    end

    DropButton.MouseButton1Click:Connect(function()
        if Destroyed then return end
        SetDropdown(not DropOpen)
    end)
    DropCatcher.MouseButton1Click:Connect(function()
        SetDropdown(false)
    end)

    UpdateDropdown()
end

Md.Frame = New("Frame", {
    Name = "Modal",
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Visible = false,
    ZIndex = 40,
}, MainFrame)

Md.Dim = New("Frame", {
    Size = UDim2.fromScale(1, 1),
    BackgroundColor3 = Color3.new(0, 0, 0),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    Active = true,
    ZIndex = 1,
}, Md.Frame)
Corner(Md.Dim, MAIN_RADIUS)

do
    local Box = New("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(360, 230),
        ZIndex = 2,
    }, Md.Frame)
    Surface(Box, MAIN_RADIUS, true, true)
    GradStroke(Box, 2, 0.05, 45)
    Md.Scale = New("UIScale", { Scale = 1 }, Box)

    Md.Title = Label({
        Position = UDim2.fromOffset(20, 18),
        Size = UDim2.new(1, -40, 0, 26),
        Text = "",
        TextSize = 16,
        Font = Enum.Font.GothamBlack,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, Box)

    Md.Desc = Label({
        Position = UDim2.fromOffset(20, 52),
        Size = UDim2.new(1, -40, 0, 108),
        RichText = true,
        Text = "",
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
    }, Box)

    Md.Cancel = New("TextButton", {
        Position = UDim2.fromOffset(20, 170),
        Size = UDim2.fromOffset(140, 42),
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Text = "CANCEL",
        TextSize = 12,
        Font = Enum.Font.GothamBold,
    }, Box)
    Bind(Md.Cancel, "BackgroundColor3", "Surface")
    Bind(Md.Cancel, "TextColor3", "Muted")
    Corner(Md.Cancel, 10)
    Stroke(Md.Cancel, false, 1.2)

    Md.Continue = GradButton(
        Box, "CONTINUE",
        UDim2.fromOffset(160, 42), UDim2.fromOffset(170, 170), 13
    )
end

local function ShowModal(Title, Desc, ContinueText)
    ModalToken += 1
    Md.Title.Text = Title
    Md.Desc.Text = Desc
    Md.Continue.Text = ContinueText
    Md.Frame.Visible = true
    Md.Dim.BackgroundTransparency = 1
    Md.Scale.Scale = 0.88
    Tween(Md.Dim, 0.2, { BackgroundTransparency = 0.4 })
    Tween(Md.Scale, 0.3, { Scale = 1 }, Enum.EasingStyle.Back)
end

local function HideModal()
    ModalToken += 1
    local My = ModalToken
    Tween(Md.Dim, 0.15, { BackgroundTransparency = 1 })
    Tween(Md.Scale, 0.15, { Scale = 0.92 })
    After(0.16, function()
        if not Destroyed and ModalToken == My then
            Md.Frame.Visible = false
        end
    end)
end

local Splash = New("Frame", {
    Name = "Splash",
    Size = UDim2.fromScale(1, 1),
    BackgroundColor3 = T.Bg,
    BackgroundTransparency = 0,
    BorderSizePixel = 0,
    Active = true,
    ClipsDescendants = true,
    ZIndex = 100,
}, MainFrame)
Corner(Splash, MAIN_RADIUS)
BindGrad(New("UIGradient", { Rotation = 135 }, Splash), "Bg", "Bg2")

local SplashAlive = true
local SplashOrbs = {
    OrbMoving(Splash, { X = 0.9, Y = 0.1, Size = 120, AX = 0.05, AY = 0.05, FX = 0.6, FY = 0.5, Phase = 0, Speed = 90 }),
    OrbMoving(Splash, { X = 0.1, Y = 0.9, Size = 120, AX = 0.05, AY = 0.05, FX = 0.55, FY = 0.45, Phase = 3, Speed = 90 }),
}
local SplashParticles = MakeParticles(Splash, 8)

local SplashLogo = New("ImageLabel", {
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.new(0.5, 0, 0.5, -52),
    Size = UDim2.fromOffset(0, 0),
    BorderSizePixel = 0,
    Image = "rbxthumb://type=Asset&id=88492989421310&w=768&h=432",
    ScaleType = Enum.ScaleType.Crop,
    ZIndex = 2,
}, Splash)
Bind(SplashLogo, "BackgroundColor3", "SurfaceHi")
Corner(SplashLogo, 22)
New("UIStroke", {
    Color = White,
    Thickness = 1,
    Transparency = 0.75,
    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
}, SplashLogo)

local SplashTitle = New("TextLabel", {
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.new(0.5, 0, 0.5, 14),
    Size = UDim2.fromOffset(340, 34),
    BackgroundTransparency = 1,
    Text = "TOOLKIT LOADER",
    TextColor3 = White,
    TextSize = 28,
    Font = Enum.Font.GothamBlack,
    MaxVisibleGraphemes = 0,
    ZIndex = 2,
}, Splash)
BindGrad(New("UIGradient", {}, SplashTitle), "AccentA", "AccentB")
local SplashTitleLen = #SplashTitle.Text

local SplashSub = Label({
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.new(0.5, 0, 0.5, 48),
    Size = UDim2.fromOffset(300, 16),
    Text = "Initializing...",
    TextSize = 11,
    Font = Enum.Font.GothamMedium,
    ZIndex = 2,
}, Splash, "Muted")

local BarBg = New("Frame", {
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.new(0.5, 0, 0.5, 76),
    Size = UDim2.fromOffset(220, 4),
    BorderSizePixel = 0,
    ZIndex = 2,
}, Splash)
Bind(BarBg, "BackgroundColor3", "SurfaceHi")
Corner(BarBg, 2)
local BarFill = New("Frame", {
    Size = UDim2.fromScale(0, 1),
    BackgroundColor3 = White,
    BorderSizePixel = 0,
}, BarBg)
Corner(BarFill, 2)
BindGrad(New("UIGradient", {}, BarFill), "AccentA", "AccentB")

local Bubble = New("Frame", {
    Size = UDim2.fromOffset(48, 48),
    Position = UDim2.new(1, -64, 0.5, -24),
    BackgroundColor3 = White,
    BorderSizePixel = 0,
    Visible = false,
}, ScreenGui)
Corner(Bubble, 24)
Bind(Bubble, "BackgroundColor3", "SurfaceHi")
New("UIStroke", {
    Color = White,
    Thickness = 1.5,
    Transparency = 0.5,
    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
}, Bubble)

local BubbleButton = New("ImageButton", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Image = "rbxthumb://type=Asset&id=88492989421310&w=768&h=432",
    ScaleType = Enum.ScaleType.Crop,
}, Bubble)
Corner(BubbleButton, 24)

local Hidden = false
local function SetHidden(Value)
    if Destroyed or not Started then return end
    Hidden = Value
    Root.Visible = not Value
    Bubble.Visible = Value
end

local LiveAnims = {}
local LIVE_TIME = 0.9

local function SetLive(UI, Game, Playing, Visits)
    local From = Game.LastPlaying or 0
    Game.LastPlaying = Playing
    SetDot(UI, "Good")
    Pulse(UI.Dot, "BackgroundTransparency", 0, 0.55, 0.9)
    LiveAnims[UI] = { From = From, To = Playing, Visits = Visits, T = 0, Shown = -1 }
end

local function IsInGame(Game)
    if game.PlaceId == Game.PlaceId then
        return true
    end
    return Game.UniverseId ~= nil and game.GameId == Game.UniverseId
end

local function UpdateDivider()
    local Show = false
    for _, G in ipairs(Games) do
        if IsDev(G) and Entries[G] and not IsInGame(G) then
            Show = true
            break
        end
    end
    DevDivider.Visible = Show
end

local function UpdateBadge(Game, UI)
    local Here = IsInGame(Game)
    UI.Here = Here
    UI.Badge.Text = Here and "CURRENT SERVER" or "NOT IN THIS GAME"
    UI.DevBadge.Visible = IsDev(Game)

    if Here then
        UI.Card.LayoutOrder = IsDev(Game) and (DEV_ORDER_START - 2) or 0
    else
        UI.Card.LayoutOrder = Game.Order or 1
    end

    UI.Restyle()
    UpdateDivider()
end

local function RefreshGame(Game, UI)
    Defer(function()
        if not Game.PlaceId or Game.PlaceId <= 0 then
            UI.Players.Text = "Coming soon"
            SetDot(UI, "Warn")
            return
        end

        if not Game.UniverseId then
            Game.UniverseId = ResolveUniverse(Game.PlaceId)
            if Game.UniverseId and UI.Icon.Parent then
                UI.Icon.Image = "rbxthumb://type=GameIcon&id=" .. IdStr(Game.UniverseId) .. "&w=256&h=256"
            end
        end
        if Destroyed or not UI.Players.Parent then return end

        UpdateBadge(Game, UI)
        if UpdateSupportState then
            UpdateSupportState()
        end

        local Info = Game.UniverseId and FetchGameInfo(Game.UniverseId)
        if Destroyed or not UI.Players.Parent then return end

        if Info and Info.playing ~= nil then
            SetLive(UI, Game, Info.playing, Info.visits)
        else
            UI.Players.Text = "Player count unavailable"
            SetDot(UI, "Bad")
        end
    end)
end

local PageFrames = { Games = HomePage, Versions = VersionPage, Changelogs = ChangelogPage }
local PageOrder = { Games = 1, Versions = 2, Changelogs = 3 }
local CurrentPage = "Games"
local NavToken = 0

local function Navigate(Name)
    if Destroyed or Name == CurrentPage then return end

    if CurrentPage == "Versions" and Name ~= "Versions" then
        SelectedGame = nil
    end
    if Ui.CloseDropdown then
        Ui.CloseDropdown()
    end

    NavToken += 1
    local My = NavToken
    local Old, New_ = PageFrames[CurrentPage], PageFrames[Name]
    local Dir = (PageOrder[Name] > PageOrder[CurrentPage]) and 1 or -1

    New_.Position = UDim2.fromScale(Dir, 0)
    New_.Visible = true
    Old.Visible = true
    Tween(Old, 0.4, { Position = UDim2.fromScale(-Dir, 0) })
    Tween(New_, 0.4, { Position = UDim2.fromScale(0, 0) })
    CurrentPage = Name

    ActiveTab = (Name == "Changelogs") and "Changelogs" or "Games"
    UpdateTabs(true)

    After(0.45, function()
        if Destroyed or NavToken ~= My then return end
        for PageName, Frame in pairs(PageFrames) do
            if PageName ~= CurrentPage then
                Frame.Visible = false
            end
        end
    end)
end

local CurrentGameName = "Unknown Game"

local function OpenGameConfirmation(Game)
    if Busy or Destroyed then return end
    SelectedGame = Game
    PendingAction = "Game"
    PendingURL = nil

    local Desc = "You selected " .. Hl(Esc(Game.Name)) .. ".\n\n"
        .. "Continue to choose a script version?"
    if IsDev(Game) then
        Desc ..= "\n" .. Tint("Warn", "This game is still in development.")
    end

    ShowModal("CONFIRM GAME", Desc, "CONTINUE")
end

local function OpenVersionConfirmation(Version, URL)
    if Busy or Destroyed or not SelectedGame then return end

    if IsDev(SelectedGame) or not URL or URL == "" then
        PendingAction = "DevNotice"
        PendingURL = nil
        ShowModal(
            "IN DEVELOPMENT",
            "Game: " .. Hl(Esc(SelectedGame.Name)) .. "\nVersion: " .. Hl(Version) .. "\n\n"
                .. Tint("Warn", "<b>This script is in development.</b>") .. "\n"
                .. "It can't be executed yet. Please check back soon!",
            "OKAY"
        )
        return
    end

    PendingAction = "Version"
    PendingURL = URL
    ShowModal(
        "CONFIRM VERSION",
        "Game: " .. Hl(Esc(SelectedGame.Name)) .. "\nVersion: " .. Hl(Version)
            .. "\n\nContinue and load this version?",
        "EXECUTE"
    )
end

local function DestroyLauncher()
    if Destroyed then return end
    Destroyed = true
    Busy = true

    for _, C in ipairs(Connections) do
        pcall(function() C:Disconnect() end)
    end

    local function Kill()
        pcall(function() ScreenGui:Destroy() end)
    end

    local Ok, Tw = pcall(Tween, RootScale, 0.25, { Scale = 0.8 }, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    if Ok and Tw then
        Tw.Completed:Connect(Kill)
    else
        Kill()
    end
end

local function ExecuteScript(URL)
    if not Config.Status then return end
    if Busy or Destroyed or not SelectedGame or not URL or URL == "" then return end

    Busy = true
    HideModal()
    SetStatus("Fetching the selected script...", "Info")

    local Success, Response = pcall(function()
        return game:HttpGet(URL)
    end)

    if not Success or type(Response) ~= "string" or Response == "" then
        SetStatus("Failed to fetch the selected script.", "Bad")
        Busy = false
        return
    end

    local CompileSuccess, ScriptFunction = pcall(function()
        return loadstring(Response)
    end)

    if not CompileSuccess or type(ScriptFunction) ~= "function" then
        SetStatus("Failed to compile the selected script.", "Bad")
        Busy = false
        return
    end

    DestroyLauncher()
    RunService.Heartbeat:Wait()

    local RunSuccess, RunError = pcall(ScriptFunction)
    if not RunSuccess then
        warn("[Toolkit Loader] Script execution failed: " .. tostring(RunError))
    end
end

for Index, Game in ipairs(Games) do
    Game.Order = Index + (IsDev(Game) and DEV_ORDER_START or 0)

    local UI = CreateGameCard(Game, Game.Order)
    Entries[Game] = UI
    UpdateBadge(Game, UI)
    UI.Select.MouseButton1Click:Connect(function()
        OpenGameConfirmation(Game)
    end)
end

local Req = { Sending = false, Until = 0, Active = false, Acc = 0 }

do
    local FILE = "ToolkitLoader_RequestCooldown.txt"

    local function GetLast()
        local Last = 0
        pcall(function()
            if isfile and readfile and isfile(FILE) then
                Last = math.max(Last, tonumber(readfile(FILE)) or 0)
            end
        end)
        pcall(function()
            local Env = getgenv and getgenv()
            if Env and type(Env.ToolkitLastRequest) == "number" then
                Last = math.max(Last, Env.ToolkitLastRequest)
            end
        end)
        return Last
    end

    function Req.Save(Time)
        Req.Until = Time + Config.RequestCooldown
        pcall(function()
            if writefile then
                writefile(FILE, tostring(Time))
            end
        end)
        pcall(function()
            local Env = getgenv and getgenv()
            if Env then
                Env.ToolkitLastRequest = Time
            end
        end)
    end

    do
        local Last = GetLast()
        if Last > 0 then
            Req.Until = Last + Config.RequestCooldown
        end
    end

    function Req.Left()
        if Req.Until <= 0 then
            return 0
        end
        return math.clamp(Req.Until - os.time(), 0, Config.RequestCooldown)
    end

    local function FormatTime(Seconds)
        Seconds = math.floor(Seconds)
        return string.format("%02d:%02d", math.floor(Seconds / 60), Seconds % 60)
    end

    function Req.FormatLong(Seconds)
        Seconds = math.floor(Seconds)
        return string.format("%dm %02ds", math.floor(Seconds / 60), Seconds % 60)
    end

    function Req.Render(Left)
        if UnsupportedUI and UnsupportedUI.Card.Visible then
            UnsupportedUI.Select.Text = Left > 0 and FormatTime(Left) or "REQUEST"
        end
    end

    function Req.Start()
        local Left = Req.Left()
        Req.Render(Left)
        Req.Acc = 0
        Req.Active = Left > 0
    end

    local function FormatCount(Value)
        local Number = tonumber(Value)
        if not Number then
            return "Unavailable"
        end

        Number = math.floor(Number)
        local Formatted = Commify(Number)

        local Suffix
        if Number >= 1000000000 then
            Suffix = string.format("%.2f billion", Number / 1000000000)
        elseif Number >= 1000000 then
            Suffix = string.format("%.2f million", Number / 1000000)
        elseif Number >= 1000 then
            Suffix = string.format("%.2f thousand", Number / 1000)
        end

        if Suffix then
            return Formatted .. " (" .. Suffix .. ")"
        end
        return Formatted
    end

    function Req.Send()
        local Url = Config.Webhook

        if type(Url) ~= "string" or not Url:find("^https://") then
            return false, "nowebhook"
        end

        local Request = (syn and syn.request)
            or request
            or http_request
            or (http and http.request)

        if not Request then
            return false, "norequest"
        end

        local PlaceStr = IdStr(game.PlaceId)
        local UniverseId = game.GameId
        local GameName = tostring(CurrentGameName or game.Name)

        local ActivePlayers = #Players:GetPlayers()
        local TotalVisits = nil
        local ThumbnailUrl = nil

        local function GetJson(Endpoint)
            local Ok, Res = pcall(Request, {
                Url = Endpoint,
                Method = "GET",
                Headers = { ["Content-Type"] = "application/json" },
            })

            if not Ok or type(Res) ~= "table"
                or type(Res.StatusCode) ~= "number"
                or Res.StatusCode < 200
                or Res.StatusCode >= 300
                or type(Res.Body) ~= "string" then
                return nil
            end

            local DecodeOk, Data = pcall(function()
                return HttpService:JSONDecode(Res.Body)
            end)

            if DecodeOk and type(Data) == "table" then
                return Data
            end
            return nil
        end

        local GameData = GetJson("https://games.roblox.com/v1/games?universeIds=" .. IdStr(UniverseId))
        if GameData and type(GameData.data) == "table" then
            local Info = GameData.data[1]
            if Info then
                GameName = tostring(Info.name or GameName)
                TotalVisits = tonumber(Info.visits)
                ActivePlayers = tonumber(Info.playing) or ActivePlayers
            end
        end

        local ThumbData = GetJson(
            "https://thumbnails.roblox.com/v1/games/icons?universeIds="
                .. IdStr(UniverseId) .. "&size=512x512&format=Png&isCircular=false"
        )
        if ThumbData and type(ThumbData.data) == "table" then
            local Thumb = ThumbData.data[1]
            if Thumb and Thumb.state == "Completed" and type(Thumb.imageUrl) == "string" then
                ThumbnailUrl = Thumb.imageUrl
            end
        end

        local Embed = {
            title = "Experience Request",
            description = "A new experience has been submitted for review.",
            color = 9133311,
            fields = {
                { name = "Experience", value = string.sub(GameName, 1, 200), inline = true },
                { name = "Place ID", value = PlaceStr, inline = true },
                {
                    name = "Active Players",
                    value = FormatCount(ActivePlayers) .. "\nCurrently playing across the experience.",
                    inline = true,
                },
                {
                    name = "Total Visits",
                    value = FormatCount(TotalVisits) .. "\nTotal visits accumulated by the experience.",
                    inline = true,
                },
                { name = "Game Link", value = "https://www.roblox.com/games/" .. PlaceStr, inline = false },
                {
                    name = "Requested by",
                    value = string.sub(LocalPlayer.Name .. " (" .. IdStr(LocalPlayer.UserId) .. ")", 1, 200),
                    inline = false,
                },
            },
            timestamp = DateTime.now():ToIsoDate(),
        }

        if ThumbnailUrl then
            Embed.thumbnail = { url = ThumbnailUrl }
        end

        local Payload = HttpService:JSONEncode({
            username = "Toolkit Request",
            embeds = { Embed },
        })

        local Ok, Res = pcall(Request, {
            Url = Url,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = Payload,
        })

        if Ok and type(Res) == "table" and type(Res.StatusCode) == "number"
            and Res.StatusCode >= 200 and Res.StatusCode < 300 then
            return true
        end
        return false, "failed"
    end
end

local function IsSupportedHere()
    for _, G in ipairs(Games) do
        if IsInGame(G) then
            return true
        end
    end
    return false
end

UnsupportedUI = CreateGameCard(
    { Name = "Current Game", PlaceId = game.PlaceId }, 0,
    { ButtonText = "REQUEST", Big = true, StrokeKey = "Bad" }
)
UnsupportedUI.Card.Visible = false
UnsupportedUI.BadgeKey = "Bad"
UnsupportedUI.Badge.Text = "UNSUPPORTED"
UnsupportedUI.Players.Text = "This game isn't supported yet"
SetDot(UnsupportedUI, "Bad")
UnsupportedUI.Restyle()

if game.GameId ~= 0 then
    UnsupportedUI.Icon.Image = "rbxthumb://type=GameIcon&id=" .. IdStr(game.GameId) .. "&w=256&h=256"
end

Defer(function()
    local Ok, Info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    if Ok and type(Info) == "table" and type(Info.Name) == "string" and Info.Name ~= "" then
        CurrentGameName = Info.Name
        if UnsupportedUI.Name.Parent then
            UnsupportedUI.Name.Text = Info.Name
        end
    end
end)

UpdateSupportState = function()
    if Destroyed or not UnsupportedUI then return end
    local Unsupported = not IsSupportedHere()
    UnsupportedUI.Card.Visible = Unsupported
    if Unsupported and not NotifiedUnsupported then
        NotifiedUnsupported = true
        SetStatus("This game isn't supported  •  You can send a request", "Hot")
    end
end
UpdateSupportState()
Req.Start()

UnsupportedUI.Select.MouseButton1Click:Connect(function()
    if Busy or Destroyed then return end
    local Left = Req.Left()
    if Left > 0 then
        SetStatus("Request cooldown  •  You can send another in " .. Req.FormatLong(Left), "Warn")
        return
    end
    if Req.Sending then return end
    PendingAction = "Request"
    PendingURL = nil
    ShowModal(
        "UNSUPPORTED GAME",
        "The game you're currently in is " .. Hl(Esc(CurrentGameName)) .. ", which is "
            .. Tint("Bad", "<b>unsupported</b>") .. ".\n\n"
            .. "Would you like to send a request for this game through our Discord server?\n"
            .. '<font size="11">Your Roblox username will be included.</font>',
        "SEND REQUEST"
    )
end)

VP.Premium.MouseButton1Click:Connect(function()
    if SelectedGame then
        OpenVersionConfirmation("Premium", SelectedGame.Premium)
    end
end)

VP.Freemium.MouseButton1Click:Connect(function()
    if SelectedGame then
        OpenVersionConfirmation("Freemium", SelectedGame.Freemium)
    end
end)

VP.Notice.MouseButton1Click:Connect(function()
    if Destroyed or Busy then return end
    PendingAction = "Notice"
    PendingURL = nil
    ShowModal(
        "PREMIUM NOTICE",
        "Premium keys are purchased through our Discord server. Continue to copy the invite link.",
        "COPY DISCORD"
    )
end)

Hooks[#Hooks + 1] = function()
    VP.Sub.TextColor3 = T[VP.SubKey]
end

Md.Cancel.MouseButton1Click:Connect(function()
    if Destroyed then return end
    PendingAction = nil
    PendingURL = nil
    HideModal()
end)

Md.Continue.MouseButton1Click:Connect(function()
    if Destroyed or Busy or not PendingAction then return end

    if PendingAction == "DevNotice" then
        PendingAction = nil
        PendingURL = nil
        HideModal()
        SetStatus("This script is in development  •  Coming soon", "Warn")
        return
    end

    if PendingAction == "Notice" then
        PendingAction = nil
        HideModal()
        if CopyText(Config.Discord) then
            SetStatus("Discord invite copied!", "Good")
        else
            SetStatus("Unable to copy Discord invite.", "Bad")
        end
        return
    end

    if PendingAction == "Request" then
        PendingAction = nil
        HideModal()

        local Left = Req.Left()
        if Left > 0 then
            SetStatus("Request cooldown  •  You can send another in " .. Req.FormatLong(Left), "Warn")
            return
        end
        if Req.Sending then return end

        Req.Sending = true
        SetStatus("Sending request...", "Info")
        Defer(function()
            local Ok, Err = Req.Send()
            Req.Sending = false
            if Ok then
                Req.Save(os.time())
            end
            if Destroyed then return end
            if Ok then
                Req.Start()
                SetStatus("Request sent!  •  You can request again in 1 hour", "Good")
            elseif Err == "nowebhook" then
                SetStatus("Requests are currently unavailable.", "Bad")
            else
                SetStatus("Failed to send request. Try again.", "Bad")
            end
        end)
        return
    end

    if PendingAction == "Game" then
        PendingAction = nil
        HideModal()
        if not SelectedGame then return end

        local UI = Entries[SelectedGame]
        VP.Name.Text = SelectedGame.Name
        VP.Icon.Image = UI and UI.Icon.Image or ""

        if IsDev(SelectedGame) then
            VP.Sub.Text = "In development  •  Scripts aren't available yet"
            VP.SubKey = "Warn"
            SetStatus("In development  •  Script not available yet", "Warn")
        else
            VP.Sub.Text = "Game ID: " .. IdStr(SelectedGame.PlaceId) .. "\nSelect Premium or Freemium"
            VP.SubKey = "Text"
            SetStatus("Game selected  •  Choose Premium or Freemium", "Good")
        end
        VP.Sub.TextColor3 = T[VP.SubKey]

        Navigate("Versions")
        return
    end

    if PendingAction == "Version" then
        if SelectedGame and not IsInGame(SelectedGame) then
            PendingAction = "Force"
            ShowModal(
                "UNSUPPORTED GAME",
                "This script is made for " .. Hl(Esc(SelectedGame.Name)) .. ", but you're in "
                    .. Hl(Esc(CurrentGameName)) .. ". "
                    .. Tint("Bad", "It isn't supported in this game.") .. "\n\n"
                    .. "Do you want to still execute this script?",
                "EXECUTE ANYWAY"
            )
            return
        end

        local URL = PendingURL
        PendingAction = nil
        PendingURL = nil
        ExecuteScript(URL)
        return
    end

    if PendingAction == "Force" then
        local URL = PendingURL
        PendingAction = nil
        PendingURL = nil
        ExecuteScript(URL)
    end
end)

VP.Back.MouseButton1Click:Connect(function()
    if Destroyed or Busy then return end
    Navigate("Games")
    SetStatus("Ready  •  Choose a supported game", "Good")
end)

TabGames.MouseButton1Click:Connect(function()
    if Destroyed or Busy or CurrentPage == "Games" then return end
    Navigate("Games")
    SetStatus("Ready  •  Choose a supported game", "Good")
end)

TabChangelogs.MouseButton1Click:Connect(function()
    if Destroyed or Busy or CurrentPage == "Changelogs" then return end
    Navigate("Changelogs")
    local Picked = Ui.ChangelogGame()
    if Picked then
        SetStatus("Viewing changelogs  •  " .. Picked.Name, "Info")
    else
        SetStatus("Changelogs  •  Select a game from the dropdown", "Info")
    end
end)

CloseButton.MouseButton1Click:Connect(DestroyLauncher)
MinButton.MouseButton1Click:Connect(function()
    SetHidden(true)
end)
BubbleButton.MouseButton1Click:Connect(function()
    SetHidden(false)
end)

Connect(UserInputService.InputBegan, function(Input, Processed)
    if Processed or Destroyed then return end
    if Input.KeyCode == Config.ToggleKey then
        SetHidden(not Hidden)
    end
end)

local Drag = { Active = false }

local function OverlayOpen()
    return Md.Frame.Visible
end

TopBar.InputBegan:Connect(function(Input)
    if OverlayOpen() then return end
    if Input.UserInputType == Enum.UserInputType.MouseButton1
        or Input.UserInputType == Enum.UserInputType.Touch then
        Drag.Active = true
        Drag.Start = Input.Position
        Drag.From = Root.Position
        Input.Changed:Connect(function()
            if Input.UserInputState == Enum.UserInputState.End then
                Drag.Active = false
            end
        end)
    end
end)

TopBar.InputChanged:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseMovement
        or Input.UserInputType == Enum.UserInputType.Touch then
        Drag.Input = Input
    end
end)

Connect(UserInputService.InputChanged, function(Input)
    if Input == Drag.Input and Drag.Active and not OverlayOpen() then
        local Delta = (Input.Position - Drag.Start) / RootScale.Scale
        Root.Position = UDim2.new(
            Drag.From.X.Scale, Drag.From.X.Offset + Delta.X,
            Drag.From.Y.Scale, Drag.From.Y.Offset + Delta.Y
        )
    end
end)

local MaintenancePage

local function ShowMaintenance()
    if MaintenancePage or Destroyed then return end
    if Ui.CloseDropdown then
        Ui.CloseDropdown()
    end

    local Holder = New("Frame", {
        Name = "MaintenanceHolder",
        Position = UDim2.fromOffset(0, 70),
        Size = UDim2.new(1, 0, 1, -140),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        ZIndex = 5,
    }, MainFrame)

    local Page = New("Frame", {
        Name = "Maintenance",
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(1, 0),
        BackgroundTransparency = 1,
    }, Holder)
    MaintenancePage = Page

    local Header = New("Frame", {
        Position = UDim2.fromOffset(16, 4),
        Size = UDim2.new(1, -32, 0, 78),
    }, Page)
    Surface(Header, 14, false)

    local IconBox = New("Frame", {
        Position = UDim2.fromOffset(8, 7),
        Size = UDim2.fromOffset(64, 64),
        BorderSizePixel = 0,
    }, Header)
    Bind(IconBox, "BackgroundColor3", "SurfaceHi")
    Corner(IconBox, 12)
    do
        local S = New("UIStroke", {
            Thickness = 1.5,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        }, IconBox)
        Bind(S, "Color", "Warn")
    end
    Label({
        Size = UDim2.fromScale(1, 1),
        Text = "!",
        TextSize = 30,
        Font = Enum.Font.GothamBlack,
    }, IconBox, "Warn")

    Label({
        Position = UDim2.fromOffset(82, 12),
        Size = UDim2.new(1, -92, 0, 24),
        Text = "Toolkit Maintenance",
        TextSize = 18,
        Font = Enum.Font.GothamBlack,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
    }, Header)

    Label({
        Position = UDim2.fromOffset(82, 38),
        Size = UDim2.new(1, -92, 0, 28),
        Text = "The script is being fixed by the owner.",
        TextSize = 12,
        Font = Enum.Font.GothamMedium,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
    }, Header, "Warn")

    local MsgCard = New("Frame", {
        Position = UDim2.fromOffset(16, 92),
        Size = UDim2.new(1, -32, 1, -92 - 48),
    }, Page)
    Surface(MsgCard, 14, false)

    Label({
        Position = UDim2.fromOffset(14, 12),
        Size = UDim2.new(1, -28, 0, 12),
        Text = "MESSAGE BY OWNER",
        TextSize = 10,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, MsgCard, "Muted")

    Label({
        Position = UDim2.fromOffset(14, 32),
        Size = UDim2.new(1, -28, 1, -64),
        Text = Config.OwnerMessage,
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
    }, MsgCard)

    Label({
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.new(0, 14, 1, -12),
        Size = UDim2.new(1, -28, 0, 14),
        Text = Config.Discord,
        TextSize = 11,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
    }, MsgCard, "AccentB")

    local MaintDiscord = GradButton(
        Page, "JOIN OUR DISCORD",
        UDim2.new(1, -32, 0, 38), UDim2.new(0, 16, 1, -42), 12
    )

    MaintDiscord.MouseButton1Click:Connect(function()
        if DiscordBusy or Destroyed then return end
        DiscordBusy = true
        if CopyText(Config.Discord) then
            SetStatus("Discord invite copied!", "Good")
            MaintDiscord.Text = "LINK COPIED!"
        else
            SetStatus("Unable to copy Discord invite.", "Bad")
            MaintDiscord.Text = "COPY FAILED"
        end
        After(1.4, function()
            if not Destroyed then
                MaintDiscord.Text = "JOIN OUR DISCORD"
                DiscordBusy = false
            end
        end)
    end)

    TabBar.Visible = false
    Pages.Visible = false
    SetStatus("Under maintenance  •  Please wait for the update", "Warn")
    Tween(Page, 0.45, { Position = UDim2.fromScale(0, 0) })
end

local Intro = nil

local function TriggerFetchAfterIntro()
    if not Config.Status then return end

    for Index, Game in ipairs(Games) do
        local UI = Entries[Game]
        if UI then
            After((Index - 1) * 0.12, function()
                if not Destroyed then
                    RefreshGame(Game, UI)
                end
            end)
        end
    end
end

local function FinishSplash()
    if not SplashAlive then return end
    SplashAlive = false
    SplashParticles = {}
    SplashOrbs = {}
    pcall(function() Splash:Destroy() end)
    MainFrame.BackgroundTransparency = 0

    if not Config.Status then
        ShowMaintenance()
    end
end

local Elapsed, AnimAcc = 0, 0

local function StepParticles(List, Step)
    for _, P in ipairs(List) do
        local Y = P.Y - P.Speed * Step
        if Y < -0.02 then
            Y = 1.02
        end
        local X = P.X + math.sin(Elapsed + P.Drift) * 0.018 * Step
        P.X, P.Y = X, Y
        P.Obj.Position = UDim2.fromScale(X, Y)
    end
end

Connect(RunService.RenderStepped, function(Dt)
    if Destroyed then return end

    Clock += Dt
    for I = #Timers, 1, -1 do
        local Timer = Timers[I]
        if Clock >= Timer.At then
            table.remove(Timers, I)
            pcall(Timer.Fn)
        end
    end

    if Req.Active then
        Req.Acc += Dt
        if Req.Acc >= 1 then
            Req.Acc = 0
            local Remaining = Req.Left()
            Req.Render(Remaining)
            if Remaining <= 0 then
                Req.Active = false
            end
        end
    end

    for UI, A in pairs(LiveAnims) do
        A.T += Dt / LIVE_TIME
        local Done = A.T >= 1
        if UI.Players.Parent then
            local Value = Done and A.To or (A.From + (A.To - A.From) * (1 - (1 - A.T) ^ 4))
            local Shown = math.floor(Value + 0.5)
            if Done or Shown ~= A.Shown then
                A.Shown = Shown
                UI.LiveValue = Value
                UI.LiveVisits = A.Visits
                UI.Players.Text = LiveText(Value, A.Visits)
            end
        else
            Done = true
        end
        if Done then
            LiveAnims[UI] = nil
        end
    end

    if not Started then return end

    if Intro then

        local Now = os.clock() - Intro.Start

        local Typed = math.min(SplashTitleLen, math.floor(Now / 0.02) + 1)
        if Typed ~= Intro.Typed then
            Intro.Typed = Typed
            SplashTitle.MaxVisibleGraphemes = Typed
        end

        if Intro.Stage < 1 and Now >= 1.2 then
            Intro.Stage = 1
            SplashSub.Text = "Syncing game data..."
        end
        if Intro.Stage < 2 and Now >= 2.4 then
            Intro.Stage = 2
            SplashSub.Text = "Ready."
        end
        if Intro.Stage < 3 and Now >= 2.8 then
            Intro.Stage = 3
            Intro = nil
            FinishSplash()
            TriggerFetchAfterIntro()
        end
    end

    if Hidden then return end

    Elapsed += Dt

    BorderGrad.Rotation = (Elapsed * 45) % 360
    SpinOrbs(Orbs, Elapsed)
    if SplashAlive then
        SpinOrbs(SplashOrbs, Elapsed)
    end

    AnimAcc += Dt
    if AnimAcc < ANIM_STEP then return end
    local Step = math.min(AnimAcc, 0.1)
    AnimAcc = 0

    StepOrbs(Orbs, Elapsed)
    StepContours(Elapsed)
    if SplashAlive then
        StepOrbs(SplashOrbs, Elapsed)
        StepParticles(SplashParticles, Step)
    end
    StepParticles(Particles, Step)
end)

local function BeginIntro()
    if Destroyed then return end

    Started = true
    TargetScale = ComputeScale()
    Root.Visible = true

    if not Config.ShowIntro then
        RootScale.Scale = TargetScale
        FinishSplash()
        TriggerFetchAfterIntro()
        return
    end

    RootScale.Scale = TargetScale * 0.85
    Tween(RootScale, 0.4, { Scale = TargetScale }, Enum.EasingStyle.Back)
    Tween(SplashLogo, 0.35, { Size = UDim2.fromOffset(76, 76) }, Enum.EasingStyle.Back)
    Tween(BarFill, 1.2, { Size = UDim2.fromScale(1, 1) }, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
    Intro = { Start = os.clock(), Typed = 0, Stage = 0 }

    task.delay(Config.IntroWatchdog, function()
        if Destroyed or not SplashAlive then return end
        Intro = nil
        FinishSplash()
        TriggerFetchAfterIntro()
    end)
end

task.spawn(function()
    local Deadline = os.clock() + Config.LoadTimeout
    while (not game:IsLoaded() or not workspace.CurrentCamera) and os.clock() < Deadline do
        task.wait(0.1)
    end

    task.wait(Rng:NextNumber(Config.IntroDelayMin, Config.IntroDelayMax))
    if Destroyed then return end

    local Ok, Err = pcall(BeginIntro)
    if not Ok then
        warn("[Toolkit Loader] Intro failed, skipping: " .. tostring(Err))
        Started = true
        Root.Visible = true
        FinishSplash()
        TriggerFetchAfterIntro()
    end
end)
