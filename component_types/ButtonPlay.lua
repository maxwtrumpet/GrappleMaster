-- The ButtonAction component for the checkpoint buttons.

ButtonPlay = {

    -- Level number.
    level = 0,

    -- On Start:
    -- Get static data and checkpoint number.
    -- Disabled button if checkpoint is not unlocked yet.
    OnStart = function (self)
        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        self.checkpoint = tonumber(self.actor:GetComponent("TextRenderer").text)

        if self.actor:GetComponents("SpriteRenderer")[2].sprite == "checkpoint" then
            self.actor:GetComponent("ButtonManager").clickable = false
        end -- CHECKPOINT LOCKED

    end, -- ONSTART

    -- On Click:
    -- Update the starting location and load the level.
    OnClick = function (self)
        self.sd.level_layout[self.level]["location"] = self.checkpoint
        Scene.Load("level" .. tostring(self.level - 1))
    end -- ON CLICK

} -- BUTTON PLAY