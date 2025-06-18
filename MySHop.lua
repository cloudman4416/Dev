local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")

local client = game.Players.LocalPlayer
local save = HttpService:JSONDecode((isfile("CloudHub/Servers") and readfile("CloudHub/Servers")) or '{"Joined":[], "History":[]}')

local ret = game:HttpGet(`https://games.roblox.com/v1/games/{game.PlaceId}/servers/Public?sortOrder=Asc&limit=100`)
if ret then
	local dec = HttpService:JSONDecode(ret)
	if dec.data then
		save.History = dec.data 
		for i, v in dec.data do
			if v.playing > 1 then
				TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, client)
				table.insert(save.Joined, v.id)
				break
			end
		end
	end
else
    for i, v in save.History do
        if v.playing > 1 then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, client)
            table.insert(save.Joined, v.id)
            break
        end
    end
end

writefile("CloudHub/Servers", HttpService:JSONEncode(save))