-- The ButtonAction component for the Menu Button.

ButtonMenu = {

    -- On Click function:
    -- Load the main menu.
    OnClick = function (self)
        local sd = Actor.Find("StaticData"):GetComponent("StaticData")
        sd.full_run = false
        sd.valid_level = false
        Scene.Load("menu")
    end -- ON CLICK

} -- BUTTON MENU