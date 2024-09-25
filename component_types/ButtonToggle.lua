ButtonToggle = {

    text = {"Circle","Square"},
    current = 1,

    OnStart = function (self)
        self.tr = self.actor:GetComponent("TextRenderer")
        self.bm = self.actor:GetComponent("ButtonManager")
        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        local level_actors = Actor.FindAll("Level Button")
        self.levels = {}
        for index, value in ipairs(level_actors) do
            self.levels[index] = value:GetComponents("SpriteRenderer")
            local full_name = self.levels[index][2].sprite
            self.levels[index]["Name"] = string.sub(full_name,1,string.len(full_name)-6)
        end
        self.bm.enabled = false
    end,

    ToggleLevels = function (self)
        local postfix = "_blank"
        local scale = 6.25
        if self.current == 2 then
            postfix = "_circle"
            scale = 0.425
            self.sd.circle_mode = true
        else
            self.sd.circle_mode = false
        end
        local all_secrets = true
        for index, value in ipairs(self.sd.secrets_found) do
            if value == false then
                all_secrets = false
                break
            end
        end
        for index, value in ipairs(self.levels) do
            value[1].x_scale = scale
            value[1].y_scale = scale
            value[2].x_scale = scale
            value[2].y_scale = scale
            value[1].sprite = "Level" .. postfix
            value[2].sprite = value["Name"] .. postfix
            value[4].enabled = self.sd.circle_mode == false and self.sd.secrets_found[index]
        end
    end,

    OnClick = function (self)
        self.current = self.current % 2 + 1
        self.tr.text = self.text[self.current]
        self:ToggleLevels()
    end
}