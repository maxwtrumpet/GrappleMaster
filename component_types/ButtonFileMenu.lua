ButtonFileMenu = {

    mode = "load",

    OnStart = function (self)
        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
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
        self.buttons["Cancel"]["bc"] = self.buttons["Cancel"]["bm"].actor:GetComponent("ButtonCancel")
        self.file_menu = Actor.Find("File Menu"):GetComponent("SpriteRenderer")
        self.title = Actor.Find("Title"):GetComponent("SpriteRenderer")
    end,

    OnClick = function(self)
        self.sd:LoadFileMenu(self.mode)
        self.hover_sr.enabled = false
        self.file_menu.enabled = true
        self.title.enabled = false
        for key, value in pairs(self.buttons) do
            value["sr"].enabled = false
            value["tr"].enabled = false
            value["bm"].enabled = false
        end

        self.buttons["Cancel"]["sr"].enabled = true
        self.buttons["Cancel"]["tr"].enabled = true
        self.buttons["Cancel"]["bm"].enabled = true
        self.buttons["Cancel"]["bc"].menu = "file"

    end

}