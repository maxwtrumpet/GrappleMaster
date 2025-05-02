ButtonReturn = {
    submenu = "records",
    OnStart = function (self)
        self.title = Actor.Find("Title"):GetComponent("SpriteRenderer")
        self.records = Actor.Find("Records"):GetComponent("SpriteRenderer")
        self.displays = Actor.FindAll("Display")
        self.sr = self.actor:GetComponents("SpriteRenderer")[2]
        self.tr = self.actor:GetComponent("TextRenderer")
        self.bm = self.actor:GetComponent("ButtonManager")
        self.bm.enabled = false
        local switch = Actor.Find("Switch")
        self.ssr = switch:GetComponents("SpriteRenderer")[2]
        self.str = switch:GetComponent("TextRenderer")
        self.sbm = switch:GetComponent("ButtonManager")
        local buttons = Actor.FindAll("Button")
        self.buttons = {}
        for i = 1, 6, 1 do
            self.buttons[i] = {}
            self.buttons[i]["sr"] = buttons[i]:GetComponents("SpriteRenderer")[2]
            self.buttons[i]["tr"] = buttons[i]:GetComponent("TextRenderer")
            self.buttons[i]["bm"] = buttons[i]:GetComponent("ButtonManager")
        end
        self.hover = self.actor:GetComponent("SpriteRenderer")
    end,

    OnClick = function (self)
        self.title.enabled = true
        for i = 1, 6, 1 do
            self.buttons[i]["sr"].enabled = true
            self.buttons[i]["tr"].enabled = true
            self.buttons[i]["bm"].enabled = true
        end
        self.sr.enabled = false
        self.tr.enabled = false
        self.bm.enabled = false
        self.hover.enabled = false
        self.ssr.enabled = false
        self.str.enabled = false
        self.sbm.enabled = false
        if self.submenu == "records" then
            self.records.enabled = false
            self.displays[1]:DisableAll()
            self.displays[2]:DisableAll()
        else
            Debug.Log("Not done yet!")
        end
    end
}