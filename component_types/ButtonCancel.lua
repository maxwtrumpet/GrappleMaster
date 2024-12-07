-- The ButtonAction component for the Cancel Button anywhere on the main menu.

ButtonCancel = {

    -- Which submenu the button is in.
    menu = "home",

    -- On Start function.
    -- Get Static Data and Title/Level/File Menu sprites.
    -- Get SpriteRenderer and Rigidbody components.
    -- Get all level and menu buttons.
    -- Diable self.
    OnStart = function (self)

        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        self.title = Actor.Find("Title"):GetComponent("SpriteRenderer")
        self.level_select = Actor.Find("Level Select"):GetComponent("SpriteRenderer")
        self.file_menu = Actor.Find("File Menu"):GetComponent("SpriteRenderer")

        self.hover_sr = self.actor:GetComponent("SpriteRenderer")
        self.rb = self.actor:GetComponent("Rigidbody")

        self.levels = Actor.FindAll("Level Button")
        local button_actors = Actor.FindAll("Button")
        self.buttons = {}
        for index, value in ipairs(button_actors) do
            local tr = value:GetComponent("TextRenderer")
            local text = tr.text
            if text == "Circle" then
                text = "Toggle"
            end -- TOGGLE BUTTON NAME ADJUST
            self.buttons[text] = {}
            self.buttons[text]["sr"] = value:GetComponents("SpriteRenderer")[2]
            self.buttons[text]["tr"] = tr
            self.buttons[text]["bm"] = value:GetComponent("ButtonManager")
        end -- BUTTON LOOP
        self.buttons["Toggle"]["bt"] = self.buttons["Toggle"]["bm"].actor:GetComponent("ButtonToggle")

        self.buttons["Cancel"]["bm"].enabled = false

    end, -- ON START

    -- Return to Home function:
    -- Reset the submenu variable and show the title.
    -- Enable all home menu buttons.
    -- Disable/reset self and disable toggle button.
    -- Hide level buttons and remove the file/level menu sprites
    ReturnToHome = function (self)

        self.menu = "home"
        self.title.enabled = true

        for key, value in pairs(self.buttons) do
            value["sr"].enabled = true
            value["tr"].enabled = true
            value["bm"].enabled = true
        end -- BUTTON LOOP

        self.buttons["Cancel"]["sr"].enabled = false
        self.hover_sr.enabled = false
        self.buttons["Cancel"]["tr"].enabled = false
        self.buttons["Cancel"]["bm"].enabled = false
        self.rb:SetUIPosition(Vector2(0,-3.65))
        self.buttons["Toggle"]["sr"].enabled = false
        self.buttons["Toggle"]["tr"].enabled = false
        self.buttons["Toggle"]["bm"].enabled = false

        self.sd:HideLevelButtons(self.levels)
        self.level_select.enabled = false
        self.file_menu.enabled = false
        self.sd:RemoveFileMenu()

    end, -- RETURN TO HOME

    -- Return to the main level select screen:
    -- Reset the submenu variable.
    -- If all square mode secrets are found, show the toggle button.
    -- Remove checkpoint buttons and show the level buttons.
    ReturnToLevel = function (self)

        self.menu = "level"

        local all_found = true
        for index, value in ipairs(self.sd.secrets_found) do
            if value["Square"] == false then
                all_found = false
                break
            end -- SECRET NOT FOUND
        end -- LEVEL LOOP
        if all_found == true then
            self.buttons["Toggle"]["sr"].enabled = true
            self.buttons["Toggle"]["tr"].enabled = true
            self.buttons["Toggle"]["bm"].enabled = true
        end -- ALL SECRETS FOUND

        self.sd.RemoveCheckpointButtons()
        self.sd:ShowLevelButtons(self.levels, self.buttons["Toggle"]["bt"].text[self.buttons["Toggle"]["bt"].current % 2 + 1])

    end, -- RETURN TO LEVEL

    -- On Click function:
    -- Return to home menu or level select based on the current submenu.
    OnClick = function (self)
        if self.menu == "level" or self.menu == "file" then
            self:ReturnToHome()
        else
            self:ReturnToLevel()
        end -- SUBMENU CHECK
    end -- ON CLICK

} -- BUTTON CANCEL