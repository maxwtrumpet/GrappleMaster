CameraManager = {
	ease_factor = 0.2,
	tracking_player = false,

	OnUpdate = function(self)
		local player_actor = Actor.Find("Player")
		if player_actor == nil then
			self.tracking_player = false
			return
		
		elseif self.tracking_player == false then
			self.tracking_player = true
			local rb = player_actor:GetComponent("Rigidbody")
			local player_pos = rb:GetPosition()
			Camera.SetPosition(player_pos)
			return
		end

		local player_rb = player_actor:GetComponent("Rigidbody")
		local desired_position = player_rb:GetPosition()
		local current_position = Camera.GetPosition()

		local new_position = current_position + (desired_position - current_position) * self.ease_factor
		Camera.SetPosition(new_position)
	end
}