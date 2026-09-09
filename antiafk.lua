local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

for _, gui in pairs(PlayerGui:GetChildren()) do
	if gui:IsA("ScreenGui") and (gui.Name:find("AntiAFK") or gui.Name:find("HexkyHub")) then
		gui:Destroy()
	end
end

if gethui then
	for _, gui in pairs(gethui():GetChildren()) do
		if gui.Name:find("AntiAFK") or gui.Name:find("HexkyHub") then
			gui:Destroy()
		end
	end
end

LocalPlayer.Idled:Connect(function()
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new(0,0))
end)

local TargetParent = gethui and gethui() or PlayerGui

local BlackScreenGui = Instance.new("ScreenGui")
BlackScreenGui.Name = "AntiAFK_BlackScreen"
BlackScreenGui.ResetOnSpawn = false
BlackScreenGui.IgnoreGuiInset = true
BlackScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
BlackScreenGui.DisplayOrder = 999999
BlackScreenGui.Enabled = false
BlackScreenGui.Parent = TargetParent

local BlackFrame = Instance.new("Frame")
BlackFrame.Size = UDim2.new(1, 0, 1, 0)
BlackFrame.Position = UDim2.new(0, 0, 0, 0)
BlackFrame.BackgroundColor3 = Color3.fromRGB(2, 2, 5)
BlackFrame.BorderSizePixel = 0
BlackFrame.Parent = BlackScreenGui

local BlackText = Instance.new("TextLabel")
BlackText.Size = UDim2.new(1, 0, 0, 100)
BlackText.Position = UDim2.new(0, 0, 0.5, -50)
BlackText.BackgroundTransparency = 1
BlackText.Text = "MODE HEMAT DAYA (BLACK SCREEN)\nTekan 'B' untuk Kembali Ke Normal"
BlackText.TextColor3 = Color3.fromRGB(0, 220, 255)
BlackText.TextSize = 20
BlackText.Font = Enum.Font.SourceSansBold
BlackText.Parent = BlackFrame

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ANTI_AFK_HEXKY_HUB"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = TargetParent

local MainUIScale = Instance.new("UIScale")
MainUIScale.Scale = 1
MainUIScale.Parent = ScreenGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 360, 0, 380)
MainFrame.Position = UDim2.new(0.5, -180, 0.25, -190)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 18, 26)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 2.5
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Parent = MainFrame

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 200)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 100, 255))
})
UIGradient.Parent = UIStroke

task.spawn(function()
	local rotation = 0
	while MainFrame and MainFrame.Parent do
		rotation = (rotation + 2) % 360
		UIGradient.Rotation = rotation
		task.wait(0.03)
	end
end)

local HeaderFrame = Instance.new("Frame")
HeaderFrame.Size = UDim2.new(1, 0, 0, 36)
HeaderFrame.BackgroundColor3 = Color3.fromRGB(22, 27, 38)
HeaderFrame.BorderSizePixel = 0
HeaderFrame.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 8)
HeaderCorner.Parent = HeaderFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0.65, 0, 1, 0)
TitleLabel.Position = UDim2.new(0, 12, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "ANTI AFK - HEXKY HUB"
TitleLabel.TextColor3 = Color3.fromRGB(0, 210, 255)
TitleLabel.TextSize = 14
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.Parent = HeaderFrame

local ExpandBtn = Instance.new("TextButton")
ExpandBtn.Size = UDim2.new(0, 28, 0, 24)
ExpandBtn.Position = UDim2.new(1, -64, 0, 6)
ExpandBtn.BackgroundColor3 = Color3.fromRGB(35, 45, 65)
ExpandBtn.Text = "[+]"
ExpandBtn.TextColor3 = Color3.fromRGB(0, 230, 255)
ExpandBtn.TextSize = 12
ExpandBtn.Font = Enum.Font.SourceSansBold
ExpandBtn.Parent = HeaderFrame

local ExpandCorner = Instance.new("UICorner")
ExpandCorner.CornerRadius = UDim.new(0, 4)
ExpandCorner.Parent = ExpandBtn

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 24)
CloseBtn.Position = UDim2.new(1, -32, 0, 6)
CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 13
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.Parent = HeaderFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 4)
CloseCorner.Parent = CloseBtn

local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, -20, 0, 30)
TabBar.Position = UDim2.new(0, 10, 0, 42)
TabBar.BackgroundTransparency = 1
TabBar.Parent = MainFrame

local TabAntiAfkBtn = Instance.new("TextButton")
TabAntiAfkBtn.Size = UDim2.new(0.32, 0, 1, 0)
TabAntiAfkBtn.Position = UDim2.new(0, 0, 0, 0)
TabAntiAfkBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 220)
TabAntiAfkBtn.Text = "Anti-AFK"
TabAntiAfkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TabAntiAfkBtn.TextSize = 12
TabAntiAfkBtn.Font = Enum.Font.SourceSansBold
TabAntiAfkBtn.Parent = TabBar

local TabFlyBtn = Instance.new("TextButton")
TabFlyBtn.Size = UDim2.new(0.32, 0, 1, 0)
TabFlyBtn.Position = UDim2.new(0.34, 0, 0, 0)
TabFlyBtn.BackgroundColor3 = Color3.fromRGB(30, 38, 52)
TabFlyBtn.Text = "Fly Mode"
TabFlyBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
TabFlyBtn.TextSize = 12
TabFlyBtn.Font = Enum.Font.SourceSansBold
TabFlyBtn.Parent = TabBar

local TabSettingsBtn = Instance.new("TextButton")
TabSettingsBtn.Size = UDim2.new(0.32, 0, 1, 0)
TabSettingsBtn.Position = UDim2.new(0.68, 0, 0, 0)
TabSettingsBtn.BackgroundColor3 = Color3.fromRGB(30, 38, 52)
TabSettingsBtn.Text = "Settings"
TabSettingsBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
TabSettingsBtn.TextSize = 12
TabSettingsBtn.Font = Enum.Font.SourceSansBold
TabSettingsBtn.Parent = TabBar

for _, btn in pairs({TabAntiAfkBtn, TabFlyBtn, TabSettingsBtn}) do
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 5)
	corner.Parent = btn
end

local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, -20, 0, 265)
Container.Position = UDim2.new(0, 10, 0, 78)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

local TabAntiAfkPage = Instance.new("ScrollingFrame")
TabAntiAfkPage.Size = UDim2.new(1, 0, 1, 0)
TabAntiAfkPage.BackgroundTransparency = 1
TabAntiAfkPage.BorderSizePixel = 0
TabAntiAfkPage.ScrollBarThickness = 4
TabAntiAfkPage.CanvasSize = UDim2.new(0, 0, 0, 340)
TabAntiAfkPage.Visible = true
TabAntiAfkPage.Parent = Container

local TabFlyPage = Instance.new("ScrollingFrame")
TabFlyPage.Size = UDim2.new(1, 0, 1, 0)
TabFlyPage.BackgroundTransparency = 1
TabFlyPage.BorderSizePixel = 0
TabFlyPage.ScrollBarThickness = 4
TabFlyPage.CanvasSize = UDim2.new(0, 0, 0, 260)
TabFlyPage.Visible = false
TabFlyPage.Parent = Container

local TabSettingsPage = Instance.new("ScrollingFrame")
TabSettingsPage.Size = UDim2.new(1, 0, 1, 0)
TabSettingsPage.BackgroundTransparency = 1
TabSettingsPage.BorderSizePixel = 0
TabSettingsPage.ScrollBarThickness = 4
TabSettingsPage.CanvasSize = UDim2.new(0, 0, 0, 260)
TabSettingsPage.Visible = false
TabSettingsPage.Parent = Container

local FooterFrame = Instance.new("Frame")
FooterFrame.Size = UDim2.new(1, 0, 0, 24)
FooterFrame.Position = UDim2.new(0, 0, 1, -24)
FooterFrame.BackgroundColor3 = Color3.fromRGB(10, 12, 18)
FooterFrame.BorderSizePixel = 0
FooterFrame.Parent = MainFrame

local FooterCorner = Instance.new("UICorner")
FooterCorner.CornerRadius = UDim.new(0, 8)
FooterCorner.Parent = FooterFrame

local CreditsLabel = Instance.new("TextLabel")
CreditsLabel.Size = UDim2.new(1, -20, 1, 0)
CreditsLabel.Position = UDim2.new(0, 10, 0, 0)
CreditsLabel.BackgroundTransparency = 1
CreditsLabel.Text = "Credits: Created by Hexky | Keybinds [P: Menu | B: BlackScreen | E: Fly]"
CreditsLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
CreditsLabel.TextSize = 10
CreditsLabel.Font = Enum.Font.SourceSans
CreditsLabel.TextXAlignment = Enum.TextXAlignment.Left
CreditsLabel.Parent = FooterFrame

local function createStyledBtn(parent, size, pos, text, bg)
	local btn = Instance.new("TextButton")
	btn.Size = size
	btn.Position = pos
	btn.BackgroundColor3 = bg or Color3.fromRGB(30, 38, 52)
	btn.Text = text
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 12
	btn.Font = Enum.Font.SourceSansBold
	btn.Parent = parent
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 6)
	corner.Parent = btn
	return btn
end

local function switchTab(selectedBtn, selectedPage)
	for _, btn in pairs({TabAntiAfkBtn, TabFlyBtn, TabSettingsBtn}) do
		btn.BackgroundColor3 = Color3.fromRGB(30, 38, 52)
		btn.TextColor3 = Color3.fromRGB(200, 200, 200)
	end
	for _, page in pairs({TabAntiAfkPage, TabFlyPage, TabSettingsPage}) do
		page.Visible = false
	end
	selectedBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 220)
	selectedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	selectedPage.Visible = true
end

TabAntiAfkBtn.MouseButton1Click:Connect(function() switchTab(TabAntiAfkBtn, TabAntiAfkPage) end)
TabFlyBtn.MouseButton1Click:Connect(function() switchTab(TabFlyBtn, TabFlyPage) end)
TabSettingsBtn.MouseButton1Click:Connect(function() switchTab(TabSettingsBtn, TabSettingsPage) end)

local isExpanded = false
ExpandBtn.MouseButton1Click:Connect(function()
	isExpanded = not isExpanded
	if isExpanded then
		MainFrame.Size = UDim2.new(0, 480, 0, 440)
		Container.Size = UDim2.new(1, -20, 0, 325)
		ExpandBtn.Text = "[-]"
	else
		MainFrame.Size = UDim2.new(0, 360, 0, 380)
		Container.Size = UDim2.new(1, -20, 0, 265)
		ExpandBtn.Text = "[+]"
	end
end)

CloseBtn.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
	BlackScreenGui:Destroy()
end)

local isAntiAfkActive = false
local afkMode = "Camera & Jump"
local moveTask = nil

local ToggleAfkBtn = createStyledBtn(TabAntiAfkPage, UDim2.new(1, -10, 0, 34), UDim2.new(0, 5, 0, 5), "ANTI-AFK: OFF", Color3.fromRGB(180, 40, 50))
local AfkModeBtn = createStyledBtn(TabAntiAfkPage, UDim2.new(1, -10, 0, 32), UDim2.new(0, 5, 0, 45), "MODE: Camera & Jump", Color3.fromRGB(35, 45, 65))
local VfxBtn = createStyledBtn(TabAntiAfkPage, UDim2.new(1, -10, 0, 32), UDim2.new(0, 5, 0, 83), "VFX / EFEK: ON (NORMAL)", Color3.fromRGB(180, 40, 50))
local FpsBtn = createStyledBtn(TabAntiAfkPage, UDim2.new(1, -10, 0, 32), UDim2.new(0, 5, 0, 121), "BOOST FPS & LOW RENDER", Color3.fromRGB(50, 55, 70))
local HidePlayersBtn = createStyledBtn(TabAntiAfkPage, UDim2.new(1, -10, 0, 32), UDim2.new(0, 5, 0, 159), "HIDE PLAYERS: OFF", Color3.fromRGB(180, 40, 50))
local BlackBtn = createStyledBtn(TabAntiAfkPage, UDim2.new(1, -10, 0, 32), UDim2.new(0, 5, 0, 197), "BLACK SCREEN (HEMAT DAYA) [B]", Color3.fromRGB(20, 80, 60))

local modesList = {"Camera & Jump", "Spin Character", "Random Walk", "Idle Safe"}
local currentModeIdx = 1

AfkModeBtn.MouseButton1Click:Connect(function()
	currentModeIdx = (currentModeIdx % #modesList) + 1
	afkMode = modesList[currentModeIdx]
	AfkModeBtn.Text = "MODE: " .. afkMode
end)

local function startAntiAFK()
	moveTask = task.spawn(function()
		while isAntiAfkActive do
			local char = LocalPlayer.Character
			local hrp = char and char:FindFirstChild("HumanoidRootPart")
			local hum = char and char:FindFirstChildOfClass("Humanoid")
			local camera = Workspace.CurrentCamera

			if afkMode == "Camera & Jump" then
				if hrp then hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(10), 0) end
				if camera then camera.CFrame = camera.CFrame * CFrame.Angles(0, math.rad(5), 0) end
				task.wait(1.5)
				if not isAntiAfkActive then break end
				VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
				task.wait(0.1)
				VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
				task.wait(2)
			elseif afkMode == "Spin Character" then
				if hrp then hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(30), 0) end
				task.wait(0.2)
			elseif afkMode == "Random Walk" then
				if hum then
					local dirs = {Vector3.new(1,0,0), Vector3.new(-1,0,0), Vector3.new(0,0,1), Vector3.new(0,0,-1)}
					hum:Move(dirs[math.random(1, #dirs)], false)
				end
				task.wait(2)
			elseif afkMode == "Idle Safe" then
				VirtualUser:CaptureController()
				VirtualUser:ClickButton2(Vector2.new(0,0))
				task.wait(5)
			end
		end
	end)
end

ToggleAfkBtn.MouseButton1Click:Connect(function()
	isAntiAfkActive = not isAntiAfkActive
	if isAntiAfkActive then
		ToggleAfkBtn.Text = "ANTI-AFK: ON"
		ToggleAfkBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
		startAntiAFK()
	else
		ToggleAfkBtn.Text = "ANTI-AFK: OFF"
		ToggleAfkBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 50)
		if moveTask then task.cancel(moveTask) end
	end
end)

local flying = false
local flySpeed = 50
local flyConnection = nil

local FlyToggleBtn = createStyledBtn(TabFlyPage, UDim2.new(1, -10, 0, 36), UDim2.new(0, 5, 0, 5), "FLY: OFF [E]", Color3.fromRGB(180, 40, 50))

local SpeedFrame = Instance.new("Frame")
SpeedFrame.Size = UDim2.new(1, -10, 0, 40)
SpeedFrame.Position = UDim2.new(0, 5, 0, 48)
SpeedFrame.BackgroundColor3 = Color3.fromRGB(25, 32, 45)
SpeedFrame.Parent = TabFlyPage

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0, 6)
SpeedCorner.Parent = SpeedFrame

local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Size = UDim2.new(0.45, 0, 1, 0)
SpeedLabel.Position = UDim2.new(0, 8, 0, 0)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "Kecepatan Fly: 50"
SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedLabel.TextSize = 12
SpeedLabel.Font = Enum.Font.SourceSansBold
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
SpeedLabel.Parent = SpeedFrame

local SpeedMinus = createStyledBtn(SpeedFrame, UDim2.new(0, 32, 0, 28), UDim2.new(1, -108, 0, 6), "-", Color3.fromRGB(40, 50, 70))
local SpeedReset = createStyledBtn(SpeedFrame, UDim2.new(0, 32, 0, 28), UDim2.new(1, -72, 0, 6), "R", Color3.fromRGB(40, 50, 70))
local SpeedPlus = createStyledBtn(SpeedFrame, UDim2.new(0, 32, 0, 28), UDim2.new(1, -36, 0, 6), "+", Color3.fromRGB(40, 50, 70))

SpeedMinus.MouseButton1Click:Connect(function()
	flySpeed = math.max(10, flySpeed - 10)
	SpeedLabel.Text = "Kecepatan Fly: " .. tostring(flySpeed)
end)

SpeedPlus.MouseButton1Click:Connect(function()
	flySpeed = math.min(300, flySpeed + 10)
	SpeedLabel.Text = "Kecepatan Fly: " .. tostring(flySpeed)
end)

SpeedReset.MouseButton1Click:Connect(function()
	flySpeed = 50
	SpeedLabel.Text = "Kecepatan Fly: " .. tostring(flySpeed)
end)

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
	
	FlyToggleBtn.Text = "FLY: OFF [E]"
	FlyToggleBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 50)
end

local function startFly()
	local char = LocalPlayer.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local hum = char:FindFirstChildOfClass("Humanoid")
	
	if not hrp or not hum then return end
	
	flying = true
	FlyToggleBtn.Text = "FLY: ON [E]"
	FlyToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)

	hum.PlatformStand = true

	flyConnection = RunService.RenderStepped:Connect(function(deltaTime)
		if not flying or not char or not hrp or not hum or hum.Health <= 0 then
			stopFly()
			return
		end

		local camera = Workspace.CurrentCamera
		if not camera then return end

		hrp.Velocity = Vector3.new(0, 0, 0)
		hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)

		local camCFrame = camera.CFrame
		local lookVector = Vector3.new(camCFrame.LookVector.X, 0, camCFrame.LookVector.Z).Unit
		local rightVector = Vector3.new(camCFrame.RightVector.X, 0, camCFrame.RightVector.Z).Unit

		local moveVector = Vector3.new()

		if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveVector = moveVector + lookVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveVector = moveVector - lookVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveVector = moveVector - rightVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveVector = moveVector + rightVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveVector = moveVector + Vector3.new(0, 1, 0) end
		if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveVector = moveVector - Vector3.new(0, 1, 0) end

		if moveVector.Magnitude > 0 then
			hrp.CFrame = hrp.CFrame + (moveVector.Unit * flySpeed * deltaTime)
		end

		local targetLook = Vector3.new(camCFrame.LookVector.X, 0, camCFrame.LookVector.Z)
		if targetLook.Magnitude > 0 then
			hrp.CFrame = CFrame.new(hrp.Position, hrp.Position + targetLook)
		end
	end)
end

local function toggleFly()
	if flying then stopFly() else startFly() end
end

FlyToggleBtn.MouseButton1Click:Connect(toggleFly)

local ScaleBtn = createStyledBtn(TabSettingsPage, UDim2.new(1, -10, 0, 34), UDim2.new(0, 5, 0, 5), "UI SCALE: 1.0x", Color3.fromRGB(35, 45, 65))
local TextScaleBtn = createStyledBtn(TabSettingsPage, UDim2.new(1, -10, 0, 34), UDim2.new(0, 5, 0, 45), "UKURAN TEKS: Normal", Color3.fromRGB(35, 45, 65))
local ResetPosBtn = createStyledBtn(TabSettingsPage, UDim2.new(1, -10, 0, 34), UDim2.new(0, 5, 0, 85), "RESET POSISI UI", Color3.fromRGB(50, 55, 70))

local scales = {0.8, 1.0, 1.1, 1.2}
local scaleIdx = 2
ScaleBtn.MouseButton1Click:Connect(function()
	scaleIdx = (scaleIdx % #scales) + 1
	MainUIScale.Scale = scales[scaleIdx]
	ScaleBtn.Text = "UI SCALE: " .. tostring(scales[scaleIdx]) .. "x"
end)

local textSizes = {11, 13, 15}
local textNames = {"Kecil", "Normal", "Besar"}
local textIdx = 2

local function updateTextSizes(size)
	for _, desc in pairs(MainFrame:GetDescendants()) do
		if desc:IsA("TextLabel") or desc:IsA("TextButton") then
			if desc ~= TitleLabel and desc ~= CreditsLabel then
				desc.TextSize = size
			end
		end
	end
end

TextScaleBtn.MouseButton1Click:Connect(function()
	textIdx = (textIdx % #textSizes) + 1
	updateTextSizes(textSizes[textIdx])
	TextScaleBtn.Text = "UKURAN TEKS: " .. textNames[textIdx]
end)

ResetPosBtn.MouseButton1Click:Connect(function()
	MainFrame.Position = UDim2.new(0.5, -180, 0.25, -190)
end)

local isHidePlayers = false
local hidePlayersConn = nil
HidePlayersBtn.MouseButton1Click:Connect(function()
	isHidePlayers = not isHidePlayers
	if isHidePlayers then
		HidePlayersBtn.Text = "HIDE PLAYERS: ON"
		HidePlayersBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
		for _, plr in pairs(Players:GetPlayers()) do
			if plr ~= LocalPlayer and plr.Character then plr.Character.Parent = nil end
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
		HidePlayersBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 50)
		if hidePlayersConn then hidePlayersConn:Disconnect() hidePlayersConn = nil end
		for _, plr in pairs(Players:GetPlayers()) do
			if plr ~= LocalPlayer and plr.Character then plr.Character.Parent = Workspace end
		end
	end
end)

local function toggleBlackScreen()
	BlackScreenGui.Enabled = not BlackScreenGui.Enabled
	RunService:Set3DRenderSteppedEnabled(not BlackScreenGui.Enabled)
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
		VfxBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 50)
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
