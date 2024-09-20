GrappleCollect = {

    OnStart = function (self)
        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        if self.sd.player_progress[5]["location"] > 1 then
            self:EnableGrapple()
        end
    end,

    EnableGrapple = function (self)
        Actor.Find("Player"):GetComponent("PlayerManager").can_grapple = true
        Actor.Find("Cursor"):GetComponent("SpriteRenderer").enabled = true
        Actor.Destroy(self.actor)
    end,

    OnTriggerEnter = function(self, contact)
        self:EnableGrapple()
        local all_found = true
        for index, value in ipairs(self.sd.secrets_found) do
            if value == false then
                all_found = false
                break
            end
        end
        if self.sd.mute_mode == false then
            Audio.PlaySound("pie_collect.mp3", 4, false)
            if all_found == false then
                for parameter, values in pairs(self.sd.parameters) do
                    Audio.SetEventParameter(self.sd.square_time, parameter, values[5])
                end
            end
        end
    end
}