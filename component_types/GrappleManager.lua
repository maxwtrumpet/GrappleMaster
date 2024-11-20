-- The component for the Grapple actor.

GrappleManager = {

    -- The grapple target, return status, and the actor it's possibly attached to.
    target = Vector2(0,0),
    returning = false,
    attached = nil,

    -- On Start function:
    -- Get Ridibody component and player actor, confirming it exists.
    -- Get player Rigidbody and set own position to player's position.
    -- Get direction to target unit vector and use it to set velocity.
    OnStart = function(self)

        self.rb = self.actor:GetComponent("Rigidbody")
        self.player = Actor.Find("Player")
        if self.player == nil then
            Actor.Destroy(self.actor)
            return
        end -- PLAYER DOES NOT EXIST

        self.player_rb = self.player:GetComponent("Rigidbody")
        local init_pos = self.player_rb:GetPosition()
        self.rb:SetPosition(init_pos)

        local direction = Vector2(self.target.x - init_pos.x, self.target.y - init_pos.y)
        direction:Normalize()
        self.rb:SetVelocity(direction * 7.5)

    end, -- ON START

    -- On Update funtion:
    -- Get current position.
    -- If not already returning and within 0.1 of the target with attachhing, return.
    -- If returning, destroy self if close enough to player or update velocity if not.
    OnUpdate = function(self)

        local cur_pos = self.rb:GetPosition()
        if self.returning == false then
            local distance = Vector2(self.target.x - cur_pos.x, self.target.y - cur_pos.y)
            if distance:Length() < 0.1 and self.attached == nil then
                self.returning = true
            end -- CLOSE TO TARGET AND NOT ATTACHED
        end -- NOT ALREADY RETURNING

        if self.returning == true then
            local player_pos = self.player_rb:GetPosition()
            local to_player = Vector2(player_pos.x - cur_pos.x, player_pos.y - cur_pos.y)
            if to_player:Length() < 0.6 then
                Actor.Destroy(self.actor)
            else
                to_player:Normalize()
                self.rb:SetVelocity(to_player * 7.5)
            end -- DISTANCE TO PLAYER CHECK
        end -- RETURNING

    end, -- ON UPDATE

    -- On Late Update function:
    -- If player is dead, destroy self.
    -- Otherwise, if atatched, update player velocity and destroy self if block broke.
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
            end -- BLOCK BROKE
        end -- ATTACHED OR PLAYER DEAD

    end, -- ON LATE UPDATE

    -- Attach to actor function.
    Attach = function(self, actor)

        -- Set atatched actor/velocity to zero and confirm player exists.
        self.attached = actor
        self.rb:SetVelocity(Vector2(0,0))
        local player = Actor.Find("Player")
        if player ~= nil then

            -- Get player Rigidbody. If it was climbing:
            -- Reset its gravity scale.
            -- Reset its sprite and hitboxes based on player type.
            local player_rb = player:GetComponent("Rigidbody")
            if player_rb:GetGravityScale() == 0 then

                player_rb:SetGravityScale(1)

                if Actor.Find("StaticData"):GetComponent("StaticData").player_type == "Circle" then
                    player:GetComponent("SpriteRenderer").sprite = "Player_circle"
                    player_rb:SetColliderRadius(0.5)
                    player_rb:SetTriggerRadius(0.5)
                else
                    player:GetComponent("SpriteRenderer").sprite = "player"
                    player_rb:SetColliderDimensions(Vector2(1,1))
                    player_rb:SetTriggerDimensions(Vector2(1,1))
                end -- PLAYER TYPE

            end -- PLAYER WAS CLIMBING

        end -- PLAYER EXISTS

    end, -- ATTACH

    -- On Trigger Enter function:
    OnTriggerEnter = function(self, contact)

        -- Confirm the grapple is not already attached to something nor returning.
        if self.attached == nil and self.returning == false then

            --  If triggered by non-broken block:
            -- If grappleable run attach and grapple functions.
            -- If Fragile or Brittle blocks break immediately.
            -- Otherwise return the grapple.
            local other = contact.other:GetComponent("Block")
            if other ~= nil and other.reset_frame == -1 then

                if other.grappleable ~= -1 then
                    self:Attach(other)
                    other:Grapple()

                elseif contact.other:GetName() == "Brittle" or contact.other:GetName() == "Fragile" then
                    other:Break(Application.GetFrame())
                else

                    self.returning = true
                end -- BLOCK STATUS

            -- Otherwise, check if triggered by pie piece and attach if so.
            else
                local pie = contact.other:GetComponent("PieCollect")
                if pie ~= nil then
                    self:Attach(pie)
                end -- ATTACHED TO PIE
            end -- ACTOR ATTACHED TO

        end -- NOT ALREADY ATTACHED

    end -- ON TRIGGER ENTER

} -- GRAPPLE MANAGER