

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomTabbedGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 520, 0, 340)
mainFrame.Position = UDim2.new(0.5, -260, 0.5, -170)
mainFrame.BackgroundColor3 = Color3.fromRGB(28, 29, 34)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Size = UDim2.new(1, 0, 0, 44)
topBar.BackgroundColor3 = Color3.fromRGB(20, 20, 24)
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, -180, 1, 0)
title.Position = UDim2.new(0, 8, 0, 0)
title.BackgroundTransparency = 1
title.Text = "JJS SIMPLE GUI Made by urs truly deep"
title.TextColor3 = Color3.fromRGB(230, 230, 235)
title.TextSize = 18
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = topBar

local actionsHolder = Instance.new("Frame")
actionsHolder.Name = "ActionsHolder"
actionsHolder.Size = UDim2.new(0, 160, 1, 0)
actionsHolder.Position = UDim2.new(1, -168, 0, 0)
actionsHolder.BackgroundTransparency = 1
actionsHolder.Parent = topBar

local actionsLayout = Instance.new("UIListLayout")
actionsLayout.FillDirection = Enum.FillDirection.Horizontal
actionsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
actionsLayout.VerticalAlignment = Enum.VerticalAlignment.Center
actionsLayout.Padding = UDim.new(0, 8)
actionsLayout.Parent = actionsHolder

local function createTopButton(text)
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(0, 70, 0, 26)
	button.BackgroundColor3 = Color3.fromRGB(45, 47, 55)
	button.TextColor3 = Color3.fromRGB(230, 230, 235)
	button.TextSize = 13
	button.Font = Enum.Font.GothamSemibold
	button.Text = text
	button.AutoButtonColor = false
	button.Parent = actionsHolder

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 6)
	corner.Parent = button

	return button
end

local tabBar = Instance.new("Frame")
tabBar.Name = "TabBar"
tabBar.Size = UDim2.new(1, 0, 0, 36)
tabBar.Position = UDim2.new(0, 0, 0, 44)
tabBar.BackgroundColor3 = Color3.fromRGB(24, 25, 30)
tabBar.BorderSizePixel = 0
tabBar.Parent = mainFrame

local content = Instance.new("Frame")
content.Name = "Content"
content.Size = UDim2.new(1, 0, 1, -80)
content.Position = UDim2.new(0, 0, 0, 80)
content.BackgroundColor3 = Color3.fromRGB(30, 31, 36)
content.BorderSizePixel = 0
content.Parent = mainFrame

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 10)
uiCorner.Parent = mainFrame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(46, 47, 54)
stroke.Thickness = 1
stroke.Parent = mainFrame

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabLayout.Padding = UDim.new(0, 8)
tabLayout.Parent = tabBar

local tabPadding = Instance.new("UIPadding")
tabPadding.PaddingLeft = UDim.new(0, 8)
tabPadding.PaddingTop = UDim.new(0, 6)
tabPadding.Parent = tabBar

local function createTabButton(text, order)
	local button = Instance.new("TextButton")
	button.Name = text .. "Tab"
	button.Size = UDim2.new(0, 120, 0, 24)
	button.LayoutOrder = order
	button.BackgroundColor3 = Color3.fromRGB(40, 41, 48)
	button.TextColor3 = Color3.fromRGB(220, 220, 228)
	button.TextSize = 14
	button.Font = Enum.Font.GothamSemibold
	button.Text = text
	button.AutoButtonColor = false
	button.Parent = tabBar

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 6)
	corner.Parent = button

	return button
end

local function createPage(name)
	local page = Instance.new("Frame")
	page.Name = name .. "Page"
	page.Size = UDim2.new(1, 0, 1, 0)
	page.BackgroundTransparency = 1
	page.Visible = false
	page.Parent = content

	local pagePadding = Instance.new("UIPadding")
	pagePadding.PaddingTop = UDim.new(0, 12)
	pagePadding.PaddingLeft = UDim.new(0, 12)
	pagePadding.PaddingRight = UDim.new(0, 12)
	pagePadding.PaddingBottom = UDim.new(0, 12)
	pagePadding.Parent = page

	local list = Instance.new("UIListLayout")
	list.Padding = UDim.new(0, 10)
	list.SortOrder = Enum.SortOrder.LayoutOrder
	list.Parent = page

	return page
end

local function createActionButton(text, order, parent)
	local button = Instance.new("TextButton")
	button.Name = text:gsub("%s+", "") .. "Button"
	button.LayoutOrder = order
	button.Size = UDim2.new(1, 0, 0, 42)
	button.BackgroundColor3 = Color3.fromRGB(52, 54, 62)
	button.TextColor3 = Color3.fromRGB(235, 235, 240)
	button.TextSize = 14
	button.Font = Enum.Font.GothamSemibold
	button.Text = text
	button.AutoButtonColor = false
	button.Parent = parent

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = button

	local hover = Instance.new("UIStroke")
	hover.Color = Color3.fromRGB(70, 72, 82)
	hover.Thickness = 1
	hover.Parent = button

	return button
end

local mainTab = createTabButton("Main", 1)
local teleportTab = createTabButton("Teleport", 2)

local toggleButton = createTopButton("Toggle")
local unloadButton = createTopButton("Unload")

local mainPage = createPage("Main")
local teleportPage = createPage("Teleport")

local mainInfo = Instance.new("TextLabel")
mainInfo.Name = "MainInfo"
mainInfo.Size = UDim2.new(1, 0, 0, 24)
mainInfo.BackgroundTransparency = 1
mainInfo.Text = "Add your main actions here."
mainInfo.TextColor3 = Color3.fromRGB(200, 200, 210)
mainInfo.TextSize = 14
mainInfo.Font = Enum.Font.Gotham
mainInfo.TextXAlignment = Enum.TextXAlignment.Left
mainInfo.LayoutOrder = 0
mainInfo.Parent = mainPage

local buttons = {}
buttons.noFall = createActionButton("No Fall", 1, mainPage)
buttons.trinketHighlight = createActionButton("Trinket Highlight: ON", 2, mainPage)
buttons.collectTrinkets = createActionButton("Collect Trinkets: OFF", 3, mainPage)
buttons.forest3 = createActionButton("Forest 3", 1, teleportPage)
buttons.desert3 = createActionButton("Desert 3", 2, teleportPage)
buttons.forest2 = createActionButton("Forest 2", 3, teleportPage)
buttons.quest1 = createActionButton("Quest 1", 4, teleportPage)
buttons.quest2 = createActionButton("Quest 2", 5, teleportPage)

local function setActiveTab(activeButton, activePage)
	for _, page in ipairs(content:GetChildren()) do
		if page:IsA("Frame") then
			page.Visible = (page == activePage)
		end
	end

	for _, button in ipairs(tabBar:GetChildren()) do
		if button:IsA("TextButton") then
			if button == activeButton then
				button.BackgroundColor3 = Color3.fromRGB(70, 72, 82)
			else
				button.BackgroundColor3 = Color3.fromRGB(40, 41, 48)
			end
		end
	end
end

mainTab.MouseButton1Click:Connect(function()
	setActiveTab(mainTab, mainPage)
end)

teleportTab.MouseButton1Click:Connect(function()
	setActiveTab(teleportTab, teleportPage)
end)

setActiveTab(mainTab, mainPage)

toggleButton.MouseButton1Click:Connect(function()
	local isCollapsed = not content.Visible
	if isCollapsed then
		content.Visible = true
		tabBar.Visible = true
		mainFrame.Size = UDim2.new(0, 520, 0, 340)
	else
		content.Visible = false
		tabBar.Visible = false
		mainFrame.Size = UDim2.new(0, 520, 0, topBar.Size.Y.Offset)
	end
end)

unloadButton.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

-- Zet je scripts in deze callbacks.
buttons.forest3.MouseButton1Click:Connect(function()
local ts = game:GetService("TweenService")
local plr = game.Players.LocalPlayer

local tween = ts:Create(
    plr.Character.HumanoidRootPart,
    TweenInfo.new(6),
    { CFrame = CFrame.new(2741, 286, 57) }
)
tween:Play()
end)

buttons.noFall.MouseButton1Click:Connect(function()
	local noFallEnabled = not (buttons.noFall:GetAttribute("NoFallEnabled") == true)
	buttons.noFall:SetAttribute("NoFallEnabled", noFallEnabled)
	if noFallEnabled then
		buttons.noFall.Text = "No Fall: ON"
		buttons.noFall.BackgroundColor3 = Color3.fromRGB(58, 98, 76)

		local args = { [1] = 0 }
		workspace:WaitForChild("Live", 9e9)
			:WaitForChild("ghoste_guiexe", 9e9)
			:WaitForChild("CharacterHandler", 9e9)
			:WaitForChild("Remotes", 9e9)
			:WaitForChild("ApplyFallDamage", 9e9)
			:FireServer(unpack(args))
	else
		buttons.noFall.Text = "No Fall: OFF"
		buttons.noFall.BackgroundColor3 = Color3.fromRGB(52, 54, 62)
	end
end)

buttons.desert3.MouseButton1Click:Connect(function()
	-- Je script voor Desert 3
end)

buttons.forest2.MouseButton1Click:Connect(function()
	-- Je script voor Forest 2
end)

buttons.quest1.MouseButton1Click:Connect(function()
local ts = game:GetService("TweenService")
local plr = game.Players.LocalPlayer

local tween = ts:Create(
    plr.Character.HumanoidRootPart,
    TweenInfo.new(6),
    { CFrame = CFrame.new(2284, 71, -571) }
)
tween:Play()
end)

buttons.quest2.MouseButton1Click:Connect(function()
	-- Je script voor Quest 2
end)

-- Trinket highlight/label (werkt bij spawn/despawn)
-- Dit blok zoekt trinkets in Workspace en voegt een highlight + naamlbl toe aan elke trinket.
local function getClickPart(instance)
	-- Clickpart is de echte interactie-part; vind die eerst (case-insensitive).
	if instance:IsA("Model") then
		for _, desc in ipairs(instance:GetDescendants()) do
			if desc:IsA("BasePart") and desc.Name:lower() == "clickpart" then
				return desc
			end
		end
	end
	if instance:IsA("BasePart") and instance.Name:lower() == "clickpart" then
		return instance
	end
	return nil
end

local function getTrinketRoot(descendant, rootFolder)
	-- Als een descendant spawnt, pak het trinket-model dat direct onder de folder hangt.
	local current = descendant
	while current and current ~= rootFolder do
		if current.Parent == rootFolder then
			return current
		end
		current = current.Parent
	end
	return nil
end

local function getTrinketDisplayName(instance)
	-- Toon liever de modelnaam in plaats van "clickpart".
	if instance:IsA("BasePart") and instance.Name:lower() == "clickpart" and instance.Parent then
		return instance.Parent.Name
	end
	return instance.Name
end

local function getAdornmentPart(instance)
	-- We hebben een BasePart nodig om BillboardGui/Highlight aan te hangen.
	-- Clickpart krijgt voorrang, zodat de highlight op de interactieplek zit.
	local clickPart = getClickPart(instance)
	if clickPart and clickPart:IsA("BasePart") then
		return clickPart
	end
	if instance:IsA("BasePart") then
		return instance
	end
	if instance:IsA("Model") then
		-- Geef voorkeur aan PrimaryPart; anders pak de eerste BasePart in het model.
		return instance.PrimaryPart or instance:FindFirstChildWhichIsA("BasePart")
	end
	return nil
end

local function addTrinketUi(instance)
	-- Zoek de part waar we UI aan kunnen hangen; stop als die er niet is.
	local part = getAdornmentPart(instance)
	if not part then
		return false
	end

	if not part:FindFirstChild("TrinketHighlight") then
		-- Highlight = glow/outline zodat de trinket opvalt.
		local highlight = Instance.new("Highlight")
		highlight.Name = "TrinketHighlight"
		highlight.FillColor = Color3.fromRGB(255, 214, 107)
		highlight.FillTransparency = 0.6
		highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
		highlight.OutlineTransparency = 0.2
		highlight.Parent = part
	end

	if not part:FindFirstChild("TrinketLabel") then
		-- BillboardGui = zwevende tekst boven het object.
		local labelGui = Instance.new("BillboardGui")
		labelGui.Name = "TrinketLabel"
		labelGui.Size = UDim2.new(0, 120, 0, 30)
		labelGui.StudsOffset = Vector3.new(0, 2.5, 0)
		labelGui.AlwaysOnTop = true
		labelGui.Adornee = part
		labelGui.Parent = part

		local text = Instance.new("TextLabel")
		text.Name = "Text"
		text.Size = UDim2.new(1, 0, 1, 0)
		text.BackgroundTransparency = 1
		-- Toon de instancenaam; vervang dit met DisplayName als je die hebt.
		text.Text = getTrinketDisplayName(instance)
		text.TextColor3 = Color3.fromRGB(255, 255, 255)
		text.TextTransparency = 0.1
		text.TextScaled = true
		text.Font = Enum.Font.SourceSansSemibold
		text.Parent = labelGui
	end

	return true
end

local function ensureTrinketUi(instance)
	-- Als parts later spawnen, luister dan even en probeer opnieuw.
	if addTrinketUi(instance) then
		return
	end

	local connection
	connection = instance.DescendantAdded:Connect(function()
		if addTrinketUi(instance) then
			connection:Disconnect()
		end
	end)
end

local function removeTrinketUi(instance)
	local part = getAdornmentPart(instance)
	if not part then
		return
	end

	local highlight = part:FindFirstChild("TrinketHighlight")
	if highlight then
		highlight:Destroy()
	end

	local label = part:FindFirstChild("TrinketLabel")
	if label then
		label:Destroy()
	end
end

-- Zoekt de trinketfolder in Workspace (case-insensitive) en waarschuwt als deze niet gevonden wordt.
local function findTrinketsFolder()
	-- Vind de trinketfolder, ook als die in Workspace/Items zit.
	local direct = workspace:FindFirstChild("Trinkets") or workspace:FindFirstChild("trinkets")
	if direct then
		return direct
	end

	local items = workspace:FindFirstChild("Items") or workspace:FindFirstChild("items")
	if items then
		return items:FindFirstChild("Trinkets") or items:FindFirstChild("trinkets")
	end

	return nil
end

local trinketsFolder = findTrinketsFolder()
if trinketsFolder then
	local trinketHighlightEnabled = true
	local trinketAddedConnection = nil
	local trinketDescAddedConnection = nil
	local isCollecting = false
	local warnedClickDetectorMissing = false
	local noClipEnabled = false

	local function isDescendantOfTerrain(part)
		return part:IsDescendantOf(workspace.Terrain)
	end

	game:GetService("RunService").Stepped:Connect(function()
		-- Noclip actief tijdens auto-collect om vastzitten te voorkomen.
		if noClipEnabled then
			local character = player.Character
			if character then
				for _, part in ipairs(character:GetDescendants()) do
					if part:IsA("BasePart") and not isDescendantOfTerrain(part) then
						part.CanCollide = false
					end
				end
			end
		end
	end)

	local function refreshTrinketHighlights()
		-- Voeg UI toe aan bestaande trinkets, ook in subfolders.
		local seen = {}
		for _, child in ipairs(trinketsFolder:GetChildren()) do
			seen[child] = true
			ensureTrinketUi(child)
		end
		for _, desc in ipairs(trinketsFolder:GetDescendants()) do
			local root = getTrinketRoot(desc, trinketsFolder)
			if root and not seen[root] then
				seen[root] = true
				ensureTrinketUi(root)
			end
		end
	end

	-- Voeg UI toe aan bestaande trinkets.
	refreshTrinketHighlights()

	-- Voeg UI toe aan trinkets die later spawnen (directe kinderen).
	trinketAddedConnection = trinketsFolder.ChildAdded:Connect(function(child)
		if trinketHighlightEnabled then
			ensureTrinketUi(child)
		end
	end)

	-- Sommige games spawnen trinkets dieper in subfolders; pak ook descendants.
	trinketDescAddedConnection = trinketsFolder.DescendantAdded:Connect(function(desc)
		if trinketHighlightEnabled then
			local root = getTrinketRoot(desc, trinketsFolder)
			if root then
				ensureTrinketUi(root)
			end
		end
	end)

	buttons.trinketHighlight.MouseButton1Click:Connect(function()
		trinketHighlightEnabled = not trinketHighlightEnabled
		if trinketHighlightEnabled then
			buttons.trinketHighlight.Text = "Trinket Highlight: ON"
			buttons.trinketHighlight.BackgroundColor3 = Color3.fromRGB(58, 98, 76)

			refreshTrinketHighlights()
		else
			buttons.trinketHighlight.Text = "Trinket Highlight: OFF"
			buttons.trinketHighlight.BackgroundColor3 = Color3.fromRGB(52, 54, 62)

			for _, child in ipairs(trinketsFolder:GetChildren()) do
				removeTrinketUi(child)
			end
		end
	end)

	buttons.collectTrinkets.MouseButton1Click:Connect(function()
		isCollecting = not isCollecting
		if isCollecting then
			buttons.collectTrinkets.Text = "Collect Trinkets: ON"
			buttons.collectTrinkets.BackgroundColor3 = Color3.fromRGB(58, 98, 76)
			noClipEnabled = true

			task.spawn(function()
				while isCollecting do
					local character = player.Character or player.CharacterAdded:Wait()
					local hrp = character:WaitForChild("HumanoidRootPart")
					local trinkets = {}

					-- Verzamel alle clickparts (dit zijn de echte pickup targets).
					for _, desc in ipairs(trinketsFolder:GetDescendants()) do
						if desc:IsA("BasePart") and desc.Name:lower() == "clickpart" then
							table.insert(trinkets, desc)
						end
					end

					if #trinkets == 0 then
						task.wait(0.5)
						continue
					end

					table.sort(trinkets, function(a, b)
						return (hrp.Position - a.Position).Magnitude < (hrp.Position - b.Position).Magnitude
					end)

					for _, part in ipairs(trinkets) do
						if not isCollecting then
							break
						end
						if not part or not part.Parent then
							continue
						end

						-- Zelfde tween-stijl als de teleports: vaste duur.
						local travelTime = 3.5
						local target = part.CFrame * CFrame.new(0, 2.5, 0)
						local tween = game:GetService("TweenService"):Create(
							hrp,
							TweenInfo.new(travelTime, Enum.EasingStyle.Linear),
							{ CFrame = target }
						)
						tween:Play()
						tween.Completed:Wait()

						-- Probeer de ClickDetector te activeren als de functie beschikbaar is.
						local cd = part:FindFirstChildOfClass("ClickDetector")
						if cd and fireclickdetector then
							fireclickdetector(cd)
						elseif cd and not warnedClickDetectorMissing then
							warnedClickDetectorMissing = true
							warn("fireclickdetector is not available in this environment.")
						end

						task.wait(0.15)
					end
				end
			end)
		else
			buttons.collectTrinkets.Text = "Collect Trinkets: OFF"
			buttons.collectTrinkets.BackgroundColor3 = Color3.fromRGB(52, 54, 62)
			noClipEnabled = false
		end
	end)
else
	warn("Trinkets folder not found in Workspace.")
end
