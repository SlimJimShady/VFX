local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

if not RunService:IsClient() then return end

-- Cache references and optimize performance
local workspace = workspace
local Instance_new = Instance.new
local CFrame_new = CFrame.new
local Color3_new = Color3.new
local NumberRange_new = NumberRange.new
local NumberSequence_new = NumberSequence.new
local NumberSequenceKeypoint_new = NumberSequenceKeypoint.new
local ColorSequence_new = ColorSequence.new
local ColorSequenceKeypoint_new = ColorSequenceKeypoint.new
local Vector2_new = Vector2.new
local Vector3_new = Vector3.new
local math_max = math.max
local table_insert = table.insert
local ipairs = ipairs
local task_wait = task.wait

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Create effect container
local effectPart = Instance_new("Part")
effectPart.Anchored = true
effectPart.CanCollide = false
effectPart.Transparency = 1
effectPart.Size = Vector3_new(1, 1, 1)
effectPart.Parent = workspace

-- Calculate position
local forward = humanoidRootPart.CFrame.LookVector
local effectCFrame = CFrame_new(
    humanoidRootPart.Position + (forward * 5),
    humanoidRootPart.Position + (forward * 5) + forward
)
effectPart.CFrame = effectCFrame

-- Color definitions
local purpleColor = Color3_new(0.5, 0, 1)
local darkPurpleColor = Color3_new(0.3, 0, 0.7) -- Darker version
local lightBlueColor = Color3_new(0.4, 0.8, 1)
local darkLightBlueColor = Color3_new(0.2, 0.6, 0.8) -- Darker version

local particles = {}

-- Function to create a particle emitter with common properties
local function createParticle(parent, config)
    local particle = Instance_new("ParticleEmitter")
    particle.Parent = parent
    
    -- Apply configuration
    for property, value in pairs(config) do
        particle[property] = value
    end
    
    table_insert(particles, particle)
    return particle
end

-- Base particle configuration
local baseParticleConfig = {
    ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume,
    LightInfluence = 0,
    LockedToPart = false,
    FlipbookStartRandom = false,
    VelocityInheritance = 0,
    ShapePartial = 1,
    FlipbookIncompatible = "Particle texture must be 1024 by 1024 to use flipbooks.",
    Shape = Enum.ParticleEmitterShape.Box,
    ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
}

-- Main particles
do
    -- Original particle 1 (brighter)
    createParticle(effectPart, {
        FlipbookFramerate = NumberRange_new(26.542080),
        Lifetime = NumberRange_new(0.180845, 0.602816),
        SpreadAngle = Vector2_new(25, 25),
        Transparency = NumberSequence_new({
            NumberSequenceKeypoint_new(0, 1),
            NumberSequenceKeypoint_new(0.249377, 0.268750),
            NumberSequenceKeypoint_new(1, 1)
        }),
        Orientation = Enum.ParticleOrientation.VelocityPerpendicular,
        Color = ColorSequence_new({
            ColorSequenceKeypoint_new(0, purpleColor),
            ColorSequenceKeypoint_new(1, lightBlueColor)
        }),
        TimeScale = 0.3,
        VelocitySpread = 25,
        Squash = NumberSequence_new({
            NumberSequenceKeypoint_new(0, -0.1),
            NumberSequenceKeypoint_new(1, -0.1)
        }),
        Speed = NumberRange_new(0.000514),
        Brightness = 25,
        Size = NumberSequence_new({
            NumberSequenceKeypoint_new(0, 0),
            NumberSequenceKeypoint_new(0.1, 1.192195),
            NumberSequenceKeypoint_new(0.2, 2.023280),
            NumberSequenceKeypoint_new(0.3, 2.646057),
            NumberSequenceKeypoint_new(0.4, 3.127246),
            NumberSequenceKeypoint_new(0.5, 3.502817),
            NumberSequenceKeypoint_new(0.6, 3.794430),
            NumberSequenceKeypoint_new(0.7, 4.015844),
            NumberSequenceKeypoint_new(0.8, 4.175643),
            NumberSequenceKeypoint_new(0.9, 4.277915),
            NumberSequenceKeypoint_new(1, 4.318142)
        }),
        Acceleration = Vector3_new(0, 0, 0),
        RotSpeed = NumberRange_new(0),
        ZOffset = 1.1420596837997437,
        Rate = 100, -- Increased rate
        Rotation = NumberRange_new(-360, 360),
        Texture = "rbxassetid://14837899287",
        FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
        EmissionDirection = Enum.NormalId.Front,
        LightEmission = 0.5,
        Enabled = false
    })
    
    -- Darker clone of particle 1
    createParticle(effectPart, {
        FlipbookFramerate = NumberRange_new(26.542080),
        Lifetime = NumberRange_new(0.180845, 0.602816),
        SpreadAngle = Vector2_new(35, 35), -- Wider spread
        Transparency = NumberSequence_new({
            NumberSequenceKeypoint_new(0, 1),
            NumberSequenceKeypoint_new(0.249377, 0.5), -- More transparent
            NumberSequenceKeypoint_new(1, 1)
        }),
        Orientation = Enum.ParticleOrientation.VelocityPerpendicular,
        Color = ColorSequence_new({
            ColorSequenceKeypoint_new(0, darkPurpleColor),
            ColorSequenceKeypoint_new(1, darkLightBlueColor)
        }),
        TimeScale = 0.4, -- Slower
        VelocitySpread = 35, -- More spread
        Squash = NumberSequence_new({
            NumberSequenceKeypoint_new(0, -0.2),
            NumberSequenceKeypoint_new(1, -0.2)
        }),
        Speed = NumberRange_new(0.000514 * 1.5), -- Faster
        Brightness = 15, -- Darker
        Size = NumberSequence_new({
            NumberSequenceKeypoint_new(0, 0),
            NumberSequenceKeypoint_new(0.1, 1.5), -- Larger
            NumberSequenceKeypoint_new(0.2, 2.5),
            NumberSequenceKeypoint_new(0.3, 3.2),
            NumberSequenceKeypoint_new(0.4, 3.8),
            NumberSequenceKeypoint_new(0.5, 4.3),
            NumberSequenceKeypoint_new(0.6, 4.7),
            NumberSequenceKeypoint_new(0.7, 5.0),
            NumberSequenceKeypoint_new(0.8, 5.2),
            NumberSequenceKeypoint_new(0.9, 5.3),
            NumberSequenceKeypoint_new(1, 5.4)
        }),
        Acceleration = Vector3_new(0, 0.5, 0), -- Some upward movement
        RotSpeed = NumberRange_new(-10, 10), -- Some rotation
        ZOffset = 1.5,
        Rate = 150, -- Higher rate
        Rotation = NumberRange_new(-360, 360),
        Texture = "rbxassetid://14837899287",
        FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
        EmissionDirection = Enum.NormalId.Front,
        LightEmission = 0.3,
        Enabled = false
    })
end

do
    -- Original particle 2 (brighter)
    createParticle(effectPart, {
        FlipbookFramerate = NumberRange_new(0.895795),
        Lifetime = NumberRange_new(0.083591, 0.140657),
        FlipbookLayout = Enum.ParticleFlipbookLayout.Grid8x8,
        SpreadAngle = Vector2_new(10, 360),
        Transparency = NumberSequence_new({
            NumberSequenceKeypoint_new(0, 0),
            NumberSequenceKeypoint_new(1, 0)
        }),
        Orientation = Enum.ParticleOrientation.VelocityParallel,
        Color = ColorSequence_new({
            ColorSequenceKeypoint_new(0, purpleColor),
            ColorSequenceKeypoint_new(1, lightBlueColor)
        }),
        Drag = 16.72150993347168,
        TimeScale = 0.2,
        VelocitySpread = 10,
        Squash = NumberSequence_new({
            NumberSequenceKeypoint_new(0, -0.278688),
            NumberSequenceKeypoint_new(1, 0.3)
        }),
        Speed = NumberRange_new(0.388791, 174.955978),
        Brightness = 45,
        Size = NumberSequence_new({
            NumberSequenceKeypoint_new(0, 0),
            NumberSequenceKeypoint_new(1, 2.651083)
        }),
        Acceleration = Vector3_new(0, 0, 0),
        RotSpeed = NumberRange_new(0),
        Rate = 200, -- Increased rate
        Rotation = NumberRange_new(-360, 360),
        Texture = "rbxassetid://15958829994",
        FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
        EmissionDirection = Enum.NormalId.Top,
        LightEmission = 0.5,
        Enabled = false
    })
    
    -- Darker clone of particle 2
    createParticle(effectPart, {
        FlipbookFramerate = NumberRange_new(0.895795 * 1.5), -- Faster animation
        Lifetime = NumberRange_new(0.083591 * 1.5, 0.140657 * 1.5), -- Longer lifetime
        FlipbookLayout = Enum.ParticleFlipbookLayout.Grid8x8,
        SpreadAngle = Vector2_new(15, 360), -- Wider spread
        Transparency = NumberSequence_new({
            NumberSequenceKeypoint_new(0, 0.2), -- More transparent
            NumberSequenceKeypoint_new(1, 0.2)
        }),
        Orientation = Enum.ParticleOrientation.VelocityParallel,
        Color = ColorSequence_new({
            ColorSequenceKeypoint_new(0, darkPurpleColor),
            ColorSequenceKeypoint_new(1, darkLightBlueColor)
        }),
        Drag = 10, -- Less drag
        TimeScale = 0.3,
        VelocitySpread = 15, -- More spread
        Squash = NumberSequence_new({
            NumberSequenceKeypoint_new(0, -0.4),
            NumberSequenceKeypoint_new(1, 0.5)
        }),
        Speed = NumberRange_new(0.388791 * 2, 174.955978 * 1.5), -- Faster
        Brightness = 30, -- Darker
        Size = NumberSequence_new({
            NumberSequenceKeypoint_new(0, 0),
            NumberSequenceKeypoint_new(1, 3.5) -- Larger
        }),
        Acceleration = Vector3_new(0, 1, 0), -- Some upward movement
        RotSpeed = NumberRange_new(-5, 5), -- Some rotation
        Rate = 300, -- Higher rate
        Rotation = NumberRange_new(-360, 360),
        Texture = "rbxassetid://15958829994",
        FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
        EmissionDirection = Enum.NormalId.Top,
        LightEmission = 0.2,
        Enabled = false
    })
end

do
    -- Original particle 3 (brighter)
    createParticle(effectPart, {
        FlipbookFramerate = NumberRange_new(0.414720),
        Lifetime = NumberRange_new(0.120563, 0.241127),
        FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
        SpreadAngle = Vector2_new(10, 360),
        Transparency = NumberSequence_new({
            NumberSequenceKeypoint_new(0, 0),
            NumberSequenceKeypoint_new(1, 0)
        }),
        Orientation = Enum.ParticleOrientation.VelocityParallel,
        Color = ColorSequence_new({
            ColorSequenceKeypoint_new(0, purpleColor),
            ColorSequenceKeypoint_new(1, lightBlueColor)
        }),
        Drag = 9.953280448913574,
        TimeScale = 0.2,
        VelocitySpread = 10,
        Squash = NumberSequence_new({
            NumberSequenceKeypoint_new(0, 0),
            NumberSequenceKeypoint_new(1, 0)
        }),
        Speed = NumberRange_new(0.269994, 121.497208),
        Brightness = 35,
        Size = NumberSequence_new({
            NumberSequenceKeypoint_new(0, 0),
            NumberSequenceKeypoint_new(0.298954, 1.591283),
            NumberSequenceKeypoint_new(1, 2.900242)
        }),
        Acceleration = Vector3_new(0, 0, 0),
        RotSpeed = NumberRange_new(0),
        ZOffset = 7.725882053375244,
        Rate = 50, -- Increased rate
        Rotation = NumberRange_new(0),
        Texture = "rbxassetid://13622252312",
        FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
        EmissionDirection = Enum.NormalId.Top,
        LightEmission = 0.3,
        Enabled = false
    })
    
    -- Darker clone of particle 3
    createParticle(effectPart, {
        FlipbookFramerate = NumberRange_new(0.414720 * 2), -- Faster animation
        Lifetime = NumberRange_new(0.120563 * 1.5, 0.241127 * 1.5), -- Longer lifetime
        FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
        SpreadAngle = Vector2_new(15, 360), -- Wider spread
        Transparency = NumberSequence_new({
            NumberSequenceKeypoint_new(0, 0.3), -- More transparent
            NumberSequenceKeypoint_new(1, 0.3)
        }),
        Orientation = Enum.ParticleOrientation.VelocityParallel,
        Color = ColorSequence_new({
            ColorSequenceKeypoint_new(0, darkPurpleColor),
            ColorSequenceKeypoint_new(1, darkLightBlueColor)
        }),
        Drag = 5, -- Less drag
        TimeScale = 0.25,
        VelocitySpread = 15, -- More spread
        Squash = NumberSequence_new({
            NumberSequenceKeypoint_new(0, -0.2),
            NumberSequenceKeypoint_new(1, 0.2)
        }),
        Speed = NumberRange_new(0.269994 * 1.5, 121.497208 * 1.2), -- Faster
        Brightness = 25, -- Darker
        Size = NumberSequence_new({
            NumberSequenceKeypoint_new(0, 0),
            NumberSequenceKeypoint_new(0.298954, 2.0), -- Larger
            NumberSequenceKeypoint_new(1, 3.5)
        }),
        Acceleration = Vector3_new(0, 0.5, 0), -- Some upward movement
        RotSpeed = NumberRange_new(-3, 3), -- Some rotation
        ZOffset = 8.0,
        Rate = 80, -- Higher rate
        Rotation = NumberRange_new(-10, 10), -- Some random rotation
        Texture = "rbxassetid://13622252312",
        FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
        EmissionDirection = Enum.NormalId.Top,
        LightEmission = 0.1,
        Enabled = false
    })
end

-- Enable all particles
for _, particle in ipairs(particles) do
    particle.Enabled = true
end

-- Calculate maximum lifetime
local maxLifetime = 0
for _, particle in ipairs(particles) do
    maxLifetime = math_max(maxLifetime, particle.Lifetime.Max)
end

-- Wait for effect to complete
task_wait(maxLifetime * 2.5)

-- Clean up
for _, particle in ipairs(particles) do
    particle.Enabled = false
end

task_wait(1)
effectPart:Destroy()
