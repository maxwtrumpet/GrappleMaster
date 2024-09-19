Checkpoint = {

    number = 0,

    OnStart = function(self)
        self.sr = self.actor:GetComponent("SpriteRenderer")
        self.position = self.actor:GetComponent("Rigidbody"):GetPosition()
    end,

    OnTriggerEnter = function(self, contact)
        local pm = contact.other:GetComponent("PlayerManager")
        if pm ~= nil then
            self.sr.sprite = "respawn"
            pm.original_loc = self.position
            local sd = Actor.Find("StaticData"):GetComponent("StaticData")
            local level = Actor.Find("LevelLoader"):GetComponent("LevelLoader").current_scene + 1
            if sd.player_progress[level]["progress"] < self.number then
                sd.player_progress[level]["progress"] = self.number
            end
            self.enabled = false
        end
    end
}