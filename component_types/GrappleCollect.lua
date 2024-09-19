GrappleCollect = {

    OnTriggerEnter = function(self, contact)
        Audio.PlaySound("pie_collect.mp3", 4, false)
        Actor.Find("Player"):GetComponent("PlayerManager").can_grapple = true
        Actor.Find("Cursor"):GetComponent("SpriteRenderer").enabled = true
        Actor.Destroy(self.actor)
        local sd = Actor.Find("StaticData"):GetComponent("StaticData")
        local all_found = true
        for index, value in ipairs(sd.secrets_found) do
            if value == false then
                all_found = false
                break
            end
        end
        if all_found == false then
            for parameter, values in pairs(sd.parameters) do
                Audio.SetEventParameter(sd.square_time, parameter, values[5])
            end
        end
    end

}