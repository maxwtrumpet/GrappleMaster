GrappleCollect = {

    OnStart = function (self)
        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        if self.sd.player_progress[5]["location"] > 1 then
            self:EnableGrapple()
        end
    end,

    EnableGrapple = function (self)
        Actor.Find("Player"):GetComponentByKey("Manager").can_grapple = true
        Actor.Find("Cursor"):GetComponent("SpriteRenderer").enabled = true
        Actor.Destroy(self.actor)
    end,

    OnTriggerEnter = function(self, contact)
        local pm = contact.other:GetComponentByKey("Manager")
        if pm ~= nil then
            self:EnableGrapple()
            if self.sd.mute_mode == false then
                Audio.PlaySound("pie_collect.mp3", 4, false)
                local player_type = nil
                if pm.actor:GetComponent("CircleManager") == nil then
                    player_type = "Square"
                else
                    player_type = "Circle"
                end
                for parameter, values in pairs(self.sd.parameters[player_type]) do
                    Audio.SetEventParameter(self.sd.square_time, parameter, values[5])
                end
            end
        end
    end
}