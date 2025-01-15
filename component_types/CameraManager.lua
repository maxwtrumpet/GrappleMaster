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
			local pos = player_actor:GetComponent("Rigidbody2D"):GetPosition()
			Camera.SetPosition(Vector3(pos.x, pos.y, 0))
			Camera.SetDirection(Vector3(pos.x, pos.y, -1))

		else
			local desired_position = player_actor:GetComponent("Rigidbody2D"):GetPosition()
			local current_position = Camera.GetPosition()
			local new_position = Vector2(current_position.x + (desired_position.x - current_position.x) * self.EASE_FACTOR,
										 current_position.y + (desired_position.y - current_position.y) * self.EASE_FACTOR)
			Camera.SetPosition(Vector3(new_position.x, new_position.y, 0))
			Camera.SetDirection(Vector3(new_position.x, new_position.y, -1))
		end -- PLAYER STATUS

	end -- ON UPDATE

} -- CAMERA MANAGER