-- The ButtonAction component for the Toggle Button.

ButtonToggle = {

    -- Button text and current mode.
    text = {"Circle","Square"},
    current = 1,

    -- On Start function:
    -- Get Static Data and all level buttons.
    -- Get TextRenderer and ButtonManager components, disabling the latter.
    OnStart = function (self)

        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        local level_actors = Actor.FindAll("Level Button")
        self.levels = {}
        for index, value in ipairs(level_actors) do
            self.levels[index] = value:GetComponents("SpriteRenderer")
            local full_name = self.levels[index][2].sprite
            self.levels[index]["Name"] = string.sub(full_name,1,string.len(full_name)-6)
        end

        self.tr = self.actor:GetComponent("TextRenderer")
        self.bm = self.actor:GetComponent("ButtonManager")
        self.bm.enabled = false

    end,

    -- Toggle Levels function:
    -- Set postfix, scale, and player mode based on current toggle.
    -- Update each level's sprites and ButtonManager/TextRenderer based on mode/level data.
    ToggleLevels = function (self)

        local postfix = "_blank"
        local scale = 6.25
        if self.current == 2 then
            postfix = "_circle"
            scale = 0.425
            self.sd.circle_mode = true
        else
            self.sd.circle_mode = false
        end -- CURRENT TOGGLE CHECK

        for index, value in ipairs(self.levels) do
            if index > self.sd.level_reached[self.text[self.current % 2 + 1]] then
                value[3].enabled = true
                value[5].enabled = true
                value[1].actor:GetComponent("ButtonManager").clickable = false
                value[1].actor:GetComponent("TextRenderer").enabled = false
            else
                value[3].enabled = false
                value[5].enabled = false
                value[1].actor:GetComponent("ButtonManager").clickable = true
                value[1].actor:GetComponent("TextRenderer").enabled = true
            end -- LEVEL VISIBILITY
            value[1].x_scale = scale
            value[1].y_scale = scale
            value[2].x_scale = scale
            value[2].y_scale = scale
            value[1].sprite = "Level" .. postfix
            value[2].sprite = value["Name"] .. postfix
            value[4].sprite = "Secret_found" .. postfix
            value[4].x_scale = scale
            value[4].y_scale = scale
            value[4].enabled = self.sd.secrets_found[index][self.text[self.current % 2 + 1]]
            value[5].x_scale = scale
            value[5].y_scale = scale
            value[5].sprite = "silhouette" .. postfix
        end -- LEVEL BUTTON LOOP

    end, -- TOGGLE LEVELS

    -- On Click function:
    -- Swap the current mode and update the text/levels accordingly.
    OnClick = function (self)
        self.current = self.current % 2 + 1
        self.tr.text = self.text[self.current]
        self:ToggleLevels()
    end -- ON CLICK

} -- BUTTON TOGGLE