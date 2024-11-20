-- The component for managing checkpoints.

Checkpoint = {

    -- The number checkpoint this is.
    number = 0,

    -- On Start function:
    -- Get Static Data and level.
    OnStart = function(self)
        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        self.level = Actor.Find("LevelLoader"):GetComponent("LevelLoader").current_scene + 1
    end, -- ON START

    -- On Trigger Enter function:
    -- Ensure that this trigger was from the player.
    -- Update sprite and player respawn/static data location + progress/music if applicable.
    -- Disable this component.
    OnTriggerEnter = function(self, contact)

        local pm = contact.other:GetComponentByKey("Manager")
        if pm ~= nil then

            self.actor:GetComponent("SpriteRenderer").sprite = "respawn"
            pm.original_loc = self.actor:GetComponent("Rigidbody"):GetPosition()
            self.sd.level_layout[self.level]["location"] = self.number
            if self.sd.player_progress[self.level][self.sd.player_type] < self.number then
                self.sd.player_progress[self.level][self.sd.player_type] = self.number
            end -- PROGRESS GAINED
            if self.level == 12 and self.number > 5 then
                for parameter, values in pairs(self.sd.final_music[self.sd.player_type]) do
                    Audio.SetEventParameter( "event:/music/square_time", parameter, values[self.number-5])
                end -- PARAMETER LOOP
            end -- MUSIC UPDATE

            self.enabled = false

        end -- PLAYER TRIGGER

    end -- ON TRIGGER ENTER

} -- CHECKPOIN