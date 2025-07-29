local module = {}

module.Load = function(plaga)
	local GiveTo = plaga

	--// CODE (DONT TOUCH!) \\-- 

	print("loading anti-lag..")

	-- Define targets to delete
	
	local targets = {
	    game:GetService("Workspace").Map.Nature,
	    game:GetService("Workspace").Map.Houses,
	    game:GetService("Workspace").Map.Buildings,
	    game:GetService("Workspace").Map.Decoration,
	    game:GetService("Workspace").Map.Roads,
	    game:GetService("Workspace").Map.Architecture.Counters,
	    game:GetService("Workspace").Map.Architecture.Lights
	}
	
	-- Delete each target if it exists
	for _, obj in ipairs(targets) do
	    if obj then
	        obj:Destroy()
	    end
	end

	wait(1)

	local RS = game:GetService("ReplicatedStorage")
	local WS = workspace
	local Network = RS:WaitForChild("OJFramework").Modules["5 | Network"].Remotes
	local Fridge = WS.programmed_holder.Cooking.Fridges.Fridge
	local FirstCall = false 

	local GetSoda = function(SodaType)
		Network.Functions.IsDoingTask:InvokeServer()
		Network.Events.FridgeItemSelected:FireServer(Fridge.Interaction)
		Network.Functions.TakeDrink:InvokeServer(Fridge, SodaType)
		if FirstCall == false then FirstCall = true
			game.Workspace.Camera.CameraType = Enum.CameraType.Scriptable
			wait(0.3)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(173.03871154785156, 66.332664489746094, -316.7889404296875)
		else
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(173.03871154785156, 66.332664489746094, -316.7889404296875)
		end
	end

	local GiveDrink = function(Peron)
		local args = {[1] = game:GetService("Players"):WaitForChild(Peron),[2] = false}
		Network:WaitForChild("Events"):WaitForChild("HandTo"):FireServer(unpack(args))
	end

	local GetAddedChild = function(model,lookingfor)
		if model:FindFirstChild("Is_Giving") then return end

		Instance.new("BoolValue",model).Name = "IsGiving"

		if model then
			model.ChildAdded:Connect(function(child)
				if child.Name == lookingfor then
					local Tool = child
					GiveDrink(GiveTo)
				end
			end)
		end
	end

	local LoopEquipTools = function()
		task.spawn(function()
			while true do
				for i,v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
					if v:IsA('Tool') and v.Name == "Cream Soda" then
						v.Parent = game.Players.LocalPlayer.Character
						wait()
					end
				end
				wait(1)
			end
		end)
	end 
	
	--/⬇/ ⬇⬇ THIS CODE LOADS FUNCTIONS AND STARTS FARM ⬇⬇ \⬇\--
	task.spawn(function()
		GetAddedChild(game.Players.LocalPlayer.Character,"Cream Soda")
		LoopEquipTools()

		task.spawn(function()
			while true do
				GetSoda("Cream Soda") wait()
			end
		end)
	end)
end

return module
