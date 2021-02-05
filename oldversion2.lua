--esp script by joost grunwald

local c=game:service("\80\108\97\121\101\114\115")local d=c.LocalPlayer

local Move = game.Workspace.Map
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local mouse = Players.LocalPlayer:GetMouse()
local g = false

-- mouse.KeyDown:Connect(function(key) --x ray hack
-- if key == "t" then
-- if g == false then
-- Move.Parent = ReplicatedStorage
-- Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
-- g = true
-- else if g == true then
-- Move.Parent = game.Workspace
-- Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
-- g = false
-- end
-- end
-- end)

-- i = (game.Players.LocalPlayer.Name)

-- mouse.KeyDown:Connect(function(key) 
-- if key == "o" then
-- _G.HeadSize = 40
-- _G.HeadOffset = 20
-- _G.Enabled = true
-- game:service'RunService'.Stepped:connect(function()
-- if _G.Enabled then
-- for i,v in pairs(game:service'Players':GetPlayers()) do
-- if v.TeamColor ~= game:service'Players'.LocalPlayer.TeamColor then
--if v.Name ~= game:service'Players'.LocalPlayer.Name then
-- pcall(function()
-- v.Character.Head.CanCollide = false
-- v.Character.Head.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
-- v.Character.Head.CFrame = v.Character.Torso.CFrame * CFrame.new(0,_G.HeadOffset,0)
-- end)
--end
-- end
-- end
-- end)

function Esp(_a,aa)
if _a~=c.LocalPlayer and
_a.Character then
local ba=_a.Character:FindFirstChild("\84\111\114\115\111")
if ba then
local ca=Instance.new("\66\105\108\108\98\111\97\114\100\71\117\105",workspace.CurrentCamera)local da=Instance.new("\70\114\97\109\101",ca)ca.AlwaysOnTop=true
ca.Enabled=true;ca.Size=UDim2.new(3.5,0,4.7,0)ca.Name=aa;ca.Adornee=ba;ca.StudsOffset=Vector3.new(0,
-0.6,0)
da.BackgroundColor3=Color3.new(1,0,0)da.BackgroundTransparency=0.8;da.BorderColor3=Color3.new(0,0,0)
da.BorderSizePixel=1;da.Size=UDim2.new(1,0,1,0)end end end

function Esp2(_a,aa)
if _a~=c.LocalPlayer and
_a.Character then
local ba=_a.Character:FindFirstChild("\84\111\114\115\111")
if ba then
local ca=Instance.new("\66\105\108\108\98\111\97\114\100\71\117\105",workspace.CurrentCamera)local da=Instance.new("\70\114\97\109\101",ca)ca.AlwaysOnTop=true
ca.Enabled=true;ca.Size=UDim2.new(3.5,0,4.7,0)ca.Name=aa;ca.Adornee=ba;ca.StudsOffset=Vector3.new(0,
-0.6,0)
da.BackgroundColor3=Color3.new(0,0,1)da.BackgroundTransparency=0.8;da.BorderColor3=Color3.new(0,0,0)
da.BorderSizePixel=1;da.Size=UDim2.new(1,0,1,0)end end end

function Esp3(_a,aa)
if _a~=c.LocalPlayer and
_a.Character then
local ba=_a.Character:FindFirstChild("\84\111\114\115\111")
if ba then
local ca=Instance.new("\66\105\108\108\98\111\97\114\100\71\117\105",workspace.CurrentCamera)local da=Instance.new("\70\114\97\109\101",ca)ca.AlwaysOnTop=true
ca.Enabled=true;ca.Size=UDim2.new(3.5,0,4.7,0)ca.Name=aa;ca.Adornee=ba;ca.StudsOffset=Vector3.new(0,
-0.6,0)
da.BackgroundColor3=Color3.new(0,1,0)da.BackgroundTransparency=0.8;da.BorderColor3=Color3.new(0,0,0)
da.BorderSizePixel=1;da.Size=UDim2.new(1,0,1,0)end end end

function Esp4(_a,aa)
if _a~=c.LocalPlayer and
_a.Character then
local ba=_a.Character:FindFirstChild("\84\111\114\115\111")
if ba then
local ca=Instance.new("\66\105\108\108\98\111\97\114\100\71\117\105",workspace.CurrentCamera)local da=Instance.new("\70\114\97\109\101",ca)ca.AlwaysOnTop=true
ca.Enabled=true;ca.Size=UDim2.new(3.5,0,4.7,0)ca.Name=aa;ca.Adornee=ba;ca.StudsOffset=Vector3.new(0,
-0.6,0)
da.BackgroundColor3=Color3.new(1,1,1)da.BackgroundTransparency=0.8;da.BorderColor3=Color3.new(0,0,0)
da.BorderSizePixel=1;da.Size=UDim2.new(1,0,1,0)end end end

function CheckEsp()
	for _a,aa in pairs(c:GetChildren())do
		if aa then
			if  aa.TeamColor~=d.TeamColor 
			    and aa.Team.Name~=d.Team.Name
				then local ba=aa.Character
				if ba then local ca=ba:FindFirstChild("\84\111\114\115\111")
					if ca then
						local da=workspace.CurrentCamera;local _b=aa.Name
						if
							da:FindFirstChild(_b)==nil then Esp(aa,_b)
						end 
					end 	
				end 
			elseif 	aa.Team.Name~=d.Team.Name 
				 and  aa.TeamColor == d.TeamColor 
					then local ba=aa.Character
					if ba then local ca=ba:FindFirstChild("\84\111\114\115\111")
						if ca then
							local da=workspace.CurrentCamera;local _b=aa.Name
							if
								da:FindFirstChild(_b)==nil then Esp3(aa,_b)
							end 
						end 	
					end 
			elseif aa.Team.Name == d.Team.Name 
				    and  aa.TeamColor~=d.TeamColor 
					then local ba=aa.Character
					if ba then local ca=ba:FindFirstChild("\84\111\114\115\111")
						if ca then
							local da=workspace.CurrentCamera;local _b=aa.Name
							if
								da:FindFirstChild(_b)==nil then Esp3(aa,_b)
							end 
						end 	
					end 
			elseif aa.Team.Name == d.Team.Name 
				    and  aa.TeamColor == d.TeamColor 
					then local ba=aa.Character
					if ba then local ca=ba:FindFirstChild("\84\111\114\115\111")
						if ca then
							local da=workspace.CurrentCamera;local _b=aa.Name
							if
								da:FindFirstChild(_b)==nil then Esp2(aa,_b)
							end 
						end 	
					end 
			else 
			 	local ba=aa.Character
				if ba then local ca=ba:FindFirstChild("\84\111\114\115\111")
					if ca then
						local da=workspace.CurrentCamera;local _b=aa.Name
						if
							da:FindFirstChild(_b)==nil then Esp4(aa,_b)
						end 
					end 	
				end 	
			end 
		end 
	end 
end;while wait(1)do CheckEsp()end