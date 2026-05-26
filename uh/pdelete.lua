	local function getTool(backpack, toolName)
   		return backpack:FindFirstChild(toolName)
	end

	local function Delete(part, deleteRemote)
   		if deleteRemote then
       		coroutine.wrap(function()
           		deleteRemote:FireServer(part)
       		end)()
   		else
       		warn("Delete remote not found!")
   		end
	end

	for i, player in ipairs(game.Players:GetPlayers()) do
		bp = player:FindFirstChild("Backpack")
		if bp then
   			local deleteTool = getTool(bp, "Delete")
   			if deleteTool then
       			local deleteRemote = deleteTool:FindFirstChild("RemoteEvent") or deleteTool:FindFirstChild("delete")
       			if deleteRemote then
           			for _, part in ipairs(workspace:GetDescendants()) do
               			if part:IsA("BasePart") then
                   			Delete(part, deleteRemote)
               			end
           			end
                    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("h \n\n\n\n\n Server Reset. \n\n\n\n\n", "All")
       			else
           			warn("Delete remote not found in tool for player " .. player.Name)
       			end
   			else
       			warn("Delete tool not found in backpack for player " .. player.Name)
   			end
		end
	end
