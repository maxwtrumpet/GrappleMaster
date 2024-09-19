ButtonLoad = {

    level = 0,

    OnStart = function (self)
        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        self.tr = self.actor:GetComponent("TextRenderer")
        self.checkpoint = tonumber(self.tr.text)
        if self.actor:GetComponents("SpriteRenderer")[2].sprite == "checkpoint" then
            self.actor:GetComponent("ButtonManager").clickable = false
        end
    end,

    OnClick = function (self)
        self.sd.player_progress[self.level]["location"] = self.checkpoint
        Scene.Load("level" .. tostring(self.level - 1))
    end
}