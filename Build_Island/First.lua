local Players = game:GetService("Players")
local client = Players.LocalPlayer

local plot = workspace.Plots[client.Name]
local ressources = plot.Resources
local plants = plot.Plants

local dont = {
    "Bamboo";
    "Obsidian";
    "Oak Tree";
    "Stone"
}

local function tpto(p1)
    pcall(function()
        client.Character.HumanoidRootPart.CFrame = p1
    end)
end

task.spawn(function()
    while task.wait() do
        for i, v in ressources:GetChildren() do
            if v:GetAttribute("MaxHP") == v:GetAttribute("HP") then
                for i = 1, math.ceil(v:GetAttribute("MaxHP") / 4) do
                    local args = {
                        v
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("HitResource"):FireServer(unpack(args))
                end
                task.wait()
            end
        end
        task.wait()
    end
end)

task.spawn(function()
    while task.wait() do
        for i, v in plants:GetChildren() do
            local args = {
                v.Name
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("Harvest"):FireServer(unpack(args))
            task.wait(0.1)
        end
        task.wait(5)
    end
end)