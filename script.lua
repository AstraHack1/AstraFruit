-- Blox Fruits Gelişmiş GUI Scripti (Her Sea İçin Özel Teleport)
-- Script Sadece Eğitim Amaçlıdır!

-- GUI Oluşturma
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Logo = Instance.new("ImageLabel") -- Logo için ImageLabel
local SeaDropdown = Instance.new("TextButton")
local IslandsFrame = Instance.new("Frame")
local SpeedBoostButton = Instance.new("TextButton") -- Hız Artışı
local AutoFarmButton = Instance.new("TextButton") -- Otomatik Farm

-- GUI Özellikleri
ScreenGui.Parent = game.CoreGui

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 600, 0, 800) -- Daha büyük boyut
MainFrame.Visible = false -- Başlangıçta gizli olacak
MainFrame.Active = true
MainFrame.Draggable = true -- GUI'yi hareket ettirilebilir yapar

Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.Size = UDim2.new(0, 600, 0, 50)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Blox Fruits Gelişmiş Menü"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 30

-- Logo Ayarları
Logo.Parent = ScreenGui
Logo.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Logo.Position = UDim2.new(0, 10, 0, 10)
Logo.Size = UDim2.new(0, 100, 0, 100) -- Logo boyutunu belirle
Logo.Image = "http://www.roblox.com/asset/?id=95202280707520"
Logo.Active = true

SeaDropdown.Parent = MainFrame
SeaDropdown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SeaDropdown.Position = UDim2.new(0, 0, 0.1, 0)
SeaDropdown.Size = UDim2.new(0, 600, 0, 50)
SeaDropdown.Font = Enum.Font.SourceSansBold
SeaDropdown.Text = "Sea Seç: 1"
SeaDropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
SeaDropdown.TextSize = 20

IslandsFrame.Parent = MainFrame
IslandsFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
IslandsFrame.Position = UDim2.new(0, 0, 0.2, 0)
IslandsFrame.Size = UDim2.new(0, 600, 0, 500)

-- Ekstra Özellik: Hız Artışı
SpeedBoostButton.Parent = MainFrame
SpeedBoostButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SpeedBoostButton.Position = UDim2.new(0, 0, 0.8, 0)
SpeedBoostButton.Size = UDim2.new(0, 600, 0, 50)
SpeedBoostButton.Font = Enum.Font.SourceSansBold
SpeedBoostButton.Text = "Hız Artışı: Kapalı"
SpeedBoostButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedBoostButton.TextSize = 20

-- GUI'yi Aç/Kapat Fonksiyonu
Logo.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Teleport Fonksiyonu
function teleport(location)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(location)
end

-- Ada Düğmeleri Oluşturma
function createIslandButton(islandName, position)
    local button = Instance.new("TextButton")
    button.Parent = IslandsFrame
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.Size = UDim2.new(0, 580, 0, 40)
    button.Position = position
    button.Font = Enum.Font.SourceSans
    button.Text = islandName
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 18
    return button
end

-- Sea Bilgisini Tespit Etme
local currentSea = 1
local islands = {}

-- Oyuncunun hangi Sea'de olduğunu belirleme
function detectCurrentSea()
    local position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    if position.Y < 1000 then
        currentSea = 1
    elseif position.Y < 5000 then
        currentSea = 2
    else
        currentSea = 3
    end
    SeaDropdown.Text = "Sea Seç: " .. currentSea
    updateIslands()
end

-- Adaları Güncelleme Fonksiyonu
function updateIslands()
    for _, child in pairs(IslandsFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    if currentSea == 1 then
        islands = {
            {name = "Starter Island", location = Vector3.new(100, 20, 100)},
            {name = "Jungle", location = Vector3.new(200, 30, 200)},
            {name = "Desert", location = Vector3.new(300, 40, 300)},
        }
    elseif currentSea == 2 then
        islands = {
            {name = "Cafe", location = Vector3.new(400, 50, 400)},
            {name = "Colosseum", location = Vector3.new(500, 60, 500)},
            {name = "Ussop's Island", location = Vector3.new(600, 70, 600)},
        }
    elseif currentSea == 3 then
        islands = {
            {name = "Port Town", location = Vector3.new(700, 80, 700)},
            {name = "Floating Turtle", location = Vector3.new(800, 90, 800)},
            {name = "Great Tree", location = Vector3.new(900, 100, 900)},
        }
    end

    for i, island in ipairs(islands) do
        local button = createIslandButton(island.name, UDim2.new(0, 0, (i - 1) * 0.15, 0))
        button.MouseButton1Click:Connect(function()
            teleport(island.location)
        end)
    end
end

-- Sea'yi Otomatik Tespit Etme
detectCurrentSea()

-- Sea Manuel Değiştirici
SeaDropdown.MouseButton1Click:Connect(function()
    currentSea = currentSea + 1
    if currentSea > 3 then currentSea = 1 end
    SeaDropdown.Text = "Sea Seç: " .. currentSea
    updateIslands()
end)
