-- The component for moving the camera.

CameraManager = {

	-- Ease factor and whether or not the player is being tracked.
	EASE_FACTOR = 0.2,
	tracking_player = false,

	-- On Update function:
	-- If player no longer exists, mark the variable and do nothing.
	-- If the player just respawned, mark the variable and move the camera to the player.
	-- Otherwise, set the camera's position based on the new player position and ease factor.
	OnUpdate = function(self)

		local player_actor = Actor.Find("Player")
		if player_actor == nil then
			self.tracking_player = false

		elseif self.tracking_player == false then
			self.tracking_player = true
			Camera.SetPosition(player_actor:GetComponent("Rigidbody"):GetPosition())

		else
			local desired_position = player_actor:GetComponent("Rigidbody"):GetPosition()
			local current_position = Camera.GetPosition()
			local new_position = current_position + (desired_position - current_position) * self.EASE_FACTOR
			Camera.SetPosition(new_position)
		end -- PLAYER STATUS

	end -- ON UPDATE

} -- CAMERA MANAGER