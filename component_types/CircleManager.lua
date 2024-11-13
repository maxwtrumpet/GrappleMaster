CircleManager = {

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
        self.cursor = Actor.Find("Cursor"):GetComponent("Rigidbody")
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
            if Input.IsKeyJustDown("space") or Input.IsMouseJustDown("right") then
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
                position.y = position.y - 0.15
                local top_hit = Physics.Raycast(position, self.left, .55)
                position.y = position.y + 0.3
                local bottom_hit = Physics.Raycast(position, self.left, .55)
                position.y = position.y - 0.15
                if top_hit ~= nil then
                    top_hit = top_hit.actor:GetComponent("Block")
                end
                if bottom_hit ~= nil then
                    bottom_hit = bottom_hit.actor:GetComponent("Block")
                end
                if (Input.IsKeyDown("a")) and ((top_hit ~= nil and top_hit.climbable ~= -1) or (bottom_hit ~= nil and bottom_hit.climbable ~= -1)) then
                    velocity.x = 0
                    velocity.y = 0
                    if top_hit ~= nil then
                        top_hit:Climb()
                    end
                    if bottom_hit ~= nil then
                        bottom_hit:Climb()
                    end
                else
                    self.rb:SetGravityScale(1)
                    self.sr.sprite = "Player_circle"
                    self.rb:AddForce(Vector2(0,1))
                    self.rb:SetColliderRadius(0.5)
                    self.rb:SetTriggerRadius(0.5)
                    position.x = position.x + 0.125
                    cur_grav = 1
                end
            elseif self.left_hold == false then
                position.y = position.y - 0.15
                local top_hit = Physics.Raycast(position, self.right, .55)
                position.y = position.y + 0.3
                local bottom_hit = Physics.Raycast(position, self.right, .55)
                position.y = position.y - 0.15
                if top_hit ~= nil then
                    top_hit = top_hit.actor:GetComponent("Block")
                end
                if bottom_hit ~= nil then
                    bottom_hit = bottom_hit.actor:GetComponent("Block")
                end
                if (Input.IsKeyDown("d")) and ((top_hit ~= nil and top_hit.climbable ~= -1) or (bottom_hit ~= nil and bottom_hit.climbable ~= -1)) then
                    velocity.x = 0
                    velocity.y = 0
                    if top_hit ~= nil then
                        top_hit:Climb()
                    end
                    if bottom_hit ~= nil then
                        bottom_hit:Climb()
                    end
                else
                    self.rb:SetGravityScale(1)
                    self.sr.sprite = "Player_circle"
                    self.rb:AddForce(Vector2(0,1))
                    self.rb:SetColliderRadius(0.5)
                    self.rb:SetTriggerRadius(0.5)
                    position.x = position.x - 0.125
                    cur_grav = 1
                end
            end
        else
            if Input.IsKeyDown("d") then
                local top_hit = nil
                local bottom_hit = nil
                if self.crouched then
                    position.y = position.y - 0.15
                    top_hit = Physics.Raycast(position, self.right, .435)
                    position.y = position.y + 0.3
                    bottom_hit = Physics.Raycast(position, self.right, .435)
                    position.y = position.y - 0.15
                else
                    position.y = position.y - 0.15
                    top_hit = Physics.Raycast(position, self.right, .55)
                    position.y = position.y + 0.3
                    bottom_hit = Physics.Raycast(position, self.right, .55)
                    position.y = position.y - 0.15
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
                        self.sr.sprite = "Player_circle_squished"
                        cur_grav = 0
                        self.left_hold = false
                        self.rb:SetColliderRadius(0.375)
                        self.rb:SetTriggerRadius(0.375)
                        position.x = position.x + 0.125
                        if top_hit ~= nil then
                            top_hit:Climb()
                        end
                        if bottom_hit ~= nil then
                            bottom_hit:Climb()
                        end
                    end
                end
            elseif Input.IsKeyDown("a") then
                local top_hit = nil
                local bottom_hit = nil
                if self.crouched then
                    position.y = position.y - 0.15
                    top_hit = Physics.Raycast(position, self.left, .435)
                    position.y = position.y + 0.3
                    bottom_hit = Physics.Raycast(position, self.left, .435)
                    position.y = position.y - 0.15
                else
                    position.y = position.y - 0.15
                    top_hit = Physics.Raycast(position, self.left, .55)
                    position.y = position.y + 0.3
                    bottom_hit = Physics.Raycast(position, self.left, .55)
                    position.y = position.y - 0.15
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
                        self.sr.sprite = "Player_circle_squished"
                        cur_grav = 0
                        self.left_hold = true
                        self.rb:SetColliderRadius(0.375)
                        self.rb:SetTriggerRadius(0.375)
                        position.x = position.x - 0.125
                        if top_hit ~= nil then
                            top_hit:Climb()
                        end
                        if bottom_hit ~= nil then
                            bottom_hit:Climb()
                        end
                    end
                end
            end
        end
        if cur_grav == 0 then
            if Input.IsKeyDown("w") then
                velocity.y = -6.5
                if self.left_hold then
                    self.rb:SetRotation(self.rb:GetRotation() - 5)
                else
                    self.rb:SetRotation(self.rb:GetRotation() + 5)
                end
            elseif Input.IsKeyDown("s") then
                velocity.y = 6.5
                if self.left_hold then
                    self.rb:SetRotation(self.rb:GetRotation() + 5)
                else
                    self.rb:SetRotation(self.rb:GetRotation() - 5)
                end
            end
        else
            if self.crouched == false and (Input.IsKeyDown("s")) then
                self.sr.sprite = "Player_circle_squished"
                self.rb:SetColliderRadius(0.375)
                self.rb:SetTriggerRadius(0.375)
                self.rb:SetDensity(2.263536968418068)
                position.y = position.y + 0.125
                self.crouched = true
            elseif self.crouched and Input.IsKeyDown("s") == false then
                self.sr.sprite = "Player_circle"
                self.rb:SetColliderRadius(0.5)
                self.rb:SetTriggerRadius(0.5)
                self.rb:SetDensity(1.273239544735163)
                position.y = position.y - 0.125
                self.crouched = false
            end
            position.x = position.x + 0.15
            local right_hit = Physics.RaycastAll(position, self.down, .555)
            position.x = position.x - 0.3
            local left_hit = Physics.RaycastAll(position, self.down, .555)
            position.x = position.x + 0.15
            local valid = false
            for index, value in ipairs(right_hit) do
                if value ~= nil and value.actor:GetName() ~= "Checkpoint" and value.actor:GetName() ~= "Grapple" and value.actor:GetName() ~= "Cursor" and value.actor:GetName() ~= "Player" then
                    valid = true
                    break
                end
            end
            if valid == false then
                for index, value in ipairs(left_hit) do
                    if value ~= nil and value.actor:GetName() ~= "Checkpoint" and value.actor:GetName() ~= "Grapple" and value.actor:GetName() ~= "Cursor" and value.actor:GetName() ~= "Player" then
                        valid = true
                        break
                    end
                end
            end
            if valid == true then
                if Input.IsKeyJustDown("space") or Input.IsMouseJustDown("right") then
                    self.rb:AddForce(Vector2(0,-667))
                    if self.sd.mute_mode == false then
                        Audio.PlaySound("jump.mp3", 16, false)
                    end
                end
            else
                self.rb:AddForce(Vector2(-5*velocity.x,0))
                if Input.IsKeyDown("space") == false and Input.IsMouseDown("right") == false and velocity.y < 0 then
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
        ll:Respawn(self.original_loc, "Player_circle")
    end

}