ButtonCancel = {

    OnStart = function (self)
        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        self.title = Actor.Find("Title"):GetComponent("SpriteRenderer")
        self.level_select = Actor.Find("Level Select"):GetComponent("SpriteRenderer")

        self.bm = self.actor:GetComponent("ButtonManager")
        self.bm.enabled = false
        self.srs = self.actor:GetComponents("SpriteRenderer")
        self.tr = self.actor:GetComponent("TextRenderer")
        self.tr.enabled = false
        self.rb = self.actor:GetComponent("Rigidbody")

        local buttons = Actor.FindAll("Button")

        self.start_bm = buttons[1]:GetComponent("ButtonManager")
        self.start_srs = buttons[1]:GetComponents("SpriteRenderer")
        self.start_tr = buttons[1]:GetComponent("TextRenderer")

        self.quit_bm = buttons[2]:GetComponent("ButtonManager")
        self.quit_srs = buttons[2]:GetComponents("SpriteRenderer")
        self.quit_tr = buttons[2]:GetComponent("TextRenderer")

        self.toggle_bm = buttons[4]:GetComponent("ButtonManager")
        self.toggle_srs = buttons[4]:GetComponents("SpriteRenderer")
        self.toggle_tr = buttons[4]:GetComponent("TextRenderer")

        self.levels = Actor.FindAll("Level Button")
        self.single_level_check = self.levels[1]:GetComponents("SpriteRenderer")[2]
    end,

    OnClick = function (self)
        if self.single_level_check.enabled then
            self.title.enabled = true
            self.level_select.enabled = false

            self.srs[1].enabled = false
            self.srs[2].enabled = false
            self.bm.enabled = false
            self.tr.enabled = false

            self.quit_srs[2].enabled = true
            self.quit_bm.enabled = true
            self.quit_tr.enabled = true

            self.start_srs[2].enabled = true
            self.start_bm.enabled = true
            self.start_tr.enabled = true

            self.toggle_srs[2].enabled = false
            self.toggle_bm.enabled = false
            self.toggle_tr.enabled = false

            self.rb:SetUIPosition(Vector2(0,3.65))

            self.sd:HideLevelButtons(self.levels)
        else
            self.sd.RemoveCheckpointButtons()
            self.sd:ShowLevelButtons(self.levels)
        end
    end
}