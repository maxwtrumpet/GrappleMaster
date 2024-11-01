ButtonLevel = {

    OnStart = function (self)
        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        self.bm = self.actor:GetComponent("ButtonManager")
        self.bm.enabled = false
        self.tr = self.actor:GetComponent("TextRenderer")
        self.tr.enabled = false
        self.level = tonumber(self.tr.text)
        self.levels = Actor.FindAll("Level Button")
        self.toggle_bt = Actor.FindAll("Button")[6]:GetComponent("ButtonToggle")
        self.toggle_bm = self.toggle_bt.actor:GetComponent("ButtonManager")
        self.toggle_tr = self.toggle_bt.actor:GetComponent("TextRenderer")
        self.toggle_sr = self.toggle_bt.actor:GetComponents("SpriteRenderer")[2]
        self.cancel_bc = Actor.FindAll("Button")[5]:GetComponent("ButtonCancel")
    end,

    OnClick = function (self)
        if self.sd.stage_layout[self.level]["Checkpoint"][2] == nil then
            Scene.Load("level" .. tostring(self.level - 1))
        else
            self.sd:HideLevelButtons(self.levels)
            self.sd:LoadCheckpointButtons(self.level, self.toggle_bt.text[self.toggle_bt.current % 2 + 1])
            self.toggle_sr.enabled = false
            self.toggle_bm.enabled = false
            self.toggle_tr.enabled = false
            self.cancel_bc.menu = "checkpoint"
        end
    end

}