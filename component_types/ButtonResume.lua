-- The ButtonAction component for the Resume Button.

ButtonResume = {

    -- On Start function:
    -- Get all other pause menu actors + the cursor.
    OnStart = function (self)
        self.backdrop = Actor.Find("Backdrop")
        self.menu = Actor.Find("ButtonMenu")
        self.pause = Actor.Find("Pause")
        self.cursor = Actor.Find("Cursor")
        self.hint = Actor.Find("ButtonHint")
        self.back = Actor.Find("ButtonBack")
    end, -- ON START

    -- On Click function:
    -- Re-enable the player if they currently exist and restrict the cursor.
    -- Destroy all pause menu actors.
    OnClick = function (self)

        local player = Actor.Find("Player")
        if player ~= nil then
            player:GetComponentByKey("Manager").enabled = true
        end -- PLAYER EXISTS
        self.cursor:GetComponent("CursorManager").restricted = true

        Actor.Destroy(self.backdrop)
        Actor.Destroy(self.pause)
        Actor.Destroy(self.menu)
        Actor.Destroy(self.actor)
        Actor.Destroy(self.hint)
        Actor.Destroy(self.back)

    end -- ON CLICK

} -- BUTTON RESUME