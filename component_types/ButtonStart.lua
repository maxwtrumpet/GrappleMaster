-- The ButtonAction component for the Start Button.

ButtonStart = {

    -- On Start function:
    -- Get Static Data and Main/Level titles.
    -- Get all level and menu buttons.
    OnStart = function (self)

        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        self.title = Actor.Find("Title"):GetComponent("SpriteRenderer")
        self.level_select = Actor.Find("Level Select"):GetComponent("SpriteRenderer")

        self.levels = Actor.FindAll("Level Button")
        local button_actors = Actor.FindAll("Button")
        self.buttons = {}
        for index, value in ipairs(button_actors) do
            local tr = value:GetComponent("TextRenderer")
            local text = tr.text
            if text == "Circle" then
                text = "Toggle"
                self.buttons["Toggle"] = {}
            end -- TOGGLE BUTTON NAME ADJUST
            self.buttons[text] = {}
            self.buttons[text]["sr"] = value:GetComponents("SpriteRenderer")[2]
            self.buttons[text]["tr"] = tr
            self.buttons[text]["bm"] = value:GetComponent("ButtonManager")
        end -- BUTTON LOOP
        self.hover_sr = self.actor:GetComponent("SpriteRenderer")
        self.buttons["Cancel"]["rb"] = self.buttons["Cancel"]["bm"].actor:GetComponent("Rigidbody")
        self.buttons["Cancel"]["bc"] = self.buttons["Cancel"]["bm"].actor:GetComponent("ButtonCancel")
        self.buttons["Toggle"]["bt"] = self.buttons["Toggle"]["bm"].actor:GetComponent("ButtonToggle")

    end, -- ON START

    -- On Click function:
    -- Hide Main title and show Level title.
    -- Disable all main menu buttons.
    -- Enable cancel button (and toggle button if applicable).
    -- Reset levels to be square version and show the level buttons.
    OnClick = function (self)

        self.title.enabled = false
        self.level_select.enabled = true

        self.hover_sr.enabled = false
        for key, value in pairs(self.buttons) do
            value["sr"].enabled = false
            value["tr"].enabled = false
            value["bm"].enabled = false
        end -- BUTTON LOOP

        self.buttons["Cancel"]["sr"].enabled = true
        self.buttons["Cancel"]["tr"].enabled = true
        self.buttons["Cancel"]["bm"].enabled = true
        self.buttons["Cancel"]["bc"].menu = "level"
        local all_secrets = true
        for index, value in ipairs(self.sd.secrets_found) do
            if value["Square"] == false then
                all_secrets = false
                break
            end -- SECRET NOT FOUND
        end -- SECRETS LOOP
        if all_secrets == true then
            self.buttons["Toggle"]["sr"].enabled = true
            self.buttons["Toggle"]["tr"].enabled = true
            self.buttons["Toggle"]["bm"].enabled = true
            self.buttons["Toggle"]["tr"].text = self.buttons["Toggle"]["bt"].text[self.buttons["Toggle"]["bt"].current]
            self.buttons["Cancel"]["rb"]:SetUIPosition(Vector2(2, 3.65))
        end -- ALL SQUARE SECRETS FOUND

        self.buttons["Toggle"]["bt"].current = 1
        self.buttons["Toggle"]["bt"]:ToggleLevels()
        self.sd:ShowLevelButtons(self.levels, "Square")

    end -- ON CLICK

} -- BUTTON START