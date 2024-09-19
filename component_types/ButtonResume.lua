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
        self.player:GetComponent("PlayerManager").enabled = true
        self.player:GetComponent("Rigidbody"):SetVelocity(self.previous_velocity)
        local scene_num = tonumber(string.sub(Scene.GetCurrent(),6))
        if scene_num < 4 then
            Actor.Destroy(self.cursor)
        else
            self.cursor:GetComponent("CursorManager").restricted = true
        end
        Actor.Destroy(self.backdrop)
        Actor.Destroy(self.pause)
        Actor.Destroy(self.menu)
        Actor.Destroy(self.actor)
    end

}