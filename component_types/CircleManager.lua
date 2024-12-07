-- The component for handling circle player controls.

CircleManager = {

    -- Grapple actor.
    grapple = nil,

    -- Status booleans.
    left_hold = false,
    crouched = false,

    -- On Start function:
    -- Get Static Data and Cursor.
    -- Get SpriteRenderer and Rigidbody components.
    -- Set original location and grapple status.
    -- Disable self if in the pause menu.
    OnStart = function(self)

        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        self.cursor = Actor.Find("Cursor"):GetComponent("Rigidbody")

        self.sr = self.actor:GetComponent("SpriteRenderer")
        self.rb = self.actor:GetComponent("Rigidbody")

        self.original_loc = self.rb:GetPosition()
        local ll = Actor.Find("LevelLoader"):GetComponent("LevelLoader")
        self.can_grapple = ll.current_scene > 4 or (ll.current_scene == 4 and Actor.Find("GrappleCollect") == nil)

        if Actor.Find("Pause") ~= nil then
            self.enabled = false
        end -- IN PAUSE MENU

    end, -- ON START

    -- On Update function:
    OnUpdate = function(self)

        -- If player pressed escape, load the pause menu and return early.
        if Input.IsKeyJustDown("escape") then
            self.sd:LoadPauseMenu(self)
            return
        end -- ESC DOWN

        -- If player pressed enter, reset the scene and return early.
        if Input.IsKeyJustDown("enter") then
            Scene.Load("level" .. tostring(Actor.Find("LevelLoader"):GetComponent("LevelLoader").current_scene))
            return
        end -- ENTER DOWN

        -- Initialize grapple actor and Rigidbody properties.
        self.grapple = Actor.Find("Grapple")
        local velocity = self.rb:GetVelocity()
        local position = self.rb:GetPosition()
        local cur_grav = self.rb:GetGravityScale()

        -- If currently grappling to a block:
        -- If player had jump input, just destroy the grapple.
        -- If player can grapple and mouse was clicked, re-grapple.
        if self.grapple ~= nil and self.gm.attached then

            if Input.IsKeyJustDown("space") or Input.IsMouseJustDown("right") then
                Actor.Destroy(self.grapple)
            
            elseif self.can_grapple and (Input.IsMouseJustDown("left")) then
                Actor.Destroy(self.grapple)
                self:Grapple()
            end -- CHANGE GRAPPLE STATUS CHECK

        -- Otherwise, if climbing:
        elseif cur_grav == 0 then

            -- Set the raycast direction, pressed key, and offset based on hold direction.
            local direction = self.sd.left
            local key = "a"
            local offset = 0.125
            if self.left_hold == false then
                direction = self.sd.right
                key = "d"
                offset = -0.125
            end -- RIGHT HOLD

            -- Raycast twice equidistant from the player center.
            position.y = position.y - 0.15
            local top_hit = Physics.Raycast(position, direction, .55)
            position.y = position.y + 0.3
            local bottom_hit = Physics.Raycast(position, direction, .55)
            position.y = position.y - 0.15

            -- If either is a hit, attempt to get its block component.
            if top_hit ~= nil then
                top_hit = top_hit.actor:GetComponent("Block")
            end -- TOP HAD HIT
            if bottom_hit ~= nil then
                bottom_hit = bottom_hit.actor:GetComponent("Block")
            end -- BOTTOM HAD HIT

            -- If key is down and either hit is a climbable block:
            -- Set the velocity to 0.
            -- Run the climb function on what blocks are being climbed.
            if (Input.IsKeyDown(key)) and ((top_hit ~= nil and top_hit.climbable ~= -1) or (bottom_hit ~= nil and bottom_hit.climbable ~= -1)) then

                velocity = Vector2(0,0)

                if top_hit ~= nil then
                    top_hit:Climb()
                end -- TOP HAD HIT
                if bottom_hit ~= nil then
                    bottom_hit:Climb()
                end -- BOTTOM HAD HIT

            -- Otherwise, reset gravity/sprite/hitboxes and adjust position.
            else
                self.rb:SetGravityScale(1)
                cur_grav = 1
                self.sr.sprite = "Player_circle"
                self.rb:SetColliderRadius(0.5)
                self.rb:SetTriggerRadius(0.5)
                position.x = position.x + offset
            end -- CURRENT CLIMB STATUS

        -- Otherwise, if either a or d is pressed:
        else
            if Input.IsKeyDown("a") or Input.IsKeyDown("d") then

                -- Set the raycast direction and offset based on pressed direction.
                local direction = self.sd.left
                local offset = -0.1
                if Input.IsKeyDown("d") then
                    direction = self.sd.right
                    offset = 0.1
                end -- RIGHT PRESS

                -- Raycast twice equidistant from the player center.
                -- The raycast length is dependent on if the player is crouching.
                local top_hit = nil
                local bottom_hit = nil
                if self.crouched then
                    position.y = position.y - 0.15
                    top_hit = Physics.Raycast(position, direction, .435)
                    position.y = position.y + 0.3
                    bottom_hit = Physics.Raycast(position, direction, .435)
                    position.y = position.y - 0.15
                else
                    position.y = position.y - 0.15
                    top_hit = Physics.Raycast(position, direction, .55)
                    position.y = position.y + 0.3
                    bottom_hit = Physics.Raycast(position, direction, .55)
                    position.y = position.y - 0.15
                end -- CROUCH STATUS

                -- If either is a hit, attempt to get its block component.
                if top_hit ~= nil then
                    top_hit = top_hit.actor:GetComponent("Block")
                end -- TOP HAD HIT
                if bottom_hit ~= nil then
                    bottom_hit = bottom_hit.actor:GetComponent("Block")
                end -- BOTTOM HAD HIT

                -- If both blocks are kill blocks or don't exist, give the player velocity in the direction pressed.
                if (top_hit == nil or top_hit.actor:GetName() == "Kill") and (bottom_hit == nil or bottom_hit.actor:GetName() == "Kill") then
                    velocity.x = offset * 55

                -- Otherwise:
                else

                    -- Set the x velocity to zero.
                    velocity.x = 0

                    -- If either hit is a climbable block:
                    -- Set the y velocity, round the x position, and gravity scale to 0.
                    -- Update the sprite and hitboxes.
                    -- Determine which direction the hold was in climb the blocks.
                    if (top_hit ~= nil and top_hit.climbable ~= -1) or (bottom_hit ~= nil and bottom_hit.climbable ~= -1) then

                        velocity.y = 0
                        position.x = math.floor(position.x*2+0.5)/2+offset
                        self.rb:SetGravityScale(0)
                        cur_grav = 0

                        self.sr.sprite = "Player_circle_squished"
                        self.rb:SetColliderRadius(0.375)
                        self.rb:SetTriggerRadius(0.375)

                        self.left_hold = (offset == -0.1)
                        if top_hit ~= nil then
                            top_hit:Climb()
                        end -- TOP HAD HIT
                        if bottom_hit ~= nil then
                            bottom_hit:Climb()
                        end -- BOTTOM HAD HIT

                    end -- INITIATE CLIMB

                end -- RAYCAST RESULTS

            end -- A OR D PRESSED

        end  -- GRAPPLE/CLIMB STATUS

        -- If current climbing and either w or s is pressed:
        -- Move the player in that direction.
        -- Rotate the player based on the climb direction.
        if cur_grav == 0 then
            if Input.IsKeyDown("w") then

                velocity.y = 6.5

                if self.left_hold then
                    self.rb:SetRotation(self.rb:GetRotation() - 5)
                else
                    self.rb:SetRotation(self.rb:GetRotation() + 5)
                end -- DIRECTION CHECK

            elseif Input.IsKeyDown("s") then

                velocity.y = -6.5

                if self.left_hold then
                    self.rb:SetRotation(self.rb:GetRotation() + 5)
                else
                    self.rb:SetRotation(self.rb:GetRotation() - 5)
                end -- DIRECTION CHECK

            end -- W OR S PRESSED

        -- Otherwise:
        else

            -- If player swaps crouching statuses:
            -- Update the sprite and hitboxes.
            -- Update the density and position.
            -- Update the crocuhing variable.
            if self.crouched == false and (Input.IsKeyDown("s")) then

                self.sr.sprite = "Player_circle_squished"
                self.rb:SetColliderRadius(0.375)
                self.rb:SetTriggerRadius(0.375)

                self.rb:SetDensity(2.263536968418068)
                position.y = position.y - 0.125

                self.crouched = true

            elseif self.crouched and Input.IsKeyDown("s") == false then

                self.sr.sprite = "Player_circle"
                self.rb:SetColliderRadius(0.5)
                self.rb:SetTriggerRadius(0.5)

                self.rb:SetDensity(1.273239544735163)
                position.y = position.y + 0.125

                self.crouched = false

            end -- CROUCH STATUS SWAPS

            -- Raycast twice equidistant from the player center.
            position.x = position.x + 0.15
            local right_hit = Physics.RaycastAll(position, self.sd.down, .555)
            position.x = position.x - 0.3
            local left_hit = Physics.RaycastAll(position, self.sd.down, .555)
            position.x = position.x + 0.15

            -- Loop through all raycast hits, and a single valid one is found, note it.
            local valid = false
            for index, value in ipairs(right_hit) do
                if value ~= nil and value.actor:GetName() ~= "Checkpoint" and value.actor:GetName() ~= "Grapple" and value.actor:GetName() ~= "Cursor" and value.actor:GetName() ~= "Player" then
                    valid = true
                    break
                end -- VALID FOR JUMPING
            end -- RIGHT HIT RESULTS LOOP
            if valid == false then
                for index, value in ipairs(left_hit) do
                    if value ~= nil and value.actor:GetName() ~= "Checkpoint" and value.actor:GetName() ~= "Grapple" and value.actor:GetName() ~= "Cursor" and value.actor:GetName() ~= "Player" then
                        valid = true
                        break
                    end -- VALID FOR JUMPING
                end -- LEFT HIT RESULTS LOOP
            end -- NO VALID HIT FOUND YET

            -- If a valid jumping block was hit:
            -- Confirm the player has a valid jump input.
            -- Add a vertical force and play the jump sound.
            if valid == true then

                if Input.IsKeyJustDown("space") or Input.IsMouseJustDown("right") then

                    self.rb:AddForce(Vector2(0,667))
                    Audio.PlaySound("jump.mp3", 16, false)

                end -- VALID JUMP INPUT

            -- Otherwise: 
            -- Add a drag force.
            -- If player is no longer jumping but has upward velocity, slow them down.
            else

                self.rb:AddForce(Vector2(-5*velocity.x,0))

                if Input.IsKeyDown("space") == false and Input.IsMouseDown("right") == false and velocity.y > 0 then
                    self.rb:AddForce(Vector2(0,-30))
                end -- NO LONGER JUMPING

            end -- VALID STATUS

        end -- GRAPPLE/CLIMB STATUS

        -- If player can grapple and has pressed the input to do so, grapple.
        if self.can_grapple and (Input.IsMouseJustDown("left")) and self.grapple == nil then
            self:Grapple()
        end -- VALID GRAPPLE INPUT

        -- Update teh player's velocity and position.
        self.rb:SetVelocity(velocity)
        self.rb:SetPosition(position)

    end, -- ON UPDATE

    -- The function called when a player hits the kill blocks:
    -- Queue player for respawning in the level loader and play death sound.
    Die = function(self)
        Actor.Find("LevelLoader"):GetComponent("LevelLoader"):Respawn(self.original_loc, "Player_Circle")
        Audio.PlaySound("death.mp3", 4, false)
    end, -- DIE

    -- The function called to shoot a grapple.
    -- Update Grapple and GrappleManager variables.
    -- Set the grapple's target and play the grapple sound.
    Grapple = function (self)

        self.grapple = Actor.Instantiate("Grapple")
        self.gm = self.grapple:GetComponent("GrappleManager")

        self.gm.target = self.cursor:GetPosition()
        Audio.PlaySound("grapple.mp3", 16, false)

    end -- GRAPPLE

} -- CIRCLE MANAGER