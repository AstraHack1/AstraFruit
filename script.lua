-- GUI Oluşturma
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Logo = Instance.new("ImageLabel")
local FarmButton = Instance.new("TextButton")
local TeleportButton = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui

-- Ana Menü
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Draggable = true

-- Logo
Logo.Parent = MainFrame
Logo.Position = UDim2.new(0.35, 0, 0.1, 0)
Logo.Size = UDim2.new(0.3, 0, 0.2, 0)
Logo.Image = "http://www.roblox.com/asset/?id=95202280707520"

-- Farm Butonu
FarmButton.Parent = MainFrame
FarmButton.Text = "Farm"
FarmButton.Position = UDim2.new(0.1, 0, 0.4, 0)
FarmButton.Size = UDim2.new(0.8, 0, 0.1, 0)
FarmButton.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    for _, enemy in pairs(workspace.Enemies:GetChildren()) do
        if enemy:FindFirstChild("Humanoid") then
            player.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame
            wait(0.5)
        end
    end
end)

-- Işınlanma Butonu
TeleportButton.Parent = MainFrame
TeleportButton.Text = "Işınlan"
TeleportButton.Position = UDim2.new(0.1, 0, 0.6, 0)
TeleportButton.Size = UDim2.new(0.8, 0, 0.1, 0)
TeleportButton.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 100, 0)
end)
