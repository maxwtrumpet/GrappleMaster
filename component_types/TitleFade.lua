-- The component to fade in the game title.

TitleFade = {

    -- On Start function:
    -- Get SpriteRenderer and StaticData (initialize it if it doesn't already exist).
    -- Load music based on secrets found.
    OnStart = function (self)

        self.sr = self.actor:GetComponent("SpriteRenderer")
        self.sd = Actor.Find("StaticData")
        if self.sd == nil then
            self.sd = Actor.Instantiate("StaticData")
        end
        self.sd = self.sd:GetComponent("StaticData")

        local all_found = true
        for index, value in ipairs(self.sd.secrets_found) do
            if value["Circle"] == false then
                all_found = false
                break
            end -- CIRCLE SECRET NOT FOUND
        end -- SECRETS LOOP
        if all_found == true then
            self.sd.player_type = "Circle"
            self.sd:UpdateMusic(12)
            self.sd.player_type = "Square"
        else
            self.sd.player_type = "Square"
            self.sd:UpdateMusic(12)
        end -- MUSIC UPDATE

    end, -- ON START

    -- On Update function. Increase alpha every frame until it's maximized.
    OnUpdate = function (self)
        if self.sr.a < 254 then
            self.sr.a = self.sr.a + 2
        end -- ALPHA NOT MAXIMIZED
    end -- ON UPDATE

} -- TITLE FADE