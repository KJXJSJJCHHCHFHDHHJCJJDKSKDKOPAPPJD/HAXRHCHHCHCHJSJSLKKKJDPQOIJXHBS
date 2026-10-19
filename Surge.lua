
local breakingb = false

local function GetGitSound(url, name)
if not isfile(name .. ".mp3") then
writefile(name .. ".mp3", game:HttpGet(url))
end

local sound = Instance.new("Sound")
sound.SoundId = (getcustomasset or getsynasset)(name .. ".mp3")
return sound

end
local function LoadModel(file, url)
if not isfile(file) then
writefile(file, game:HttpGet(url))
end

return game:GetObjects((getcustomasset or getsynasset)(file))[1]

end


local dmg = GetGitSound(
"https://github.com/lynguyen26031993-design/-u/raw/refs/heads/main/SFX_Electrocute4.mp3?raw=true",
"vuidkdjxjccn"
)
dmg.Volume = 0.7
dmg.Parent = workspace 

local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local CameraShaker = require(game.ReplicatedStorage:WaitForChild("CameraShaker"))
local camera = workspace.CurrentCamera

local spawnShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
	camera.CFrame = camera.CFrame * shakeCf
end)

spawnShake:Start()

local function ElectrocutedLight(light)
local rs = game:GetService("ReplicatedStorage")
local ts = game:GetService("TweenService")
local cs = game:GetService("CollectionService")

local lr = rs.GameData.LatestRoom
local room = workspace.CurrentRooms:FindFirstChild(tostring(lr.Value))
local fixtures = room and room:FindFirstChild("Assets")
and room.Assets:FindFirstChild("Light_Fixtures")

if not fixtures then return end

local ev = require(rs.ModulesClient.Module_Events)
local lights = {}
local models = {}

for _, v in ipairs(fixtures:GetChildren()) do
if v:IsA("Model") and v.Name == "LightStand" then
table.insert(models, v)
end
end

for i = #models, 2, -1 do
local j = math.random(1, i)
models[i], models[j] = models[j], models[i]
end

for i = 1, math.min(light, #models) do
table.insert(lights, models[i])
end

for _, v in ipairs(lights) do
ev.breakSingleLight(v)
task.wait(0.2)
end

task.wait(1.3)



local elec = GetGitSound(
"https://github.com/lynguyen26031993-design/-u/raw/refs/heads/main/surgeline.mp3?raw=true",
"bvkdkkxjcjjfjf"
)

local sound1 = GetGitSound(
"https://github.com/lynguyen26031993-design/-u/raw/refs/heads/main/Electricity%20Static%2017%20(SFX).mp3?raw=true",
"hcjisksjxjcj"
)
sound1.Volume = 0.4
sound1.RollOffMaxDistance = 100

local sound2 = GetGitSound(
"https://github.com/lynguyen26031993-design/-u/raw/refs/heads/main/Electricity%20Static%2023%20(SFX).mp3?raw=true",
"jvjkdkxjjcg"
)
sound2.Volume = 0.4
sound2.RollOffMaxDistance = 100





local src = LoadModel(
"SurgeLocalCenter.txt",
"https://github.com/lynguyen26031993-design/-u/raw/refs/heads/main/Place_74871629393921_Attachment_SurgeLocalCenter_1791729897.txt"
)

if not src then return end

local dmggui = LoadModel(
"SurgeDamageUi.txt",
"https://github.com/lynguyen26031993-design/-u/raw/refs/heads/main/Place_131351567799504_ScreenGui_SurgeReignitedUI_1792302581.txt"
)

dmggui.Parent = game.Players.LocalPlayer.PlayerGui

for _, stand in ipairs(lights) do
if stand.Parent then
for _, p in ipairs(stand:GetDescendants()) do
if p.Name == "LightFixture" and p:IsA("BasePart") then
local clone = src:Clone()
clone.Parent = p


local a1, a2, beam, beam2
local active = false

local hitBeam = false
local dmgCooldown = false

for _, v in ipairs(clone:GetChildren()) do
    if v:IsA("Attachment") and v.Name == "SurgeActiveSpark" then
        local hasSound = false

        for _, obj in ipairs(v:GetChildren()) do
            if obj:IsA("Sound") then
                hasSound = true
                break
            end
        end

        if hasSound then
            a1 = v
        else
            a2 = v
        end
    end
end

if a1 and a2 then
    beam = a1:FindFirstChild("SparkBeam", true)

    if beam and beam:IsA("Beam") then
        beam.Attachment0 = a2
        beam.Enabled = false
    else
        beam = nil
    end
end

if a1 and a2 then
    beam2 = a2:FindFirstChild("SparkBeam", true)


end


            task.spawn(function()
                local sparks = {}
                local shock = {}
                local sounds = {}

                for _, v in ipairs(clone:GetDescendants()) do
                    if v:IsA("Sound") and v.Name == "Sound" then
                        v.SoundId = elec.SoundId
                        table.insert(sounds, v)
                    end

                    if v.Name == "SurgeActiveSpark" and v:IsA("Attachment") then
                        for _, obj in ipairs(v:GetDescendants()) do
                            if obj.Name == "SparkParticle" and obj:IsA("ParticleEmitter") then
                                table.insert(sparks, obj)
                            end
                        end
                    elseif v.Name == "SurgeShockLight" and v:IsA("PointLight") then
                        table.insert(shock, v)
                    end
                end

                local residual = clone:FindFirstChild("SurgeResidual", true)
                local electricity = residual and residual:FindFirstChild("SurgeElectricity", true)

task.spawn(function()
    while clone.Parent do
        task.wait(0.1)

        if not dmgCooldown and active and a2 and a2.Parent then
            local pla = game:GetService("Players").LocalPlayer
            local char = pla.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local root = hrp and hrp:FindFirstChild("RootAttachment")

            if hum and hrp and root and hum.Health > 0
            and (hrp.Position - p.Position).Magnitude < 10 then

                dmgCooldown = true

                if beam2 and beam2.Parent then
    beam2.Attachment0 = root
    beam2.Enabled = true
end



                hum:TakeDamage(5)

local img = dmggui:FindFirstChildWhichIsA("ImageLabel", true)

if img then
    img.Visible = true
    local cur = (img:GetAttribute("AnimId") or 0) + 1
    img:SetAttribute("AnimId", cur)

    task.spawn(function()
        local start = tick()

        while img.Parent and img.Visible
        and img:GetAttribute("AnimId") == cur
        and tick() - start < 2 do
            img.Rotation = 180
            task.wait(0.2)

            if not img.Parent or not img.Visible
            or img:GetAttribute("AnimId") ~= cur
            or tick() - start >= 2 then break end

            img.Rotation = 360
            task.wait(0.2)
        end

        if img.Parent and img:GetAttribute("AnimId") == cur then
            img.Visible = false
        end
    end)
end

                local s = dmg:Clone()
                s.Parent = hrp
                s:Play()
                s.Ended:Connect(function()
                    s:Destroy()
                end)

                task.delay(1.5, function()
                    if beam2 and beam2.Parent then
                        beam2.Enabled = false
                        beam2.Attachment0 = a2
                    end
                end)

                task.delay(4, function()
                    dmgCooldown = false
                end)
            end
        end
    end
end)

                task.spawn(function()
                    while clone.Parent do
                        task.wait(math.random(10, 20) / 10)
                        if not clone.Parent then break end
                        
                        active = true

task.delay(0.5, function()
    active = false
end)

if math.random(1,2) == 1 then
local trop = sound1:Clone() 
trop.Parent = p
trop:Play() 
trop.Ended:Connect(function() 
trop:Destroy() 
end) 
else
local trop = sound2:Clone() 
trop.Parent = p
trop:Play() 
trop.Ended:Connect(function() 
trop:Destroy() 
end) 
end

                        
if a2 and a2.Parent and beam and beam.Parent then
    beam.Enabled = true

    local cf = p.CFrame
    local pos = cf:PointToWorldSpace(Vector3.new(
        math.random(-400, 400) / 100,
        math.random(-400, 400) / 100,
        math.random(-400, 400) / 100
    ))

    local rot = a2.WorldCFrame - a2.WorldPosition
    a2.WorldCFrame = CFrame.new(pos) * rot
end

for _, v in ipairs(sparks) do
    if v.Parent then
        v.Enabled = true
    end
end


                        for _, sound in ipairs(sounds) do
                            if sound.Parent and not sound.IsPlaying then
                                if sound.TimeLength > 0 then
                                    sound.TimePosition = math.random() * sound.TimeLength
                                end
                                sound:Play()
                            end
                        end

                        for _, v in ipairs(shock) do
                            if v.Parent then
                                local range = v.Range
                                v.Enabled = true

                                local fade = ts:Create(
                                    v,
                                    TweenInfo.new(0.5),
                                    {Range = 0}
                                )

                                fade:Play()

                                task.spawn(function()
                                    fade.Completed:Wait()
                                    if v.Parent then
                                        v.Range = range
                                        v.Enabled = false
                                    end
                                end)
                            end
                        end

                        task.delay(0.3, function()
                            for _, v in ipairs(sparks) do
                                if v.Parent then
                                    v.Enabled = false
                                end
                            end
                            
                            if beam and beam.Parent and beam ~= beam2 then
    beam.Enabled = false
end

                            for _, sound in ipairs(sounds) do
                                if sound.Parent then
                                    sound:Stop()
                                end
                            end
                        end)

                        task.wait(0.5)
                    end
                end)

                task.spawn(function()
                    while clone.Parent do
                        task.wait(math.random(15, 30) / 10)
                        if not clone.Parent then break end

                        if electricity and electricity:IsA("PointLight") and electricity.Parent then
                            electricity.Enabled = true
                        end

                        for _, v in ipairs(sparks) do
                            if v.Parent then
                                v.Enabled = true
                            end
                        end

                        task.wait(0.07)

                        if electricity and electricity.Parent then
                            electricity.Enabled = false
                        end

                        for _, v in ipairs(sparks) do
                            if v.Parent then
                                v.Enabled = false
                            end
                        end
                    end
                end)
            end)
        end
    end
end

end
end

local finished = false

local thunder = GetGitSound(
"https://github.com/lynguyen26031993-design/-u/raw/refs/heads/main/surge_1.mp3?raw=true",
"jvkdkxjcjjcj"
)
thunder.Volume = 1.7
thunder.Parent = workspace 
thunder:Play() 

local surgestart = GetGitSound(
"https://github.com/lynguyen26031993-design/-u/raw/refs/heads/main/surgeattackLOUD.mp3?raw=true",
"jckdlkxnxcjjcjcj"
)
surgestart.Volume = 1.7
surgestart.Parent = workspace 

local rs = game:GetService("ReplicatedStorage")
local lr = rs.GameData.LatestRoom
local conn

conn = lr:GetPropertyChangedSignal("Value"):Connect(function()
    local room = workspace.CurrentRooms:FindFirstChild(tostring(lr.Value))
    if not room then return end

    local windows = {}
    local windowFolder = room.Assets:FindFirstChild("Windows") 

    for _, v in ipairs(room.Assets:GetChildren()) do
        if v:IsA("Model") and (v.Name == "Window" or v.Name == "Window_Tall") then
            table.insert(windows, v)
        end
    end
    
    if windowFolder then
    for _, v in ipairs(windowFolder:GetChildren()) do
        if v:IsA("Model") and (v.Name == "Window" or v.Name == "Window_Tall") then
            table.insert(windows, v)
        end
    end
    end
    
    for _, v in ipairs(room.Assets:GetChildren()) do
        if v:IsA("Model") and (v.Name == "Window" or v.Name == "Window_Tall") then
            table.insert(windows, v)
        end
    end
    
    task.spawn(function() 
    if #windows == 0 and math.random(1,3) == 1 then
    task.wait(0.5)
    ElectrocutedLight(6)
    end
    end) 

    if #windows == 0 then return end

    conn:Disconnect()
    
    task.wait(1)
    
    task.spawn(function() 
while not finished do
spawnShake:ShakeOnce(
	4,   -- Magnitude (mạnh)
	10,   -- Roughness
	0, -- FadeIn
	0.09, -- FadeOut
	0,    -- PositionInfluence
	0.8   -- RotationInfluence
)
task.wait(0.04)
end
end) 

surgestart:Play() 

local windowsounds = {}
local winconn

for _, model in ipairs(windows) do
    for _, v in ipairs(model:GetDescendants()) do
        if v:IsA("Sound") then
            windowsounds[v] = {
                Volume = v.Volume,
                RollOffMaxDistance = v.RollOffMaxDistance
            }

            v.Volume = v.Volume * 2
            v.RollOffMaxDistance = v.RollOffMaxDistance * 1.5
        end
    end
end

winconn = game:GetService("RunService").Heartbeat:Connect(function()
    if not finished then return end

    winconn:Disconnect()

    for v, data in pairs(windowsounds) do
        if v.Parent then
            v.Volume = data.Volume
            v.RollOffMaxDistance = data.RollOffMaxDistance
        end
    end

    table.clear(windowsounds)
end)

local starttodie = LoadModel(
"SurgeDamageUi.txt",
"https://github.com/lynguyen26031993-design/-u/raw/refs/heads/main/Place_131351567799504_ScreenGui_SurgeReignitedUI_1792302581.txt"
)

starttodie.Parent = game.Players.LocalPlayer.PlayerGui

local ts = game:GetService("TweenService")
local gui = starttodie

if gui then
    for _, img in ipairs(gui:GetDescendants()) do
        if img:IsA("ImageLabel") then
        img.Visible = true
            img.Size = UDim2.new(1.5, 0, 1.5, 0)

            ts:Create(img, TweenInfo.new(5), {
                Size = UDim2.new(1.1, 0, 1.1, 0)
            }):Play()

            task.spawn(function()
            if finished and img.Parent then
        img:Destroy()
    end
    
    while img.Parent and not finished do
        img.Rotation = img.Rotation + 180
        task.wait(0.1)
    end

    
end)
        end
    end
end

    local col = Color3.fromRGB(255, 241, 115)
local cons = {}
local old = {}
local active = true

local function Restore()
    if not active then return end
    active = false

    for _, c in ipairs(cons) do
        c:Disconnect()
    end

    for v, data in pairs(old) do
        if v.Parent then
            v.Color = data.Color
            if data.Brightness ~= nil then
                v.Brightness = data.Brightness
            end
            if data.Enabled ~= nil then
                v.Enabled = data.Enabled
            end
        end
    end
end

task.spawn(function()
    while not finished and active do
        task.wait(0.05)
    end
    Restore()
end)

for _, model in ipairs(windows) do
    for _, v in ipairs(model:GetDescendants()) do
        if finished then
            Restore()
            break
        end

        if v.Name == "SkyBox" or v.Name == "Skybox" then
            if v:IsA("BasePart") then
                old[v] = {
                    Color = v.Color
                }

                v.Color = col

                table.insert(cons, v:GetPropertyChangedSignal("Color"):Connect(function()
                    if active and v.Parent and v.Color ~= col then
                        v.Color = col
                    end
                end))
            end
        end

        if v:IsA("PointLight") or v:IsA("SurfaceLight") or v:IsA("SpotLight") then
            if not old[v] then
                old[v] = {
                    Color = v.Color,
                    Brightness = v.Brightness,
                    Enabled = v.Enabled
                }
            end

            v.Color = col
            v.Enabled = true
            v.Brightness = 0.7

            table.insert(cons, v:GetPropertyChangedSignal("Color"):Connect(function()
                if active and v.Parent then
                    v.Color = col
                end
            end))

            table.insert(cons, v:GetPropertyChangedSignal("Brightness"):Connect(function()
                if active and v.Parent and v.Brightness ~= 0.5 and v.Brightness ~= 0.7 then
                    v.Brightness = 0.7
                end
            end))

            table.insert(cons, v:GetPropertyChangedSignal("Enabled"):Connect(function()
                if active and v.Parent and not v.Enabled then
                    v.Enabled = true
                end
            end))

            task.spawn(function()
                while active and v.Parent and not finished do
                    v.Brightness = 0.5
                    task.wait(0.03)

                    if not active or finished or not v.Parent then break end

                    v.Brightness = 0.7
                    task.wait(0.03)
                end
            end)
        end
    end
end

task.delay(6, function()
breakingb = true
ElectrocutedLight(100)
    
local pla = game:GetService("Players")
local rs = game:GetService("ReplicatedStorage")
local ts = game:GetService("TweenService")
local run = game:GetService("RunService")
local lpla = pla.LocalPlayer
local char = lpla.Character or lpla.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

local function GetGitSound(url, name)
    if not isfile(name .. ".mp3") then
        writefile(name .. ".mp3", game:HttpGet(url))
    end

    local sound = Instance.new("Sound")
    sound.SoundId = (getcustomasset or getsynasset)(name .. ".mp3")
    return sound
end

local idle = GetGitSound(
    "https://github.com/lynguyen26031993-design/-u/raw/refs/heads/main/surgeidleLOUD.mp3?raw=true",
    "jgjdkjjchfh"
)

local file = "SurgeMoving.txt"
local url = "https://github.com/lynguyen26031993-design/-u/raw/refs/heads/main/Place_131351567799504_Part_SurgeMoving_1792299088.txt"

if not isfile(file) then
    writefile(file, game:HttpGet(url))
end

local obj = game:GetObjects((getcustomasset or getsynasset)(file))[1]
if not obj then return end

local lr = rs.GameData.LatestRoom
local room = workspace.CurrentRooms:FindFirstChild(tostring(lr.Value))
local assets = room and room:FindFirstChild("Assets")
local windows = {}
local windowFolder = assets:FindFirstChild("Windows") 

if assets then
if windowFolder then
    for _, v in ipairs(windowFolder:GetChildren()) do
        if v:IsA("Model") and (v.Name == "Window" or v.Name == "Window_Tall") then
            table.insert(windows, v)
        end
    end
    end
    
    for _, v in ipairs(assets:GetChildren()) do
        if v:IsA("Model") and (v.Name == "Window" or v.Name == "Window_Tall") then
            table.insert(windows, v)
        end
    end
end

if #windows == 0 then
    obj:Destroy()
    idle:Destroy()
    return
end

local win = windows[math.random(1, #windows)]
obj.Parent = workspace
obj:PivotTo(win:GetPivot())

local spawnTime = os.clock()
local ending = false

for _, v in ipairs(obj:GetDescendants()) do
    if v:IsA("Sound") then
        v.SoundId = idle.SoundId
        v.Volume = v.Volume * 2
    end
end

if obj:IsA("BasePart") then
    for _, v in ipairs(obj:GetChildren()) do
        if v:IsA("Sound") then
            v.SoundId = idle.SoundId
        end
    end
end

task.wait(1)

local function GetOrigin()
    if obj:IsA("BasePart") then
        return obj.Position
    elseif obj:IsA("Model") then
        return obj:GetPivot().Position
    end
end

local part
if obj:IsA("BasePart") then
    part = obj
elseif obj:IsA("Model") then
    part = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart", true)
end

if not part then
    obj:Destroy()
    idle:Destroy()
    return
end

local hitbox = Instance.new("Part")
hitbox.Name = "SurgeHitbox"
hitbox.Size = Vector3.new(80, 80, 80)
hitbox.Transparency = 1
hitbox.CanCollide = false
hitbox.CanTouch = false
hitbox.CanQuery = false
hitbox.Massless = true
hitbox.Anchored = false
hitbox.CFrame = part.CFrame
hitbox.Parent = workspace

local weld = Instance.new("WeldConstraint")
weld.Part0 = part
weld.Part1 = hitbox
weld.Parent = hitbox

local rooms = workspace:WaitForChild("CurrentRooms")
local parts = {}

local function AddPart(v)
    if v:IsA("BasePart") and not v:IsDescendantOf(obj) then
        if not table.find(parts, v) then
            table.insert(parts, v)
        end
    end
end

local function RemovePart(v)
    local i = table.find(parts, v)
    if i then
        table.remove(parts, i)
    end
end

for _, v in ipairs(rooms:GetDescendants()) do
    AddPart(v)
end

local addConn = rooms.DescendantAdded:Connect(AddPart)
local remConn = rooms.DescendantRemoving:Connect(RemovePart)

local beams = {}
local paused = {}
local targets = {}

for _, v in ipairs(obj:GetDescendants()) do
    if v:IsA("Beam") then
        table.insert(beams, v)
        v.Enabled = true
        paused[v] = false

        for i = 1, 2 do
            local clone = v:Clone()
            clone.Enabled = true
            clone.Parent = v.Parent
            paused[clone] = false
            table.insert(beams, clone)
        end
    end
end

local moving = false
local triggerRequested = false

local function IsBlocked(pos, rot)
    local pivot = CFrame.new(pos) * rot
    local boxcf
    local size

    if obj:IsA("Model") then
        boxcf, size = obj:GetBoundingBox()
    else
        boxcf = obj.CFrame
        size = obj.Size
    end

    local offset = obj:GetPivot():ToObjectSpace(boxcf)
    local filter = {obj, hitbox, win}

    char = lpla.Character
    if char then
        table.insert(filter, char)
    end

    local op = OverlapParams.new()
    op.FilterType = Enum.RaycastFilterType.Exclude
    op.FilterDescendantsInstances = filter

    local found = workspace:GetPartBoundsInBox(
        pivot * offset,
        size * 0.8,
        op
    )

    for _, v in ipairs(found) do
        if v:IsA("BasePart") and v.CanCollide then
            return true
        end
    end

    return false
end

local function MoveTo(target, duration, wander)
    local pivot = obj:GetPivot()
    local start = pivot.Position
    local rot = pivot - start
    local elapsed = 0

    while elapsed < duration and obj.Parent and not ending do
        local dt = run.Heartbeat:Wait()
        elapsed += dt

        if wander and triggerRequested then
            return false
        end

        local alpha = math.clamp(elapsed / duration, 0, 1)
        local pos = start:Lerp(target, alpha)

        obj:PivotTo(CFrame.new(pos) * rot)
    end

    return true
end

char = lpla.Character
        hrp = char and char:FindFirstChild("HumanoidRootPart")

task.spawn(function()
    while obj.Parent and not ending do
        task.wait(0.05)

        

        local hiding = char and char:GetAttribute("Hiding") == true
        local detected = false

        if hrp and hitbox.Parent then
            local d = hrp.Position - hitbox.Position

            detected =
                math.abs(d.X) <= hitbox.Size.X / 2
                and math.abs(d.Y) <= hitbox.Size.Y / 2
                and math.abs(d.Z) <= hitbox.Size.Z / 2
        end

        triggerRequested = hiding or detected

        if not triggerRequested or moving or not hrp then
            continue
        end

        moving = true

        local angle = math.random() * math.pi * 2
        local dist = math.random(1, 30)

        local target = Vector3.new(
            hrp.Position.X + math.cos(angle) * dist,
            hrp.Position.Y,
            hrp.Position.Z + math.sin(angle) * dist
        )

        MoveTo(target, 0.35, false)

        moving = false
        task.wait(math.random(2, 8) / 20)
    end
end)

task.spawn(function()
    while obj.Parent and not ending do
        if triggerRequested or moving then
            task.wait(0.05)
            continue
        end

        task.wait(math.random(1, 20) / 10)

        if ending or triggerRequested or moving then
            continue
        end
        
        local folder = room and room:FindFirstChild("Parts")
        local floors = {}

        if folder then
            for _, v in ipairs(folder:GetChildren()) do
                if v:IsA("BasePart") and v.Name == "Floor" then
                    table.insert(floors, v)
                end
            end
        end

        if #floors == 0 then
            continue
        end

        local floor = floors[math.random(1, #floors)]
        local cf = floor.CFrame
        local size = floor.Size

        local x = (math.random() - 0.5) * size.X
        local z = (math.random() - 0.5) * size.Z
        local surface = cf:PointToWorldSpace(Vector3.new(x, size.Y / 2, z))
        local origin = GetOrigin()

        if not origin then
            continue
        end

        local target = Vector3.new(
            surface.X,
            surface.Y + (origin.Y - floor.Position.Y),
            surface.Z
        )

        moving = true
        MoveTo(target, math.random(25, 60) / 100, true)
        moving = false
    end
end)

for _, beam in ipairs(beams) do
    task.spawn(function()
        local att

        while beam.Parent and obj.Parent and not ending do
            task.wait(0.1)

            if ending or not beam.Parent or not obj.Parent then
                break
            end

            if paused[beam] then
                continue
            end

            local origin = GetOrigin()
            if not origin then break end

            local valid = {}

            for _, p in ipairs(parts) do
                if p.Parent
                and not p:IsDescendantOf(obj)
                and (p.Position - origin).Magnitude < 20 then
                    table.insert(valid, p)
                end
            end

            if #valid > 0 then
                local p = valid[math.random(1, #valid)]

                if att then
                    att:Destroy()
                end

                att = Instance.new("Attachment")
                att.Name = "SurgeTarget"
                att.Parent = p

                targets[beam] = att
                beam.Attachment0 = att
            else
                if att then
                    att:Destroy()
                    att = nil
                end

                targets[beam] = nil
                beam.Attachment0 = nil
            end
        end

        if att then
            att:Destroy()
        end
    end)
end

local dmg2 = false

task.spawn(function()
    while obj.Parent and not ending do
        task.wait(0.1)

        if ending or dmg2 then
            continue
        end

        char = lpla.Character
        hrp = char and char:FindFirstChild("HumanoidRootPart")

        local hum = char and char:FindFirstChildOfClass("Humanoid")
        local root = hrp and hrp:FindFirstChild("RootAttachment")
        local origin = GetOrigin()

        if hum and hum.Health > 0 and root and origin
        and (hrp.Position - origin).Magnitude < 10
        and #beams > 0 then

            local available = {}

            for _, beam in ipairs(beams) do
                if beam.Parent and not paused[beam] then
                    table.insert(available, beam)
                end
            end

            if #available == 0 then
                continue
            end

            dmg2 = true

            local beam = available[math.random(1, #available)]
            local old = beam.Attachment0

            beam.Attachment0 = root
            local hiding = char and char:GetAttribute("Hiding") == true
            if not hiding then
            local boom = dmg:Clone() 
boom.Parent = workspace 
boom:Play() 
            hum:TakeDamage(15)
            game.ReplicatedStorage.GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Surge"
            end

            task.wait(0.4)

            if beam.Parent and not ending then
                beam.Attachment0 = old
            end

            dmg2 = false
        end
    end
end)

task.spawn(function()
    task.wait(math.max(0, 15 - (os.clock() - spawnTime)))



    if not obj.Parent or ending then
        return
    end

    ending = true
    triggerRequested = false

    if hitbox.Parent then
        hitbox:Destroy()
    end
    
    finished = true
    
    if finished then
        starttodie:Destroy()
    end

    for _, beam in ipairs(beams) do
        if beam.Parent then
            beam:Destroy()
        end
    end

    addConn:Disconnect()
    remConn:Disconnect()

    local tweens = {}
    local emitters = {}

    for _, v in ipairs(obj:GetDescendants()) do
        if v:IsA("Sound") then
            table.insert(tweens, ts:Create(
                v,
                TweenInfo.new(4),
                {PlaybackSpeed = 0}
            ))
        elseif v:IsA("PointLight")
        or v:IsA("SpotLight")
        or v:IsA("SurfaceLight") then
            table.insert(tweens, ts:Create(
                v,
                TweenInfo.new(4),
                {Range = 0}
            ))
        elseif v:IsA("ParticleEmitter") then
            emitters[v] = v.Transparency
        end
    end

    for _, tw in ipairs(tweens) do
        tw:Play()
    end

    local startTime = os.clock()

    while os.clock() - startTime < 4 and obj.Parent do
        local alpha = math.clamp((os.clock() - startTime) / 4, 0, 1)

        for em, seq in pairs(emitters) do
            if em.Parent then
                local keys = {}

                for _, kp in ipairs(seq.Keypoints) do
                    table.insert(keys, NumberSequenceKeypoint.new(
                        kp.Time,
                        kp.Value * (1 - alpha),
                        kp.Envelope * (1 - alpha)
                    ))
                end

                em.Transparency = NumberSequence.new(keys)
            end
        end

        run.Heartbeat:Wait()
    end

    if obj.Parent then
        obj:Destroy()
    end

    idle:Destroy()
    
    
end)

end)
end)
