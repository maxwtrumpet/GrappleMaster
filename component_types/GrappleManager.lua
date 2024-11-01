GrappleManager = {

    target = Vector2(0,0),
    returning = false,
    attached = nil,

    OnStart = function(self)
        self.rb = self.actor:GetComponent("Rigidbody")
        self.player = Actor.Find("Player")
        if self.player == nil then
            Actor.Destroy(self.actor)
        end
        self.player_rb = self.player:GetComponent("Rigidbody")
        local init_pos = self.player_rb:GetPosition()
        self.rb:SetPosition(init_pos)
        local direction = Vector2(self.target.x - init_pos.x, self.target.y - init_pos.y)
        direction:Normalize()
        self.rb:SetVelocity(direction * 7.5)
    end,

    OnUpdate = function(self)
        local cur_pos = self.rb:GetPosition()
        if self.returning == false then
            local distance = Vector2(self.target.x - cur_pos.x, self.target.y - cur_pos.y)
            if distance:Length() < 0.1 then
                self.returning = true
            end
        end
        if self.returning == true then
            local player_pos = self.player_rb:GetPosition()
            local to_player = Vector2(player_pos.x - cur_pos.x, player_pos.y - cur_pos.y)
            if to_player:Length() < 0.6 then
                Actor.Destroy(self.actor)
            else
                to_player:Normalize()
                self.rb:SetVelocity(to_player * 7.5)
            end
        end
    end,

    OnLateUpdate = function(self)
        self.player = Actor.Find("Player")
        if self.player == nil then
            Actor.Destroy(self.actor)
        elseif self.attached ~= nil then
            local player_rb = self.player:GetComponent("Rigidbody")
            local player_pos = player_rb:GetPosition()
            local cur_pos = self.rb:GetPosition()
            local distance = Vector2(cur_pos.x - player_pos.x, cur_pos.y - player_pos.y)
            distance:Normalize()
            player_rb:SetVelocity(Vector2(distance.x * 7.5, distance.y * 7.5))
            if self.attached.countdown ~= -1 and self.attached.reset_frame ~= -1 then
                Actor.Destroy(self.actor)
            end
        end
    end,

    SetTarget = function(self, target_in)
        self.target = target_in
    end,

    Attach = function(self)
        self.rb:SetVelocity(Vector2(0,0))
        local player = Actor.Find("Player")
        if player ~= nil then
            local player_rb = player:GetComponent("Rigidbody")
            if player_rb:GetGravityScale() == 0 then
                player_rb:SetGravityScale(1)
                if player:GetComponent("SquareManager") == nil then
                    player:GetComponent("SpriteRenderer").sprite = "Player_circle"
                else
                    player:GetComponent("SpriteRenderer").sprite = "player"
                end
                player_rb:SetColliderDimensions(Vector2(1,1))
            end
        end
    end,

    OnTriggerEnter = function(self, contact)
        if self.attached == nil then
            local other = contact.other:GetComponent("Block")
            if self.returning == false and other ~= nil and other.reset_frame == -1 then
                if other.grappleable ~= other.DISABLED then
                    self.attached = other
                    self:Attach()
                    other:Grapple()
                elseif contact.other:GetName() == "Brittle" or contact.other:GetName() == "Fragile" then
                    other:Break(Application.GetFrame())
                else
                    self.returning = true
                end
            else
                local pie = contact.other:GetComponent("PieCollect")
                if pie ~= nil then
                    self.attached = pie
                    self:Attach()
                end
            end
        end
    end

}