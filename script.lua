-- Blox Fruits Basit GUI Scripti
-- Script sadece eğitim amaçlıdır!

-- GUI Oluşturma
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Logo = Instance.new("ImageButton") -- Logo için ImageButton
local SeaDropdown = Instance.new("TextButton")
local IslandsFrame = Instance.new("Frame")

-- GUI Özellikleri
ScreenGui.Parent = game.CoreGui

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 400, 0, 600) -- Küçük ve basit boyut
MainFrame.Visible = false -- Başlangıçta gizli olacak
MainFrame.Active = true
MainFrame.Draggable = true -- GUI'yi hareket ettirilebilir yapar

Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.Size = UDim2.new(0, 400, 0, 50)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Blox Fruits Basit Menü"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 25

-- Logo Ayarları
Logo.Parent = ScreenGui
Logo.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Logo.Position = UDim2.new(0, 10, 0, 10)
Logo.Size = UDim2.new(0, 80, 0, 80) -- Logo boyutunu belirle
Logo.Image = "http://www.roblox.com/asset/?id=95202280707520"
Logo.Active = true

SeaDropdown.Parent = MainFrame
SeaDropdown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SeaDropdown.Position = UDim2.new(0, 0, 0.1, 0)
SeaDropdown.Size = UDim2.new(0, 400, 0, 40)
SeaDropdown.Font = Enum.Font.SourceSansBold
SeaDropdown.Text = "Sea Seç: 1"
SeaDropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
SeaDropdown.TextSize = 18

IslandsFrame.Parent = MainFrame
IslandsFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
IslandsFrame.Position = UDim2.new(0, 0, 0.2, 0)
IslandsFrame.Size = UDim2.new(0, 400, 0, 450)

-- GUI'yi Aç/Kapat Fonksiyonu
Logo.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Teleport Fonksiyonu
function teleport(location)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(location)
end

-- Ada Düğmeleri Oluşturma
function createIslandButton(islandName, location)
    local button = Instance.new("TextButton")
    button.Parent = IslandsFrame
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.Size = UDim2.new(0, 380, 0, 30)
    button.Font = Enum.Font.SourceSans
    button.Text = islandName
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 16

    button.MouseButton1Click:Connect(function()
        teleport(location)
    end)
end

-- Adaları Güncelleme Fonksiyonu
function updateIslands(sea)
    for _, child in pairs(IslandsFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    if sea == 1 then
        createIslandButton("Starter Island", Vector3.new(100, 20, 100))
        createIslandButton("Jungle", Vector3.new(200, 30, 200))
        createIslandButton("Desert", Vector3.new(300, 40, 300))
    elseif sea == 2 then
        createIslandButton("Cafe", Vector3.new(400, 50, 400))
        createIslandButton("Colosseum", Vector3.new(500, 60, 500))
        createIslandButton("Ussop's Island", Vector3.new(600, 70, 600))
    elseif sea == 3 then
        createIslandButton("Port Town", Vector3.new(700, 80, 700))
        createIslandButton("Floating Turtle", Vector3.new(800, 90, 800))
        createIslandButton("Great Tree", Vector3.new(900, 100, 900))
    end
end

-- Sea Manuel Değiştirici
local currentSea = 1
SeaDropdown.MouseButton1Click:Connect(function()
    currentSea = currentSea + 1
    if currentSea > 3 then currentSea = 1 end
    SeaDropdown.Text = "Sea Seç: " .. currentSea
    updateIslands(currentSea)
end)

-- Başlangıçta Sea 1'deki Adaları Göster
updateIslands(1)
