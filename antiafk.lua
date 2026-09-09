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
BlackFrame.BackgroundColor3 = Color3.fromRGB(3, 4, 8)
BlackFrame.BorderSizePixel = 0
BlackFrame.Parent = BlackScreenGui

local BlackText = Instance.new("TextLabel")
BlackText.Size = UDim2.new(1, 0, 0, 100)
BlackText.Position = UDim2.new(0, 0, 0.5, -50)
BlackText.BackgroundTransparency = 1
BlackText.Text = "SYSTEM SLEEP (BLACK SCREEN)\nTekan 'B' untuk membangunkan layar"
BlackText.TextColor3 = Color3.fromRGB(0, 230, 255)
BlackText.TextSize = 18
BlackText.Font = Enum.Font.GothamBold
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
MainFrame.Size = UDim2.new(0, 380, 0, 390)
MainFrame.Position = UDim2.new(0.5, -190, 0.25, -195)
MainFrame.BackgroundColor3 = Color3.fromRGB(11, 13, 19)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 2
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Parent = MainFrame

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 150, 255)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 230)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 90, 255))
})
UIGradient.Parent = UIStroke

task.spawn(function()
	local rot = 0
	while MainFrame and MainFrame.Parent do
		rot = (rot + 1.5) % 360
		UIGradient.Rotation = rot
		task.wait(0.02)
	end
end)

local HeaderFrame = Instance.new("Frame")
HeaderFrame.Size = UDim2.new(1, 0, 0, 42)
HeaderFrame.BackgroundTransparency = 1
HeaderFrame.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0.65, 0, 1, 0)
TitleLabel.Position = UDim2.new(0, 16, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "ANTI AFK - HEXKY HUB"
TitleLabel.TextColor3 = Color3.fromRGB(240, 245, 255)
TitleLabel.TextSize = 13
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Parent = HeaderFrame

local ExpandBtn = Instance.new("TextButton")
ExpandBtn.Size = UDim2.new(0, 24, 0, 24)
ExpandBtn.Position = UDim2.new(1, -62, 0, 9)
ExpandBtn.BackgroundColor3 = Color3.fromRGB(20, 26, 38)
ExpandBtn.Text = "⤢"
ExpandBtn.TextColor3 = Color3.fromRGB(0, 210, 255)
ExpandBtn.TextSize = 14
ExpandBtn.Font = Enum.Font.GothamBold
ExpandBtn.AutoButtonColor = false
ExpandBtn.Parent = HeaderFrame

local ExpandCorner = Instance.new("UICorner")
ExpandCorner.CornerRadius = UDim.new(1, 0)
ExpandCorner.Parent = ExpandBtn

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 24, 0, 24)
CloseBtn.Position = UDim2.new(1, -32, 0, 9)
CloseBtn.BackgroundColor3 = Color3.fromRGB(25, 20, 28)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 70, 80)
CloseBtn.TextSize = 12
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.AutoButtonColor = false
CloseBtn.Parent = HeaderFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseBtn

local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, -28, 0, 32)
TabBar.Position = UDim2.new(0, 14, 0, 46)
TabBar.BackgroundColor3 = Color3.fromRGB(16, 20, 29)
TabBar.Parent = MainFrame

local TabBarCorner = Instance.new("UICorner")
TabBarCorner.CornerRadius = UDim.new(0, 8)
TabBarCorner.Parent = TabBar

local TabAntiAfkBtn = Instance.new("TextButton")
TabAntiAfkBtn.Size = UDim2.new(0.33, -2, 1, -4)
TabAntiAfkBtn.Position = UDim2.new(0, 2, 0, 2)
TabAntiAfkBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 230)
TabAntiAfkBtn.Text = "Anti-AFK"
TabAntiAfkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TabAntiAfkBtn.TextSize = 11
TabAntiAfkBtn.Font = Enum.Font.GothamBold
TabAntiAfkBtn.Parent = TabBar

local TabFlyBtn = Instance.new("TextButton")
TabFlyBtn.Size = UDim2.new(0.33, -2, 1, -4)
TabFlyBtn.Position = UDim2.new(0.33, 2, 0, 2)
TabFlyBtn.BackgroundTransparency = 1
TabFlyBtn.Text = "Fly"
TabFlyBtn.TextColor3 = Color3.fromRGB(140, 150, 170)
TabFlyBtn.TextSize = 11
TabFlyBtn.Font = Enum.Font.GothamBold
TabFlyBtn.Parent = TabBar

local TabSettingsBtn = Instance.new("TextButton")
TabSettingsBtn.Size = UDim2.new(0.33, -2, 1, -4)
TabSettingsBtn.Position = UDim2.new(0.66, 2, 0, 2)
TabSettingsBtn.BackgroundTransparency = 1
TabSettingsBtn.Text = "Settings"
TabSettingsBtn.TextColor3 = Color3.fromRGB(140, 150, 170)
TabSettingsBtn.TextSize = 11
TabSettingsBtn.Font = Enum.Font.GothamBold
TabSettingsBtn.Parent = TabBar

for _, btn in pairs({TabAntiAfkBtn, TabFlyBtn, TabSettingsBtn}) do
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 6)
	corner.Parent = btn
end

local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, -28, 0, 260)
Container.Position = UDim2.new(0, 14, 0, 88)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

local TabAntiAfkPage = Instance.new("ScrollingFrame")
TabAntiAfkPage.Size = UDim2.new(1, 0, 1, 0)
TabAntiAfkPage.BackgroundTransparency = 1
TabAntiAfkPage.BorderSizePixel = 0
TabAntiAfkPage.ScrollBarThickness = 2
TabAntiAfkPage.CanvasSize = UDim2.new(0, 0, 0, 330)
TabAntiAfkPage.Visible = true
TabAntiAfkPage.Parent = Container

local TabFlyPage = Instance.new("ScrollingFrame")
TabFlyPage.Size = UDim2.new(1, 0, 1, 0)
TabFlyPage.BackgroundTransparency = 1
TabFlyPage.BorderSizePixel = 0
TabFlyPage.ScrollBarThickness = 2
TabFlyPage.CanvasSize = UDim2.new(0, 0, 0, 240)
TabFlyPage.Visible = false
TabFlyPage.Parent = Container

local TabSettingsPage = Instance.new("ScrollingFrame")
TabSettingsPage.Size = UDim2.new(1, 0, 1, 0)
TabSettingsPage.BackgroundTransparency = 1
TabSettingsPage.BorderSizePixel = 0
TabSettingsPage.ScrollBarThickness = 2
TabSettingsPage.CanvasSize = UDim2.new(0, 0, 0, 240)
TabSettingsPage.Visible = false
TabSettingsPage.Parent = Container

local FooterFrame = Instance.new("Frame")
FooterFrame.Size = UDim2.new(1, 0, 0, 28)
FooterFrame.Position = UDim2.new(0, 0, 1, -28)
FooterFrame.BackgroundTransparency = 1
FooterFrame.Parent = MainFrame

local CreditsLabel = Instance.new("TextLabel")
CreditsLabel.Size = UDim2.new(1, -28, 1, 0)
CreditsLabel.Position = UDim2.new(0, 14, 0, 0)
CreditsLabel.BackgroundTransparency = 1
CreditsLabel.Text = "Credits: Created by Hexky  •  [P: Menu | B: Screen | E: Fly]"
CreditsLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
CreditsLabel.TextSize = 10
CreditsLabel.Font = Enum.Font.Gotham
CreditsLabel.TextXAlignment = Enum.TextXAlignment.Left
CreditsLabel.Parent = FooterFrame

local function createRow(parent, pos, text)
	local row = Instance.new("Frame")
	row.Size = UDim2.new(1, -6, 0, 38)
	row.Position = pos
	row.BackgroundColor3 = Color3.fromRGB(16, 20, 29)
	row.Parent = parent
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = row
	
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(0.6, 0, 1, 0)
	label.Position = UDim2.new(0, 12, 0, 0)
	label.BackgroundTransparency = 1
	label.Text = text
	label.TextColor3 = Color3.fromRGB(220, 225, 235)
	label.TextSize = 11
	label.Font = Enum.Font.GothamMedium
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = row
	
	return row
end

local function switchTab(selectedBtn, selectedPage)
	for _, btn in pairs({TabAntiAfkBtn, TabFlyBtn, TabSettingsBtn}) do
		btn.BackgroundTransparency = 1
		btn.TextColor3 = Color3.fromRGB(140, 150, 170)
	end
	for _, page in pairs({TabAntiAfkPage, TabFlyPage, TabSettingsPage}) do
		page.Visible = false
	end
	selectedBtn.BackgroundTransparency = 0
	selectedBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 230)
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
		Container.Size = UDim2.new(1, -28, 0, 310)
		ExpandBtn.Text = "↙"
	else
		MainFrame.Size = UDim2.new(0, 380, 0, 390)
		Container.Size = UDim2.new(1, -28, 0, 260)
		ExpandBtn.Text = "⤢"
	end
end)

CloseBtn.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
	BlackScreenGui:Destroy()
end)

local function createToggle(row, defaultState, callback)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0, 42, 0, 20)
	btn.Position = UDim2.new(1, -50, 0.5, -10)
	btn.BackgroundColor3 = defaultState and Color3.fromRGB(0, 180, 120) or Color3.fromRGB(35, 42, 58)
	btn.Text = ""
	btn.AutoButtonColor = false
	btn.Parent = row
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(1, 0)
	corner.Parent = btn
	
	local dot = Instance.new("Frame")
	dot.Size = UDim2.new(0, 14, 0, 14)
	dot.Position = defaultState and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)
	dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	dot.Parent = btn
	
	local dotCorner = Instance.new("UICorner")
	dotCorner.CornerRadius = UDim.new(1, 0)
	dotCorner.Parent = dot
	
	local state = defaultState
	btn.MouseButton1Click:Connect(function()
		state = not state
		btn.BackgroundColor3 = state and Color3.fromRGB(0, 180, 120) or Color3.fromRGB(35, 42, 58)
		dot.Position = state and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)
		callback(state)
	end)
end

local isAntiAfkActive = false
local afkMode = "Camera & Jump"
local moveTask = nil

local rowAfk = createRow(TabAntiAfkPage, UDim2.new(0, 3, 0, 4), "Anti-AFK System")
local rowMode = createRow(TabAntiAfkPage, UDim2.new(0, 3, 0, 48), "AFK Movement Mode")
local rowVfx = createRow(TabAntiAfkPage, UDim2.new(0, 3, 0, 92), "Disable World VFX")
local rowFps = createRow(TabAntiAfkPage, UDim2.new(0, 3, 0, 136), "FPS Booster & Low Render")
local rowHide = createRow(TabAntiAfkPage, UDim2.new(0, 3, 0, 180), "Hide Other Players")
local rowBlack = createRow(TabAntiAfkPage, UDim2.new(0, 3, 0, 224), "Black Screen Mode [B]")

local modesList = {"Camera & Jump", "Spin Character", "Random Walk", "Idle Safe"}
local currentModeIdx = 1

local ModeSelectBtn = Instance.new("TextButton")
ModeSelectBtn.Size = UDim2.new(0, 110, 0, 22)
ModeSelectBtn.Position = UDim2.new(1, -118, 0.5, -11)
ModeSelectBtn.BackgroundColor3 = Color3.fromRGB(24, 30, 44)
ModeSelectBtn.Text = afkMode
ModeSelectBtn.TextColor3 = Color3.fromRGB(0, 210, 255)
ModeSelectBtn.TextSize = 10
ModeSelectBtn.Font = Enum.Font.GothamBold
ModeSelectBtn.Parent = rowMode

local ModeCorner = Instance.new("UICorner")
ModeCorner.CornerRadius = UDim.new(0, 6)
ModeCorner.Parent = ModeSelectBtn

ModeSelectBtn.MouseButton1Click:Connect(function()
	currentModeIdx = (currentModeIdx % #modesList) + 1
	afkMode = modesList[currentModeIdx]
	ModeSelectBtn.Text = afkMode
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

createToggle(rowAfk, false, function(state)
	isAntiAfkActive = state
	if isAntiAfkActive then
		startAntiAFK()
	else
		if moveTask then task.cancel(moveTask) end
	end
end)

local flying = false
local flySpeed = 50
local flyConnection = nil

local rowFlyToggle = createRow(TabFlyPage, UDim2.new(0, 3, 0, 4), "Fly Hack [E]")
local rowFlySpeed = createRow(TabFlyPage, UDim2.new(0, 3, 0, 48), "Fly Speed: " .. flySpeed)

local SpeedLabel = rowFlySpeed:FindFirstChildOfClass("TextLabel")

local MinusBtn = Instance.new("TextButton")
MinusBtn.Size = UDim2.new(0, 24, 0, 22)
MinusBtn.Position = UDim2.new(1, -84, 0.5, -11)
MinusBtn.BackgroundColor3 = Color3.fromRGB(24, 30, 44)
MinusBtn.Text = "-"
MinusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinusBtn.Font = Enum.Font.GothamBold
MinusBtn.Parent = rowFlySpeed

local PlusBtn = Instance.new("TextButton")
PlusBtn.Size = UDim2.new(0, 24, 0, 22)
PlusBtn.Position = UDim2.new(1, -30, 0.5, -11)
PlusBtn.BackgroundColor3 = Color3.fromRGB(24, 30, 44)
PlusBtn.Text = "+"
PlusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PlusBtn.Font = Enum.Font.GothamBold
PlusBtn.Parent = rowFlySpeed

local ResetBtn = Instance.new("TextButton")
ResetBtn.Size = UDim2.new(0, 24, 0, 22)
ResetBtn.Position = UDim2.new(1, -57, 0.5, -11)
ResetBtn.BackgroundColor3 = Color3.fromRGB(24, 30, 44)
ResetBtn.Text = "R"
ResetBtn.TextColor3 = Color3.fromRGB(0, 210, 255)
ResetBtn.Font = Enum.Font.GothamBold
ResetBtn.Parent = rowFlySpeed

for _, btn in pairs({MinusBtn, PlusBtn, ResetBtn}) do
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, 4)
	c.Parent = btn
end

MinusBtn.MouseButton1Click:Connect(function()
	flySpeed = math.max(10, flySpeed - 10)
	SpeedLabel.Text = "Fly Speed: " .. flySpeed
end)

PlusBtn.MouseButton1Click:Connect(function()
	flySpeed = math.min(300, flySpeed + 10)
	SpeedLabel.Text = "Fly Speed: " .. flySpeed
end)

ResetBtn.MouseButton1Click:Connect(function()
	flySpeed = 50
	SpeedLabel.Text = "Fly Speed: " .. flySpeed
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
end

local function startFly()
	local char = LocalPlayer.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local hum = char:FindFirstChildOfClass("Humanoid")
	
	if not hrp or not hum then return end
	
	flying = true
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

createToggle(rowFlyToggle, false, function(state)
	if state then startFly() else stopFly() end
end)

local rowScale = createRow(TabSettingsPage, UDim2.new(0, 3, 0, 4), "UI Scale")
local rowText = createRow(TabSettingsPage, UDim2.new(0, 3, 0, 48), "Text Size Mode")
local rowResetPos = createRow(TabSettingsPage, UDim2.new(0, 3, 0, 92), "Reset Frame Position")

local scales = {0.8, 1.0, 1.1, 1.2}
local scaleIdx = 2

local ScaleBtn = Instance.new("TextButton")
ScaleBtn.Size = UDim2.new(0, 80, 0, 22)
ScaleBtn.Position = UDim2.new(1, -88, 0.5, -11)
ScaleBtn.BackgroundColor3 = Color3.fromRGB(24, 30, 44)
ScaleBtn.Text = "1.0x"
ScaleBtn.TextColor3 = Color3.fromRGB(0, 210, 255)
ScaleBtn.TextSize = 10
ScaleBtn.Font = Enum.Font.GothamBold
ScaleBtn.Parent = rowScale

local ScaleCorner = Instance.new("UICorner")
ScaleCorner.CornerRadius = UDim.new(0, 6)
ScaleCorner.Parent = ScaleBtn

ScaleBtn.MouseButton1Click:Connect(function()
	scaleIdx = (scaleIdx % #scales) + 1
	MainUIScale.Scale = scales[scaleIdx]
	ScaleBtn.Text = tostring(scales[scaleIdx]) .. "x"
end)

local textSizes = {10, 11, 13}
local textNames = {"Small", "Normal", "Large"}
local textIdx = 2

local TextBtn = Instance.new("TextButton")
TextBtn.Size = UDim2.new(0, 80, 0, 22)
TextBtn.Position = UDim2.new(1, -88, 0.5, -11)
TextBtn.BackgroundColor3 = Color3.fromRGB(24, 30, 44)
TextBtn.Text = "Normal"
TextBtn.TextColor3 = Color3.fromRGB(0, 210, 255)
TextBtn.TextSize = 10
TextBtn.Font = Enum.Font.GothamBold
TextBtn.Parent = rowText

local TextCorner = Instance.new("UICorner")
TextCorner.CornerRadius = UDim.new(0, 6)
TextCorner.Parent = TextBtn

local function updateTextSizes(size)
	for _, desc in pairs(MainFrame:GetDescendants()) do
		if desc:IsA("TextLabel") and desc ~= TitleLabel and desc ~= CreditsLabel then
			desc.TextSize = size
		end
	end
end

TextBtn.MouseButton1Click:Connect(function()
	textIdx = (textIdx % #textSizes) + 1
	updateTextSizes(textSizes[textIdx])
	TextBtn.Text = textNames[textIdx]
end)

local ResetPosBtn = Instance.new("TextButton")
ResetPosBtn.Size = UDim2.new(0, 80, 0, 22)
ResetPosBtn.Position = UDim2.new(1, -88, 0.5, -11)
ResetPosBtn.BackgroundColor3 = Color3.fromRGB(24, 30, 44)
ResetPosBtn.Text = "Reset"
ResetPosBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ResetPosBtn.TextSize = 10
ResetPosBtn.Font = Enum.Font.GothamBold
ResetPosBtn.Parent = rowResetPos

local ResetCorner = Instance.new("UICorner")
ResetCorner.CornerRadius = UDim.new(0, 6)
ResetCorner.Parent = ResetPosBtn

ResetPosBtn.MouseButton1Click:Connect(function()
	MainFrame.Position = UDim2.new(0.5, -190, 0.25, -195)
end)

createToggle(rowVfx, false, function(state)
	for _, obj in pairs(Workspace:GetDescendants()) do
		if obj:IsA("ParticleEmitter") or obj:IsA("Sparkles") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Trail") or obj:IsA("Beam") then
			obj.Enabled = not state
		end
	end
end)

createToggle(rowFps, false, function(state)
	if state then
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

local hidePlayersConn = nil
createToggle(rowHide, false, function(state)
	if state then
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

createToggle(rowBlack, false, function(state)
	toggleBlackScreen()
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
