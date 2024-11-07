PieCollect = {

    countdown = -1,
    next_scene = "level",
    current_scene = 0,

    OnStart = function (self)
        self.static_data = Actor.Find("StaticData"):GetComponent("StaticData")
        self.is_secret = self.actor:GetName() == "Secret"
        self.current_scene = Actor.Find("LevelLoader"):GetComponent("LevelLoader").current_scene
        self.next_scene = self.next_scene .. tostring(self.current_scene + 1)
        self.player_type = "Square"
        if Actor.Find("Player"):GetComponent("CircleManager") ~= nil then
            self.player_type = "Circle"
        end
    end,

    OnUpdate = function(self)
        if self.countdown ~= -1 then
            local cur_frame = Application.GetFrame()
            if self.countdown <= cur_frame then
                if self.next_scene == "level12" then
                    self.player_sr.r = 255
                    self.player_sr.g = 255
                    self.player_sr.x_scale = 0.425
                    self.player_sr.y_scale = 0.425
                    if self.is_secret then
                        if self.player_type == "Circle" then
                            Actor.Instantiate("FinalEnding")
                        else
                            Actor.Instantiate("TrueEnding")
                        end
                        self.player_sr.sprite = "true_goal"
                        for index, value in ipairs(self.static_data.secrets_found) do
                            if value[self.player_type] == false then
                                if self.player_type == "Circle" then
                                    Actor.Destroy("FinalEnding")
                                else
                                    Actor.Destroy("TrueEnding")
                                end
                                Actor.Instantiate("NormalEnding")
                                self.player_sr.sprite = "goal"
                                break
                            end
                        end
                    else
                        Actor.Instantiate("NormalEnding")
                        self.player_sr.sprite = "goal"
                    end
                    Actor.Instantiate("ButtonMenu")
                    self.enabled = false
                else
                    self.static_data.level_layout[self.current_scene+2]["location"] = 1
                    Scene.Load(self.next_scene)
                end
            else
                local is_alt = ((self.countdown - cur_frame) % 60) < 30
                if self.is_secret then
                    if is_alt then
                        if self.player_type == "Circle" then
                            self.player_sr.sprite = "true_goal"
                        else
                            self.player_sr.sprite = "gold"
                        end
                    else
                        if self.player_type == "Circle" then
                            self.player_sr.sprite = "Player_circle"
                        else
                            self.player_sr.sprite = "player"
                        end
                    end
                else
                    if is_alt then
                        self.player_sr.r = 0
                        self.player_sr.g = 0
                    else
                        self.player_sr.r = 255
                        self.player_sr.g = 255
                    end
                end
            end
        end
    end,

    OnTriggerEnter = function(self, contact)
        if contact.other:GetName() == "Player" then
            if self.current_scene + 1 == self.static_data.level_reached[self.player_type] then
                self.static_data.level_reached[self.player_type] = self.static_data.level_reached[self.player_type] + 1
            end
            local grapple = Actor.Find("Grapple")
            local player_rb = contact.other:GetComponent("Rigidbody")
            if grapple ~= nil then
                Actor.Destroy(grapple)
            end
            if self.is_secret then
                if self.player_type == "Circle" then
                    self.static_data.secrets_found[self.current_scene + 1]["Circle"] = true
                else
                    self.static_data.secrets_found[self.current_scene + 1]["Square"] = true
                end
            end
            if self.static_data.mute_mode == false then
                Audio.PlaySound("pie_collect.mp3", 4, false)
            end
            self.player_sr = contact.other:GetComponent("SpriteRenderer")
            self.countdown = Application.GetFrame() + 180
            self.actor:GetComponent("SpriteRenderer").enabled = false
            contact.other:GetComponentByKey("Manager").enabled = false
            player_rb:SetGravityScale(0)
            player_rb:SetVelocity(Vector2(0,0))
        end
    end
}