TitleFade = {

    OnStart = function (self)
        self.sd = Actor.Find("StaticData")
        if self.sd == nil then
            self.sd = Actor.Instantiate("StaticData")
        end
        self.sd = self.sd:GetComponent("StaticData")
        self.sr = self.actor:GetComponent("SpriteRenderer")
        self.sd:UpdateMusic(12)
    end,

    OnUpdate = function (self)
        if not self.sd.cheats_enabled and Input.IsKeyDown("lalt") and Input.IsKeyDown("lshift") and Input.IsKeyDown("c") then
            self.sd:EnableCheats()
        end
        if self.sd.cheats_enabled and Input.IsKeyDown("lalt") and Input.IsKeyDown("lshift") and Input.IsKeyDown("r") then
            self.sd:DisableCheats()
        end
        if self.sr.a < 254 then
            self.sr.a = self.sr.a + 2
        end
    end

}