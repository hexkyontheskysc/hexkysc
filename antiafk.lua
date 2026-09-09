-- LocalScript / Executor
local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

----------------------------------------------------
-- 1. CLEANUP (Hapus UI Lama)
----------------------------------------------------
for _, gui in pairs(PlayerGui:GetChildren()) do
	if gui:IsA("ScreenGui") and (gui.Name:find("AntiAFK") or gui.Name:find("Anti-AFK")) then
		gui:Destroy()
	end
end

if gethui then
	for _, gui in pairs(gethui():GetChildren()) do
		if gui.Name:find("AntiAFK") then
			gui:Destroy()
		end
	end
end

----------------------------------------------------
-- 2. PREVENT AFK KICK
----------------------------------------------------
LocalPlayer.Idled:Connect(function()
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new(0,0))
end)

----------------------------------------------------
-- 3. BLACK SCREEN GUI (HEMAT DAYA)
----------------------------------------------------
local TargetParent = gethui and gethui() or PlayerGui

local BlackScreenGui = Instance.new("ScreenGui")
BlackScreenGui.Name = "AntiAFK_BlackScreen"
BlackScreenGui.ResetOnSpawn = false
BlackScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
BlackScreenGui.DisplayOrder = 999999
BlackScreenGui.Enabled = false
BlackScreenGui.Parent = TargetParent

local BlackFrame = Instance.new("Frame")
BlackFrame.Size = UDim2.new(1, 0, 1, 0)
BlackFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
BlackFrame.BorderSizePixel = 0
BlackFrame.Parent = BlackScreenGui

local BlackText = Instance.new("TextLabel")
BlackText.Size = UDim2.new(1, 0, 0, 80)
BlackText.Position = UDim2.new(0, 0, 0.5, -40)
BlackText.BackgroundTransparency = 1
BlackText.Text = "MODE HEMAT DAYA (BLACK SCREEN)\nTekan 'B' di Keyboard untuk Kembali Ke Normal"
BlackText.TextColor3 = Color3.fromRGB(0, 255, 150)
BlackText.TextSize = 18
BlackText.Font = Enum.Font.SourceSansBold
BlackText.Parent = BlackFrame

----------------------------------------------------
-- 4. BIKIN GUI UTAMA
----------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AntiAFK_ExeFix"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = TargetParent

local MainFrame = Instance.new("TextButton")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 270, 0, 350)
MainFrame.Position = UDim2.new(0.5, -135, 0.25, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(0, 170, 255)
MainFrame.Text = ""
MainFrame.AutoButtonColor = false
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Header Title
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 26)
TitleLabel.Position = UDim2.new(0, 0, 0, 4)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "EXE ANTI-AFK 24H HUB"
TitleLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
TitleLabel.TextSize = 14
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.Parent = MainFrame

-- Keybind Info Label
local SubLabel = Instance.new("TextLabel")
SubLabel.Size = UDim2.new(1, 0, 0, 16)
SubLabel.Position = UDim2.new(0, 0, 0, 26)
SubLabel.BackgroundTransparency = 1
SubLabel.Text = "[ P : Menu | B : Screen | E : Fly ]"
SubLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
SubLabel.TextSize = 11
SubLabel.Font = Enum.Font.SourceSans
SubLabel.Parent = MainFrame

-- BUTTONS
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 230, 0, 34)
ToggleBtn.Position = UDim2.new(0.5, -115, 0, 46)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
ToggleBtn.Text = "ANTI-AFK: OFF"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextSize = 13
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.Parent = MainFrame

local FlyBtn = Instance.new("TextButton")
FlyBtn.Size = UDim2.new(0, 230, 0, 34)
FlyBtn.Position = UDim2.new(0.5, -115, 0, 86)
FlyBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
FlyBtn.Text = "FLY (TERBANG): OFF [E]"
FlyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyBtn.TextSize = 13
FlyBtn.Font = Enum.Font.SourceSansBold
FlyBtn.Parent = MainFrame

local VfxBtn = Instance.new("TextButton")
VfxBtn.Size = UDim2.new(0, 230, 0, 34)
VfxBtn.Position = UDim2.new(0.5, -115, 0, 126)
VfxBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
VfxBtn.Text = "VFX / EFEK: ON (NORMAL)"
VfxBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VfxBtn.TextSize = 13
VfxBtn.Font = Enum.Font.SourceSansBold
VfxBtn.Parent = MainFrame

local FpsBtn = Instance.new("TextButton")
FpsBtn.Size = UDim2.new(0, 230, 0, 34)
FpsBtn.Position = UDim2.new(0.5, -115, 0, 166)
FpsBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
FpsBtn.Text = "BOOST FPS & LOW RENDER"
FpsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FpsBtn.TextSize = 13
FpsBtn.Font = Enum.Font.SourceSansBold
FpsBtn.Parent = MainFrame

local HidePlayersBtn = Instance.new("TextButton")
HidePlayersBtn.Size = UDim2.new(0, 230, 0, 34)
HidePlayersBtn.Position = UDim2.new(0.5, -115, 0, 206)
HidePlayersBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
HidePlayersBtn.Text = "HIDE PLAYERS: OFF"
HidePlayersBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
HidePlayersBtn.TextSize = 13
HidePlayersBtn.Font = Enum.Font.SourceSansBold
HidePlayersBtn.Parent = MainFrame

local BlackBtn = Instance.new("TextButton")
BlackBtn.Size = UDim2.new(0, 230, 0, 34)
BlackBtn.Position = UDim2.new(0.5, -115, 0, 246)
BlackBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
BlackBtn.Text = "BLACK SCREEN (HEMAT DAYA) [B]"
BlackBtn.TextColor3 = Color3.fromRGB(0, 255, 150)
BlackBtn.TextSize = 13
BlackBtn.Font = Enum.Font.SourceSansBold
BlackBtn.Parent = MainFrame

local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(1, 0, 0, 20)
StatusText.Position = UDim2.new(0, 0, 0, 310)
StatusText.BackgroundTransparency = 1
StatusText.Text = "Status: Siap AFK 24 Jam"
StatusText.TextColor3 = Color3.fromRGB(150, 150, 150)
StatusText.TextSize = 11
StatusText.Font = Enum.Font.SourceSans
StatusText.Parent = MainFrame

----------------------------------------------------
-- 5. LOGIC FLY FIX (STABIL & ARAH TEPAT)
----------------------------------------------------
local flying = false
local flySpeed = 50
local flyConnection = nil

local function stopFly()
	flying = false
	if flyConnection then
		flyConnection:Disconnect()
		flyConnection = nil
	end
	
	local char = LocalPlayer.Character
	if char then
		local hrp = char:FindFirstChild("HumanoidRootPart")
		local hum = char:FindFirstChildOfClass("Humanoid")
		if hrp then 
			hrp.Velocity = Vector3.new(0,0,0)
			hrp.AssemblyLinearVelocity = Vector3.new(0,0,0)
		end
		if hum then hum.PlatformStand = false end
	end
	
	FlyBtn.Text = "FLY (TERBANG): OFF [E]"
	FlyBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
	StatusText.Text = "Status: Mode Terbang Mati"
	StatusText.TextColor3 = Color3.fromRGB(150, 150, 150)
end

local function startFly()
	local char = LocalPlayer.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local hum = char:FindFirstChildOfClass("Humanoid")
	
	if not hrp or not hum then return end
	
	flying = true
	FlyBtn.Text = "FLY (TERBANG): ON [E]"
	FlyBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
	StatusText.Text = "Status: Mode Terbang Aktif"
	StatusText.TextColor3 = Color3.fromRGB(40, 180, 80)

	hum.PlatformStand = true

	flyConnection = RunService.RenderStepped:Connect(function(deltaTime)
		if not flying or not char or not hrp or not hum or hum.Health <= 0 then
			stopFly()
			return
		end

		local camera = Workspace.CurrentCamera
		if not camera then return end

		-- Hentikan efek gravitasi Roblox
		hrp.Velocity = Vector3.new(0, 0, 0)
		hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)

		-- Ambil Vektor Kamera HANYA Bidang Horizontal (Abaikan Sudut Atas/Bawah)
		local camCFrame = camera.CFrame
		local lookVector = Vector3.new(camCFrame.LookVector.X, 0, camCFrame.LookVector.Z).Unit
		local rightVector = Vector3.new(camCFrame.RightVector.X, 0, camCFrame.RightVector.Z).Unit

		local moveVector = Vector3.new()

		-- Gerakan WASD Murni Horizontal
		if UserInputService:IsKeyDown(Enum.KeyCode.W) then
			moveVector = moveVector + lookVector
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.S) then
			moveVector = moveVector - lookVector
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.A) then
			moveVector = moveVector - rightVector
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.D) then
			moveVector = moveVector + rightVector
		end

		-- Gerakan Naik-Turun Terpisah
		if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
			moveVector = moveVector + Vector3.new(0, 1, 0)
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
			moveVector = moveVector - Vector3.new(0, 1, 0)
		end

		-- Eksekusi Pergerakan Stabil
		if moveVector.Magnitude > 0 then
			hrp.CFrame = hrp.CFrame + (moveVector.Unit * flySpeed * deltaTime)
		end

		-- Karakter Tetap Menghadap Arah Pandang Kamera
		local targetLook = Vector3.new(camCFrame.LookVector.X, 0, camCFrame.LookVector.Z)
		if targetLook.Magnitude > 0 then
			hrp.CFrame = CFrame.new(hrp.Position, hrp.Position + targetLook)
		end
	end)
end

local function toggleFly()
	if flying then
		stopFly()
	else
		startFly()
	end
end

FlyBtn.MouseButton1Click:Connect(toggleFly)

LocalPlayer.CharacterAdded:Connect(function()
	if flying then
		stopFly()
	end
end)

----------------------------------------------------
-- 6. LOGIC ANTI-AFK NO LAG
----------------------------------------------------
local isAntiAfkActive = false
local moveTask = nil

local function startAntiAFKNoLag()
	moveTask = task.spawn(function()
		while isAntiAfkActive do
			local char = LocalPlayer.Character
			local camera = Workspace.CurrentCamera
			
			if char and char:FindFirstChild("HumanoidRootPart") then
				local hrp = char.HumanoidRootPart
				
				hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(15), 0)
				if camera then
					camera.CFrame = camera.CFrame * CFrame.Angles(0, math.rad(5), 0)
				end
				
				task.wait(1.5)
				if not isAntiAfkActive then break end
				
				VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
				task.wait(0.1)
				VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
				
				task.wait(2)
			else
				task.wait(1)
			end
		end
	end)
end

ToggleBtn.MouseButton1Click:Connect(function()
	isAntiAfkActive = not isAntiAfkActive
	if isAntiAfkActive then
		ToggleBtn.Text = "ANTI-AFK: ON (NO-LAG)"
		ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
		StatusText.Text = "Status: Anti-AFK Aktif"
		StatusText.TextColor3 = Color3.fromRGB(40, 180, 80)
		startAntiAFKNoLag()
	else
		ToggleBtn.Text = "ANTI-AFK: OFF"
		ToggleBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
		StatusText.Text = "Karakter: Diam"
		StatusText.TextColor3 = Color3.fromRGB(150, 150, 150)
		if moveTask then task.cancel(moveTask) end
	end
end)

----------------------------------------------------
-- 7. LOGIC HIDE OTHER PLAYERS
----------------------------------------------------
local isHidePlayers = false
local hidePlayersConn = nil

local function toggleHidePlayers()
	isHidePlayers = not isHidePlayers
	if isHidePlayers then
		HidePlayersBtn.Text = "HIDE PLAYERS: ON (BERSIH)"
		HidePlayersBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
		for _, plr in pairs(Players:GetPlayers()) do
			if plr ~= LocalPlayer and plr.Character then
				plr.Character.Parent = nil
			end
		end
		hidePlayersConn = RunService.RenderStepped:Connect(function()
			for _, plr in pairs(Players:GetPlayers()) do
				if plr ~= LocalPlayer and plr.Character and plr.Character.Parent == Workspace then
					plr.Character.Parent = nil
				end
			end
		end)
	else
		HidePlayersBtn.Text = "HIDE PLAYERS: OFF"
		HidePlayersBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
		if hidePlayersConn then
			hidePlayersConn:Disconnect()
			hidePlayersConn = nil
		end
		for _, plr in pairs(Players:GetPlayers()) do
			if plr ~= LocalPlayer and plr.Character then
				plr.Character.Parent = Workspace
			end
		end
	end
end

HidePlayersBtn.MouseButton1Click:Connect(toggleHidePlayers)

----------------------------------------------------
-- 8. LOGIC BLACK SCREEN & FPS BOOST
----------------------------------------------------
local function toggleBlackScreen()
	BlackScreenGui.Enabled = not BlackScreenGui.Enabled
	if BlackScreenGui.Enabled then
		RunService:Set3DRenderSteppedEnabled(false)
		StatusText.Text = "Status: Black Screen (GPU Sleep Mode)"
	else
		RunService:Set3DRenderSteppedEnabled(true)
		StatusText.Text = "Status: Normal Screen"
	end
end

BlackBtn.MouseButton1Click:Connect(toggleBlackScreen)

local isVfxDisabled = false
VfxBtn.MouseButton1Click:Connect(function()
	isVfxDisabled = not isVfxDisabled
	if isVfxDisabled then
		VfxBtn.Text = "VFX / EFEK: MATI (NO LAG)"
		VfxBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
		for _, obj in pairs(Workspace:GetDescendants()) do
			if obj:IsA("ParticleEmitter") or obj:IsA("Sparkles") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Trail") or obj:IsA("Beam") then
				obj.Enabled = false
			end
		end
	else
		VfxBtn.Text = "VFX / EFEK: ON (NORMAL)"
		VfxBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
		for _, obj in pairs(Workspace:GetDescendants()) do
			if obj:IsA("ParticleEmitter") or obj:IsA("Sparkles") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Trail") or obj:IsA("Beam") then
				obj.Enabled = true
			end
		end
	end
end)

local isFpsBoosted = false
FpsBtn.MouseButton1Click:Connect(function()
	if not isFpsBoosted then
		isFpsBoosted = true
		FpsBtn.Text = "FPS BOOST: AKTIF!"
		FpsBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
		Lighting.GlobalShadows = false
		Lighting.FogEnd = 9e9
		for _, v in pairs(Lighting:GetChildren()) do
			if v:IsA("PostEffect") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") then
				v.Enabled = false
			end
		end
		if Workspace:FindFirstChildOfClass("Terrain") then
			Workspace.Terrain.WaterWaveSize = 0
			Workspace.Terrain.WaterWaveSpeed = 0
			Workspace.Terrain.WaterReflectance = 0
			Workspace.Terrain.WaterTransparency = 0
		end
		for _, part in pairs(Workspace:GetDescendants()) do
			if part:IsA("BasePart") and not part:IsA("MeshPart") then
				part.Material = Enum.Material.SmoothPlastic
			elseif part:IsA("Decal") or part:IsA("Texture") then
				part:Destroy()
			end
		end
	end
end)

----------------------------------------------------
-- 9. KEYBINDS (CHATBOX SAFE)
----------------------------------------------------
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if input.KeyCode == Enum.KeyCode.P then
		MainFrame.Visible = not MainFrame.Visible
	elseif input.KeyCode == Enum.KeyCode.B then
		toggleBlackScreen()
	elseif input.KeyCode == Enum.KeyCode.E then
		toggleFly()
	end
end)
