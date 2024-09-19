ButtonStart = {

    OnStart = function (self)

        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")

        self.title = Actor.Find("Title"):GetComponent("SpriteRenderer")
        self.level_select = Actor.Find("Level Select"):GetComponent("SpriteRenderer")

        self.bm = self.actor:GetComponent("ButtonManager")
        self.srs = self.actor:GetComponents("SpriteRenderer")
        self.tr = self.actor:GetComponent("TextRenderer")

        local buttons = Actor.FindAll("Button")

        self.quit_bm = buttons[2]:GetComponent("ButtonManager")
        self.quit_srs = buttons[2]:GetComponents("SpriteRenderer")
        self.quit_tr = buttons[2]:GetComponent("TextRenderer")

        self.cancel_bm = buttons[3]:GetComponent("ButtonManager")
        self.cancel_srs = buttons[3]:GetComponents("SpriteRenderer")
        self.cancel_tr = buttons[3]:GetComponent("TextRenderer")

        self.levels = Actor.FindAll("Level Button")
    end,
    
    OnClick = function (self)

        self.title.enabled = false
        self.level_select.enabled = true

        self.srs[1].enabled = false
        self.srs[2].enabled = false
        self.bm.enabled = false
        self.tr.enabled = false

        self.quit_srs[2].enabled = false
        self.quit_bm.enabled = false
        self.quit_tr.enabled = false

        self.cancel_srs[2].enabled = true
        self.cancel_bm.enabled = true
        self.cancel_tr.enabled = true

        self.sd:ShowLevelButtons(self.levels)
    end

}