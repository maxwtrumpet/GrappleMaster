-- Block component for all blocks in the game.

Block = {

    -- Data for the climbing and grappling staus of the block.
    climbable = -1,
    grappleable = -1,

    -- Frames to destroy/respawn the block (-1 if NA).
    death_frame = -1,
    reset_frame = -1,

    -- On Start function:
    -- Get SpriteRenderer component.
    -- Get name and position.
    -- Get Static Data & Normal/Secret Pie pieces.
    OnStart = function(self)

        self.sr = self.actor:GetComponent("SpriteRenderer")

        self.name = self.actor:GetName()
        self.position = self.actor:GetComponent("Rigidbody"):GetPosition()

        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        self.pie = Actor.Find("Pie"):GetComponent("PieCollect")
        self.secret = Actor.Find("Secret"):GetComponent("PieCollect")

    end, -- ON START

    -- Collision function.
    OnCollisionEnter = function(self, contact)

        -- If this is a kill block:
        if self.name == "Kill" then

            -- If player exists and a pie piece hasn't already been collected, kill the player.
            local player = Actor.Find("Player")
            if player ~= nil and self.pie.countdown == -1 and self.secret.countdown == -1 then
                self.sd.deaths = self.sd.deaths + 1
                player:GetComponentByKey("Manager"):Die()
                Actor.Destroy(player)
            end -- PLAYER EXISTS

        -- Otherwise, if this is a touch-sensitive block that wasn't already touched, update the death frame.
        elseif (self.name == "Dirt" or self.name == "Fragile") and self.death_frame == -1 then
            self.death_frame = Application.GetFrame() + 120
        end -- BLOCK TYPE CHECK

    end, -- ON COLLISION ENTER

    -- The break function:
    -- Destroy the Rigidbody.
    -- Update the sprite.
    -- Reset the death frame and update the reset frame.
    Break = function(self, cur_frame)

        self.actor:RemoveComponent(self.actor:GetComponent("Rigidbody"))

        self.sr.sprite = self.name .. "_broken"
        self.sr.g = 255
        self.sr.b = 255

        self.death_frame = -1
        self.reset_frame = cur_frame + 120

    end, -- BREAK

    -- On Update function.
    OnUpdate = function(self)

        -- Get frame number for later checks.
        local cur_frame = Application.GetFrame()

        -- If this block is queued to break:
        if self.death_frame ~= -1 then

            -- If the current frame exceeds the death frame, break the block.
            if self.death_frame <= cur_frame then
                self:Break(cur_frame)

            -- Otherwise, update the block color to flash red based on the frame.
            else
                local is_red = (self.death_frame - cur_frame) % 12
                if (is_red < 6) then
                    self.sr.g = 0
                    self.sr.b = 0
                else
                    self.sr.g = 255
                    self.sr.b = 255
                end -- FLASH ANIMATION
            end -- BREAK STATUS
        
        -- Otherwise, if the block is queued to reset and the current frame exceeds the reset frame:
        -- Recreate the Rigidbody component.
        -- Reset the sprite.
        -- Reset the reset frame.
        elseif self.reset_frame ~= -1 and self.reset_frame <= cur_frame then

            local rb = self.actor:AddComponent("Rigidbody")
            rb.body_type = "kinematic"
            rb.x = self.position.x
            rb.y = self.position.y

            self.sr.sprite = self.name

            self.reset_frame = -1

        end -- BREAK OR RESET
        
    end, -- ON UPDATE

    -- The climb function:
    -- If the block is temporarily climbable and is not queued to break or reset, update the death frame.
    Climb = function(self)
        if self.climbable == 0 and self.death_frame == -1 and self.reset_frame == -1 then
            self.death_frame = Application.GetFrame() + 120
        end -- VALID DEATH FRAME SET
    end, -- CLIMB

    -- The grapple function:
    -- If the block is temporarily grappleable, break it or set the death frame accordingly.
    Grapple = function(self)
        if self.grappleable == 0 then
            local cur_frame = Application.GetFrame()
            if self.death_frame ~= -1 then
                self:Break(cur_frame)
            else
                self.death_frame = cur_frame + 120
            end -- FIRST OR SECOND GRAPPLE ATTEMPT
        end -- TEMPORARILY GRAPPLEABLE
    end -- GRAPPLE

} -- BLOCK