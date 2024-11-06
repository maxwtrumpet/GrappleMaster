Checkpoint = {

    number = 0,
    final_music = {
        Square = {Chords = {1,1,1,1,1,0,0},
                  ChordType = {1,1,1,1,1,1,1},
                  Bass = {0,1,0,0,0,0,0},
                  Melody = {1,1,1,1,1,1,1},
                  Groove = {0,0,0,0,0,0,0},
                  Sustain = {1,0,0,0,1,1,0},
                  Harp = {1,1,1,0,0,0,0}},
        Circle = {Chords = {1,1,1,1,0,0,0},
                  ChordType = {1,1,1,1,1,1,0},
                  Bass = {1,1,1,0,0,0,0},
                  Melody = {0,0,0,0,1,0,0},
                  Groove = {1,0,0,0,0,0,0},
                  Sustain = {1,1,0,0,0,0,0},
                  Harp = {1,1,1,1,1,1,0}}
    },

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
            sd.level_layout[level]["location"] = self.number
            if sd.player_progress[level][self.player_type] < self.number then
                sd.player_progress[level][self.player_type] = self.number
            end
            if level == 12 and self.number > 5 and sd.mute_mode == false then
                for parameter, values in pairs(self.final_music[self.player_type]) do
                    Audio.SetEventParameter( "event:/music/square_time", parameter, values[self.number-5])
                end
            end
            self.enabled = false
        end
    end
}