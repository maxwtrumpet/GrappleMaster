-- The ButtonAction component for the Back Button when viewing a hint.

ButtonBack = {

    -- On Start function:
    -- Get SpriteRenderer, TextRenderer, and ButtonManager components for each button in the menu. 
    OnStart = function (self)
        local local_srs = self.actor:GetComponents("SpriteRenderer")
        self.hover_sprite = local_srs[1]
        self.srs = {Back = local_srs[2]}
        self.trs = {Back = self.actor:GetComponent("TextRenderer")}
        self.bms = {Back = self.actor:GetComponent("ButtonManager")}
        self.bms["Back"].enabled = false
        local menu = Actor.Find("ButtonMenu")
        self.srs["Menu"] = menu:GetComponents("SpriteRenderer")[2]
        self.trs["Menu"] = menu:GetComponent("TextRenderer")
        self.bms["Menu"] = menu:GetComponent("ButtonManager")
        local hint = Actor.Find("ButtonHint")
        self.srs["Hint"] = hint:GetComponents("SpriteRenderer")[2]
        self.trs["Hint"] = hint:GetComponent("TextRenderer")
        self.bms["Hint"] = hint:GetComponent("ButtonManager")
        local resume = Actor.Find("ButtonResume")
        self.srs["Resume"] = resume:GetComponents("SpriteRenderer")[2]
        self.trs["Resume"] = resume:GetComponent("TextRenderer")
        self.bms["Resume"] = resume:GetComponent("ButtonManager")
    end, -- ON START

    -- On Click function:
    -- Enable all the main pause menu buttons, didable this button, and destroy the hint.
    OnClick = function(self)
        self.srs["Resume"].enabled = true
        self.trs["Resume"].enabled = true
        self.bms["Resume"].enabled = true
        self.srs["Hint"].enabled = true
        self.trs["Hint"].enabled = true
        self.bms["Hint"].enabled = true
        self.srs["Menu"].enabled = true
        self.trs["Menu"].enabled = true
        self.bms["Menu"].enabled = true
        self.srs["Back"].enabled = false
        self.hover_sprite.enabled = false
        self.trs["Back"].enabled = false
        self.bms["Back"].enabled = false
        Actor.Destroy(Actor.Find("Hint"))
    end -- ON CLICK

} -- BUTTON BACK