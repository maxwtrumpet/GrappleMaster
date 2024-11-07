Block = {

    DISABLED = -1,
    TEMPORARY = 0,
    ENABLED = 1,

    climbable = -1,
    grappleable = -1,

    death_frame = -1,
    reset_frame = -1,

    OnStart = function(self)
        self.sr = self.actor:GetComponent("SpriteRenderer")
        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        self.name = self.actor:GetName()
        self.position = self.actor:GetComponent("Rigidbody"):GetPosition()
        self.pie = Actor.Find("Pie"):GetComponent("PieCollect")
        self.secret = Actor.Find("Secret"):GetComponent("PieCollect")
    end,

    OnCollisionEnter = function(self, contact)
        if self.name == "Kill" then
            local player = Actor.Find("Player")
            if player ~= nil and self.pie.countdown == -1 and self.secret.countdown == -1 then
                self.sd.deaths = self.sd.deaths + 1
                player:GetComponentByKey("Manager"):Die()
                Actor.Destroy(player)
            end
        elseif (self.name == "Dirt" or self.name == "Fragile") and self.death_frame == -1 then
            self.death_frame = Application.GetFrame() + 120
        end
    end,

    Break = function(self, cur_frame)
        self.actor:RemoveComponent(self.actor:GetComponent("Rigidbody"))
        self.sr.sprite = self.name .. "_broken"
        self.sr.g = 255
        self.sr.b = 255
        self.death_frame = -1
        self.reset_frame = cur_frame + 120
    end,

    OnUpdate = function(self)
        local cur_frame = Application.GetFrame()
        if self.death_frame ~= -1 then
            if self.death_frame <= cur_frame then
                self:Break(cur_frame)
            else
                local is_red = (self.death_frame - cur_frame) % 12
                if (is_red < 6) then
                    self.sr.g = 0
                    self.sr.b = 0
                else
                    self.sr.g = 255
                    self.sr.b = 255
                end
            end
        elseif self.reset_frame ~= -1 and self.reset_frame <= cur_frame then
            local rb = self.actor:AddComponent("Rigidbody")
            rb.body_type = "kinematic"
            rb.x = self.position.x
            rb.y = self.position.y
            self.sr.sprite = self.name
            self.reset_frame = -1
        end
    end,

    Climb = function(self)
        if self.climbable == 0 and self.death_frame == -1 and self.reset_frame == -1 then
            self.death_frame = Application.GetFrame() + 120
        end
    end,

    Grapple = function(self)
        if self.grappleable == self.TEMPORARY then
            local cur_frame = Application.GetFrame()
            if self.death_frame ~= -1 then
                self:Break(cur_frame)
            else
                self.death_frame = cur_frame + 120
            end
        end
    end

}