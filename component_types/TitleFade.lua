TitleFade = {

    OnStart = function (self)
        self.sd = Actor.Find("StaticData")
        if self.sd == nil then
            self.sd = Actor.Instantiate("StaticData")
        end
        self.sd = self.sd:GetComponent("StaticData")
        self.sr = self.actor:GetComponent("SpriteRenderer")
        local all_found = true
        for index, value in ipairs(self.sd.secrets_found) do
            if value["Circle"] == false then
                all_found = false
                break
            end
        end
        if all_found == true then
            self.sd:UpdateMusic(12, "Circle")
        else
            self.sd:UpdateMusic(12, "Square")
        end
    end,

    OnUpdate = function (self)
        if self.sr.a < 254 then
            self.sr.a = self.sr.a + 2
        end
    end

}