TimerManager = {
    update = true,
    OnStart = function (self)
        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        self.ll = Actor.Find("LevelLoader"):GetComponent("LevelLoader")
        self.tr = self.actor:GetComponent("TextRenderer")
        if self.sd.show_time then
            self.tr.enabled = true
            if self.sd.full_run then
                self.tr.y_position_offset = -0.5
                self.full_time = self.actor:AddComponent("TextRenderer")
                self.full_time.font = "Minecraft"
                self.full_time.r = 231
                self.full_time.g = 231
                self.full_time.b = 231
                self.full_time.x_alignment = 0.0
                self.full_time.sorting_order = 100
                local remaining = self.sd.total_time / 60
                local milliseconds = remaining % 1
                remaining = math.floor(remaining)
                local seconds = tostring(remaining % 60)
                if #seconds == 1 then
                    seconds = "0" .. seconds
                end
                local minutes = tostring(math.floor((remaining - seconds) / 60))
                if #minutes == 1 then
                    minutes = "0" .. minutes
                end
                self.full_time.text = tostring(minutes) .. ":" .. seconds .. ":" .. string.sub(string.format("%.2f", tostring(milliseconds)),3)
            end
        end
        Event.Subscribe("Win", self, self._OnWin)
    end,

    _OnWin = function (self, event)
        self.update = false
        if self.sd.valid_level then
            if self.sd.fewest_deaths[self.ll.current_scene + 1][self.sd.player_type] > self.sd.current_deaths then
                self.sd.fewest_deaths[self.ll.current_scene + 1][self.sd.player_type] = self.sd.current_deaths
            end
            if self.sd.best_times[self.ll.current_scene + 1][self.sd.player_type] > self.sd.current_time then
                self.sd.best_times[self.ll.current_scene + 1][self.sd.player_type] = self.sd.current_time
            end
        end
        self.sd.valid_level = true
        self.sd.current_deaths = 0
    end,

    OnUpdate = function (self)
        if self.sd.show_time then
            if self.update then
                if self.sd.current_time >= 360000 then
                    self.tr.text = "99:59:99"
                else
                    local remaining = self.sd.current_time / 60
                    local milliseconds = remaining % 1
                    remaining = math.floor(remaining)
                    local seconds = tostring(remaining % 60)
                    if #seconds == 1 then
                        seconds = "0" .. seconds
                    end
                    local minutes = tostring(math.floor((remaining - seconds) / 60))
                    if #minutes == 1 then
                        minutes = "0" .. minutes
                    end
                    self.tr.text = tostring(minutes) .. ":" .. seconds .. ":" .. string.sub(string.format("%.2f", tostring(milliseconds)),3)
                end
            end
            if self.sd.full_run then
                if self.sd.total_time >= 360000 then
                    self.full_time.text = "99:59:99"
                else
                    local remaining = self.sd.total_time / 60
                    local milliseconds = remaining % 1
                    remaining = math.floor(remaining)
                    local seconds = tostring(remaining % 60)
                    if #seconds == 1 then
                        seconds = "0" .. seconds
                    end
                    local minutes = tostring(math.floor((remaining - seconds) / 60))
                    if #minutes == 1 then
                        minutes = "0" .. minutes
                    end
                    self.full_time.text = tostring(minutes) .. ":" .. seconds .. ":" .. string.sub(string.format("%.2f", tostring(milliseconds)),3)
                end
            end
        end
    end
}