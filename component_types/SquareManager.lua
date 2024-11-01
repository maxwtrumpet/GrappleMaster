SquareManager = {

    grapple = nil,
    down = Vector2(0,1),
    left = Vector2(-1,0),
    right = Vector2(1,0),
    left_hold = false,
    crouched = false,

    OnStart = function(self)
        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        self.sr = self.actor:GetComponent("SpriteRenderer")
        self.rb = self.actor:GetComponent("Rigidbody")
        self.original_loc = self.rb:GetPosition()
        local ll = Actor.Find("LevelLoader"):GetComponent("LevelLoader")
        self.can_grapple = ll.current_scene > 4 or (ll.current_scene == 4 and Actor.Find("GrappleCollect") == nil)
        if ll.current_scene > 3 then
            self.cursor = Actor.Find("Cursor"):GetComponent("Rigidbody")
        end
    end,

    LoadPauseMenu = function (self)
        Actor.Instantiate("Backdrop")
        local cursor = Actor.Find("Cursor")
        if cursor == nil then
            cursor = Actor.Instantiate("Cursor")
        elseif cursor:GetComponent("SpriteRenderer").enabled == false then
            cursor:GetComponent("SpriteRenderer").enabled = true
        end
        cursor:GetComponent("CursorManager").restricted = false
        Actor.Instantiate("Pause")
        Actor.Instantiate("ButtonResume")
        Actor.Instantiate("ButtonMenu")
        self.enabled = false
    end,

    OnUpdate = function(self)
        if Input.IsKeyJustDown("escape") then
            self:LoadPauseMenu()
            return
        end
        if Input.IsKeyJustDown("enter") then
            Scene.Load("level" .. tostring(Actor.Find("LevelLoader"):GetComponent("LevelLoader").current_scene))
            return
        end
        self.grapple = Actor.Find("Grapple")
        local velocity = self.rb:GetVelocity()
        local position = self.rb:GetPosition()
        local cur_grav = self.rb:GetGravityScale()
        if self.grapple ~= nil and self.gm.attached then
            if Input.IsKeyJustDown("space") then
                Actor.Destroy(self.grapple)
            elseif self.can_grapple and (Input.IsMouseJustDown("left")) then
                Actor.Destroy(self.grapple)
                self.grapple = Actor.Instantiate("Grapple")
                self.gm = self.grapple:GetComponent("GrappleManager")
                self.gm:SetTarget(self.cursor:GetPosition())
                if self.sd.mute_mode == false then
                    Audio.PlaySound("grapple.mp3", 16, false)
                end
            end
        elseif cur_grav == 0 then
            if self.left_hold == true then
                position.y = position.y - 0.5
                local top_hit = Physics.Raycast(position, self.left, .55)
                position.y = position.y + 1
                local bottom_hit = Physics.Raycast(position, self.left, .55)
                position.y = position.y - 0.5
                if top_hit ~= nil then
                    top_hit = top_hit.actor:GetComponent("Block")
                end
                if bottom_hit ~= nil then
                    bottom_hit = bottom_hit.actor:GetComponent("Block")
                end
                if (Input.IsKeyDown("a")) and ((top_hit ~= nil and top_hit.climbable ~= -1) or (bottom_hit ~= nil and bottom_hit.climbable ~= -1)) then
                    velocity.y = 0
                    if top_hit ~= nil then
                        top_hit:Climb()
                    end
                    if bottom_hit ~= nil then
                        bottom_hit:Climb()
                    end
                else
                    self.rb:SetGravityScale(1)
                    self.sr.sprite = "player"
                    self.rb:AddForce(Vector2(0,1))
                    self.rb:SetColliderDimensions(Vector2(1,1))
                    self.rb:SetTriggerDimensions(Vector2(1,1))
                    cur_grav = 1
                end
            elseif self.left_hold == false then
                position.y = position.y - 0.5
                local top_hit = Physics.Raycast(position, self.right, .55)
                position.y = position.y + 1
                local bottom_hit = Physics.Raycast(position, self.right, .55)
                position.y = position.y - 0.5
                if top_hit ~= nil then
                    top_hit = top_hit.actor:GetComponent("Block")
                end
                if bottom_hit ~= nil then
                    bottom_hit = bottom_hit.actor:GetComponent("Block")
                end
                if (Input.IsKeyDown("d")) and ((top_hit ~= nil and top_hit.climbable ~= -1) or (bottom_hit ~= nil and bottom_hit.climbable ~= -1)) then
                    velocity.y = 0
                    if top_hit ~= nil then
                        top_hit:Climb()
                    end
                    if bottom_hit ~= nil then
                        bottom_hit:Climb()
                    end
                else
                    self.rb:SetGravityScale(1)
                    self.sr.sprite = "player"
                    self.rb:AddForce(Vector2(0,1))
                    self.rb:SetColliderDimensions(Vector2(1,1))
                    self.rb:SetTriggerDimensions(Vector2(1,1))
                    cur_grav = 1
                end
            end
        else
            if Input.IsKeyDown("d") then
                local top_hit = nil
                local bottom_hit = nil
                if self.crouched then
                    position.y = position.y - 0.375
                    top_hit = Physics.Raycast(position, self.right, .55)
                    position.y = position.y + .75
                    bottom_hit = Physics.Raycast(position, self.right, .55)
                    position.y = position.y - 0.375
                else
                    position.y = position.y - 0.5
                    top_hit = Physics.Raycast(position, self.right, .55)
                    position.y = position.y + 1
                    bottom_hit = Physics.Raycast(position, self.right, .55)
                    position.y = position.y - 0.5
                end
                if top_hit ~= nil then
                    top_hit = top_hit.actor:GetComponent("Block")
                end
                if bottom_hit ~= nil then
                    bottom_hit = bottom_hit.actor:GetComponent("Block")
                end
                if (top_hit == nil or top_hit.actor:GetName() == "Kill") and (bottom_hit == nil or bottom_hit.actor:GetName() == "Kill") then
                    velocity.x = 5.5
                else
                    velocity.x = 0
                    if (top_hit ~= nil and top_hit.climbable ~= -1) or (bottom_hit ~= nil and bottom_hit.climbable ~= -1) then
                        velocity.y = 0
                        self.rb:SetGravityScale(0)
                        self.sr.sprite = "squished_right"
                        cur_grav = 0
                        self.left_hold = false
                        self.rb:SetColliderDimensions(Vector2(0.75,1))
                        self.rb:SetTriggerDimensions(Vector2(0.75,1))
                        if top_hit ~= nil then
                            top_hit:Climb()
                        end
                        if bottom_hit ~= nil then
                            bottom_hit:Climb()
                        end
                    elseif velocity.y < 0 then
                        velocity.y = 0
                    end
                end
            elseif Input.IsKeyDown("a") then
                local top_hit = nil
                local bottom_hit = nil
                if self.crouched then
                    position.y = position.y - 0.375
                    top_hit = Physics.Raycast(position, self.left, .55)
                    position.y = position.y + .75
                    bottom_hit = Physics.Raycast(position, self.left, .55)
                    position.y = position.y - 0.375
                else
                    position.y = position.y - 0.5
                    top_hit = Physics.Raycast(position, self.left, .55)
                    position.y = position.y + 1
                    bottom_hit = Physics.Raycast(position, self.left, .55)
                    position.y = position.y - 0.5
                end
                if top_hit ~= nil then
                    top_hit = top_hit.actor:GetComponent("Block")
                end
                if bottom_hit ~= nil then
                    bottom_hit = bottom_hit.actor:GetComponent("Block")
                end
                if (top_hit == nil or top_hit.actor:GetName() == "Kill") and (bottom_hit == nil or bottom_hit.actor:GetName() == "Kill") then
                    velocity.x = -5.5
                else
                    velocity.x = 0
                    if (top_hit ~= nil and top_hit.climbable ~= -1) or (bottom_hit ~= nil and bottom_hit.climbable ~= -1) then
                        velocity.y = 0
                        self.rb:SetGravityScale(0)
                        self.sr.sprite = "squished_left"
                        cur_grav = 0
                        self.left_hold = true
                        self.rb:SetColliderDimensions(Vector2(0.75,1))
                        self.rb:SetTriggerDimensions(Vector2(0.75,1))
                        if top_hit ~= nil then
                            top_hit:Climb()
                        end
                        if bottom_hit ~= nil then
                            bottom_hit:Climb()
                        end
                    elseif velocity.y < 0 then
                        velocity.y = 0
                    end
                end
            end
        end
        if cur_grav == 0 then
            if Input.IsKeyDown("w") then
                velocity.y = -5.5
            elseif Input.IsKeyDown("s") then
                velocity.y = 5.5
            end
        else
            if self.crouched == false and (Input.IsKeyDown("s")) then
                self.sr.sprite = "squished_down"
                self.rb:SetColliderDimensions(Vector2(1,0.75))
                self.rb:SetTriggerDimensions(Vector2(1,0.75))
                self.rb:SetDensity(4.0/3.0)
                position.y = position.y + 0.125
                self.crouched = true
            elseif self.crouched and Input.IsKeyDown("s") == false then
                self.sr.sprite = "player"
                self.rb:SetColliderDimensions(Vector2(1,1))
                self.rb:SetTriggerDimensions(Vector2(1,1))
                self.rb:SetDensity(1)
                position.y = position.y - 0.125
                self.crouched = false
            end
            position.x = position.x + 0.5
            local right_hit = Physics.Raycast(position, self.down, .555)
            position.x = position.x - 1
            local left_hit = Physics.Raycast(position, self.down, .555)
            position.x = position.x + 0.5
            if (left_hit ~= nil and left_hit.actor:GetName() ~= "Checkpoint" and left_hit.actor:GetName() ~= "Grapple" and left_hit.actor:GetName() ~= "Cursor" and left_hit.actor:GetName() ~= "Player") or (right_hit ~= nil and right_hit.actor:GetName() ~= "Checkpoint" and right_hit.actor:GetName() ~= "Grapple" and right_hit.actor:GetName() ~= "Cursor" and right_hit.actor:GetName() ~= "Player") then
                if Input.IsKeyJustDown("space") then
                    self.rb:AddForce(Vector2(0,-667))
                    if self.sd.mute_mode == false then
                        Audio.PlaySound("jump.mp3", 16, false)
                    end
                end
            else
                self.rb:AddForce(Vector2(-5*velocity.x,0))
                if Input.IsKeyDown("space") == false and velocity.y < 0 then
                    self.rb:AddForce(Vector2(0,30))
                end
            end
        end
        if self.can_grapple and (Input.IsMouseJustDown("left")) and self.grapple == nil then
            self.grapple = Actor.Instantiate("Grapple")
            self.gm = self.grapple:GetComponent("GrappleManager")
            self.gm:SetTarget(self.cursor:GetPosition())
            if self.sd.mute_mode == false then
                Audio.PlaySound("grapple.mp3", 16, false)
            end
        end
        self.rb:SetVelocity(velocity)
        self.rb:SetPosition(position)
    end,

    Die = function(self)
        if self.sd.mute_mode == false then
            Audio.PlaySound("death.mp3", 4, false)
        end
        local ll = Actor.Find("LevelLoader"):GetComponent("LevelLoader")
        ll:Respawn(self.original_loc, "Player_square")
    end

}