-- Sea'ye Göre Adalar İçin Teleport Scripti
-- Script Sadece Eğitim Amaçlıdır!

-- GUI Oluşturma
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SeaDropdown = Instance.new("TextButton")
local IslandsFrame = Instance.new("Frame")

-- GUI Özellikleri
ScreenGui.Parent = game.CoreGui

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 300, 0, 500)

Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.Size = UDim2.new(0, 300, 0, 50)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Blox Fruits Teleport Menüsü"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20

SeaDropdown.Parent = MainFrame
SeaDropdown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SeaDropdown.Position = UDim2.new(0, 0, 0.15, 0)
SeaDropdown.Size = UDim2.new(0, 300, 0, 50)
SeaDropdown.Font = Enum.Font.SourceSansBold
SeaDropdown.Text = "Sea Seç: 1"
SeaDropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
SeaDropdown.TextSize = 18

IslandsFrame.Parent = MainFrame
IslandsFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
IslandsFrame.Position = UDim2.new(0, 0, 0.3, 0)
IslandsFrame.Size = UDim2.new(0, 300, 0, 350)

-- Teleport Fonksiyonu
function teleport(location)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(location)
end

-- Ada Düğmeleri Oluşturma
function createIslandButton(islandName, position)
    local button = Instance.new("TextButton")
    button.Parent = IslandsFrame
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.Size = UDim2.new(0, 280, 0, 40)
    button.Position = position
    button.Font = Enum.Font.SourceSans
    button.Text = islandName
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 16
    return button
end

-- Sea Seçimini Tutma
local currentSea = 1
local islands = {}

-- Adaları Güncelleme Fonksiyonu
function updateIslands()
    for _, child in pairs(IslandsFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    if currentSea == 1 then
        -- Sea 1 için adalar
        islands = {
            {name = "Starter Island", location = Vector3.new(100, 20, 100)},
            {name = "Jungle", location = Vector3.new(200, 30, 200)},
            {name = "Desert", location = Vector3.new(300, 40, 300)},
            -- Diğer Sea 1 adalarını ekleyebilirsin...
        }
    elseif currentSea == 2 then
        -- Sea 2 için adalar
        islands = {
            {name = "Cafe", location = Vector3.new(400, 50, 400)},
            {name = "Colosseum", location = Vector3.new(500, 60, 500)},
            {name = "Ussop's Island", location = Vector3.new(600, 70, 600)},
            -- Diğer Sea 2 adalarını ekleyebilirsin...
        }
    elseif currentSea == 3 then
        -- Sea 3 için adalar
        islands = {
            {name = "Port Town", location = Vector3.new(700, 80, 700)},
            {name = "Floating Turtle", location = Vector3.new(800, 90, 800)},
            {name = "Great Tree", location = Vector3.new(900, 100, 900)},
            -- Diğer Sea 3 adalarını ekleyebilirsin...
        }
    end

    -- Güncellenen adalar için düğmeleri oluşturma
    for i, island in ipairs(islands) do
        local button = createIslandButton(island.name, UDim2.new(0, 0, (i - 1) * 0.15, 0))
        button.MouseButton1Click:Connect(function()
            teleport(island.location)
        end)
    end
end

-- Sea Değiştirici
SeaDropdown.MouseButton1Click:Connect(function()
    currentSea = currentSea + 1
    if currentSea > 3 then currentSea = 1 end
    SeaDropdown.Text = "Sea Seç: " .. currentSea
    updateIslands()
end)

-- İlk Adaları Yükleme
updateIslands()
