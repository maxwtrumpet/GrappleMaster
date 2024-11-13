ButtonResume = {

    previous_velocity = Vector2(0,0),

    OnStart = function (self)
        self.backdrop = Actor.Find("Backdrop")
        self.menu = Actor.Find("ButtonMenu")
        self.pause = Actor.Find("Pause")
        self.player = Actor.Find("Player")
        self.cursor = Actor.Find("Cursor")
    end,

    OnClick = function (self)
        self.player:GetComponentByKey("Manager").enabled = true
        self.cursor:GetComponent("CursorManager").restricted = true
        Actor.Destroy(self.backdrop)
        Actor.Destroy(self.pause)
        Actor.Destroy(self.menu)
        Actor.Destroy(self.actor)
    end

}