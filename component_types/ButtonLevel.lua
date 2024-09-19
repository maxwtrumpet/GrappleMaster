ButtonLevel = {

    OnStart = function (self)
        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        self.bm = self.actor:GetComponent("ButtonManager")
        self.bm.enabled = false
        self.tr = self.actor:GetComponent("TextRenderer")
        self.tr.enabled = false
        self.level = tonumber(self.tr.text)
        self.levels = Actor.FindAll("Level Button")
    end,

    OnClick = function (self)
        if self.sd.stage_layout[self.level]["Checkpoint"][2] == nil then
            Scene.Load("level" .. tostring(self.level - 1))
        else
            self.sd:HideLevelButtons(self.levels)
            self.sd:LoadCheckpointButtons(self.level)
        end
    end

}