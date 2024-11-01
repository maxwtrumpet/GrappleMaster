ButtonStart = {

    OnStart = function (self)

        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")

        self.title = Actor.Find("Title"):GetComponent("SpriteRenderer")
        self.level_select = Actor.Find("Level Select"):GetComponent("SpriteRenderer")

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
        self.buttons["Cancel"]["rb"] = self.buttons["Cancel"]["bm"].actor:GetComponent("Rigidbody")
        self.buttons["Cancel"]["bc"] = self.buttons["Cancel"]["bm"].actor:GetComponent("ButtonCancel")
        self.buttons["Toggle"]["bt"] = self.buttons["Toggle"]["bm"].actor:GetComponent("ButtonToggle")
        self.levels = Actor.FindAll("Level Button")
    end,
    
    OnClick = function (self)

        self.title.enabled = false
        self.level_select.enabled = true

        self.hover_sr.enabled = false

        for key, value in pairs(self.buttons) do
            value["sr"].enabled = false
            value["tr"].enabled = false
            value["bm"].enabled = false
        end

        self.buttons["Cancel"]["sr"].enabled = true
        self.buttons["Cancel"]["tr"].enabled = true
        self.buttons["Cancel"]["bm"].enabled = true
        self.buttons["Cancel"]["bc"].menu = "level"

        local all_secrets = true
        for index, value in ipairs(self.sd.secrets_found) do
            if value["Square"] == false then
                all_secrets = false
                break
            end
        end
        if all_secrets == true then
            self.buttons["Toggle"]["sr"].enabled = true
            self.buttons["Toggle"]["tr"].enabled = true
            self.buttons["Toggle"]["bm"].enabled = true
            self.buttons["Toggle"]["tr"].text = self.buttons["Toggle"]["bt"].text[self.buttons["Toggle"]["bt"].current]
            self.buttons["Cancel"]["rb"]:SetUIPosition(Vector2(2, 3.65))
        end
        self.buttons["Toggle"]["bt"].current = 1
        self.buttons["Toggle"]["bt"]:ToggleLevels()

        self.sd:ShowLevelButtons(self.levels, "Square")
    end

}