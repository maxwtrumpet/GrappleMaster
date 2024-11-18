ButtonHint = {

    OnStart = function (self)
        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        self.level = Actor.Find("LevelLoader"):GetComponent("LevelLoader").current_scene + 1
        self.location = self.sd.level_layout[self.level]["location"]
        self.pause = Actor.Find("Pause")
        local local_srs = self.actor:GetComponents("SpriteRenderer")
        self.hover_sprite = local_srs[1]
        self.srs = {Hint = local_srs[2]}
        self.trs = {Hint = self.actor:GetComponent("TextRenderer")}
        self.bms = {Hint = self.actor:GetComponent("ButtonManager")}
        local menu = Actor.Find("ButtonMenu")
        self.srs["Menu"] = menu:GetComponents("SpriteRenderer")[2]
        self.trs["Menu"] = menu:GetComponent("TextRenderer")
        self.bms["Menu"] = menu:GetComponent("ButtonManager")
        local back = Actor.Find("ButtonBack")
        self.srs["Back"] = back:GetComponents("SpriteRenderer")[2]
        self.trs["Back"] = back:GetComponent("TextRenderer")
        self.bms["Back"] = back:GetComponent("ButtonManager")
        local resume = Actor.Find("ButtonResume")
        self.srs["Resume"] = resume:GetComponents("SpriteRenderer")[2]
        self.trs["Resume"] = resume:GetComponent("TextRenderer")
        self.bms["Resume"] = resume:GetComponent("ButtonManager")
        self.secrets_found = 0
        for index, value in ipairs(self.sd.secrets_found) do
            if index == self.level then
                break
            end
            if value["Square"] == true then
                self.secrets_found = self.secrets_found + 1
            end
        end
    end,

    OnClick = function(self)
        self.srs["Resume"].enabled = false
        self.trs["Resume"].enabled = false
        self.bms["Resume"].enabled = false
        self.srs["Hint"].enabled = false
        self.hover_sprite.enabled = false
        self.trs["Hint"].enabled = false
        self.bms["Hint"].enabled = false
        self.srs["Menu"].enabled = false
        self.trs["Menu"].enabled = false
        self.bms["Menu"].enabled = false
        self.srs["Back"].enabled = true
        self.trs["Back"].enabled = true
        self.bms["Back"].enabled = true
        local hint = Actor.Instantiate("Hint")
        if (self.level == 5 and self.location == 1 and Actor.Find("GrappleCollect") ~= nil) then
            local tr = hint:AddComponent("TextRenderer")
            tr.text = "What's that black square over there?"
            tr.sorting_order = 999
            tr.r = 231
            tr.g = 231
            tr.b = 231
        else
            if self.sd.secret_hints[self.level][1] == self.location and self.sd.level_reached["Square"] == 13 and self.secrets_found == self.level - 1 then
                for index, value in ipairs(self.sd.secret_hints[self.level][2]) do
                    local tr = hint:AddComponent("TextRenderer")
                    tr.text = value
                    tr.sorting_order = 999
                    tr.r = 231
                    tr.g = 231
                    tr.b = 231
                    tr.y_offset = index - 1
                end
            else
                for index, value in ipairs(self.sd.hints[self.level][self.location]) do
                    local tr = hint:AddComponent("TextRenderer")
                    tr.text = value
                    tr.sorting_order = 999
                    tr.r = 231
                    tr.g = 231
                    tr.b = 231
                    tr.y_offset = index - 1
                end
            end
            
        end
    end
}