ButtonResume = {

    previous_velocity = Vector2(0,0),

    OnStart = function (self)
        self.backdrop = Actor.Find("Backdrop")
        self.menu = Actor.Find("ButtonMenu")
        self.pause = Actor.Find("Pause")
        self.cursor = Actor.Find("Cursor")
        self.hint = Actor.Find("ButtonHint")
        self.back = Actor.Find("ButtonBack")
    end,

    OnClick = function (self)
        local player = Actor.Find("Player")
        if player ~= nil then
            player:GetComponentByKey("Manager").enabled = true
        end
        self.cursor:GetComponent("CursorManager").restricted = true
        Actor.Destroy(self.backdrop)
        Actor.Destroy(self.pause)
        Actor.Destroy(self.menu)
        Actor.Destroy(self.actor)
        Actor.Destroy(self.hint)
        Actor.Destroy(self.back)
    end

}