-- The component for collecting a pie peice.

PieCollect = {

    -- Countdown after collection.
    countdown = -1,

    -- Current and next scene.
    next_scene = "level",
    current_scene = 0,

    -- On Start function:
    -- Get Static Data, secret status, and current/next scene.
    OnStart = function (self)
        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        self.is_secret = self.actor:GetName() == "Secret"
        self.current_scene = Actor.Find("LevelLoader"):GetComponent("LevelLoader").current_scene
        self.next_scene = self.next_scene .. tostring(self.current_scene + 1)
    end, -- ON START

    -- On Update function:
    OnUpdate = function(self)

        -- If piece has been collected:
        if self.countdown ~= -1 then

            -- If countdown has ended:
            local cur_frame = Application.GetFrame()
            if self.countdown <= cur_frame then

                -- If this is the last level:
                -- Reset the player color and scale.
                -- If this is a secret piece, make ending based on if all secrets are collected.
                -- Otherwise, always do the normal ending.
                -- Instantiate the menu button and disable this component.
                if self.next_scene == "level12" then

                    self.player_sr.r = 255
                    self.player_sr.g = 255
                    self.player_sr.x_scale = 0.425
                    self.player_sr.y_scale = 0.425

                    if self.is_secret then
                        if self.sd.player_type == "Circle" then
                            Actor.Instantiate("FinalEnding")
                        else
                            Actor.Instantiate("TrueEnding")
                        end -- CREATE GOOD ENDINF
                        self.player_sr.sprite = "true_goal"
                        for index, value in ipairs(self.sd.secrets_found) do
                            if value[self.sd.player_type] == false then
                                if self.sd.player_type == "Circle" then
                                    Actor.Destroy("FinalEnding")
                                else
                                    Actor.Destroy("TrueEnding")
                                end -- GET RID OF GOOD ENDING
                                Actor.Instantiate("NormalEnding")
                                self.player_sr.sprite = "goal"
                                break
                            end -- SECRET NOT FOUND
                        end -- SECRETS LOOP

                    else
                        Actor.Instantiate("NormalEnding")
                        self.player_sr.sprite = "goal"
                    end -- SECRET STATUS

                    Actor.Instantiate("ButtonMenu"):GetComponent("Rigidbody2D"):SetPosition(Vector2(0,-2))
                    self.enabled = false

                -- Otherwise, load the next scene.
                else
                    self.sd.level_layout[self.current_scene+2]["location"] = 1
                    Scene.Load(self.next_scene)
                end -- CURRENT LEVEL

            -- Otherwise:
            -- Determine if the sprite is normal or altered.
            -- Change the sprite based on that, secret status, and player type.
            else

                local is_alt = ((self.countdown - cur_frame) % 60) < 30

                if self.is_secret then
                    if is_alt then
                        if self.sd.player_type == "Circle" then
                            self.player_sr.sprite = "true_goal"
                        else
                            self.player_sr.sprite = "gold"
                        end -- PLAYER TYPE STATUS
                    else
                        if self.sd.player_type == "Circle" then
                            self.player_sr.sprite = "Player_circle"
                        else
                            self.player_sr.sprite = "player"
                        end -- PLAYER TYPE STATUS
                    end -- ALT STATUS
                else
                    if is_alt then
                        self.player_sr.r = 0
                        self.player_sr.g = 0
                    else
                        self.player_sr.r = 255
                        self.player_sr.g = 255
                    end -- ALT STATUS
                end -- SECRET STATUS

            end -- COUNTDOWN STATUS

        end -- PIE COLLECTED

    end, -- ON UPDATE

    -- On Trigger enter 2D function:
    -- Confirm the trigger was caused by the player and they still exist.
    -- Update the level reached and secrets found if applicable.
    -- Set the countdown frame and turn off pie sprite.
    -- Immobilize player and get their SpriteRenderer.
    -- Destroy grapple and pause menu actors if applicable.
    -- Play the collect sound.
    OnTriggerEnter2D = function(self, contact)

        if contact.other:GetName() == "Player" and Actor.Find("Player") ~= nil then

            if self.current_scene + 1 == self.sd.level_reached[self.sd.player_type] then
                self.sd.level_reached[self.sd.player_type] = self.sd.level_reached[self.sd.player_type] + 1
            end -- FIRST TIME COLLECTING PIE PIECE
            if self.is_secret then
                self.sd.secrets_found[self.current_scene + 1][self.sd.player_type] = true
            end -- IS SECRET

            self.countdown = Application.GetFrame() + 180
            self.actor:GetComponent("SpriteRenderer").enabled = false

            contact.other:GetComponentByKey("Manager").enabled = false
            local player_rb = contact.other:GetComponent("Rigidbody2D")
            player_rb:SetGravityScale(0)
            player_rb:SetVelocity(Vector2(0,0))
            self.player_sr = contact.other:GetComponent("SpriteRenderer")

            local grapple = Actor.Find("Grapple")
            if grapple ~= nil then
                Actor.Destroy(grapple)
            end -- GRAPPLE EXISTS
            local pause = Actor.Find("Pause")
            if pause ~= nil then
                Actor.Destroy(pause)
                Actor.Destroy(Actor.Find("Backdrop"))
                Actor.Destroy(Actor.Find("ButtonMenu"))
                Actor.Destroy(Actor.Find("ButtonHint"))
                Actor.Destroy(Actor.Find("ButtonBack"))
                Actor.Destroy(Actor.Find("ButtonResume"))
                local hint = Actor.Find("Hint")
                if hint ~= nil then
                    Actor.Destroy(hint)
                end -- HINT EXISTS
            end -- IN PAUSE MENU

            Audio.PlaySound("pie_collect.mp3", 4, false)

        end -- PLAYER TRIGGER THAT EXISTS

    end -- ON TRIGGER ENTER 2D

} -- PIE COLLECT