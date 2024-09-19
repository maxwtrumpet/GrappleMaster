CursorManager = {

    smoothing_factor = 0.25,
    restricted = true,

    OnStart = function(self)
        self.rb = self.actor:GetComponent("Rigidbody")
        self.sr = self.actor:GetComponent("SpriteRenderer")
        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        if self.sd.controller_mode then
            self.rb:SetPosition(Camera.GetPosition())
        end
        self.joystick_delta = Vector2(0,0)
        self.prev_loc = Vector2(0,0)
    end,

    OnUpdate = function(self)
        local camera_pos = Camera.GetPosition()
        if self.sd.controller_mode then
            local minor_delta = Input.GetMinorJoystickDelta()
            self.joystick_delta.x = (self.smoothing_factor * minor_delta.x) + ((1.0 - self.smoothing_factor) * self.joystick_delta.x);
            self.joystick_delta.y = (self.smoothing_factor * minor_delta.y) + ((1.0 - self.smoothing_factor) * self.joystick_delta.y);
            local current_delta = Vector2(0,0)
            if math.abs(self.joystick_delta.x) > 500 then
                current_delta.x = self.joystick_delta.x * math.abs(self.joystick_delta.x) / 500000000
            end
            if math.abs(self.joystick_delta.y) > 500 then
                current_delta.y = self.joystick_delta.y * math.abs(self.joystick_delta.y) / 500000000
            end
            if current_delta.x ~= 0 or current_delta.y ~= 0 then
                local new_position = Vector2(self.prev_loc.x + current_delta.x, self.prev_loc.y + current_delta.y)
                if self.restricted and new_position:Length() > 5 then
                    new_position:Normalize()
                    new_position.x = new_position.x * 5
                    new_position.y = new_position.y * 5
                end
                self.prev_loc = Vector2(new_position.x, new_position.y)
            end
            self.rb:SetPosition(Vector2(self.prev_loc.x + camera_pos.x, self.prev_loc.y + camera_pos.y))
        else
            local position = Input.GetMousePosition()
            local distance = Vector2(position.x - camera_pos.x, position.y - camera_pos.y)
            if self.restricted and distance:Length() > 5 then
                distance:Normalize()
                position = Vector2(camera_pos.x + distance.x * 5, camera_pos.y + distance.y * 5)
                if self.sr.enabled then
                    Input.SetMousePosition(position)
                end
            end
            self.rb:SetPosition(position)
        end
    end
}