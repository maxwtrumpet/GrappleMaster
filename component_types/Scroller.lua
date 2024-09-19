Scroller = {

    cleared = false,

    OnStart = function(self)
        self.rb = self.actor:GetComponent("Rigidbody")
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
            self.player_prev_pos = self.player:GetComponent("Rigidbody"):GetPosition()
            local cur_pos = self.rb:GetPosition()
            self.rb:SetPosition(Vector2(cur_pos.x + self.player_prev_pos.x/2, cur_pos.y + self.player_prev_pos.y/2))
        end
    end,

    OnUpdate = function(self)
        if self.auto then
            self.position = self.rb:GetPosition()
            if self.cleared == false then
                if self.position.x - self.cam_pos.x > 0 then
                    self.new_screen = Actor.Instantiate("Background"):GetComponent("Rigidbody")
                    self.new_screen:SetPosition(Vector2(self.position.x - 16, self.position.y))
                    self.cleared = true
                end
            elseif self.position.x - self.cam_pos.x > 16 then
                Actor.Destroy(self.actor)
            end
        else
            self.player = Actor.Find("Player")
            if self.player ~= nil then
                local player_cur_pos = self.player:GetComponent("Rigidbody"):GetPosition()
                local position_dif = Vector2((player_cur_pos.x - self.player_prev_pos.x)/2, (player_cur_pos.y - self.player_prev_pos.y)/2)
                local cur_pos = self.rb:GetPosition()
                self.rb:SetPosition(Vector2(cur_pos.x + position_dif.x,cur_pos.y + position_dif.y))
                self.player_prev_pos = player_cur_pos
            end
        end
    end

}