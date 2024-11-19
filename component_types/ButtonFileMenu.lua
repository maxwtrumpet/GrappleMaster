-- The ButtonAction component for the Save/Load Buttons.

ButtonFileMenu = {

    -- Save/load mode
    mode = "load",

    -- On Start function:
    -- Get Static Data and Title/File Menu sprites.
    -- Get SpriteRenderer component.
    -- Get all menu buttons.
    OnStart = function (self)

        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        self.title = Actor.Find("Title"):GetComponent("SpriteRenderer")
        self.file_menu = Actor.Find("File Menu"):GetComponent("SpriteRenderer")

        self.hover_sr = self.actor:GetComponent("SpriteRenderer")

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
        self.buttons["Cancel"]["bc"] = self.buttons["Cancel"]["bm"].actor:GetComponent("ButtonCancel")
        
    end, -- ON START

    -- On Click function:
    -- Hide the title and all home menu buttons.
    -- Load the file menu and show its title/the cancel button, updating it accordingly.
    OnClick = function(self)

        self.title.enabled = false
        for key, value in pairs(self.buttons) do
            value["sr"].enabled = false
            value["tr"].enabled = false
            value["bm"].enabled = false
        end -- BUTTON LOOP
        self.hover_sr.enabled = false

        self.sd:LoadFileMenu(self.mode)
        self.file_menu.enabled = true
        self.buttons["Cancel"]["sr"].enabled = true
        self.buttons["Cancel"]["tr"].enabled = true
        self.buttons["Cancel"]["bm"].enabled = true
        self.buttons["Cancel"]["bc"].menu = "file"

    end -- ON CLICK

} -- BUTTON FILE MENU