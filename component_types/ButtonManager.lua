ButtonManager = {

    clickable = true,

    OnStart = function (self)
        self.srs = self.actor:GetComponents("SpriteRenderer")
        self.rb = self.actor:GetComponent("Rigidbody")
        self.text_pos = (self.rb:GetPosition() - Camera.GetPosition()) * 75
        self.text_pos.x = self.text_pos.x + 640
        self.text_pos.y = self.text_pos.y + 360
        self.button_action = self.actor:GetComponentByKey("ButtonAction")
    end,

    OnTriggerEnter = function(self, contact)
        if self.clickable then
            local contact_name = contact.other:GetName()
                if contact_name == "Cursor" then
                    self.srs[1].enabled = true
                end
        end
    end,

    OnUpdate = function(self)
        if self.srs[1].enabled and Input.IsMouseJustDown("left") then
            self.button_action:OnClick()
        end
    end,

    OnTriggerExit = function(self, contact)
        if self.clickable then
            local contact_name = contact.other:GetName()
            if contact_name == "Cursor" then
                self.srs[1].enabled = false
            end
        end
    end

}