-- The ButtonAction component for Level Buttons.

ButtonLevel = {

    -- On Start function:
    -- Get Static Data and level number.
    -- Disable ButtonManager and TextRenderer components.
    -- Get level, toggle, and cancel buttons.
    OnStart = function (self)

        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        local tr = self.actor:GetComponent("TextRenderer")
        self.level = tonumber(tr.text)

        self.actor:GetComponent("ButtonManager").enabled = false
        tr.enabled = false

        self.levels = Actor.FindAll("Level Button")
        self.toggle_bt = Actor.FindAll("Button")[6]:GetComponent("ButtonToggle")
        self.toggle_bm = self.toggle_bt.actor:GetComponent("ButtonManager")
        self.toggle_tr = self.toggle_bt.actor:GetComponent("TextRenderer")
        self.toggle_sr = self.toggle_bt.actor:GetComponents("SpriteRenderer")[2]
        self.cancel_bc = Actor.FindAll("Button")[5]:GetComponent("ButtonCancel")

    end, -- ON START

    -- On Click function.
    OnClick = function (self)

         -- Get the current player type.
        local player_type = self.toggle_bt.text[self.toggle_bt.current % 2 + 1]

        -- Load the level if there's only one visible checkpoint.
        if self.sd.player_progress[self.level][player_type] == 1 then
            Scene.Load("level" .. tostring(self.level - 1))

        -- Otherwise:
        -- Hide the level menu and show the checkpoint buttons.
        -- Hide the toggle button and update the cancel button submenu.
        else

            self.sd:HideLevelButtons(self.levels)
            self.sd:LoadCheckpointButtons(self.level, player_type)

            self.toggle_sr.enabled = false
            self.toggle_bm.enabled = false
            self.toggle_tr.enabled = false
            self.cancel_bc.menu = "checkpoint"

        end -- SINGLE OR MULTI CHECKPOINT

    end -- ON CLICK

} -- BUTTON LEVEL