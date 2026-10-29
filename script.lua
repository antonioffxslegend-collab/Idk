--==================================================
-- ANTONMVTWIN • 28KXPEHH & KYWSAM
-- GUN CUSTOMIZER — TABS + PERSISTENCE 🖤💙
-- BLINDED WHITELIST (RED/BLACK) 🛡️ + THEMES + DYNAMIC COLORS 🎨 + SOUND 🔊
--==================================================

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local SoundService = game:GetService("SoundService")

-- 📋 ALLOWED NAMES (Lowercase backup)
local ALLOWED_NAMES = {
    "chiclao1", "juguemoos3", "hdhrrhrhhjrrjrj", "8_ia20", "rs_bynnah", "eli300600",
    "tozety45", "antoniommvnz", "linda_2597u7", "cocopuffer72", "antoniozinn2", "sol4erxvr",
    "elfino300021", "achusi78", "hi1235010", "harts1234giles", "kanaaruii", "ttlvls",
    "123jessica2022", "lulzlarp", "gudumax666x", "lylyemxinhsayhi1", "xanhzxanhz", "realmicahfx",
    "duskc167", "lovelygirl28123", "ba_n874", "wzxjoao_1", "yass_ew",
    "fjkekrjrkeleke", "asesuasf", "miguelmsdp", "manuqueamacoxinha"
}

-- 🆔 ALLOWED IDS
local ALLOWED_IDS = {
    3293685732, 4670096697, 7695473173, 5009875472, 9998372366, 
    4108899606, 3018355903, 11564720365, 5771518336, 7251368903, 
    7701613986, 2944620855, 8266154165, 4301349397, 7593605026, 
    11207334181, 3903207122, 1305835722, 7821936805, 11207812993, 
    11570858243, 3437380853, 9351312377, 10970955463, 11215419140, 
    10739119332, 2058676908, 3597760069, 5164330681
}

-- 🔍 Whitelist Check Function
local function checkWhitelist()
    for _, id in ipairs(ALLOWED_IDS) do
        if player.UserId == id then return true end
    end
    local nome = string.lower(player.Name)
    for _, name in ipairs(ALLOWED_NAMES) do
        if nome == name then return true end
    end
    return false
end

-- 🛡️ WHITELIST & ACCESS DENIED UI (RED AND BLACK):
if not checkWhitelist() then
    local PlayerGui = player:WaitForChild("PlayerGui")
    
    -- Create ScreenGui
    local denyGui = Instance.new("ScreenGui")
    denyGui.Name = "AccessDeniedPanel"
    denyGui.ResetOnSpawn = false
    denyGui.IgnoreGuiInset = true
    denyGui.Parent = PlayerGui

    -- Dark semi-transparent background
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    bg.BackgroundTransparency = 0.5
    bg.BorderSizePixel = 0
    bg.Parent = denyGui

    -- Central Panel Red and Black
    local panel = Instance.new("Frame")
    panel.Size = UDim2.fromOffset(400, 200)
    panel.Position = UDim2.new(0.5, -200, 0.5, -100)
    panel.BackgroundColor3 = Color3.fromRGB(10, 0, 0) -- Reddish black
    panel.BorderSizePixel = 0
    panel.Parent = denyGui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = panel

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(255, 0, 0) -- Strong red
    stroke.Thickness = 3
    stroke.Parent = panel

    -- Warning Text
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 50)
    title.BackgroundTransparency = 1
    title.Text = "ACCESS DENIED"
    title.TextColor3 = Color3.fromRGB(255, 0, 0)
    title.Font = Enum.Font.GothamBlack
    title.TextSize = 28
    title.Parent = panel

    local desc = Instance.new("TextLabel")
    desc.Size = UDim2.new(1, -20, 0, 100)
    desc.Position = UDim2.new(0, 10, 0, 50)
    desc.BackgroundTransparency = 1
    desc.Text = "You are not whitelisted to use this script!\n\nName: " .. player.Name .. "\nID: " .. tostring(player.UserId) .. "\n\nContact the creator to request access."
    desc.TextColor3 = Color3.fromRGB(255, 255, 255)
    desc.Font = Enum.Font.GothamBold
    desc.TextSize = 14
    desc.TextWrapped = true
    desc.Parent = panel

    -- Stops the script from running
    return 
end

--==================================================
-- NORMAL SCRIPT (ONLY RUNS IF WHITELISTED)
--==================================================

    --==================================================
    -- CONFIG
    --==================================================
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local ContentProvider = game:GetService("ContentProvider")
    local PlayerGui = player:WaitForChild("PlayerGui")

    local GUN_TOOL_NAME = "Gun" 
    local TARGET_NAME = "GunDisplay"
    local USE_TEXTURES = true
    local GUN_MATERIAL = Enum.Material.Metal 
    local WHITE = Color3.fromRGB(255, 255, 255)

    -- 🐱 CHOCO CAT IMAGE
    local CHOCO_IMG = "rbxthumb://type=Asset&id=118126832694865&w=150&h=150"

    -- 🖤💙 UI COLORS (Default)
    local BK_BLACK       = Color3.fromRGB(15, 15, 20)
    local BK_BLACK_SOFT  = Color3.fromRGB(30, 30, 40)
    local BK_BLACK_DARK  = Color3.fromRGB(5, 5, 10)
    local BLUE_LIGHT     = Color3.fromRGB(180, 220, 255)

    -- 🔊 CREAMY CLICK SOUND
    local clickSound = Instance.new("Sound")
    clickSound.SoundId = "rbxassetid://8400935516"
    clickSound.Volume = 0.5
    clickSound.Parent = SoundService
    
    local function playClick()
        if clickSound then clickSound:Play() end
    end

    --==================================================
    -- 🎨 THEME SYSTEM (CORRECTED IDs & COLORS)
    --==================================================
    local CONFIG = { DefaultBackground = "rbxassetid://133816048165658" }
    local CURRENT_THEME_COLOR = BLUE_LIGHT

    local ThemeSystem = {
        Current = "Default",
        Themes = {
            Default = { BackgroundImage = CONFIG.DefaultBackground, Color = BLUE_LIGHT },
            Ariana = { BackgroundImage = "rbxassetid://133816048165658", Color = Color3.fromRGB(200, 150, 255) },
            PinkYara = { BackgroundImage = "rbxassetid://130187487655695", Color = Color3.fromRGB(255, 150, 200) },
            AdrianaLima = { BackgroundImage = "rbxassetid://136251373820483", Color = Color3.fromRGB(255, 200, 150) },
            Sabrina = { BackgroundImage = "rbxassetid://105468290598013", Color = Color3.fromRGB(150, 200, 255) },
            Angelcore = { BackgroundImage = "rbxassetid://100364085785081", Color = Color3.fromRGB(255, 228, 225) },
            Gallavich = { BackgroundImage = "rbxassetid://79336979061058", Color = Color3.fromRGB(180, 50, 50) },
            Cinnamoroll = { BackgroundImage = "rbxassetid://78101128685842", Color = Color3.fromRGB(173, 216, 230) },
            Kuromi = { BackgroundImage = "rbxassetid://116002552774250", Color = Color3.fromRGB(150, 50, 150) },
            HelloKitty = { BackgroundImage = "rbxassetid://70579742856410", Color = Color3.fromRGB(255, 80, 100) },
            PomPomPurin = { BackgroundImage = "rbxassetid://79908170083488", Color = Color3.fromRGB(255, 215, 0) },
            Keroppi = { BackgroundImage = "rbxassetid://134596481339629", Color = Color3.fromRGB(100, 220, 100) },
            FlowerPastel = { BackgroundImage = "rbxassetid://112370820456921", Color = Color3.fromRGB(255, 182, 193) },
            GallavichV2 = { BackgroundImage = "rbxassetid://129071017097022", Color = Color3.fromRGB(70, 130, 180) }, 
            Hollanov = { BackgroundImage = "rbxassetid://121751344066710", Color = Color3.fromRGB(169, 169, 169) }, 
            CMBYN = { BackgroundImage = "rbxassetid://71561732326227", Color = Color3.fromRGB(144, 238, 144) } 
        }
    }

    --==================================================
    -- SHOT DETECTION
    --==================================================
    local SHOT_NAMES = {
        Bullet = true, Projectile = true, Tracer = true, Shot = true, Laser = true,
        BulletTrail = true, BulletTracer = true, MuzzleFlash = true,
    }

    --==================================================
    -- COLORS & TEXTURES
    --==================================================
    local EFFECT_COLORS = {
        Purple = Color3.fromRGB(115, 35, 170), RedScope = Color3.fromRGB(170, 0, 0), BlueScope = Color3.fromRGB(20, 45, 110), RainbowScope = Color3.fromRGB(255, 100, 200), GoldScope = Color3.fromRGB(255, 215, 0), Rosescope = Color3.fromRGB(255, 105, 180), WhiteScope = Color3.fromRGB(255, 255, 255), WhiteScope2 = Color3.fromRGB(255, 255, 255), GhostScope = Color3.fromRGB(255, 255, 255), LadyNoir = Color3.fromRGB(200, 30, 90), RainbowDashScope = Color3.fromRGB(0, 200, 255), PomPomPurinScope = Color3.fromRGB(255, 200, 120), MyMelodyScope = Color3.fromRGB(255, 150, 200), CinnamorollScope = Color3.fromRGB(160, 220, 255), KeroppiScope = Color3.fromRGB(100, 220, 100), HallowHelloKittyScope = Color3.fromRGB(255, 120, 200), FluttershyScope = Color3.fromRGB(255, 220, 130), PinkPieScope = Color3.fromRGB(255, 105, 180), ShinobuScope = Color3.fromRGB(150, 80, 200), KuromiScope = Color3.fromRGB(90, 50, 130), ChocoCatScope = Color3.fromRGB(75, 45, 25), CatNoirCyanScope = Color3.fromRGB(0, 220, 220), TwilightBiScope = Color3.fromRGB(200, 100, 255), CreatorScope = Color3.fromRGB(255, 180, 60), ChocoScope = Color3.fromRGB(92, 51, 23), EasterScope = Color3.fromRGB(180, 240, 180), GreenAppleBowScope = Color3.fromRGB(140, 220, 60), AppleStrawberryKittyScope = Color3.fromRGB(255, 80, 120), BlueCookieCremeScope = Color3.fromRGB(100, 170, 255), PinkMintScope = Color3.fromRGB(255, 160, 200), FiliaScope = Color3.fromRGB(150, 60, 200), NapolitanScope = Color3.fromRGB(255, 140, 170), AppleJackScope = Color3.fromRGB(240, 150, 60), SummerAquaScope = Color3.fromRGB(80, 220, 220), SweetPetalAppleBlossomScope = Color3.fromRGB(255, 180, 210), ChocoFlakeCreamScope = Color3.fromRGB(180, 130, 90), RedVelvetScope = Color3.fromRGB(200, 30, 60), SwagMusicScope = Color3.fromRGB(150, 80, 220), FallScope = Color3.fromRGB(230, 130, 60), PusheenScope = Color3.fromRGB(180, 170, 160), PudinScope = Color3.fromRGB(255, 210, 130), VectorFlourishScope = Color3.fromRGB(120, 220, 100), FrutigerAeroScopeV1 = Color3.fromRGB(80, 180, 220), FrutigerAeroScopeV2 = Color3.fromRGB(130, 220, 180), MoeKawaiiScope = Color3.fromRGB(255, 160, 200), PastelKawaiiScope = Color3.fromRGB(255, 240, 180), AnyaScope = Color3.fromRGB(255, 192, 203), KwaiiCoquettePastelScope = Color3.fromRGB(255, 200, 220), TheThreeElementsScope = Color3.fromRGB(200, 150, 100), UfoCoquetteScope = Color3.fromRGB(180, 200, 255), UKSwagScope = Color3.fromRGB(200, 50, 50), IceScope = Color3.fromRGB(150, 220, 255), AlienGoddessScope = Color3.fromRGB(80, 255, 120), ChocolatMintScope = Color3.fromRGB(130, 220, 185),
        HallowaGingerScope = Color3.fromRGB(255, 140, 0), NapolitanGingerScope = Color3.fromRGB(255, 180, 190), SwagMuisicGingerScope = Color3.fromRGB(150, 80, 220), AngelCoreGingerScope = Color3.fromRGB(255, 240, 200), CandyDreamGingerScope = Color3.fromRGB(255, 180, 220),
        
        HatsuneMikuScope = Color3.fromRGB(0, 255, 255), 
        WitchGingerScope = Color3.fromRGB(138, 43, 226),
    }
    local GUN_BODY_COLORS = EFFECT_COLORS

    local SPECIAL_BEAMS = {
        CreatorScope = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 30, 30)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 30, 30))}),
        HallowHelloKittyScope = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 130, 0)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(20, 20, 20)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 130, 0))}),
        ChocoCatScope = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 220, 255)), ColorSequenceKeypoint.new(0.35, Color3.fromRGB(92, 51, 23)), ColorSequenceKeypoint.new(0.65, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 220, 255))}),
        RainbowScope = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.16, Color3.fromRGB(255, 165, 0)), ColorSequenceKeypoint.new(0.32, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(0.48, Color3.fromRGB(0, 255, 0)), ColorSequenceKeypoint.new(0.64, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(75, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 255))}),
        SwagMusicScope = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(0.33, Color3.fromRGB(140, 230, 140)), ColorSequenceKeypoint.new(0.66, Color3.fromRGB(255, 240, 130)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 105, 180))}),
        PastelKawaiiScope = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 245, 180)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(180, 240, 190)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 245, 180))}),
        AnyaScope = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 255, 100)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 182, 193)), ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 255, 100))}),
        TheThreeElementsScope = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 50, 0)), ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 150, 255)), ColorSequenceKeypoint.new(0.66, Color3.fromRGB(139, 69, 19)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 50, 0))}),
        UKSwagScope = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 30, 30)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(50, 100, 200)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}),
        
        HatsuneMikuScope = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 255))
        }),
        WitchGingerScope = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(138, 43, 226)),
            ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 0, 0)),
            ColorSequenceKeypoint.new(0.66, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(138, 43, 226))
        }),
    }

    local TEXTURES = {
        RedScope = "rbxassetid://84961185975751", BlueScope = "rbxassetid://82435090032680", Purple = "rbxassetid://88934686234709", RainbowScope = "rbxassetid://111439232051230", GoldScope = "rbxassetid://97949364982596", Rosescope = "rbxassetid://102809990017058", WhiteScope = "rbxassetid://87412774611144", WhiteScope2 = "rbxassetid://72855494812542", LadyNoir = "rbxassetid://113455213965513", RainbowDashScope = "rbxassetid://85978013893097", PomPomPurinScope = "rbxassetid://103585180315576", MyMelodyScope = "rbxassetid://83689518548676", CinnamorollScope = "rbxassetid://109331272063130", KeroppiScope = "rbxassetid://133286588792571", HallowHelloKittyScope = "rbxassetid://87175911202111", FluttershyScope = "rbxassetid://138078031195826", PinkPieScope = "rbxassetid://81233140778268", ShinobuScope = "rbxassetid://129716772920139", KuromiScope = "rbxassetid://139867139703027", ChocoCatScope = "rbxassetid://92566809803349", CatNoirCyanScope = "rbxassetid://131180982037558", TwilightBiScope = "rbxassetid://108862731291876", CreatorScope = "rbxassetid://109285425289366", ChocoScope = "rbxassetid://116961984812398", EasterScope = "rbxassetid://77549067516683", GreenAppleBowScope = "rbxassetid://82764504607954", AppleStrawberryKittyScope = "rbxassetid://119568146178980", BlueCookieCremeScope = "rbxassetid://133388239485972", PinkMintScope = "rbxassetid://71532164725857", FiliaScope = "rbxassetid://70932940623767", NapolitanScope = "rbxassetid://79744127665364", AppleJackScope = "rbxassetid://76362909492405", SummerAquaScope = "rbxassetid://99078829240858", SweetPetalAppleBlossomScope = "rbxassetid://121702965361666", ChocoFlakeCreamScope = "rbxassetid://85987967443318", RedVelvetScope = "rbxassetid://91979423609344", SwagMusicScope = "rbxassetid://134828538631475", FallScope = "rbxassetid://118826135119487", PusheenScope = "rbxassetid://76905425230972", PudinScope = "rbxassetid://107816958013843", VectorFlourishScope = "rbxassetid://89091163185390", FrutigerAeroScopeV1 = "rbxassetid://109961326765377", FrutigerAeroScopeV2 = "rbxassetid://89548347687314", MoeKawaiiScope = "rbxassetid://131107656713089", PastelKawaiiScope = "rbxassetid://121510582236866", AnyaScope = "rbxassetid://134446987735310", KwaiiCoquettePastelScope = "rbxassetid://126388750944722", TheThreeElementsScope = "rbxassetid://122254936124815", UfoCoquetteScope = "rbxassetid://137323071263645", UKSwagScope = "rbxassetid://132254542440649", IceScope = "rbxassetid://97699953297734", AlienGoddessScope = "rbxassetid://117970027895417", ChocolatMintScope = "rbxassetid://73232663886600", HallowaGingerScope = "rbxassetid://77427712462429", NapolitanGingerScope = "rbxassetid://89287323611069", SwagMuisicGingerScope = "rbxassetid://108107348961526", AngelCoreGingerScope = "rbxassetid://75642761780571", CandyDreamGingerScope = "rbxassetid://117167455554900",
        
        HatsuneMikuScope = "rbxassetid://95638676600780",
        WitchGingerScope = "rbxassetid://103864411814140",
    }

    local TRAIL_STYLES = {
        ["None"] = nil,
        ["Rainbow"] = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(0.4, Color3.fromRGB(0, 255, 0)), ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))}),
        ["Galaxy"] = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(75, 0, 130)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 20, 147)), ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 112))}),
        ["Fire"] = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 140, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 0))}),
        ["Ice"] = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(135, 206, 250)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}),
        ["Neon Pink"] = ColorSequence.new(Color3.fromRGB(255, 20, 147)), ["Neon Blue"] = ColorSequence.new(Color3.fromRGB(0, 191, 255)), ["Neon Green"] = ColorSequence.new(Color3.fromRGB(57, 255, 20)),
        ["Toxic"] = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 0)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 0))}),
        ["Sakura"] = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 182, 193)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 240, 245))}),
        ["Purple Void"] = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(48, 25, 52)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(138, 43, 226)), ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 0, 50))}),
        ["Gold"] = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 215, 0)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(218, 165, 32)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 224))}),
        ["Blood Red"] = ColorSequence.new(Color3.fromRGB(139, 0, 0)), ["Black & White"] = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}),
        
        ["Witch"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(75, 0, 130)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(20, 0, 20)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(138, 43, 226))
        }),
    }

    local CURRENT_TRAIL = "None"
    local Styles = {
        "Normal", "Purple", "RedScope", "BlueScope", "RainbowScope", "GoldScope", "Rosescope", "WhiteScope", "WhiteScope2", "GhostScope", "LadyNoir", "RainbowDashScope", "PomPomPurinScope", "MyMelodyScope", "CinnamorollScope", "KeroppiScope", "HallowHelloKittyScope", "FluttershyScope", "PinkPieScope", "ShinobuScope", "KuromiScope", "ChocoCatScope", "CatNoirCyanScope", "TwilightBiScope", "CreatorScope", "ChocoScope", "EasterScope", "GreenAppleBowScope", "AppleStrawberryKittyScope", "BlueCookieCremeScope", "PinkMintScope", "FiliaScope", "NapolitanScope", "AppleJackScope", "SummerAquaScope", "SweetPetalAppleBlossomScope", "ChocoFlakeCreamScope", "RedVelvetScope", "SwagMusicScope", "FallScope", "PusheenScope", "PudinScope", "VectorFlourishScope", "FrutigerAeroScopeV1", "FrutigerAeroScopeV2", "MoeKawaiiScope", "PastelKawaiiScope", "AnyaScope", "KwaiiCoquettePastelScope", "TheThreeElementsScope", "UfoCoquetteScope", "UKSwagScope", "IceScope", "AlienGoddessScope", "ChocolatMintScope", "HallowaGingerScope", "NapolitanGingerScope", "SwagMuisicGingerScope", "AngelCoreGingerScope", "CandyDreamGingerScope",
        
        "HatsuneMikuScope", "WitchGingerScope"
    }

    local CURRENT_STYLE = "Normal"
    local customizerEnabled = true
    local originalProperties = {}
    local hookedTools = {}

    --==================================================
    -- SCRIPT LOGIC
    --==================================================
    local function applyTrailToTool(tool)
        if not tool or not tool:IsA("Tool") then return end
        if not string.find(tool.Name, GUN_TOOL_NAME) then return end
        local handle = tool:FindFirstChild("Handle"); if not handle then return end
        local trail = handle:FindFirstChild("CustomGunTrail")
        local att0 = handle:FindFirstChild("TrailAtt0")
        local att1 = handle:FindFirstChild("TrailAtt1")

        if CURRENT_TRAIL == "None" then
            if trail then trail:Destroy() end
            if att0 then att0:Destroy() end
            if att1 then att1:Destroy() end
            return
        end

        if not trail then
            att0 = Instance.new("Attachment"); att0.Name = "TrailAtt0"; att0.Position = Vector3.new(0, 0.5, -1.5); att0.Parent = handle
            att1 = Instance.new("Attachment"); att1.Name = "TrailAtt1"; att1.Position = Vector3.new(0, 0.5, 0.5); att1.Parent = handle
            trail = Instance.new("Trail"); trail.Name = "CustomGunTrail"; trail.Attachment0 = att0; trail.Attachment1 = att1
            trail.Lifetime = 0.5; trail.MinLength = 0.1; trail.FaceCamera = true; trail.LightEmission = 1; trail.Texture = "rbxassetid://446111271"
            trail.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.1, 0), NumberSequenceKeypoint.new(0.9, 0), NumberSequenceKeypoint.new(1, 1)})
            trail.Parent = handle
        end
        trail.Color = TRAIL_STYLES[CURRENT_TRAIL]
    end

    task.spawn(function()
        local ids = {}
        for _, id in pairs(TEXTURES) do table.insert(ids, id) end
        for i = 1, #ids, 5 do
            local bloco = {}
            for j = i, math.min(i + 4, #ids) do table.insert(bloco, ids[j]) end
            pcall(function() ContentProvider:PreloadAsync(bloco) end)
        end
    end)

    local function shiftColor(cor, factor) if factor > 0 then return cor:Lerp(Color3.new(1,1,1), factor) else return cor:Lerp(Color3.new(0,0,0), -factor) end end

    local function applyGradient(container, baseColor, overrideTable)
        if not container then return end
        local parts = {}
        for _, obj in ipairs(container:GetDescendants()) do if obj:IsA("BasePart") or obj:IsA("MeshPart") then table.insert(parts, obj) end end
        if container:IsA("BasePart") or container:IsA("MeshPart") then table.insert(parts, container) end
        if #parts == 0 then return end
        table.sort(parts, function(a, b) return a.Position.Y > b.Position.Y end)
        local total = math.max(#parts, 1)
        for i, part in ipairs(parts) do
            local t = (i - 1) / math.max(total - 1, 1)
            local corFinal = shiftColor(baseColor, 0.25 - (t * 0.50))
            pcall(function() saveOriginal(part, "Color"); part.Color = corFinal end)
        end
    end

    local function saveOriginal(object, property)
        originalProperties[object] = originalProperties[object] or {}
        local properties = originalProperties[object]
        if properties[property] == nil then
            local ok, value = pcall(function() return object[property] end)
            if ok then properties[property] = value end
        end
    end

    local function restoreObject(object)
        local properties = originalProperties[object]
        if not properties or not object.Parent then return end
        for property, value in pairs(properties) do pcall(function() object[property] = value end) end
    end

    local function restoreAll()
        for object in pairs(originalProperties) do restoreObject(object) end
    end

    local function colorEffect(object, style)
        if not object or not object.Parent then return end
        local isEffect = object:IsA("Beam") or object:IsA("Trail") or object:IsA("ParticleEmitter")
        if object.Name == "CustomGunTrail" then return end
        if style == "GhostScope" then
            if isEffect then saveOriginal(object, "Color"); saveOriginal(object, "Transparency"); object.Color = ColorSequence.new(WHITE); object.Transparency = NumberSequence.new(0.5) end
            return
        end
        if SPECIAL_BEAMS[style] then if isEffect then saveOriginal(object, "Color"); object.Color = SPECIAL_BEAMS[style] end return end
        local color = EFFECT_COLORS[style]
        if color and isEffect then
            saveOriginal(object, "Color")
            object.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, shiftColor(color, 0.3)), ColorSequenceKeypoint.new(0.5, color), ColorSequenceKeypoint.new(1, shiftColor(color, -0.3))})
        end
    end

    local function applyObject(object)
        if not customizerEnabled then return end
        if object.Name == "CustomGunTrail" or object.Name == "TrailAtt0" or object.Name == "TrailAtt1" then return end
        local isPart = object:IsA("BasePart"); local isMesh = object:IsA("SpecialMesh"); local isDecal = object:IsA("Decal") or object:IsA("Texture"); local isSurf = object:IsA("SurfaceAppearance"); local isEffect = object:IsA("Beam") or object:IsA("Trail") or object:IsA("ParticleEmitter")

        if CURRENT_STYLE == "GhostScope" then
            if isPart then
                saveOriginal(object, "Color"); saveOriginal(object, "Transparency"); object.Color = WHITE; object.Transparency = 0.5
                if object:IsA("MeshPart") then saveOriginal(object, "TextureID"); object.TextureID = "" end
                local surf = object:FindFirstChildOfClass("SurfaceAppearance"); if surf then saveOriginal(surf, "Transparency"); surf.Transparency = 1 end
                local mesh = object:FindFirstChildOfClass("SpecialMesh"); if mesh then saveOriginal(mesh, "TextureId"); mesh.TextureId = "" end
            elseif isMesh then saveOriginal(object, "TextureId"); object.TextureId = ""
            elseif isDecal then saveOriginal(object, "Transparency"); object.Transparency = 1
            elseif isEffect then saveOriginal(object, "Color"); saveOriginal(object, "Transparency"); object.Color = ColorSequence.new(WHITE); object.Transparency = NumberSequence.new(0.5) end
            return
        end

        local textureId = TEXTURES[CURRENT_STYLE]; local bodyColor = GUN_BODY_COLORS[CURRENT_STYLE]
        if USE_TEXTURES and textureId then
            if object:IsA("MeshPart") then saveOriginal(object, "TextureID"); object.TextureID = textureId
            elseif isMesh then saveOriginal(object, "TextureId"); object.TextureId = textureId
            elseif isDecal then saveOriginal(object, "Texture"); object.Texture = textureId
            elseif isSurf then saveOriginal(object, "ColorMap"); object.ColorMap = textureId end
        end

        if isPart and bodyColor then
            saveOriginal(object, "Color"); object.Color = bodyColor
            if not USE_TEXTURES then
                saveOriginal(object, "Material"); object.Material = GUN_MATERIAL
                if object:IsA("MeshPart") then saveOriginal(object, "TextureID"); object.TextureID = "" end
                local surf = object:FindFirstChildOfClass("SurfaceAppearance"); if surf then saveOriginal(surf, "Transparency"); surf.Transparency = 1 end
                local mesh = object:FindFirstChildOfClass("SpecialMesh"); if mesh then saveOriginal(mesh, "TextureId"); mesh.TextureId = "" end
            end
        end

        if isEffect then
            if SPECIAL_BEAMS[CURRENT_STYLE] then saveOriginal(object, "Color"); object.Color = SPECIAL_BEAMS[CURRENT_STYLE]
            else
                local color = EFFECT_COLORS[CURRENT_STYLE]
                if color then saveOriginal(object, "Color"); object.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, shiftColor(color, 0.3)), ColorSequenceKeypoint.new(0.5, color), ColorSequenceKeypoint.new(1, shiftColor(color, -0.3))}) end
            end
        end
    end

    local function applyToTool(tool)
        if not tool or not tool:IsA("Tool") then return 0 end
        if not string.find(tool.Name, GUN_TOOL_NAME) then return 0 end
        if not customizerEnabled then return 0 end
        if CURRENT_STYLE ~= "Normal" then
            local count = 0
            if tool:IsA("BasePart") or tool:IsA("SpecialMesh") or tool:IsA("Decal") or tool:IsA("Texture") or tool:IsA("Beam") or tool:IsA("Trail") or tool:IsA("ParticleEmitter") or tool:IsA("SurfaceAppearance") then applyObject(tool); count += 1 end
            for _, obj in ipairs(tool:GetDescendants()) do applyObject(obj); count += 1 end
            if CURRENT_STYLE ~= "GhostScope" then
                local bodyColor = GUN_BODY_COLORS[CURRENT_STYLE]
                if bodyColor then applyGradient(tool, bodyColor, true) end
            end
        end
        applyTrailToTool(tool)
        return 1
    end

    local function forceApplyTool(tool)
        if not customizerEnabled then return end
        task.spawn(function() applyToTool(tool); task.wait(0.05); applyToTool(tool); task.wait(0.15); applyToTool(tool); task.wait(0.35); applyToTool(tool); task.wait(0.7); applyToTool(tool); task.wait(1.5); applyToTool(tool) end)
    end

    local function setupTool(tool)
        if not tool:IsA("Tool") then return end
        if not string.find(tool.Name, GUN_TOOL_NAME) then return end
        if hookedTools[tool] then return end
        hookedTools[tool] = true
        tool.Equipped:Connect(function() forceApplyTool(tool) end)
        tool.Unequipped:Connect(function() forceApplyTool(tool) end)
        tool.DescendantAdded:Connect(function(obj)
            if not customizerEnabled then return end
            task.wait(0.05)
            if CURRENT_STYLE ~= "Normal" then
                applyObject(obj)
                if CURRENT_STYLE ~= "GhostScope" then
                    local bodyColor = GUN_BODY_COLORS[CURRENT_STYLE]
                    if bodyColor then applyGradient(tool, bodyColor, true) end
                end
            end
            applyTrailToTool(tool)
        end)
        tool.Destroying:Connect(function() hookedTools[tool] = nil end)
        forceApplyTool(tool)
    end

    local function setupCharacter(character)
        for _, obj in ipairs(character:GetChildren()) do if obj:IsA("Tool") then setupTool(obj) end end
        character.ChildAdded:Connect(function(obj) if obj:IsA("Tool") then setupTool(obj) end end)
    end

    local function setupBackpack()
        local backpack = player:WaitForChild("Backpack")
        for _, obj in ipairs(backpack:GetChildren()) do if obj:IsA("Tool") then setupTool(obj) end end
        backpack.ChildAdded:Connect(function(obj) if obj:IsA("Tool") then setupTool(obj) end end)
    end

    local function getNearestDisplay()
        local character = player.Character; local root = character and character:FindFirstChild("HumanoidRootPart"); if not root then return nil end
        local nearest, nearestDistance = nil, math.huge
        for _, object in ipairs(workspace:GetDescendants()) do
            if object.Name == TARGET_NAME then
                local part = object:IsA("BasePart") and object or object:IsA("Model") and (object.PrimaryPart or object:FindFirstChildWhichIsA("BasePart", true)) or object:IsA("Tool") and object:FindFirstChild("Handle", true)
                if part and part:IsA("BasePart") then local distance = (part.Position - root.Position).Magnitude; if distance < nearestDistance then nearestDistance = distance; nearest = object end end
            end
        end
        return nearest
    end

    local function applyToContainer(container)
        if not container then return 0 end
        local count = 0
        if container:IsA("BasePart") or container:IsA("SpecialMesh") or container:IsA("Decal") or container:IsA("Texture") or container:IsA("Beam") or container:IsA("Trail") or container:IsA("ParticleEmitter") or container:IsA("SurfaceAppearance") then applyObject(container); count += 1 end
        for _, object in ipairs(container:GetDescendants()) do applyObject(object); count += 1 end
        if CURRENT_STYLE ~= "Normal" and CURRENT_STYLE ~= "GhostScope" then local bodyColor = GUN_BODY_COLORS[CURRENT_STYLE]; if bodyColor then applyGradient(container, bodyColor, true) end end
        return count
    end

    local function findShotContainer(object)
        if SHOT_NAMES[object.Name] then return object end
        if object.Parent and SHOT_NAMES[object.Parent.Name] then return object.Parent end
        return nil
    end

    local function colorShotContainer(container)
        if not container then return end
        colorEffect(container, CURRENT_STYLE)
        for _, object in ipairs(container:GetDescendants()) do colorEffect(object, CURRENT_STYLE) end
    end

    workspace.DescendantAdded:Connect(function(object)
        if not customizerEnabled or CURRENT_STYLE == "Normal" then return end
        task.defer(function()
            if not object.Parent then return end
            local shot = findShotContainer(object)
            if shot then
                local ownerId = shot:GetAttribute("OwnerUserId")
                if ownerId == nil or ownerId == player.UserId then colorShotContainer(shot) end
            end
        end)
    end)

    function applyCurrentStyleRef()
        restoreAll()
        local function runApply()
            local char = player.Character
            if char then for _, obj in ipairs(char:GetDescendants()) do if obj:IsA("Tool") and string.find(obj.Name, GUN_TOOL_NAME) then applyToTool(obj) end end end
            local backpack = player:FindFirstChild("Backpack")
            if backpack then for _, obj in ipairs(backpack:GetChildren()) do if obj:IsA("Tool") and string.find(obj.Name, GUN_TOOL_NAME) then applyToTool(obj) end end end
            local display = getNearestDisplay(); if display then applyToContainer(display) end
        end
        runApply(); task.wait(0.05); runApply(); task.wait(0.15); runApply(); task.wait(0.35); runApply(); task.wait(0.7); runApply(); task.wait(1.5); runApply()
    end

    local function applyCurrentStyle()
        if not customizerEnabled then 
            if status then status.Text = "Customizer off" end
            return 
        end
        applyCurrentStyleRef()
        if status then status.Text = "Applied: " .. CURRENT_STYLE .. " / Trail: " .. CURRENT_TRAIL end
    end

    if player.Character then setupCharacter(player.Character) end
    player.CharacterAdded:Connect(function(character)
        hookedTools = {}; setupCharacter(character)
        task.wait(0.5)
        if customizerEnabled then applyCurrentStyleRef() end
    end)
    player.ChildAdded:Connect(function(child)
        if child.Name == "Backpack" then task.wait(0.3); setupBackpack(); task.wait(0.2); if customizerEnabled then applyCurrentStyleRef() end end
    end)
    setupBackpack()

    --==================================================
    -- 🖤💙 UI WITH TABS, THEMES, AND DYNAMIC COLORS
    --==================================================
    local oldGui = PlayerGui:FindFirstChild("MatrixVoidPanel")
    if oldGui then oldGui:Destroy() end

    local gui = Instance.new("ScreenGui")
    gui.Name = "MatrixVoidPanel"; gui.ResetOnSpawn = false; gui.IgnoreGuiInset = false; gui.Parent = PlayerGui

    local ball = Instance.new("ImageButton")
    ball.Name = "ChocoBall"
    ball.Size = UDim2.fromOffset(70, 70)
    ball.Position = UDim2.new(0, 20, 0.5, -35)
    ball.BackgroundColor3 = BK_BLACK
    ball.BorderSizePixel = 0
    ball.AutoButtonColor = true
    ball.Active = true
    ball.Image = CHOCO_IMG
    ball.ScaleType = Enum.ScaleType.Fit
    ball.Parent = gui
    Instance.new("UICorner", ball).CornerRadius = UDim.new(1, 0)

    local ballStroke = Instance.new("UIStroke", ball)
    ballStroke.Color = CURRENT_THEME_COLOR
    ballStroke.Thickness = 3

    -- 👇 AQUI ESTÁ A MUDANÇA DA PROPORÇÃO (500x320 - Mais largo e menos alto) 👇
    local main = Instance.new("Frame")
    main.Name = "MainFrame"
    main.Size = UDim2.fromOffset(500, 320)
    main.Position = UDim2.new(0.5, -250, 0.5, -160)
    main.BackgroundColor3 = BK_BLACK
    main.BackgroundTransparency = 1
    main.BorderSizePixel = 0
    main.Active = true
    main.ClipsDescendants = true
    main.Visible = false
    main.Parent = gui
    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 18)

    local BgImage = Instance.new("ImageLabel")
    BgImage.Name = "ThemeBg"
    BgImage.Size = UDim2.new(1, 0, 1, 0)
    BgImage.BackgroundColor3 = BK_BLACK
    BgImage.Image = ThemeSystem.Themes.Default.BackgroundImage
    BgImage.ScaleType = Enum.ScaleType.Crop
    BgImage.ZIndex = 1
    BgImage.Parent = main
    Instance.new("UICorner", BgImage).CornerRadius = UDim.new(0, 18)

    local Overlay = Instance.new("Frame")
    Overlay.Size = UDim2.new(1, 0, 1, 0)
    Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Overlay.BackgroundTransparency = 0.6
    Overlay.BorderSizePixel = 0
    Overlay.ZIndex = 2
    Overlay.Parent = main
    Instance.new("UICorner", Overlay).CornerRadius = UDim.new(0, 18)

    local stroke = Instance.new("UIStroke", main)
    stroke.Color = CURRENT_THEME_COLOR
    stroke.Thickness = 2.5
    stroke.ZIndex = 3

    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 42)
    titleBar.BackgroundColor3 = BK_BLACK_DARK
    titleBar.BackgroundTransparency = 0.3
    titleBar.BorderSizePixel = 0
    titleBar.Active = true
    titleBar.ZIndex = 3
    titleBar.Parent = main
    Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 18)

    local tbFix = Instance.new("Frame", titleBar)
    tbFix.Size = UDim2.new(1, 0, 0, 14)
    tbFix.Position = UDim2.new(0, 0, 1, -14)
    tbFix.BackgroundColor3 = BK_BLACK_DARK
    tbFix.BackgroundTransparency = 0.3
    tbFix.BorderSizePixel = 0
    tbFix.ZIndex = 3

    local headerIcon = Instance.new("ImageLabel")
    headerIcon.Size = UDim2.fromOffset(30, 30)
    headerIcon.Position = UDim2.new(0, 8, 0.5, -15)
    headerIcon.BackgroundTransparency = 1
    headerIcon.Image = CHOCO_IMG
    headerIcon.ScaleType = Enum.ScaleType.Fit
    headerIcon.ZIndex = 4
    headerIcon.Parent = titleBar

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -80, 1, 0)
    title.Position = UDim2.fromOffset(44, 0)
    title.BackgroundTransparency = 1
    title.Text = "antonmvtwin • kywsam"
    title.TextColor3 = CURRENT_THEME_COLOR
    title.TextSize = 13
    title.Font = Enum.Font.FredokaOne
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.ZIndex = 4
    title.Parent = titleBar

    local minimize = Instance.new("TextButton")
    minimize.Size = UDim2.fromOffset(26, 26)
    minimize.Position = UDim2.new(1, -32, 0, 8)
    minimize.BackgroundColor3 = CURRENT_THEME_COLOR
    minimize.Text = "-"
    minimize.TextColor3 = BK_BLACK
    minimize.TextSize = 18
    minimize.Font = Enum.Font.FredokaOne
    minimize.BorderSizePixel = 0
    minimize.ZIndex = 4
    minimize.Parent = titleBar
    Instance.new("UICorner", minimize).CornerRadius = UDim.new(1, 0)

    local content = Instance.new("Frame")
    content.Position = UDim2.fromOffset(12, 48)
    content.Size = UDim2.new(1, -24, 1, -58)
    content.BackgroundTransparency = 1
    content.ZIndex = 4
    content.Parent = main

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 7)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = content

    local function makeButton(text, parent)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, 0, 0, 30)
        button.BackgroundColor3 = BK_BLACK_SOFT
        button.BorderSizePixel = 0
        button.Text = text
        button.TextColor3 = CURRENT_THEME_COLOR
        button.TextSize = 12
        button.Font = Enum.Font.FredokaOne
        button.AutoButtonColor = true
        button.ZIndex = 4
        button.Parent = parent
        Instance.new("UICorner", button).CornerRadius = UDim.new(0, 10)
        local bs = Instance.new("UIStroke", button)
        bs.Color = CURRENT_THEME_COLOR
        bs.Thickness = 1.5
        return button, bs
    end

    local matrixButton, matrixStroke = makeButton("CUSTOMIZER: ON", content)
    local purpleButton, purpleStroke = makeButton("QUICK STYLE: PURPLE", content)
    local rainbowButton, rainbowStroke = makeButton("QUICK STYLE: RAINBOWSCOPE", content)

    local tabFrame = Instance.new("Frame")
    tabFrame.Size = UDim2.new(1, 0, 0, 30)
    tabFrame.BackgroundTransparency = 1
    tabFrame.ZIndex = 4
    tabFrame.Parent = content
    
    local tabLayout = Instance.new("UIListLayout")
    tabLayout.FillDirection = Enum.FillDirection.Horizontal
    tabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    tabLayout.Padding = UDim.new(0, 4)
    tabLayout.Parent = tabFrame

    local function makeTabButton(text, layoutOrder)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.25, -3, 1, 0)
        btn.BackgroundColor3 = BK_BLACK_SOFT
        btn.Text = text
        btn.TextColor3 = CURRENT_THEME_COLOR
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 10
        btn.LayoutOrder = layoutOrder
        btn.BorderSizePixel = 0
        btn.ZIndex = 4
        btn.Parent = tabFrame
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
        return btn
    end

    local btnTabMatrix = makeTabButton("MATRIX", 1)
    local btnTabGinger = makeTabButton("GINGER", 2)
    local btnTabTrails = makeTabButton("TRAILS", 3)
    local btnTabThemes = makeTabButton("THEMES", 4)
    
    btnTabMatrix.BackgroundColor3 = CURRENT_THEME_COLOR
    btnTabMatrix.TextColor3 = BK_BLACK

    -- 👇 AJUSTE DA ALTURA DA LISTA PARA CABER NO NOVO TAMANHO (130) 👇
    local scrollContainer = Instance.new("Frame")
    scrollContainer.Size = UDim2.new(1, 0, 0, 130)
    scrollContainer.BackgroundColor3 = BK_BLACK_DARK
    scrollContainer.BackgroundTransparency = 0.3
    scrollContainer.BorderSizePixel = 0
    scrollContainer.ZIndex = 4
    scrollContainer.Parent = content
    Instance.new("UICorner", scrollContainer).CornerRadius = UDim.new(0, 10)

    local function makeScroll(parent)
        local scroll = Instance.new("ScrollingFrame")
        scroll.Size = UDim2.new(1, 0, 1, 0)
        scroll.BackgroundTransparency = 1
        scroll.BorderSizePixel = 0
        scroll.ScrollBarThickness = 4
        scroll.ScrollBarImageColor3 = CURRENT_THEME_COLOR
        scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
        scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
        scroll.Visible = false
        scroll.ZIndex = 4
        scroll.Parent = parent
        
        local l = Instance.new("UIListLayout")
        l.Padding = UDim.new(0, 6)
        l.SortOrder = Enum.SortOrder.LayoutOrder
        l.Parent = scroll

        local p = Instance.new("UIPadding")
        p.PaddingTop = UDim.new(0, 6); p.PaddingBottom = UDim.new(0, 6); p.PaddingLeft = UDim.new(0, 6); p.PaddingRight = UDim.new(0, 6)
        p.Parent = scroll
        return scroll
    end

    local scrollMatrix = makeScroll(scrollContainer); scrollMatrix.Visible = true
    local scrollGinger = makeScroll(scrollContainer)
    local scrollTrails = makeScroll(scrollContainer)
    local scrollThemes = makeScroll(scrollContainer)

    local function switchTab(activeBtn)
        btnTabMatrix.BackgroundColor3 = (activeBtn == btnTabMatrix) and CURRENT_THEME_COLOR or BK_BLACK_SOFT
        btnTabMatrix.TextColor3 = (activeBtn == btnTabMatrix) and BK_BLACK or CURRENT_THEME_COLOR
        
        btnTabGinger.BackgroundColor3 = (activeBtn == btnTabGinger) and CURRENT_THEME_COLOR or BK_BLACK_SOFT
        btnTabGinger.TextColor3 = (activeBtn == btnTabGinger) and BK_BLACK or CURRENT_THEME_COLOR

        btnTabTrails.BackgroundColor3 = (activeBtn == btnTabTrails) and CURRENT_THEME_COLOR or BK_BLACK_SOFT
        btnTabTrails.TextColor3 = (activeBtn == btnTabTrails) and BK_BLACK or CURRENT_THEME_COLOR

        btnTabThemes.BackgroundColor3 = (activeBtn == btnTabThemes) and CURRENT_THEME_COLOR or BK_BLACK_SOFT
        btnTabThemes.TextColor3 = (activeBtn == btnTabThemes) and BK_BLACK or CURRENT_THEME_COLOR
        
        scrollMatrix.Visible = (activeBtn == btnTabMatrix)
        scrollGinger.Visible = (activeBtn == btnTabGinger)
        scrollTrails.Visible = (activeBtn == btnTabTrails)
        scrollThemes.Visible = (activeBtn == btnTabThemes)
    end

    btnTabMatrix.MouseButton1Click:Connect(function() playClick(); switchTab(btnTabMatrix) end)
    btnTabGinger.MouseButton1Click:Connect(function() playClick(); switchTab(btnTabGinger) end)
    btnTabTrails.MouseButton1Click:Connect(function() playClick(); switchTab(btnTabTrails) end)
    btnTabThemes.MouseButton1Click:Connect(function() playClick(); switchTab(btnTabThemes) end)

    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(1, 0, 0, 20)
    status.BackgroundTransparency = 1
    status.Text = "Ready"
    status.TextColor3 = CURRENT_THEME_COLOR
    status.TextSize = 10
    status.Font = Enum.Font.FredokaOne
    status.TextWrapped = true
    status.ZIndex = 4
    status.Parent = content

    local function updateThemeColors(themeColor)
        CURRENT_THEME_COLOR = themeColor
        ballStroke.Color = CURRENT_THEME_COLOR
        stroke.Color = CURRENT_THEME_COLOR
        title.TextColor3 = CURRENT_THEME_COLOR
        minimize.BackgroundColor3 = CURRENT_THEME_COLOR
        status.TextColor3 = CURRENT_THEME_COLOR
        matrixStroke.Color = CURRENT_THEME_COLOR
        purpleStroke.Color = CURRENT_THEME_COLOR
        rainbowStroke.Color = CURRENT_THEME_COLOR
        matrixButton.TextColor3 = CURRENT_THEME_COLOR
        purpleButton.TextColor3 = CURRENT_THEME_COLOR
        rainbowButton.TextColor3 = CURRENT_THEME_COLOR

        if btnTabMatrix.BackgroundColor3 ~= BK_BLACK_SOFT then btnTabMatrix.BackgroundColor3 = CURRENT_THEME_COLOR end
        if btnTabGinger.BackgroundColor3 ~= BK_BLACK_SOFT then btnTabGinger.BackgroundColor3 = CURRENT_THEME_COLOR end
        if btnTabTrails.BackgroundColor3 ~= BK_BLACK_SOFT then btnTabTrails.BackgroundColor3 = CURRENT_THEME_COLOR end
        if btnTabThemes.BackgroundColor3 ~= BK_BLACK_SOFT then btnTabThemes.BackgroundColor3 = CURRENT_THEME_COLOR end
        
        for _, scroll in ipairs({scrollMatrix, scrollGinger, scrollTrails, scrollThemes}) do
            scroll.ScrollBarImageColor3 = CURRENT_THEME_COLOR
        end
    end

    local function selectStyle(styleName)
        playClick()
        local valid = false
        for _, name in ipairs(Styles) do if name == styleName then valid = true break end end
        if not valid then return end

        CURRENT_STYLE = styleName
        for _, scroll in ipairs({scrollMatrix, scrollGinger}) do
            for _, button in ipairs(scroll:GetChildren()) do
                if button:IsA("TextButton") then
                    local selected = button:GetAttribute("StyleName") == styleName
                    button.BackgroundTransparency = selected and 0 or 0.15
                    button.BackgroundColor3 = selected and CURRENT_THEME_COLOR or BK_BLACK_SOFT
                    button.TextColor3 = selected and BK_BLACK or CURRENT_THEME_COLOR
                end
            end
        end
        applyCurrentStyle()
    end

    local function selectTrail(trailName)
        playClick()
        CURRENT_TRAIL = trailName
        for _, button in ipairs(scrollTrails:GetChildren()) do
            if button:IsA("TextButton") then
                local selected = button:GetAttribute("TrailName") == trailName
                button.BackgroundTransparency = selected and 0 or 0.15
                button.BackgroundColor3 = selected and CURRENT_THEME_COLOR or BK_BLACK_SOFT
                button.TextColor3 = selected and BK_BLACK or CURRENT_THEME_COLOR
            end
        end
        applyCurrentStyle()
    end

    local function selectTheme(themeName)
        playClick()
        local theme = ThemeSystem.Themes[themeName]
        if not theme then return end
        
        BgImage.Image = theme.BackgroundImage
        updateThemeColors(theme.Color)
        
        for _, button in ipairs(scrollThemes:GetChildren()) do
            if button:IsA("TextButton") then
                local selected = button:GetAttribute("ThemeName") == themeName
                button.BackgroundTransparency = selected and 0 or 0.15
                button.BackgroundColor3 = selected and CURRENT_THEME_COLOR or BK_BLACK_SOFT
                local lum = CURRENT_THEME_COLOR.R * 0.299 + CURRENT_THEME_COLOR.G * 0.587 + CURRENT_THEME_COLOR.B * 0.114
                button.TextColor3 = selected and (lum > 0.6 and BK_BLACK or WHITE) or CURRENT_THEME_COLOR
            end
        end
        status.Text = "Theme: " .. themeName
    end

    local gingerList = { 
        HallowaGingerScope = true, 
        NapolitanGingerScope = true, 
        SwagMuisicGingerScope = true, 
        AngelCoreGingerScope = true, 
        CandyDreamGingerScope = true,
        WitchGingerScope = true 
    }

    for _, styleName in ipairs(Styles) do
        local button = makeButton(styleName, nil)
        if gingerList[styleName] then button.Parent = scrollGinger else button.Parent = scrollMatrix end
        button:SetAttribute("StyleName", styleName)
        
        local preview = EFFECT_COLORS[styleName]
        if preview then
            button.BackgroundColor3 = preview
            button.BackgroundTransparency = 0
            local lum = preview.R * 0.299 + preview.G * 0.587 + preview.B * 0.114
            button.TextColor3 = lum > 0.6 and BK_BLACK or WHITE
        end
        button.Activated:Connect(function() selectStyle(styleName) end)
    end

    for trailName, _ in pairs(TRAIL_STYLES) do
        local button = makeButton(trailName, scrollTrails)
        button:SetAttribute("TrailName", trailName)
        if trailName == "None" then
            button.BackgroundColor3 = BK_BLACK_SOFT
        else
            local colorSeq = TRAIL_STYLES[trailName]
            button.BackgroundColor3 = colorSeq.Keypoints[1].Value
            if trailName == "Rainbow" then button.BackgroundColor3 = Color3.fromRGB(255, 105, 180) end
            if trailName == "Witch" then button.BackgroundColor3 = Color3.fromRGB(75, 0, 130) end
        end
        button.Activated:Connect(function() selectTrail(trailName) end)
    end

    for themeName, _ in pairs(ThemeSystem.Themes) do
        local button = makeButton(themeName, scrollThemes)
        button:SetAttribute("ThemeName", themeName)
        button.Activated:Connect(function() selectTheme(themeName) end)
    end

    matrixButton.Activated:Connect(function()
        playClick()
        customizerEnabled = not customizerEnabled
        matrixButton.Text = customizerEnabled and "CUSTOMIZER: ON" or "CUSTOMIZER: OFF"
        if customizerEnabled then applyCurrentStyle()
        else restoreAll(); status.Text = "Original properties restored" end
    end)

    purpleButton.Activated:Connect(function()
        playClick()
        if CURRENT_STYLE == "Purple" then selectStyle("Normal") else selectStyle("Purple") end
    end)

    rainbowButton.Activated:Connect(function()
        playClick()
        if CURRENT_STYLE == "RainbowScope" then selectStyle("Normal") else selectStyle("RainbowScope") end
    end)

    local function openPanel() playClick(); ball.Visible = false; main.Visible = true end
    local function closePanel() playClick(); main.Visible = false; ball.Visible = true end

    ball.Activated:Connect(openPanel)
    minimize.Activated:Connect(closePanel)

    local function makeDraggable(dragObj, moveObj)
        local dragStart, startPos, dragging = nil, nil, false
        dragObj.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true; dragStart = input.Position; startPos = moveObj.Position
                input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = input.Position - dragStart
                moveObj.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
    end

    makeDraggable(titleBar, main)
    makeDraggable(ball, ball)

    -- SAFETY LOOP
    task.spawn(function()
        while task.wait(3) do
            if customizerEnabled then
                local char = player.Character
                if char then for _, obj in ipairs(char:GetDescendants()) do if obj:IsA("Tool") and string.find(obj.Name, GUN_TOOL_NAME) then applyToTool(obj) end end end
                local backpack = player:FindFirstChild("Backpack")
                if backpack then for _, obj in ipairs(backpack:GetChildren()) do if obj:IsA("Tool") and string.find(obj.Name, GUN_TOOL_NAME) then applyToTool(obj) end end end
            end
        end
    end)

    print("[Customizer] Loaded ✔ — Blind Whitelist + Trails + Themes + Dynamic Colors 🛡️")
-- END OF SCRIPT
