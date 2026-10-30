

local Config = {
    Discord = "https://discord.gg/RQRZ7XkfCy",
    Webhook = "https://discord.com/api/webhooks/1562754643749240942/HU7xje7GbsfR2d_eWfWVSZudPJgHvs_ZhRegvnw0o1rEV8bowjx2lRJdqgMkxvGDeMXE",
    TikTokHandle = "@knorkzykiiph",
    TikTokLink = "https://www.tiktok.com/@knorkzykiiph",
    Name = "ToolkitLoader",
    Tagline = "Access Beyond Ordinary",
    Version = "v2.6",
    ToggleKey = Enum.KeyCode.RightShift,
    ShowIntro = true,
    RequestCooldown = 3600,
    IntroDelayMin = 0.8,
    IntroDelayMax = 1.4,
    LoadTimeout = 8,
    IntroWatchdog = 7,
}

local Games = {
    {
        Name = "Karinderya",
        PlaceId = 116497287371701,
        Premium = "https://api.jnkie.com/api/v1/luascripts/public/38b2a99318e9f8d5e0a7a541d9408c768d6a0cf0281f1764b281d727cb283ffa/download",
        Freemium = "https://api.jnkie.com/api/v1/luascripts/public/51f8541bf425b9feb765caaa9364b1a2d250436a35732a2f10c30153888ca976/download",
    },
    {
        Name = "Run a Sari Sari Store",
        PlaceId = 104178853788462,
        Premium = "https://api.jnkie.com/api/v1/luascripts/public/0858084d4c5d970e0404f4c685044676f4129d385ae4e44f47d77f0c2f734429/download",
        Freemium = "https://api.jnkie.com/api/v1/luascripts/public/7f511b650d4aa36024470a6f64e9d4848b18db531585cadbaea6878a94047ee4/download",
    },
    {
        Name = "Merkado",
        PlaceId = 89720771756768,
        Premium = "https://api.jnkie.com/api/v1/luascripts/public/6365bb4f49aabfb9900065b1722df3d5f7883310d185cb21502e64961eac39e3/download",
        Freemium = "https://api.jnkie.com/api/v1/luascripts/public/6365bb4f49aabfb9900065b1722df3d5f7883310d185cb21502e64961eac39e3/download",
    },
    {
        Indev = true,
        Name = "Bahay Kubo Garden",
        PlaceId = 81403703556465,
        Premium = "",
        Freemium = "",
     },
    {
        Indev = true,
        Name = "Junkyard Simulator",
        PlaceId = 111888054056100,
        Premium = "",
        Freemium = "",
     },
    {
        Indev = true,
        Name = "Pa Deliver",
        PlaceId = 115305706413475,
        Premium = "",
        Freemium = "",
    },
    {
        Indev = true,
        Name = "My Sari Sari Store",
        PlaceId = 135837745814150,
        Premium = "",
        Freemium = "",
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

local Theme = {
    Bg = Color3.fromRGB(9, 9, 16),
    Bg2 = Color3.fromRGB(18, 14, 34),
    Card = Color3.fromRGB(19, 18, 32),
    CardHover = Color3.fromRGB(27, 24, 46),
    Stroke = Color3.fromRGB(42, 40, 66),
    Text = Color3.fromRGB(242, 240, 255),
    Muted = Color3.fromRGB(178, 175, 205),
    Violet = Color3.fromRGB(139, 92, 255),
    Cyan = Color3.fromRGB(34, 211, 238),
    Pink = Color3.fromRGB(255, 77, 166),
    Teal = Color3.fromRGB(20, 184, 166),
    Blue = Color3.fromRGB(59, 130, 246),
    Blurple = Color3.fromRGB(88, 101, 242),
    Green = Color3.fromRGB(74, 222, 128),
    Red = Color3.fromRGB(248, 113, 113),
    Amber = Color3.fromRGB(251, 191, 36),
}

local BASE_W, BASE_H = 460, 460
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
    local T = TweenService:Create(
        Object,
        TweenInfo.new(Time, Style or QuartOut, Direction or DirOut),
        Props
    )
    T:Play()
    return T
end

local function Corner(Parent, Radius)
    return New("UICorner", { CornerRadius = UDim.new(0, Radius or 10) }, Parent)
end

local function Stroke(Parent, Color, Thickness, Transparency)
    return New("UIStroke", {
        Color = Color or Theme.Stroke,
        Thickness = Thickness or 1,
        Transparency = Transparency or 0,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    }, Parent)
end

local function Gradient(Parent, A, B, Rotation)
    return New("UIGradient", {
        Color = ColorSequence.new(A, B),
        Rotation = Rotation or 0,
    }, Parent)
end

local function Pad(Parent, L, T, R, B)
    return New("UIPadding", {
        PaddingLeft = UDim.new(0, L),
        PaddingTop = UDim.new(0, T),
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
    DisplayOrder = 999999,
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

local Destroyed, Busy = false, false
local Started = false
local SelectedGame, PendingAction, PendingURL
local DiscordBusy = false
local NotifiedUnsupported = false
local ModalToken = 0
local Connections = {}
local Entries = {}
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

New("ImageLabel", {
    Name = "Glow",
    BackgroundTransparency = 1,
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.new(1, 70, 1, 70),
    Image = "rbxassetid://6014261993",
    ImageColor3 = Theme.Violet,
    ImageTransparency = 0.55,
    ScaleType = Enum.ScaleType.Slice,
    SliceCenter = Rect.new(49, 49, 450, 450),
    ZIndex = 1,
}, Root)

local Main = New("Frame", {
    Name = "Main",
    Size = UDim2.fromScale(1, 1),
    BackgroundColor3 = White,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    ZIndex = 2,
}, Root)

Corner(Main, MAIN_RADIUS)
Gradient(Main, Theme.Bg2, Theme.Bg, 135)

local BorderStroke = Stroke(Main, White, 1.5, 0.1)
local BorderGrad = New("UIGradient", {
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Theme.Violet),
        ColorSequenceKeypoint.new(0.33, Theme.Cyan),
        ColorSequenceKeypoint.new(0.66, Theme.Pink),
        ColorSequenceKeypoint.new(1, Theme.Violet),
    }),
}, BorderStroke)

local Background = New("CanvasGroup", {
    Name = "Background",
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ZIndex = 1,
}, Main)
Corner(Background, MAIN_RADIUS)

local function Orb(Color, X, Y, Size, Transparency, Parent)
    return New("ImageLabel", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(X, Y),
        Size = UDim2.fromOffset(Size, Size),
        Image = "rbxassetid://6014261993",
        ImageColor3 = Color,
        ImageTransparency = Transparency,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(49, 49, 450, 450),
        ZIndex = 1,
    }, Parent)
end

local Orb1 = Orb(Theme.Violet, 0.12, 0.1, 340, 0.72, Background)
local Orb2 = Orb(Theme.Cyan, 0.95, 0.95, 320, 0.72, Background)

local Rng = Random.new()

local function MakeParticles(Parent, Count)
    local List = {}
    for I = 1, Count do
        local S = Rng:NextInteger(2, 3)
        local X, Y = Rng:NextNumber(), Rng:NextNumber()
        local P = New("Frame", {
            Size = UDim2.fromOffset(S, S),
            Position = UDim2.fromScale(X, Y),
            BackgroundColor3 = (I % 2 == 0) and Theme.Violet or Theme.Cyan,
            BackgroundTransparency = Rng:NextNumber(0.6, 0.9),
            BorderSizePixel = 0,
            ZIndex = 1,
        }, Parent)
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

local function GradButton(Parent, Text, Size, Position, ColA, ColB, TextSize)
    local Holder = New("Frame", {
        Size = Size,
        Position = Position,
        BackgroundColor3 = White,
        BorderSizePixel = 0,
    }, Parent)
    Corner(Holder, 10)
    local G = Gradient(Holder, ColA, ColB, 20)
    local S = Stroke(Holder, White, 1, 0.85)

    local Button = New("TextButton", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        AutoButtonColor = false,
        Text = Text,
        TextColor3 = White,
        TextSize = TextSize or 12,
        Font = Enum.Font.GothamBold,
    }, Holder)

    Button.MouseEnter:Connect(function()
        Tween(S, 0.18, { Transparency = 0.3 })
        Tween(G, 0.45, { Rotation = 200 })
    end)
    Button.MouseLeave:Connect(function()
        Tween(S, 0.18, { Transparency = 0.85 })
        Tween(G, 0.45, { Rotation = 20 })
    end)

    return Button, Holder
end

local function IconButton(Parent, Text, Position, HoverColor)
    local B = New("TextButton", {
        Size = UDim2.fromOffset(28, 28),
        Position = Position,
        BackgroundColor3 = Theme.Card,
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Text = Text,
        TextColor3 = Theme.Muted,
        TextSize = 16,
        Font = Enum.Font.GothamBold,
    }, Parent)
    Corner(B, 8)
    Stroke(B, Theme.Stroke, 1)
    B.MouseEnter:Connect(function()
        Tween(B, 0.15, { BackgroundColor3 = HoverColor, TextColor3 = Theme.Text })
    end)
    B.MouseLeave:Connect(function()
        Tween(B, 0.15, { BackgroundColor3 = Theme.Card, TextColor3 = Theme.Muted })
    end)
    return B
end

local TopBar = New("Frame", {
    Name = "TopBar",
    Size = UDim2.new(1, 0, 0, 66),
    BackgroundTransparency = 1,
    ZIndex = 5,
}, Main)

local Logo = New("ImageLabel", {
    Size = UDim2.fromOffset(40, 40),
    Position = UDim2.fromOffset(16, 13),
    BackgroundColor3 = Theme.Bg2,
    BorderSizePixel = 0,
    Image = "rbxthumb://type=Asset&id=88492989421310&w=768&h=432",
    ScaleType = Enum.ScaleType.Crop,
}, TopBar)
Corner(Logo, 12)
local LogoGrad = Gradient(Logo, Theme.Violet, Theme.Cyan, 45)
Stroke(Logo, White, 1, 0.75)

New("TextLabel", {
    Position = UDim2.fromOffset(66, 12),
    Size = UDim2.new(1, -170, 0, 24),
    BackgroundTransparency = 1,
    RichText = true,
    Text = 'TOOLKIT <font color="#8B5CFF">LOADER</font>',
    TextColor3 = Theme.Text,
    TextSize = 18,
    Font = Enum.Font.GothamBlack,
    TextXAlignment = Enum.TextXAlignment.Left,
}, TopBar)

New("TextLabel", {
    Position = UDim2.fromOffset(66, 37),
    Size = UDim2.new(1, -170, 0, 14),
    BackgroundTransparency = 1,
    Text = Config.Tagline .. "  •  " .. Config.Version,
    TextColor3 = Theme.Muted,
    TextSize = 10,
    Font = Enum.Font.GothamMedium,
    TextXAlignment = Enum.TextXAlignment.Left,
}, TopBar)

local CloseButton = IconButton(TopBar, "×", UDim2.new(1, -44, 0, 19), Theme.Red)
local MinButton = IconButton(TopBar, "–", UDim2.new(1, -78, 0, 19), Theme.Violet)

local Divider = New("Frame", {
    Position = UDim2.fromOffset(16, 65),
    Size = UDim2.new(1, -32, 0, 1),
    BackgroundColor3 = White,
    BorderSizePixel = 0,
    ZIndex = 5,
}, Main)
New("UIGradient", {
    Color = ColorSequence.new(Theme.Violet, Theme.Cyan),
    Transparency = NumberSequence.new(0.2, 1),
}, Divider)

local Pages = New("Frame", {
    Name = "Pages",
    Position = UDim2.fromOffset(0, 70),
    Size = UDim2.new(1, 0, 1, -140),
    BackgroundTransparency = 1,
    ClipsDescendants = true,
    ZIndex = 5,
}, Main)

local HomePage = New("Frame", {
    Name = "Home",
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

local StatusBar = New("Frame", {
    Position = UDim2.new(0, 16, 1, -60),
    Size = UDim2.new(1, -32, 0, 46),
    BackgroundColor3 = Theme.Card:Lerp(Theme.Green, 0.16),
    BorderSizePixel = 0,
    ZIndex = 5,
}, Main)
Corner(StatusBar, 12)
local StatusStroke = Stroke(StatusBar, Theme.Green, 1.5, 0)

local StatusDot = New("Frame", {
    Size = UDim2.fromOffset(14, 14),
    Position = UDim2.new(0, 14, 0.5, -7),
    BackgroundColor3 = Theme.Green,
    BorderSizePixel = 0,
}, StatusBar)
Corner(StatusDot, 7)
Pulse(StatusDot, "BackgroundTransparency", 0, 0.5, 0.8)

local Status = New("TextLabel", {
    Position = UDim2.fromOffset(38, 0),
    Size = UDim2.new(1, -50, 1, 0),
    BackgroundTransparency = 1,
    Text = "Ready  •  Choose a supported game",
    TextColor3 = White,
    TextSize = 15,
    Font = Enum.Font.GothamBold,
    TextWrapped = true,
    TextXAlignment = Enum.TextXAlignment.Left,
}, StatusBar)

local function SetStatus(Text, Color)
    Color = Color or Theme.Green
    Status.Text = Text
    Tween(StatusDot, 0.2, { BackgroundColor3 = Color })
    Tween(StatusBar, 0.25, { BackgroundColor3 = Theme.Card:Lerp(Color, 0.16) })
    StatusStroke.Color = Color
    StatusStroke.Thickness = 3.5
    Tween(StatusStroke, 0.6, { Thickness = 1.5 })
end

local DiscordButton = GradButton(
    HomePage, "JOIN OUR DISCORD",
    UDim2.fromOffset(250, 38), UDim2.fromOffset(16, 4),
    Theme.Blurple, Theme.Violet, 12
)

local TikTokChip = New("TextButton", {
    Position = UDim2.fromOffset(274, 4),
    Size = UDim2.fromOffset(170, 38),
    BackgroundColor3 = Theme.Card,
    BorderSizePixel = 0,
    AutoButtonColor = false,
    Text = "",
}, HomePage)
Corner(TikTokChip, 10)
local TikTokStroke = Stroke(TikTokChip, Theme.Stroke, 1)
New("TextLabel", {
    Position = UDim2.fromOffset(12, 5),
    Size = UDim2.new(1, -24, 0, 12),
    BackgroundTransparency = 1,
    Text = "FOLLOW ON TIKTOK",
    TextColor3 = Theme.Muted,
    TextSize = 8,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left,
}, TikTokChip)
New("TextLabel", {
    Position = UDim2.fromOffset(12, 18),
    Size = UDim2.new(1, -24, 0, 16),
    BackgroundTransparency = 1,
    Text = Config.TikTokHandle,
    TextColor3 = Theme.Text,
    TextSize = 13,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left,
    TextTruncate = Enum.TextTruncate.AtEnd,
}, TikTokChip)
TikTokChip.MouseEnter:Connect(function()
    Tween(TikTokStroke, 0.15, { Color = Theme.Pink })
end)
TikTokChip.MouseLeave:Connect(function()
    Tween(TikTokStroke, 0.15, { Color = Theme.Stroke })
end)

New("TextLabel", {
    Position = UDim2.fromOffset(18, 52),
    Size = UDim2.fromOffset(200, 14),
    BackgroundTransparency = 1,
    Text = "SUPPORTED GAMES",
    TextColor3 = Theme.Muted,
    TextSize = 10,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left,
}, HomePage)

local DevCount = 0
for _, G in ipairs(Games) do
    if IsDev(G) then
        DevCount += 1
    end
end

New("TextLabel", {
    Position = UDim2.new(1, -218, 0, 52),
    Size = UDim2.fromOffset(200, 14),
    BackgroundTransparency = 1,
    Text = tostring(#Games - DevCount) .. " AVAILABLE"
        .. (DevCount > 0 and ("  •  " .. tostring(DevCount) .. " IN DEV") or ""),
    TextColor3 = Theme.Violet,
    TextSize = 10,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Right,
}, HomePage)

local GameList = New("ScrollingFrame", {
    Position = UDim2.fromOffset(16, 72),
    Size = UDim2.new(1, -32, 1, -72),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ScrollBarThickness = 3,
    ScrollBarImageColor3 = Theme.Violet,
    CanvasSize = UDim2.new(),
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    ScrollingDirection = Enum.ScrollingDirection.Y,
}, HomePage)

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

New("TextLabel", {
    AnchorPoint = Vector2.new(0, 0.5),
    Position = UDim2.new(0, 2, 0.5, 0),
    Size = UDim2.fromOffset(112, 14),
    BackgroundTransparency = 1,
    Text = "IN DEVELOPMENT",
    TextColor3 = Theme.Amber,
    TextSize = 10,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left,
}, DevDivider)

New("Frame", {
    AnchorPoint = Vector2.new(0, 0.5),
    Position = UDim2.new(0, 116, 0.5, 0),
    Size = UDim2.new(1, -116, 0, 1),
    BackgroundColor3 = Theme.Amber,
    BackgroundTransparency = 0.7,
    BorderSizePixel = 0,
}, DevDivider)

local CARD_H = 88

local function ApplyCardLayout(UI, Big, Animate)
    UI.Big = Big

    local IconSize = 64
    local TextX = IconSize + 24
    local Right = 112

    UI.BaseStroke = Big and Theme.Green or Theme.Stroke
    UI.BaseBg = Big and Theme.Card:Lerp(Theme.Green, 0.07) or Theme.Card

    local function Set(Object, Props)
        if Animate then
            Tween(Object, 0.3, Props)
        else
            for Key, Value in pairs(Props) do
                Object[Key] = Value
            end
        end
    end

    Set(UI.Card, { Size = UDim2.new(1, -4, 0, CARD_H), BackgroundColor3 = UI.BaseBg })
    Set(UI.Stroke, { Color = UI.BaseStroke, Thickness = Big and 2 or 1.2 })
    Set(UI.Icon, { Size = UDim2.fromOffset(IconSize, IconSize) })

    Set(UI.Name, {
        Position = UDim2.fromOffset(TextX, 11),
        Size = UDim2.new(1, -(TextX + Right), 0, 20),
        TextSize = 15,
    })

    Set(UI.Dot, { Position = UDim2.fromOffset(TextX + 1, 41) })

    Set(UI.Players, {
        Position = UDim2.fromOffset(TextX + 15, 34),
        Size = UDim2.new(1, -(TextX + 15 + Right), 0, 22),
        TextSize = 12,
    })

    Set(UI.Badges, {
        Position = UDim2.fromOffset(TextX, 61),
        Size = UDim2.new(1, -(TextX + Right), 0, 18),
    })

    Set(UI.SelectHolder, {
        Size = UDim2.fromOffset(92, 36),
        Position = UDim2.new(1, -104, 0.5, -18),
    })
end

local function CreateGameCard(Game, Order, Opts)
    Opts = Opts or {}
    local UI = {}

    local Card = New("Frame", {
        Name = "Game_" .. IdStr(Game.PlaceId),
        LayoutOrder = Order,
        Size = UDim2.new(1, -4, 0, CARD_H),
        BackgroundColor3 = Theme.Card,
        BorderSizePixel = 0,
    }, GameList)
    Corner(Card, 14)
    local CardStroke = Stroke(Card, Theme.Stroke, 1.2)

    local Icon = New("ImageLabel", {
        Position = UDim2.fromOffset(12, 12),
        Size = UDim2.fromOffset(64, 64),
        BackgroundColor3 = Theme.Bg2,
        BorderSizePixel = 0,
        Image = "",
        ScaleType = Enum.ScaleType.Crop,
    }, Card)
    Corner(Icon, 12)
    Stroke(Icon, Theme.Stroke, 1)

    local NameLabel = New("TextLabel", {
        Position = UDim2.fromOffset(88, 11),
        Size = UDim2.new(1, -200, 0, 20),
        BackgroundTransparency = 1,
        Text = Game.Name,
        TextColor3 = Theme.Text,
        TextSize = 15,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
    }, Card)

    local Dot = New("Frame", {
        Position = UDim2.fromOffset(89, 41),
        Size = UDim2.fromOffset(8, 8),
        BackgroundColor3 = Theme.Muted,
        BorderSizePixel = 0,
    }, Card)
    Corner(Dot, 4)

    local PlayersLabel = New("TextLabel", {
        Position = UDim2.fromOffset(103, 34),
        Size = UDim2.new(1, -215, 0, 22),
        BackgroundTransparency = 1,
        RichText = true,
        Text = "Fetching live players...",
        TextColor3 = Theme.Muted,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
    }, Card)

    local Badges = New("Frame", {
        Position = UDim2.fromOffset(88, 61),
        Size = UDim2.new(1, -200, 0, 18),
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
        BackgroundColor3 = Theme.Muted,
        BackgroundTransparency = 0.88,
        BorderSizePixel = 0,
        Text = "NOT IN THIS GAME",
        TextColor3 = Theme.Muted,
        TextSize = 9,
        Font = Enum.Font.GothamBold,
    }, Badges)
    Corner(Badge, 6)
    Pad(Badge, 8, 0, 8, 0)

    local DevBadge = New("TextLabel", {
        LayoutOrder = 2,
        Size = UDim2.fromOffset(0, 18),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Theme.Amber,
        BackgroundTransparency = 0.85,
        BorderSizePixel = 0,
        Text = "IN DEVELOPMENT",
        TextColor3 = Theme.Amber,
        TextSize = 9,
        Font = Enum.Font.GothamBold,
        Visible = false,
    }, Badges)
    Corner(DevBadge, 6)
    Pad(DevBadge, 8, 0, 8, 0)

    local Select, SelectHolder = GradButton(
        Card, Opts.ButtonText or "SELECT",
        UDim2.fromOffset(92, 36), UDim2.new(1, -104, 0.5, -18),
        Opts.ColA or Theme.Violet, Opts.ColB or Theme.Blue, 12
    )

    UI.Card = Card
    UI.Stroke = CardStroke
    UI.Icon = Icon
    UI.Dot = Dot
    UI.Players = PlayersLabel
    UI.Badge = Badge
    UI.DevBadge = DevBadge
    UI.Badges = Badges
    UI.Select = Select
    UI.SelectHolder = SelectHolder
    UI.Name = NameLabel
    UI.Big = false
    UI.BaseStroke = Theme.Stroke
    UI.BaseBg = Theme.Card

    Card.MouseEnter:Connect(function()
        Tween(CardStroke, 0.2, { Color = Theme.Violet })
        Tween(Card, 0.2, { BackgroundColor3 = Theme.CardHover })
    end)
    Card.MouseLeave:Connect(function()
        Tween(CardStroke, 0.2, { Color = UI.BaseStroke })
        Tween(Card, 0.2, { BackgroundColor3 = UI.BaseBg })
    end)

    return UI
end

local BackButton = New("TextButton", {
    Position = UDim2.fromOffset(16, 4),
    Size = UDim2.fromOffset(84, 30),
    BackgroundColor3 = Theme.Card,
    BorderSizePixel = 0,
    AutoButtonColor = false,
    Text = "<  BACK",
    TextColor3 = Theme.Muted,
    TextSize = 11,
    Font = Enum.Font.GothamBold,
}, VersionPage)
Corner(BackButton, 8)
Stroke(BackButton, Theme.Stroke, 1)
BackButton.MouseEnter:Connect(function()
    Tween(BackButton, 0.15, { TextColor3 = Theme.Text })
end)
BackButton.MouseLeave:Connect(function()
    Tween(BackButton, 0.15, { TextColor3 = Theme.Muted })
end)

local SelectedHeaderCard = New("Frame", {
    Name = "SelectedHeaderCard",
    Position = UDim2.fromOffset(16, 40),
    Size = UDim2.new(1, -32, 0, 78),
    BackgroundColor3 = Theme.Card,
    BorderSizePixel = 0,
}, VersionPage)
Corner(SelectedHeaderCard, 14)
Stroke(SelectedHeaderCard, Theme.Stroke, 1.2)

local PickedIcon = New("ImageLabel", {
    Position = UDim2.fromOffset(8, 7),
    Size = UDim2.fromOffset(64, 64),
    BackgroundColor3 = Theme.Bg2,
    BorderSizePixel = 0,
    ScaleType = Enum.ScaleType.Crop,
}, SelectedHeaderCard)
Corner(PickedIcon, 12)
Stroke(PickedIcon, Theme.Violet, 1.5)

local PickedName = New("TextLabel", {
    Position = UDim2.fromOffset(82, 12),
    Size = UDim2.new(1, -92, 0, 24),
    BackgroundTransparency = 1,
    Text = "",
    TextColor3 = Theme.Text,
    TextSize = 18,
    Font = Enum.Font.GothamBlack,
    TextXAlignment = Enum.TextXAlignment.Left,
    TextTruncate = Enum.TextTruncate.AtEnd,
}, SelectedHeaderCard)

local VersionSub = New("TextLabel", {
    Position = UDim2.fromOffset(82, 38),
    Size = UDim2.new(1, -92, 0, 28),
    BackgroundTransparency = 1,
    Text = "",
    TextColor3 = Theme.Text,
    TextSize = 12,
    Font = Enum.Font.GothamMedium,
    TextXAlignment = Enum.TextXAlignment.Left,
    TextWrapped = true,
}, SelectedHeaderCard)

local function CreateEdition(Key, Title, Chip, Desc, X, ColA, ColB)
    local Card = New("Frame", {
        Name = Key .. "Card",
        Position = UDim2.fromOffset(X, 126),
        Size = UDim2.fromOffset(209, 182),
        BackgroundColor3 = Theme.Card,
        BorderSizePixel = 0,
    }, VersionPage)
    Corner(Card, 14)
    local S = Stroke(Card, White, 1.5, 0.1)
    Gradient(S, ColA, ColB, 45)

    local ChipLabel = New("TextLabel", {
        Position = UDim2.fromOffset(14, 12),
        Size = UDim2.fromOffset(0, 20),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = ColA,
        BackgroundTransparency = 0.82,
        BorderSizePixel = 0,
        Text = Chip,
        TextColor3 = ColA:Lerp(White, 0.35),
        TextSize = 9,
        Font = Enum.Font.GothamBold,
    }, Card)
    Corner(ChipLabel, 6)
    Pad(ChipLabel, 8, 0, 8, 0)

    local TitleLabel = New("TextLabel", {
        Position = UDim2.fromOffset(14, 38),
        Size = UDim2.new(1, -28, 0, 26),
        BackgroundTransparency = 1,
        Text = Title,
        TextColor3 = White,
        TextSize = 20,
        Font = Enum.Font.GothamBlack,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, Card)
    Gradient(TitleLabel, ColA:Lerp(White, 0.25), ColB:Lerp(White, 0.25), 0)

    New("TextLabel", {
        Position = UDim2.fromOffset(14, 68),
        Size = UDim2.new(1, -28, 0, 52),
        BackgroundTransparency = 1,
        RichText = true,
        Text = Desc,
        TextColor3 = Theme.Text,
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
    }, Card)

    local Button = GradButton(
        Card, "LOAD " .. string.upper(Title),
        UDim2.new(1, -28, 0, 38), UDim2.new(0, 14, 1, -50),
        ColA, ColB, 11
    )

    return Button, Card
end

local PremiumButton, PremiumCard = CreateEdition(
    "Premium", "Premium", "VIP ACCESS",
    "• Key Required\n• <font color=\"#8B5CFF\">Buy on Discord</font>",
    16, Theme.Violet, Theme.Pink
)

local FreemiumButton = CreateEdition(
    "Freemium", "Freemium", "Public",
    "• Key Required\n• <font color=\"#22D3EE\">Get Key Link</font>",
    235, Theme.Teal, Theme.Blue
)

local PremiumNotice = New("TextButton", {
    Position = UDim2.new(1, -34, 0, 10),
    Size = UDim2.fromOffset(22, 22),
    BackgroundColor3 = Theme.CardHover,
    BorderSizePixel = 0,
    AutoButtonColor = false,
    Text = "i",
    TextColor3 = Theme.Text,
    TextSize = 11,
    Font = Enum.Font.GothamBold,
}, PremiumCard)
Corner(PremiumNotice, 11)
Stroke(PremiumNotice, Theme.Violet, 1)

local Modal = New("Frame", {
    Name = "Modal",
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Visible = false,
    ZIndex = 40,
}, Main)

local Dim = New("Frame", {
    Size = UDim2.fromScale(1, 1),
    BackgroundColor3 = Color3.new(0, 0, 0),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    Active = true,
    ZIndex = 1,
}, Modal)
Corner(Dim, MAIN_RADIUS)

local Box = New("Frame", {
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.fromOffset(360, 230),
    BackgroundColor3 = Color3.fromRGB(24, 22, 40),
    BorderSizePixel = 0,
    ZIndex = 2,
}, Modal)
Corner(Box, MAIN_RADIUS)
local BoxStroke = Stroke(Box, White, 2, 0.05)
Gradient(BoxStroke, Theme.Violet, Theme.Cyan, 45)
local BoxScale = New("UIScale", { Scale = 1 }, Box)

local ModalTitle = New("TextLabel", {
    Position = UDim2.fromOffset(20, 18),
    Size = UDim2.new(1, -40, 0, 26),
    BackgroundTransparency = 1,
    Text = "",
    TextColor3 = Color3.fromRGB(255, 255, 255),
    TextSize = 16,
    Font = Enum.Font.GothamBlack,
    TextXAlignment = Enum.TextXAlignment.Left,
}, Box)

local ModalDesc = New("TextLabel", {
    Position = UDim2.fromOffset(20, 52),
    Size = UDim2.new(1, -40, 0, 108),
    BackgroundTransparency = 1,
    RichText = true,
    Text = "",
    TextColor3 = Color3.fromRGB(235, 233, 255),
    TextSize = 13,
    Font = Enum.Font.GothamBold,
    TextWrapped = true,
    TextXAlignment = Enum.TextXAlignment.Left,
    TextYAlignment = Enum.TextYAlignment.Top,
}, Box)

local CancelButton = New("TextButton", {
    Position = UDim2.fromOffset(20, 170),
    Size = UDim2.fromOffset(140, 42),
    BackgroundColor3 = Color3.fromRGB(36, 33, 60),
    BorderSizePixel = 0,
    AutoButtonColor = false,
    Text = "CANCEL",
    TextColor3 = Color3.fromRGB(210, 205, 240),
    TextSize = 12,
    Font = Enum.Font.GothamBold,
}, Box)
Corner(CancelButton, 10)
Stroke(CancelButton, Theme.Stroke, 1.2)

local ContinueButton = GradButton(
    Box, "CONTINUE",
    UDim2.fromOffset(160, 42), UDim2.fromOffset(170, 170),
    Theme.Violet, Theme.Blue, 13
)

local function ShowModal(Title, Desc, ContinueText)
    ModalToken += 1
    ModalTitle.Text = Title
    ModalDesc.Text = Desc
    ContinueButton.Text = ContinueText
    Modal.Visible = true
    Dim.BackgroundTransparency = 1
    BoxScale.Scale = 0.88
    Tween(Dim, 0.2, { BackgroundTransparency = 0.4 })
    Tween(BoxScale, 0.3, { Scale = 1 }, Enum.EasingStyle.Back)
end

local function HideModal()
    ModalToken += 1
    local My = ModalToken
    Tween(Dim, 0.15, { BackgroundTransparency = 1 })
    Tween(BoxScale, 0.15, { Scale = 0.92 })
    After(0.16, function()
        if not Destroyed and ModalToken == My then
            Modal.Visible = false
        end
    end)
end

local Splash = New("CanvasGroup", {
    Name = "Splash",
    Size = UDim2.fromScale(1, 1),
    BackgroundColor3 = White,
    BorderSizePixel = 0,
    ZIndex = 100,
}, Main)
Corner(Splash, MAIN_RADIUS)

local SplashAlive = true
local SplashOrb1 = Orb(Theme.Violet, 0.92, 0.08, 320, 0.65, Splash)
local SplashOrb2 = Orb(Theme.Cyan, 0.08, 0.92, 320, 0.65, Splash)
local SplashParticles = MakeParticles(Splash, 8)

local SplashLogo = New("ImageLabel", {
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.new(0.5, 0, 0.5, -52),
    Size = UDim2.fromOffset(0, 0),
    BackgroundColor3 = Theme.Bg,
    BorderSizePixel = 0,
    Image = "rbxthumb://type=Asset&id=88492989421310&w=768&h=432",
    ScaleType = Enum.ScaleType.Crop,
    ZIndex = 2,
}, Splash)
Corner(SplashLogo, 22)
local SplashLogoGrad = Gradient(SplashLogo, Theme.Violet, Theme.Cyan, 45)
Stroke(SplashLogo, White, 1, 0.75)

local SplashTitle = New("TextLabel", {
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.new(0.5, 0, 0.5, 14),
    Size = UDim2.fromOffset(340, 34),
    BackgroundTransparency = 1,
    Text = "TOOLKIT LOADER",
    TextColor3 = Theme.Bg,
    TextSize = 28,
    Font = Enum.Font.GothamBlack,
    MaxVisibleGraphemes = 0,
    ZIndex = 2,
}, Splash)
Gradient(SplashTitle, Theme.Violet, Theme.Cyan, 0)
local SplashTitleLen = #SplashTitle.Text

local SplashSub = New("TextLabel", {
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.new(0.5, 0, 0.5, 48),
    Size = UDim2.fromOffset(300, 16),
    BackgroundTransparency = 1,
    Text = "Initializing...",
    TextColor3 = Color3.fromRGB(100, 100, 120),
    TextSize = 11,
    Font = Enum.Font.GothamMedium,
    ZIndex = 2,
}, Splash)

local BarBg = New("Frame", {
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.new(0.5, 0, 0.5, 76),
    Size = UDim2.fromOffset(220, 4),
    BackgroundColor3 = Color3.fromRGB(220, 220, 230),
    BorderSizePixel = 0,
    ZIndex = 2,
}, Splash)
Corner(BarBg, 2)
local BarFill = New("Frame", {
    Size = UDim2.fromScale(0, 1),
    BackgroundColor3 = White,
    BorderSizePixel = 0,
}, BarBg)
Corner(BarFill, 2)
Gradient(BarFill, Theme.Violet, Theme.Cyan, 0)

local Bubble = New("Frame", {
    Size = UDim2.fromOffset(48, 48),
    Position = UDim2.new(1, -64, 0.5, -24),
    BackgroundColor3 = White,
    BorderSizePixel = 0,
    Visible = false,
}, ScreenGui)
Corner(Bubble, 24)
Gradient(Bubble, Theme.Violet, Theme.Cyan, 45)
Stroke(Bubble, White, 1.5, 0.6)

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

local function LiveText(Playing, Visits)
    local T = '<font color="#F2F0FF"><b>' .. Commify(Playing) .. "</b></font> playing"
    if Visits then
        T ..= "  •  " .. Short(Visits) .. " visits"
    end
    return T
end

local function SetLive(UI, Game, Playing, Visits)
    local From = Game.LastPlaying or 0
    Game.LastPlaying = Playing
    UI.Dot.BackgroundColor3 = Theme.Green
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

local function UpdateBadge(Game, UI, Instant)
    local Here = IsInGame(Game)
    UI.Badge.Text = Here and "CURRENT SERVER" or "NOT IN THIS GAME"
    UI.Badge.TextColor3 = Here and Theme.Green or Theme.Muted
    UI.Badge.BackgroundColor3 = Here and Theme.Green or Theme.Muted
    UI.DevBadge.Visible = IsDev(Game)

    if Here then
        UI.Card.LayoutOrder = IsDev(Game) and (DEV_ORDER_START - 2) or 0
    else
        UI.Card.LayoutOrder = Game.Order or 1
    end

    if UI.Big ~= Here then
        ApplyCardLayout(UI, Here, not Instant)
    end

    UpdateDivider()
end

local function RefreshGame(Game, UI)
    Defer(function()
        if not Game.PlaceId or Game.PlaceId <= 0 then
            UI.Players.Text = "Coming soon"
            UI.Dot.BackgroundColor3 = Theme.Amber
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
            UI.Dot.BackgroundColor3 = Theme.Red
        end
    end)
end

local function GoTo(Page)
    local ToVersions = (Page == "Versions")
    HomePage.Visible = true
    VersionPage.Visible = true
    Tween(HomePage, 0.45, { Position = UDim2.fromScale(ToVersions and -1 or 0, 0) })
    Tween(VersionPage, 0.45, { Position = UDim2.fromScale(ToVersions and 0 or 1, 0) })
    After(0.5, function()
        if Destroyed then return end
        if ToVersions then
            HomePage.Visible = false
        else
            VersionPage.Visible = false
        end
    end)
end

local function OpenGameConfirmation(Game)
    if Busy or Destroyed then return end
    SelectedGame = Game
    PendingAction = "Game"
    PendingURL = nil

    local Desc = 'You selected <font color="#FFFFFF"><b>' .. Game.Name .. "</b></font>.\n\n"
        .. "Continue to choose a script version?"
    if IsDev(Game) then
        Desc ..= '\n<font color="#FBBF24">This game is still in development.</font>'
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
            'Game: <font color="#FFFFFF"><b>' .. SelectedGame.Name .. "</b></font>\nVersion: "
                .. '<font color="#FFFFFF"><b>' .. Version .. "</b></font>\n\n"
                .. '<font color="#FBBF24"><b>This script is in development.</b></font>\n'
                .. "It can't be executed yet. Please check back soon!",
            "OKAY"
        )
        return
    end

    PendingAction = "Version"
    PendingURL = URL
    ShowModal(
        "CONFIRM VERSION",
        'Game: <font color="#FFFFFF"><b>' .. SelectedGame.Name .. "</b></font>\nVersion: "
            .. '<font color="#FFFFFF"><b>' .. Version .. "</b></font>\n\nContinue and load this version?",
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

    local Ok, T = pcall(Tween, RootScale, 0.25, { Scale = 0.8 }, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    if Ok and T then
        T.Completed:Connect(Kill)
    else
        Kill()
    end
end

local function ExecuteScript(URL)
    if Busy or Destroyed or not SelectedGame or not URL or URL == "" then return end

    Busy = true
    HideModal()
    SetStatus("Fetching the selected script...", Theme.Cyan)

    local Success, Response = pcall(function()
        return game:HttpGet(URL)
    end)

    if not Success or type(Response) ~= "string" or Response == "" then
        SetStatus("Failed to fetch the selected script.", Theme.Red)
        Busy = false
        return
    end

    local CompileSuccess, ScriptFunction = pcall(function()
        return loadstring(Response)
    end)

    if not CompileSuccess or type(ScriptFunction) ~= "function" then
        SetStatus("Failed to compile the selected script.", Theme.Red)
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
    UpdateBadge(Game, UI, true)
    UI.Select.MouseButton1Click:Connect(function()
        OpenGameConfirmation(Game)
    end)
end

local CurrentGameName = "Unknown Game"
local COOLDOWN_FILE = "ToolkitLoader_RequestCooldown.txt"
local Sending = false
local CooldownUntil = 0

local function GetLastRequest()
    local Last = 0
    pcall(function()
        if isfile and readfile and isfile(COOLDOWN_FILE) then
            Last = math.max(Last, tonumber(readfile(COOLDOWN_FILE)) or 0)
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

local function SaveLastRequest(Time)
    CooldownUntil = Time + Config.RequestCooldown
    pcall(function()
        if writefile then
            writefile(COOLDOWN_FILE, tostring(Time))
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
    local Last = GetLastRequest()
    if Last > 0 then
        CooldownUntil = Last + Config.RequestCooldown
    end
end

local function CooldownLeft()
    if CooldownUntil <= 0 then
        return 0
    end
    return math.clamp(CooldownUntil - os.time(), 0, Config.RequestCooldown)
end

local function FormatTime(Seconds)
    Seconds = math.floor(Seconds)
    return string.format("%02d:%02d", math.floor(Seconds / 60), Seconds % 60)
end

local function FormatTimeLong(Seconds)
    Seconds = math.floor(Seconds)
    return string.format("%dm %02ds", math.floor(Seconds / 60), Seconds % 60)
end

local TickerActive = false
local TickerAcc = 0

local function RenderCooldown(Left)
    if UnsupportedUI and UnsupportedUI.Card.Visible then
        UnsupportedUI.Select.Text = Left > 0 and FormatTime(Left) or "REQUEST"
    end
end

local function StartCooldownTicker()
    local Left = CooldownLeft()
    RenderCooldown(Left)
    TickerAcc = 0
    TickerActive = Left > 0
end

local function IsSupportedHere()
    for _, G in ipairs(Games) do
        if IsInGame(G) then
            return true
        end
    end
    return false
end

local function FormatCount(Value)
    local Number = tonumber(Value)
    if not Number then
        return "Unavailable"
    end

    Number = math.floor(Number)
    local Formatted = Commify(Number)

    local Label
    if Number >= 1000000000 then
        Label = string.format("%.2f billion", Number / 1000000000)
    elseif Number >= 1000000 then
        Label = string.format("%.2f million", Number / 1000000)
    elseif Number >= 1000 then
        Label = string.format("%.2f thousand", Number / 1000)
    end

    if Label then
        return Formatted .. " (" .. Label .. ")"
    end

    return Formatted
end

local function SendRequest()
    local Url = Config.Webhook

    if type(Url) ~= "string" or not Url:find("^https://") then
        return false, "nowebhook"
    end

    local Req = (syn and syn.request)
        or request
        or http_request
        or (http and http.request)

    if not Req then
        return false, "norequest"
    end

    local PlaceStr = IdStr(game.PlaceId)
    local UniverseId = game.GameId
    local GameName = tostring(CurrentGameName or game.Name)

    local ActivePlayers = #Players:GetPlayers()
    local TotalVisits = nil
    local ThumbnailUrl = nil

    local function GetJson(Endpoint)
        local Ok, Res = pcall(Req, {
            Url = Endpoint,
            Method = "GET",
            Headers = {
                ["Content-Type"] = "application/json",
            },
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

    local GameData = GetJson(
        "https://games.roblox.com/v1/games?universeIds="
            .. IdStr(UniverseId)
    )

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
            .. IdStr(UniverseId)
            .. "&size=512x512&format=Png&isCircular=false"
    )

    if ThumbData and type(ThumbData.data) == "table" then
        local Thumb = ThumbData.data[1]

        if Thumb
            and Thumb.state == "Completed"
            and type(Thumb.imageUrl) == "string" then
            ThumbnailUrl = Thumb.imageUrl
        end
    end

    local Embed = {
        title = "Experience Request",
        description = "A new experience has been submitted for review.",
        color = 9133311,

        fields = {
            {
                name = "Experience",
                value = string.sub(GameName, 1, 200),
                inline = true,
            },
            {
                name = "Place ID",
                value = PlaceStr,
                inline = true,
            },
            {
                name = "Active Players",
                value = FormatCount(ActivePlayers)
                    .. "\nCurrently playing across the experience.",
                inline = true,
            },
            {
                name = "Total Visits",
                value = FormatCount(TotalVisits)
                    .. "\nTotal visits accumulated by the experience.",
                inline = true,
            },
            {
                name = "Game Link",
                value = "https://www.roblox.com/games/" .. PlaceStr,
                inline = false,
            },
            {
                name = "Requested by",
                value = string.sub(
                    LocalPlayer.Name
                        .. " (" .. IdStr(LocalPlayer.UserId) .. ")",
                    1,
                    200
                ),
                inline = false,
            },
        },

        timestamp = DateTime.now():ToIsoDate(),
    }

    if ThumbnailUrl then
        Embed.thumbnail = {
            url = ThumbnailUrl,
        }
    end

    local Payload = HttpService:JSONEncode({
        username = "Toolkit Request",
        embeds = { Embed },
    })

    local Ok, Res = pcall(Req, {
        Url = Url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json",
        },
        Body = Payload,
    })

    if Ok
        and type(Res) == "table"
        and type(Res.StatusCode) == "number"
        and Res.StatusCode >= 200
        and Res.StatusCode < 300 then
        return true
    end

    return false, "failed"
end

UnsupportedUI = CreateGameCard(
    { Name = "Current Game", PlaceId = game.PlaceId }, 0,
    { ButtonText = "REQUEST", ColA = Theme.Pink, ColB = Color3.fromRGB(249, 115, 22) }
)
UnsupportedUI.Card.Visible = false
UnsupportedUI.Dot.BackgroundColor3 = Theme.Red
UnsupportedUI.Players.Text = "This game isn't supported yet"
UnsupportedUI.Badge.Text = "UNSUPPORTED"
UnsupportedUI.Badge.TextColor3 = Theme.Red
UnsupportedUI.Badge.BackgroundColor3 = Theme.Red

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
        SetStatus("This game isn't supported  •  You can send a request", Theme.Pink)
    end
end
UpdateSupportState()
StartCooldownTicker()

UnsupportedUI.Select.MouseButton1Click:Connect(function()
    if Busy or Destroyed then return end
    local Left = CooldownLeft()
    if Left > 0 then
        SetStatus("Request cooldown  •  You can send another in " .. FormatTimeLong(Left), Theme.Amber)
        return
    end
    if Sending then return end
    PendingAction = "Request"
    PendingURL = nil
    ShowModal(
        "UNSUPPORTED GAME",
        "The game you're currently in is "
            .. '<font color="#FFFFFF"><b>' .. Esc(CurrentGameName) .. "</b></font>, which is "
            .. '<font color="#F87171"><b>unsupported</b></font>.\n\n'
            .. "Would you like to send a request for this game through our Discord server?\n"
            .. '<font size="11">Your Roblox username will be included.</font>',
        "SEND REQUEST"
    )
end)

PremiumButton.MouseButton1Click:Connect(function()
    if SelectedGame then
        OpenVersionConfirmation("Premium", SelectedGame.Premium)
    end
end)

FreemiumButton.MouseButton1Click:Connect(function()
    if SelectedGame then
        OpenVersionConfirmation("Freemium", SelectedGame.Freemium)
    end
end)

PremiumNotice.MouseButton1Click:Connect(function()
    if Destroyed or Busy then return end
    PendingAction = "Notice"
    PendingURL = nil
    ShowModal(
        "PREMIUM NOTICE",
        "Premium keys are purchased through our Discord server. Continue to copy the invite link.",
        "COPY DISCORD"
    )
end)

CancelButton.MouseButton1Click:Connect(function()
    if Destroyed then return end
    PendingAction = nil
    PendingURL = nil
    HideModal()
end)

ContinueButton.MouseButton1Click:Connect(function()
    if Destroyed or Busy or not PendingAction then return end

    if PendingAction == "DevNotice" then
        PendingAction = nil
        PendingURL = nil
        HideModal()
        SetStatus("This script is in development  •  Coming soon", Theme.Amber)
        return
    end

    if PendingAction == "Notice" then
        PendingAction = nil
        HideModal()
        if CopyText(Config.Discord) then
            SetStatus("Discord invite copied!", Theme.Green)
        else
            SetStatus("Unable to copy Discord invite.", Theme.Red)
        end
        return
    end

    if PendingAction == "Request" then
        PendingAction = nil
        HideModal()

        local Left = CooldownLeft()
        if Left > 0 then
            SetStatus("Request cooldown  •  You can send another in " .. FormatTimeLong(Left), Theme.Amber)
            return
        end
        if Sending then return end

        Sending = true
        SetStatus("Sending request...", Theme.Cyan)
        Defer(function()
            local Ok, Err = SendRequest()
            Sending = false
            if Ok then
                SaveLastRequest(os.time())
            end
            if Destroyed then return end
            if Ok then
                StartCooldownTicker()
                SetStatus("Request sent!  •  You can request again in 1 hour", Theme.Green)
            elseif Err == "nowebhook" then
                SetStatus("Requests are currently unavailable.", Theme.Red)
            else
                SetStatus("Failed to send request. Try again.", Theme.Red)
            end
        end)
        return
    end

    if PendingAction == "Game" then
        PendingAction = nil
        HideModal()
        if not SelectedGame then return end

        local UI = Entries[SelectedGame]
        PickedName.Text = SelectedGame.Name
        PickedIcon.Image = UI and UI.Icon.Image or ""

        if IsDev(SelectedGame) then
            VersionSub.Text = "In development  •  Scripts aren't available yet"
            VersionSub.TextColor3 = Theme.Amber
            SetStatus("In development  •  Script not available yet", Theme.Amber)
        else
            VersionSub.Text = "Game ID: " .. IdStr(SelectedGame.PlaceId) .. "\nSelect Premium or Freemium"
            VersionSub.TextColor3 = Theme.Text
            SetStatus("Game selected  •  Choose Premium or Freemium", Theme.Green)
        end

        GoTo("Versions")
        return
    end

    if PendingAction == "Version" then
        if SelectedGame and not IsInGame(SelectedGame) then
            PendingAction = "Force"
            ShowModal(
                "UNSUPPORTED GAME",
                "This script is made for "
                    .. '<font color="#FFFFFF"><b>' .. Esc(SelectedGame.Name) .. "</b></font>, but you're in "
                    .. '<font color="#FFFFFF"><b>' .. Esc(CurrentGameName) .. "</b></font>. "
                    .. '<font color="#F87171">It isn\'t supported in this game.</font>\n\n'
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

BackButton.MouseButton1Click:Connect(function()
    if Destroyed or Busy then return end
    SelectedGame = nil
    SetStatus("Ready  •  Choose a supported game", Theme.Green)
    GoTo("Home")
end)

DiscordButton.MouseButton1Click:Connect(function()
    if DiscordBusy or Busy or Destroyed then return end
    DiscordBusy = true

    if CopyText(Config.Discord) then
        SetStatus("Discord invite copied!", Theme.Green)
        DiscordButton.Text = "LINK COPIED!"
    else
        SetStatus("Unable to copy Discord invite.", Theme.Red)
        DiscordButton.Text = "COPY FAILED"
    end

    After(1.4, function()
        if not Destroyed then
            DiscordButton.Text = "JOIN OUR DISCORD"
            DiscordBusy = false
        end
    end)
end)

TikTokChip.MouseButton1Click:Connect(function()
    if Destroyed then return end
    if CopyText(Config.TikTokLink) then
        SetStatus("TikTok link copied!", Theme.Pink)
    else
        SetStatus("Unable to copy TikTok link.", Theme.Red)
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

local Dragging, DragStart, StartPosition, DragInput = false, nil, nil, nil

TopBar.InputBegan:Connect(function(Input)
    if Modal.Visible then return end
    if Input.UserInputType == Enum.UserInputType.MouseButton1
        or Input.UserInputType == Enum.UserInputType.Touch then
        Dragging = true
        DragStart = Input.Position
        StartPosition = Root.Position
        Input.Changed:Connect(function()
            if Input.UserInputState == Enum.UserInputState.End then
                Dragging = false
            end
        end)
    end
end)

TopBar.InputChanged:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseMovement
        or Input.UserInputType == Enum.UserInputType.Touch then
        DragInput = Input
    end
end)

Connect(UserInputService.InputChanged, function(Input)
    if Input == DragInput and Dragging and not Modal.Visible then
        local Delta = (Input.Position - DragStart) / RootScale.Scale
        Root.Position = UDim2.new(
            StartPosition.X.Scale, StartPosition.X.Offset + Delta.X,
            StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y
        )
    end
end)

local Intro = nil

local function TriggerFetchAfterIntro()
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
    pcall(function() Splash:Destroy() end)
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
        local T = Timers[I]
        if Clock >= T.At then
            table.remove(Timers, I)
            pcall(T.Fn)
        end
    end

    if TickerActive then
        TickerAcc += Dt
        if TickerAcc >= 1 then
            TickerAcc = 0
            local Remaining = CooldownLeft()
            RenderCooldown(Remaining)
            if Remaining <= 0 then
                TickerActive = false
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
        -- Wall-clock based so a freeze/lag spike can't leave the splash stuck
        local T = os.clock() - Intro.Start

        local Typed = math.min(SplashTitleLen, math.floor(T / 0.02) + 1)
        if Typed ~= Intro.Typed then
            Intro.Typed = Typed
            SplashTitle.MaxVisibleGraphemes = Typed
        end

        if Intro.Stage < 1 and T >= 1.2 then
            Intro.Stage = 1
            SplashSub.Text = "Syncing game data..."
        end
        if Intro.Stage < 2 and T >= 2.4 then
            Intro.Stage = 2
            SplashSub.Text = "Ready."
            Tween(Splash, 0.25, { GroupTransparency = 1 })
        end
        if Intro.Stage < 3 and T >= 3.6 then
            Intro = nil
            FinishSplash()
            TriggerFetchAfterIntro()
        end
    end

    if Hidden then return end

    Elapsed += Dt

    BorderGrad.Rotation = (Elapsed * 45) % 360
    LogoGrad.Rotation = (Elapsed * 60) % 360
    if SplashAlive then
        SplashLogoGrad.Rotation = (Elapsed * 90) % 360
    end

    AnimAcc += Dt
    if AnimAcc < ANIM_STEP then return end
    local Step = math.min(AnimAcc, 0.1)
    AnimAcc = 0

    Orb1.Position = UDim2.fromScale(0.12 + math.sin(Elapsed * 0.5) * 0.07, 0.1 + math.cos(Elapsed * 0.4) * 0.06)
    Orb2.Position = UDim2.fromScale(0.95 + math.cos(Elapsed * 0.45) * 0.07, 0.95 + math.sin(Elapsed * 0.35) * 0.06)

    if SplashAlive then
        SplashOrb1.Position = UDim2.fromScale(0.92 + math.sin(Elapsed * 0.6) * 0.05, 0.08 + math.cos(Elapsed * 0.5) * 0.05)
        SplashOrb2.Position = UDim2.fromScale(0.08 + math.cos(Elapsed * 0.55) * 0.05, 0.92 + math.sin(Elapsed * 0.45) * 0.05)
        StepParticles(SplashParticles, Step)
    end

    StepParticles(Particles, Step)
end)

-- Safe boot: UI stays hidden until the game is ready + a random 0.8–1.4s delay,
-- then the intro starts. Includes a watchdog so the splash can never get stuck.
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
