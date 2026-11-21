-- C4 Falsa + Painel de Texturas + Queda + Confetes + Sem Cooldown
local Players = game:GetService("Players")
local Debris = game:GetService("Debris")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ===== LISTA DE TEXTURAS =====
local TEXTURAS = {
    { nome = "C4 1", id = "rbxassetid://104516981" },
    { nome = "C4 2", id = "rbxassetid://120892597032321" },
    { nome = "C4 3", id = "rbxassetid://78478439529790" },
    { nome = "C4 4", id = "rbxassetid://116505150605589" },
    { nome = "C4 5", id = "rbxassetid://72729219702473" },
    { nome = "C4 6", id = "rbxassetid://102038604584816" },
    { nome = "C4 7", id = "rbxassetid://127947985225610" },
}

local texturaAtual = TEXTURAS[1].id
local handMeshRef = nil
local toolRef = nil

-- ===== PAINEL GUI =====
local function criarPainel()
    local antigo = playerGui:FindFirstChild("PainelC4")
    if antigo then antigo:Destroy() end

    local gui = Instance.new("ScreenGui")
    gui.Name = "PainelC4"
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = playerGui

    -- Botão para abrir/fechar
    local toggle = Instance.new("TextButton")
    toggle.Name = "Toggle"
    toggle.Size = UDim2.new(0, 130, 0, 40)
    toggle.Position = UDim2.new(0, 15, 0.5, -20)
    toggle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    toggle.BorderSizePixel = 0
    toggle.Text = "🎨 Texturas C4"
    toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggle.Font = Enum.Font.GothamBold
    toggle.TextSize = 14
    toggle.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = toggle

    -- Frame principal
    local frame = Instance.new("Frame")
    frame.Name = "Frame"
    frame.Size = UDim2.new(0, 220, 0, 420)
    frame.Position = UDim2.new(0, 15, 0.5, -210)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    frame.BorderSizePixel = 0
    frame.Visible = false
    frame.Parent = gui

    local frameCorner = Instance.new("UICorner")
    frameCorner.CornerRadius = UDim.new(0, 10)
    frameCorner.Parent = frame

    local frameStroke = Instance.new("UIStroke")
    frameStroke.Color = Color3.fromRGB(255, 200, 0)
    frameStroke.Thickness = 2
    frameStroke.Parent = frame

    -- Título
    local titulo = Instance.new("TextLabel")
    titulo.Size = UDim2.new(1, 0, 0, 40)
    titulo.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
    titulo.BorderSizePixel = 0
    titulo.Text = "TEXTURAS DA C4"
    titulo.TextColor3 = Color3.fromRGB(0, 0, 0)
    titulo.Font = Enum.Font.GothamBold
    titulo.TextSize = 16
    titulo.Parent = frame

    local tituloCorner = Instance.new("UICorner")
    tituloCorner.CornerRadius = UDim.new(0, 10)
    tituloCorner.Parent = titulo

    -- Scroll
    local scroll = Instance.new("ScrollingFrame")
    scroll.Size = UDim2.new(1, -20, 1, -50)
    scroll.Position = UDim2.new(0, 10, 0, 45)
    scroll.BackgroundTransparency = 1
    scroll.BorderSizePixel = 0
    scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    scroll.ScrollBarThickness = 4
    scroll.Parent = frame

    local listLayout = Instance.new("UIListLayout")
    listLayout.Padding = UDim.new(0, 8)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Parent = scroll

    listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scroll.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 10)
    end)

    -- Função que aplica a textura
    local function aplicarTextura(id, botao)
        texturaAtual = id
        -- Atualiza textura na mão
        if handMeshRef and handMeshRef.Parent then
            handMeshRef.TextureId = id
        end
        -- Atualiza textura do tool (ícone da mochila)
        if toolRef then
            toolRef.TextureId = id
        end
        -- Feedback visual: destaca o botão selecionado
        for _, b in ipairs(scroll:GetChildren()) do
            if b:IsA("TextButton") then
                b.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            end
        end
        if botao then
            botao.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        end
    end

    -- Cria botão para cada textura
    for i, t in ipairs(TEXTURAS) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -10, 0, 70)
        btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        btn.BorderSizePixel = 0
        btn.LayoutOrder = i
        btn.Text = ""
        btn.AutoButtonColor = true
        btn.Parent = scroll

        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 8)
        btnCorner.Parent = btn

        -- Miniatura
        local img = Instance.new("ImageLabel")
        img.Size = UDim2.new(0, 55, 0, 55)
        img.Position = UDim2.new(0, 8, 0.5, -27)
        img.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        img.BorderSizePixel = 0
        img.Image = t.id
        img.ScaleType = Enum.ScaleType.Fit
        img.Parent = btn

        local imgCorner = Instance.new("UICorner")
        imgCorner.CornerRadius = UDim.new(0, 6)
        imgCorner.Parent = img

        -- Nome da textura
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -80, 1, 0)
        label.Position = UDim2.new(0, 70, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = t.nome
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.Font = Enum.Font.GothamBold
        label.TextSize = 14
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = btn

        btn.MouseButton1Click:Connect(function()
            aplicarTextura(t.id, btn)
        end)
    end

    -- Abrir/fechar painel
    toggle.MouseButton1Click:Connect(function()
        frame.Visible = not frame.Visible
    end)
end

-- ===== C4 =====
local function loadFakeC4()
    local backpack = player:WaitForChild("Backpack")
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    for _, item in pairs(backpack:GetChildren()) do
        if item.Name == "C4" or item.Name == "FakeC4" then item:Destroy() end
    end
    for _, item in pairs(character:GetChildren()) do
        if item.Name == "C4" or item.Name == "FakeC4" then item:Destroy() end
    end

    local GEAR_ID = 104642566
    local success, tool = pcall(function()
        return game:GetObjects("rbxassetid://" .. GEAR_ID)[1]
    end)

    if not success or not tool or not tool:IsA("Tool") then
        warn("❌ Falha ao carregar a C4 original.")
        return
    end

    tool.Name = "FakeC4"
    tool.TextureId = texturaAtual
    tool.RequiresHandle = true
    tool.CanBeDropped = false
    toolRef = tool

    local handle = tool:FindFirstChild("Handle") or tool:FindFirstChildWhichIsA("BasePart")
    if handle then
        handle.Transparency = 0
        handle.Color = Color3.fromRGB(45, 45, 45)
        handle.CanCollide = false
        handle.Massless = true
        handle.Size = Vector3.new(2.5, 2.5, 2.5)

        local handMesh = Instance.new("SpecialMesh")
        handMesh.MeshId = "rbxassetid://104516854"
        handMesh.TextureId = texturaAtual
        handMesh.Scale = Vector3.new(1.5, 1.5, 1.5)
        handMesh.Parent = handle
        handMeshRef = handMesh
    end

    for _, child in ipairs(tool:GetDescendants()) do
        if child:IsA("Script") or child:IsA("LocalScript") or child:IsA("Animation") then
            child:Destroy()
        end
    end

    tool.Parent = backpack
    humanoid:EquipTool(tool)

    tool.Activated:Connect(function()
        if handle then
            handle.Transparency = 1
        end

        local c4Part = Instance.new("Part")
        c4Part.Name = "DroppedC4"
        c4Part.Size = Vector3.new(3, 3, 3)
        c4Part.Color = Color3.fromRGB(45, 45, 45)
        c4Part.Material = Enum.Material.SmoothPlastic
        c4Part.CanCollide = true
        c4Part.Anchored = false

        local mesh = Instance.new("SpecialMesh")
        mesh.MeshId = "rbxassetid://104516854"
        mesh.TextureId = texturaAtual
        mesh.Scale = Vector3.new(1.5, 1.5, 1.5)
        mesh.Parent = c4Part

        local root = character:FindFirstChild("HumanoidRootPart")
        c4Part.CFrame = root.CFrame * CFrame.new(0, -3, -1)
        c4Part.Parent = workspace

        local gyro = Instance.new("BodyGyro")
        gyro.MaxTorque = Vector3.new(40000, 40000, 40000)
        gyro.P = 3000
        gyro.CFrame = c4Part.CFrame
        gyro.Parent = c4Part

        task.delay(0.5, function()
            if gyro and gyro.Parent then
                gyro:Destroy()
                c4Part.AssemblyAngularVelocity = Vector3.new(math.random(-5, 5), 0, math.random(-5, 5))
            end
        end)

        local beep = Instance.new("Sound")
        beep.SoundId = "rbxassetid://131961136"
        beep.Volume = 1
        beep.Parent = c4Part
        beep:Play()

        task.delay(3, function()
            local confetti = Instance.new("ParticleEmitter")
            confetti.Texture = "rbxassetid://396242399"
            confetti.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                ColorSequenceKeypoint.new(0.2, Color3.fromRGB(0, 255, 0)),
                ColorSequenceKeypoint.new(0.4, Color3.fromRGB(0, 0, 255)),
                ColorSequenceKeypoint.new(0.6, Color3.fromRGB(255, 255, 0)),
                ColorSequenceKeypoint.new(0.8, Color3.fromRGB(255, 0, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 255))
            })
            confetti.Size = NumberSequence.new(0.8)
            confetti.Speed = NumberRange.new(30, 60)
            confetti.SpreadAngle = Vector2.new(180, 180)
            confetti.Lifetime = NumberRange.new(2, 4)
            confetti.Rate = 0
            confetti.Parent = c4Part
            confetti:Emit(200)

            local boom = Instance.new("Sound")
            boom.SoundId = "rbxassetid://138186576"
            boom.Volume = 1.5
            boom.Parent = c4Part
            boom:Play()

            c4Part.Transparency = 1
            c4Part.CanCollide = false
            Debris:AddItem(c4Part, 4)
        end)

        task.delay(0.15, function()
            if handle then
                handle.Transparency = 0
            end
        end)
    end)

    print("✅ C4 Falsa carregada! Painel de texturas disponível.")
end

-- Iniciar
criarPainel()
loadFakeC4()

player.CharacterAdded:Connect(function()
    task.wait(1.2)
    loadFakeC4()
end)
