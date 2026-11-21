local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local localPlayer = Players.LocalPlayer

-- Todas as texturas (6 antigas + 7 novas)
local bombIds = {
    -- Antigas
    "rbxassetid://72634649711269",
    "rbxassetid://101785080415896",
    "rbxassetid://87195137432081",
    "rbxassetid://75764270519412",
    "rbxassetid://133744095064808",
    "rbxassetid://72795881681356",
    
    -- Novas
    "rbxassetid://104516981",
    "rbxassetid://120892597032321",
    "rbxassetid://78478439529790",
    "rbxassetid://116505150605589",
    "rbxassetid://72729219702473",
    "rbxassetid://102038604584816",
    "rbxassetid://127947985225610"
}

local currentTexture = bombIds[1]
local selectedButton = nil

-- Função para tornar qualquer Frame/Botão arrastável
local function makeDraggable(guiObject)
    local dragging = false
    local dragStart = nil
    local startPos = nil

    local function update(input)
        local delta = input.Position - dragStart
        guiObject.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end

    guiObject.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = guiObject.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    guiObject.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            if dragging then
                update(input)
            end
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            if dragging then
                update(input)
            end
        end
    end)
end

-- Função forte para aplicar a textura na bomba
local function modifyBomb(obj)
    if not obj then return end
    local name = obj.Name:lower()
    
    if not (name:find("bomb") or name:find("prank")) then return end
    
    for _, part in ipairs(obj:GetDescendants()) do
        if part:IsA("MeshPart") then
            part.TextureID = currentTexture
        elseif part:IsA("BasePart") then
            for _, sub in ipairs(part:GetChildren()) do
                if sub:IsA("Decal") or sub:IsA("Texture") then
                    sub.Texture = currentTexture
                elseif sub:IsA("SpecialMesh") then
                    sub.TextureId = currentTexture
                end
            end
        end
    end
    if obj:IsA("MeshPart") then
        obj.TextureID = currentTexture
    end
end

-- Monitorar mão e mochila
local function onCharacterAdded(char)
    char.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            task.spawn(function()
                task.wait(0.05)
                modifyBomb(child)
            end)
        end
    end)
end

if localPlayer.Character then
    onCharacterAdded(localPlayer.Character)
end
localPlayer.CharacterAdded:Connect(onCharacterAdded)

if localPlayer:FindFirstChild("Backpack") then
    localPlayer.Backpack.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            task.spawn(function()
                task.wait(0.05)
                modifyBomb(child)
            end)
        end
    end)
end

-- ==================== UI ====================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GoldBombGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = CoreGui

-- Botão de abrir (arrastável)
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 140, 0, 40)
toggleBtn.Position = UDim2.new(0, 20, 0, 120)
toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.TextSize = 14
toggleBtn.Font = Enum.Font.SourceSansBold
toggleBtn.Text = "قائمة Gold Bomb 💣"
toggleBtn.Parent = screenGui

local c1 = Instance.new("UICorner")
c1.CornerRadius = UDim.new(0, 8)
c1.Parent = toggleBtn

makeDraggable(toggleBtn)

-- Painel principal (arrastável) - altura maior para 13 botões
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 280, 0, 620)
mainFrame.Position = UDim2.new(0, 20, 0, 170)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Parent = screenGui

local c2 = Instance.new("UICorner")
c2.CornerRadius = UDim.new(0, 10)
c2.Parent = mainFrame

makeDraggable(mainFrame)

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.BackgroundTransparency = 1
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 13
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.Text = "اختر صورة قنبلة Gold Prank Bomb"
titleLabel.Parent = mainFrame

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 14
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.Text = "X"
closeBtn.Parent = mainFrame

local c3 = Instance.new("UICorner")
c3.CornerRadius = UDim.new(0, 6)
c3.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

toggleBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

-- Criar os 13 botões
for i, idAsset in ipairs(bombIds) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 35)
    btn.Position = UDim2.new(0.05, 0, 0, 45 + (i * 42))
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 12
    btn.Font = Enum.Font.SourceSansBold
    
    -- Diferencia visualmente antigas e novas
    if i <= 6 then
        btn.Text = "صورة قديمة " .. i
    else
        btn.Text = "صورة جديدة " .. (i - 6)
    end
    
    btn.Parent = mainFrame
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        currentTexture = idAsset
        
        if selectedButton then
            selectedButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end
        selectedButton = btn
        btn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
        
        -- Aplicar imediatamente na mão
        if localPlayer.Character then
            for _, item in ipairs(localPlayer.Character:GetChildren()) do
                if item:IsA("Tool") then
                    modifyBomb(item)
                end
            end
        end
        
        print("تم تغيير وتثبيت الصورة: " .. idAsset)
    end)
end

print("تم تفعيل السكريبت المحدث بنجاح! (13 Texturas + Draggable)")
