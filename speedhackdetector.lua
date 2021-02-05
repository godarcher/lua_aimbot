--roblox anti speedhack script

local c=game:service("\80\108\97\121\101\114\115")local d=c.LocalPlayer
local Players = game:GetService("Players")
local a = false
local beginposx = 0
local beginposy = 0
player = game.Players.LocalPlayer
character = player.Character

function sleep(n)
  if n > 0 then os.execute("ping -n " .. tonumber(n+1) .. " localhost > NUL") end
end

function CheckEsp()
	for _a,aa in pairs(c:GetChildren())do
		if aa then
			local ba=aa.Character
			if ba then 
				local hmndrootpart =ba:FindFirstChild("HumanoidRootPart")
				local beginposx = hmndrootpart.Position.X
				local beginposy = hmndrootpart.Position.Y
				sleep(10000) --delay for 10 seconds
				local secondposx = hmndrootpart.Position.X
				local secondposy = hmndrootpart.Position.Y
				
