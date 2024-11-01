ButtonCancel = {

    menu = "home",

    OnStart = function (self)
        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        self.title = Actor.Find("Title"):GetComponent("SpriteRenderer")
        self.level_select = Actor.Find("Level Select"):GetComponent("SpriteRenderer")
        self.file_menu = Actor.Find("File Menu"):GetComponent("SpriteRenderer")
        self.rb = self.actor:GetComponent("Rigidbody")

        local button_actors = Actor.FindAll("Button")
        self.buttons = {}
        for index, value in ipairs(button_actors) do
            local tr = value:GetComponent("TextRenderer")
            local text = tr.text
            if text == "Circle" then
                text = "Toggle"
                self.buttons["Toggle"] = {}
            end
            self.buttons[text] = {}
            self.buttons[text]["sr"] = value:GetComponents("SpriteRenderer")[2]
            self.buttons[text]["tr"] = tr
            self.buttons[text]["bm"] = value:GetComponent("ButtonManager")
        end
        self.hover_sr = self.actor:GetComponent("SpriteRenderer")
        self.buttons["Toggle"]["bt"] = self.buttons["Toggle"]["bm"].actor:GetComponent("ButtonToggle")
        self.buttons["Cancel"]["bm"].enabled = false

        self.levels = Actor.FindAll("Level Button")
    end,

    ReturnToHome = function (self)
        self.menu = "home"
        self.title.enabled = true
        self.level_select.enabled = false
        self.file_menu.enabled = false
        self.hover_sr.enabled = false

        for key, value in pairs(self.buttons) do
            value["sr"].enabled = true
            value["tr"].enabled = true
            value["bm"].enabled = true
        end

        self.buttons["Cancel"]["sr"].enabled = false
        self.buttons["Cancel"]["tr"].enabled = false
        self.buttons["Cancel"]["bm"].enabled = false

        self.buttons["Toggle"]["sr"].enabled = false
        self.buttons["Toggle"]["tr"].enabled = false
        self.buttons["Toggle"]["bm"].enabled = false

        self.rb:SetUIPosition(Vector2(0,3.65))

        self.sd:HideLevelButtons(self.levels)
        self.sd:RemoveFileMenu()
    end,

    ReturnToLevel = function (self)
        self.menu = "level"
        local all_found = true
        for index, value in ipairs(self.sd.secrets_found) do
            if value["Square"] == false then
                all_found = false
                break
            end
        end
        if all_found == true then
            self.buttons["Toggle"]["sr"].enabled = true
            self.buttons["Toggle"]["tr"].enabled = true
            self.buttons["Toggle"]["bm"].enabled = true
        end
        self.sd.RemoveCheckpointButtons()
        self.sd:ShowLevelButtons(self.levels, self.buttons["Toggle"]["bt"].text[self.buttons["Toggle"]["bt"].current % 2 + 1])
    end,

    OnClick = function (self)
        if self.menu == "level" or self.menu == "file" then
            self:ReturnToHome()
        else
            self:ReturnToLevel()
        end
    end
}