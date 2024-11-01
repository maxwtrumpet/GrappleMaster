LevelLoader = {

	respawn_blocks = {},
	current_scene = 0,

	OnStart = function(self)
		local data = Actor.Find("StaticData")
		if data == nil then
			data = Actor.Instantiate("StaticData")
		end
		data = data:GetComponent("StaticData")
		if self.current_scene > 5 then
			Application.HideCursor()
		end

		for block_type, loc_list in pairs(data.stage_layout[self.current_scene + 1]) do
			for index, location in ipairs(loc_list) do
				local block = Actor.Instantiate(block_type)
				local block_rb = block:GetComponent("Rigidbody")
				block_rb:SetPosition(location)
				if block_type == "Pie" or block_type == "Secret" then
					block_rb:SetRotation(30*(self.current_scene))
				end
				if block_type == "Checkpoint" then
					block:GetComponent("Checkpoint").number = index
				end
			end
		end
		local player = nil
		if data.circle_mode == true then
			player = Actor.Instantiate("Player_circle")
		else
			player = Actor.Instantiate("Player_square")
		end
		local player_rb = player:GetComponent("Rigidbody")
		player_rb:SetPosition(data.stage_layout[self.current_scene + 1]["Checkpoint"][data.player_progress[self.current_scene + 1]["location"]])
		local player_type = nil
		if player:GetComponent("CircleManager") == nil then
			player_type = "Square"
		else
			player_type = "Circle"
		end
		data:UpdateMusic(self.current_scene, player_type)
		for index, value in ipairs(data.background_layout[self.current_scene + 1]) do
			local bg = Actor.Instantiate("Background"):GetComponent("Rigidbody")
			bg:SetPosition(Vector2(value.x * 16, value.y * 9))
		end
		
	end,

	OnUpdate = function(self)
		local to_remove = {}
		for i, v in ipairs(self.respawn_blocks) do
			if Application.GetFrame() >= v[1] then
				local block = Actor.Instantiate(v[3])
				local block_rb = block:GetComponent("Rigidbody")
				block_rb:SetPosition(v[2])
				table.insert(to_remove, i)
			end
		end
		for i = #to_remove, 1, -1 do
			table.remove(self.respawn_blocks, to_remove[i])
		end
	end,

	Respawn = function(self, position, block_type)
		local delay = 120
		if block_type == "Player_square" or block_type == "Player_circle" then
			delay = 60
		end
		table.insert(self.respawn_blocks, {Application.GetFrame() + delay, position, block_type})
	end

}