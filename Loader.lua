repeat task.wait() until game:IsLoaded()
local client = game.Players.LocalPlayer
local VirtualUser = game:GetService("VirtualUser")
local TeleportService = game:GetService("TeleportService")

client.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

local GuiService = game:GetService("GuiService")
GuiService.ErrorMessageChanged:Connect(function()
	TeleportService:Teleport(5956785391, client)
end)

;
pcall(function()
	local potKey = "CloudHub/key"
	local continu = true
	local KeyGuardLibrary = loadstring(game:HttpGet("https://cdn.keyguardian.org/library/v1.0.0.lua"))()
	local trueData = "e49bcb68a54f4ef8bb52ee0df590bd9a"
	local falseData = "5633200290f640dd9a708a0f0d10d4ab"

	KeyGuardLibrary.Set({
		publicToken = "01f4a63c9efa4f4d8ec36e1edbd8bed8",
		privateToken = "57d25087e28d485bbc6ecc7138c081a1",
		trueData = trueData,
		falseData = falseData,
	})
	if isfile(potKey) then
		if KeyGuardLibrary.validateDefaultKey(readfile(potKey)) == trueData then
			continu = false
			return
		end
	end

	local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
	local key = ""

	local Window = Fluent:CreateWindow({
		Title = "Key System",
		SubTitle = "CloudHub",
		TabWidth = 160,
		Size = UDim2.fromOffset(580, 340),
		Acrylic = false,
		Theme = "Dark",
		MinimizeKey = Enum.KeyCode.LeftControl
	})

	local Tabs = {
		KeySys = Window:AddTab({ Title = "Key System", Icon = "key" }),
	}

	local Entkey = Tabs.KeySys:AddInput("Input", {
		Title = "Enter Key",
		Description = "Enter Key Here",
		Default = "",
		Placeholder = "Enter key…",
		Numeric = false,
		Finished = false,
		Callback = function(Value)
			key = Value
		end
	})

	local Checkkey = Tabs.KeySys:AddButton({
		Title = "Check Key",
		Description = "Enter Key before pressing this button",
		Callback = function()
			local response = KeyGuardLibrary.validateDefaultKey(key)
			if response == trueData then
				writefile(potKey, key)
				continu = false
				Fluent:Destroy()
			else
			end
		end
	})

	local Getkey = Tabs.KeySys:AddButton({
		Title = "Get Key",
		Description = "Get Key here",
		Callback = function()
			setclipboard(KeyGuardLibrary.getLink())
		end
	})

	Window:SelectTab(1)
	while continu do task.wait() end
end)
local baseUrl = "https://raw.githubusercontent.com/cloudman4416/scripts/refs/heads/main/"

local succ, err = pcall(function()
    loadstring(game:HttpGet(baseUrl..game.PlaceId))()
end)

if not succ then
    print(err)
end