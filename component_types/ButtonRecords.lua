ButtonRecords = {

    OnStart = function (self)
        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        self.title = Actor.Find("Title"):GetComponent("SpriteRenderer")
        self.records = Actor.Find("Records"):GetComponent("SpriteRenderer")
        self.displays = Actor.FindAll("Display")
        self.displays[1] = self.displays[1]:GetComponent("Display")
        self.displays[2] = self.displays[2]:GetComponent("Display")
        local rtn = Actor.Find("Return")
        self.rsr = rtn:GetComponents("SpriteRenderer")[2]
        self.rtr = rtn:GetComponent("TextRenderer")
        self.rbm = rtn:GetComponent("ButtonManager")
        self.rrb = rtn:GetComponent("Rigidbody2D")
        local switch = Actor.Find("Switch")
        self.ssr = switch:GetComponents("SpriteRenderer")[2]
        self.str = switch:GetComponent("TextRenderer")
        self.sbm = switch:GetComponent("ButtonManager")
        self.sbs = switch:GetComponent("ButtonSwitch")
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
        local all_secrets = true
        for index, value in ipairs(self.sd.secrets_found) do
            if value["Square"] == false then
                all_secrets = false
                break
            end -- SECRET NOT FOUND
        end -- SECRETS LOOP
        if all_secrets == true then
            self.ssr.enabled = true
            self.str.enabled = true
            self.str.text = "Circle"
            self.sbs.index = 2
            self.sbm.enabled = true
            self.rrb:SetPosition(Vector2(2,-4))
        else
            self.rrb:SetPosition(Vector2(0,-4))
        end
        self.title.enabled = false
        for i = 1, 6, 1 do
            self.buttons[i]["sr"].enabled = false
            self.buttons[i]["tr"].enabled = false
            self.buttons[i]["bm"].enabled = false
        end
        self.hover.enabled = false
        self.records.enabled = true
        self.displays[1].actor:EnableAll()
        self.displays[1]:Update(1)
        self.displays[2].actor:EnableAll()
        self.displays[2]:Update(2)
        self.rsr.enabled = true
        self.rtr.enabled = true
        self.rbm.enabled = true
    end
}