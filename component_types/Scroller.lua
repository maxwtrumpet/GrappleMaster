-- The component for moving the background.

Scroller = {

    -- Whether or not the background has cleared the screen in auto mode.
    cleared = false,

    -- On Start function:

    OnStart = function(self)
        self.rb = self.actor:GetComponent("Rigidbody2D")
        self.player = Actor.Find("Player")
        if self.player == nil then
            self.cam_pos = Camera.GetPosition()
            self.auto = true
            local total_scrolls = Actor.FindAll("Background")
            if total_scrolls[2] == nil then
                self.rb:SetPosition(Vector2(self.cam_pos.x + 4, self.cam_pos.y))
            else
                self.rb:SetPosition(Vector2(self.rb:GetPosition().x, self.cam_pos.y))
            end
            self.rb:SetVelocity(Vector2(0.2, 0))
        else
            self.player_prev_pos = self.player:GetComponent("Rigidbody2D"):GetPosition()
            local cur_pos = self.rb:GetPosition()
            self.rb:SetPosition(Vector2(cur_pos.x + self.player_prev_pos.x/2, cur_pos.y + self.player_prev_pos.y/2))
        end
    end,

    -- On Update function:
    OnUpdate = function(self)

        -- If in auto mode:
        -- Get the current position.
        -- If not previously cleared and has now, instantiate new background and mark as cleared.
        -- Otherwise, if past the screen, destroy self.
        if self.auto then

            self.position = self.rb:GetPosition()

            if self.cleared == false then
                if self.position.x - self.cam_pos.x > 0 then
                    Actor.Instantiate("Background"):GetComponent("Rigidbody2D"):SetPosition(Vector2(self.position.x - 16, self.position.y))
                    self.cleared = true
                end -- NOW CLEARED

            elseif self.position.x - self.cam_pos.x > 16 then
                Actor.Destroy(self.actor)
            end -- POSITION STATUS

        -- Otherwise:
        -- Confirm player exists.
        -- Calculate the distance between the player's previous and current positions.
        -- Update the backgrounds position using this value.
        -- Store the current player position to the previous variable for next frame use.
        else

            self.player = Actor.Find("Player")
            if self.player ~= nil then

                local player_cur_pos = self.player:GetComponent("Rigidbody2D"):GetPosition()
                local position_dif = Vector2((player_cur_pos.x - self.player_prev_pos.x)/2, (player_cur_pos.y - self.player_prev_pos.y)/2)

                local cur_pos = self.rb:GetPosition()
                self.rb:SetPosition(Vector2(cur_pos.x + position_dif.x,cur_pos.y + position_dif.y))

                self.player_prev_pos = player_cur_pos

            end -- PLAYER EXISTS

        end -- AUTO STATUS

    end -- ON UPDATE

} -- SCROLLER