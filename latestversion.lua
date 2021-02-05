--lua script made and combined by Joost Grunwals

local safe = setmetatable({}, {
    __index = function(_, k)
        return game:GetService(k)
    end
 })
 
 local movethemouse = mousemoverel or Input.MoveMouse --Mouse Move Function.
 local leftclickme = nil --Auto Shoot Key Press Thingy.
 local aimbotting = true -- Toggles.
 local autoshoot = false
 local teamcheck = true
 local visiblecheck = true
 _G.xaimoffset = 0 --_G.xaimoffset = -25
 _G.maxdistfromcross = 100
 
 local cam = safe.Workspace.CurrentCamera -- Current Camera
 local lp = safe.Players.LocalPlayer -- Local Player
 local lpc = safe.Players.LocalPlayer.Character -- Local Player Character
 
 local wtos = function(v) -- World To Screen
    return cam:WorldToScreenPoint(v)
 end
 
 local distFromCenter = function(x, y)
    local vps = cam.ViewportSize -- Get ViewPortSize.
    local vpsx = vps.X
    local vpsy = vps.Y
    local screencenterx = vpsx/2
    local screencentery = vpsy/2
    local xdist = (x - screencenterx) -- X Distance From Mid Screen.
    local ydist = (y - screencentery) -- Y Distance From Mid Screen.
    local Hypotenuse = math.sqrt(math.pow(xdist, 2) + math.pow(ydist, 2))
    return Hypotenuse
 end
 
 local function inlos(p, ...) -- In line of site?
    return #cam:GetPartsObscuringTarget({p}, {cam, lp.Character, ...}) == 0
 end
 
 local getclosestPlayer = function() -- Checks the closest player based on Hypotenuse.
    local plrs, v = safe.Players:GetPlayers()
    local maxdist = 75
    local dist = math.huge
    local plr = "none"
    for i = 1, #plrs do
        v = plrs[i]
        if v ~= safe.Players.LocalPlayer then
            if v.Character then
                if v.TeamColor ~= safe.Players.LocalPlayer.TeamColor and teamcheck then
                    local hpos = wtos(v.Character.Head.Position)
                    local idist = distFromCenter(hpos.X, hpos.Y)
                    if idist < dist and idist < _G.maxdistfromcross then
                        dist = idist
                        plr = v
                    end
                elseif not teamcheck then
                    local hpos = wtos(v.Character.Head.Position)
                    local idist = distFromCenter(hpos.X, hpos.Y)
                    if idist < dist and idist < _G.maxdistfromcross then
                        dist = idist
                        plr = v
                    end
                end
            end
        end
    end
    return plr, dist
 end
 
 local AimAt = function(x, y)
    local vps = cam.ViewportSize
    local vpsx = vps.X
    local vpsy = vps.Y
    local screencenterx = vpsx/2
    local screencentery = vpsy/2
    local aimspeed = 5
    local aimatx
    local aimaty
 
    if x ~= 0 then
        if x > screencenterx then
            aimatx = -(screencenterx - x)
            aimatx = aimatx/aimspeed
            if aimatx + screencenterx > screencenterx * 2 then
                aimatx = 0
            end
        end
        if x < screencenterx then
            aimatx = x - screencenterx
            aimatx = aimatx/aimspeed
            if aimatx + screencenterx < 0 then
                aimatx = 0
            end
        end
    end
 
    if y ~= 0 then
        if y > screencentery then
            aimaty = -(screencentery - y)
            aimaty = aimaty/aimspeed
            if aimaty + screencentery > screencentery * 2 then
                aimaty = 0
            end
        end
        if y < screencentery then
            aimaty = y - screencentery
            aimaty = aimaty/aimspeed
            if aimaty + screencentery < 0 then
                aimaty = 0
            end
        end
    end
    return aimatx, aimaty
 end
 
 local MouseTests = function()
    local player = safe.Players.LocalPlayer
    local mouse = player:GetMouse()
    local screensizex = mouse.ViewSizeX
    local screensizey = mouse.ViewSizeY
    local midx = screensizex/2
    local midy = screensizey/2
    local mousex = mouse.X
    local mousey = mouse.Y
    local moveamountx = midx - mousex
    local moveamounty = midy - mousey
    movethemouse(moveamountx, moveamounty)
    local camera = safe.Workspace.Camera
    local newmousex = safe.Players.LocalPlayer:GetMouse().X
    local newmousey = safe.Players.LocalPlayer:GetMouse().Y
    local closestplayer = getclosestPlayer()
    if player.Character.Humanoid.Health > 0 then
        if closestplayer ~= "none" then
            if inlos(closestplayer.Character.Head.Position, closestplayer.Character) and visiblecheck then
                local closesthead = closestplayer.Character.Head
                local p = camera:WorldToScreenPoint(closesthead.Position)
                local xdistancetohead, ydistancetohead = AimAt(p.X + _G.xaimoffset, p.Y + 32)
                movethemouse(xdistancetohead, ydistancetohead)
                if autoshoot then
                    movethemouse(xdistancetohead, ydistancetohead)
                    wait(1)
                    Input.LeftClick(MOUSE_DOWN)
                    wait()
                end
 elseif not visiblecheck then
 local closesthead = closestplayer.Character.Head
                local p = camera:WorldToScreenPoint(closesthead.Position)
                local xdistancetohead, ydistancetohead = AimAt(p.X + _G.xaimoffset, p.Y + 32)
                movethemouse(xdistancetohead, ydistancetohead)
            end
        end
    end
 end
 
 game:GetService('RunService').Stepped:connect(function()
    if aimbotting then
    --MouseTests()
    end
 end)
 
 
 local plr = safe.Players.LocalPlayer
 local mouse = plr:GetMouse()
 mouse.KeyDown:connect(function(key)
    if key == "t" then
        aimbotting = not aimbotting
        print("Aimbotting: " .. tostring(aimbotting))
        MouseTests()
    end
 end)
 
 
 
 print("Pixel Aimbot Loaded!")
 
 MB2Held = false
 
 function onKeyPress(inputObject,gameProcessed)
    if inputObject.UserInputType == Enum.UserInputType.MouseButton2 then
        MB2Held = true
        while MB2Held do
            if aimbotting then
                MouseTests()
            end
            wait()
        end
    end
 end
 
 function onKeyRelease(inputObject,gameProcessed)
    if inputObject.UserInputType == Enum.UserInputType.MouseButton2 then
        MB2Held = false
    end
 end
 
 game:GetService("UserInputService").InputBegan:connect(onKeyPress)
 game:GetService("UserInputService").InputEnded:connect(onKeyRelease)
 
 --esp script by joost grunwald
 
 local c=game:service("\80\108\97\121\101\114\115")local d=c.LocalPlayer
 
 local Move = game.Workspace.Map
 local ReplicatedStorage = game:GetService("ReplicatedStorage")
 local Players = game:GetService("Players")
 local mouse = Players.LocalPlayer:GetMouse()
 local a = false
 
 mouse.KeyDown:Connect(function(key)
 if key == "e" then 
 CheckEsp()
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