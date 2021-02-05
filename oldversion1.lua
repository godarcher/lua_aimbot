--------------------------------
--esp script by joost grunwald--
--------------------------------

-- all copyright is from joost grunwald and should not be infringed

local c=game:service("\80\108\97\121\101\114\115")local d=c.LocalPlayer

local Move = game.Workspace.Map
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local mouse = Players.LocalPlayer:GetMouse()
local a = false

mouse.KeyDown:Connect(function(key)
if key == "y" then
if a == false then
Move.Parent = ReplicatedStorage
Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
a = true
elseif a == true then
Move.Parent = game.Workspace
Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
a = false
end
end
end)

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