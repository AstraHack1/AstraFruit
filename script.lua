-- Astra Hile Scripti
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/UI-Library-Repo/YourLibraryHere/main/Library.lua"))()

local Window = Library:CreateWindow("Astra Hile Menüsü", Color3.fromRGB(0, 0, 0)) -- Siyah arka plan
local MainTab = Window:CreateTab("Ana Menü")

-- Başlık
MainTab:CreateLabel("Astra Hile Scripti")

-- Auto Farm Sekmesi
local AutoFarmSection = MainTab:CreateSection("Auto Farm")
AutoFarmSection:CreateToggle("Farm Aç/Kapa", function(state)
    _G.AutoFarm = state
    while _G.AutoFarm do
        pcall(function()
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
                if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                    character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame
                    wait(0.5)
                    local tool = character:FindFirstChildOfClass("Tool")
                    if tool then
                        tool:Activate()
                    end
                end
            end
        end)
        wait(0.1)
    end
end)

-- Eşya Toplama Sekmesi
local ItemSection = MainTab:CreateSection("Eşya Topla")
ItemSection:CreateButton("Eşyaları Topla", function()
    local player = game.Players.LocalPlayer
    for _, item in pairs(game.Workspace.Items:GetChildren()) do
        if item:IsA("Part") or item:IsA("MeshPart") then
            player.Character.HumanoidRootPart.CFrame = item.CFrame
            wait(0.2)
        end
    end
end)

-- Işınlanma Sekmesi
local TeleportSection = MainTab:CreateSection("Işınlanma")
TeleportSection:CreateDropdown("Işınlanma Noktası Seç", {"Spawn", "Düşman Bölgesi", "Market"}, function(option)
    local player = game.Players.LocalPlayer
    if option == "Spawn" then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0) -- Spawn noktası
    elseif option == "Düşman Bölgesi" then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(100, 10, 100) -- Düşman bölgesi
    elseif option == "Market" then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(200, 10, 200) -- Market alanı
    end
end)
