-- The Button Manager component for all buttons.

ButtonManager = {

    -- Whether or not the button is clickable.
    clickable = true,

    -- On Start function:
    -- Get SpriteRenderer, Rigidbody and ButtonAction components.
    OnStart = function (self)
        self.hover_sprite = self.actor:GetComponents("SpriteRenderer")[1]
        self.rb = self.actor:GetComponent("Rigidbody")
        self.button_action = self.actor:GetComponentByKey("ButtonAction")
    end, -- ON START

    -- On Trigger Enter:
    -- If clickable and triggered by cursor, show hover overlay sprite.
    OnTriggerEnter = function(self, contact)
        if self.clickable and contact.other:GetName() == "Cursor" then
            self.hover_sprite.enabled = true
        end -- VALID ENTER
    end, -- ON TRIGGER ENTER

    -- On Trigger Exit:
    -- If clickable and triggered by cursor, hide hover overlay sprite.
    OnTriggerExit = function(self, contact)
        if self.clickable and contact.other:GetName() == "Cursor" then
            self.hover_sprite.enabled = false
        end -- VALID EXIT
    end, -- ON TRIGGER EXIT

    -- On Update:
    -- If currently being hovered over and mouse was just click, run On Click function.
    OnUpdate = function(self)
        if self.hover_sprite.enabled and Input.IsMouseJustDown("left") then
            self.button_action:OnClick()
        end -- CLICK DETECTED
    end -- ON UPDATE

} -- BUTTON MANAGER