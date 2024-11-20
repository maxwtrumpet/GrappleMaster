-- The component for loading the level.

LevelLoader = {

	-- The blocks in the respawn queue and the current scene.
	respawn_blocks = {},
	current_scene = 0,

	-- On Start function:
	OnStart = function(self)

		-- Get static data.
		local sd = Actor.Find("StaticData"):GetComponent("StaticData")

		-- For every block to be spawned in this scene:
		for block_type, loc_list in pairs(sd.stage_layout[self.current_scene + 1]) do
			for index, location in ipairs(loc_list) do

				-- Instantiate the block and set its position.
				local block = Actor.Instantiate(block_type)
				local block_rb = block:GetComponent("Rigidbody")
				block_rb:SetPosition(location)

				-- If this is a pie piece, rotate it based on the scene number,
				if block_type == "Pie" or block_type == "Secret" then
					block_rb:SetRotation(30*(self.current_scene))
				end -- PIE PIECE

				-- If this is a checkpoint:
				-- Set its internal number.
				-- If this is the level 10 secret, hide it and add the relevant component.
				-- If the player is starting after this checkpoint, disable it.
				if block_type == "Checkpoint" then

					local b_c = block:GetComponent("Checkpoint")
					b_c.number = index

					if self.current_scene == 10 and index == 4 then
						block:GetComponent("SpriteRenderer").sprite = "hidden"
						block:AddComponent("Level10Secret")
					end -- LEVEL 10 SECRET

					if index < sd.level_layout[self.current_scene + 1]["location"] then
						b_c.enabled = false
						block:GetComponent("SpriteRenderer").sprite = "respawn"
					end -- ALREADY PASSED

				end -- CHECKPOINT BLOCK

			end -- BLOCK LOCATION LOOP
		end -- BLOCK TYPE LOOP

		-- Instantiate all background actors.
		for index, value in ipairs(sd.background_layout[self.current_scene + 1]) do
			Actor.Instantiate("Background"):GetComponent("Rigidbody"):SetPosition(Vector2(value.x * 16, value.y * 9))
		end -- BACKGROUND LOOP

		-- Instantiate the player with the correct type and set its initial position.
		Actor.Instantiate("Player_" .. sd.player_type):GetComponent("Rigidbody"):SetPosition(sd.stage_layout[self.current_scene + 1]["Checkpoint"][sd.level_layout[self.current_scene + 1]["location"]])

		-- Update the music accordingly based on the scene number.
		if self.current_scene ~= 4 then
			sd:UpdateMusic(self.current_scene)
		else
			sd:UpdateMusic(self.current_scene-1)
		end -- SCENE NUMBER

	end,

	-- On Uodate function.
	-- Respawn every block queued on this frame.
	-- Remove every block that was respawned from the queue.
	OnUpdate = function(self)

		local to_remove = {}
		for i, v in ipairs(self.respawn_blocks) do
			if Application.GetFrame() >= v[1] then
				if (v[3] ~= "Player_Square" and v[3] ~= "Player_Circle") or Actor.Find("Player") == nil then
					Actor.Instantiate(v[3]):GetComponent("Rigidbody"):SetPosition(v[2])
				end -- PLAYER RESPAWN
				table.insert(to_remove, i)
			end -- VALID RESPAWN
		end -- RESPAWN LOOP

		for i = #to_remove, 1, -1 do
			table.remove(self.respawn_blocks, to_remove[i])
		end -- REMOVE LOOP

	end, -- ON UPDATE

	-- Respawn function:
	-- Adjust respawn time to 1 (player) or 2 (blocks) seconds .
	-- Insert the block into the respawn queue.
	Respawn = function(self, position, block_type)

		local delay = 120
		if block_type == "Player_Square" or block_type == "Player_Circle" then
			delay = 60
		end -- PLAYER RESPAWN

		table.insert(self.respawn_blocks, {Application.GetFrame() + delay, position, block_type})

	end -- RESPAWN

} -- LEVEL LAODER