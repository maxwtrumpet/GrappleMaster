Checkpoint = {

    number = 0,

    OnStart = function(self)
        self.sr = self.actor:GetComponent("SpriteRenderer")
        self.position = self.actor:GetComponent("Rigidbody"):GetPosition()
        self.player_type = nil
        if Actor.Find("Player"):GetComponent("CircleManager") == nil then
            self.player_type = "Square"
        else
            self.player_type = "Circle"
        end
    end,

    OnTriggerEnter = function(self, contact)
        local pm = contact.other:GetComponentByKey("Manager")
        if pm ~= nil then
            self.sr.sprite = "respawn"
            pm.original_loc = self.position
            local sd = Actor.Find("StaticData"):GetComponent("StaticData")
            local level = Actor.Find("LevelLoader"):GetComponent("LevelLoader").current_scene + 1
            if sd.player_progress[level][self.player_type] < self.number then
                sd.player_progress[level][self.player_type] = self.number
            end
            self.enabled = false
        end
    end
}