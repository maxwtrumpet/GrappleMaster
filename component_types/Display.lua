Display = {

    OnStart = function (self)
        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        self.sr = self.actor:GetComponent("SpriteRenderer")
        self.trs = self.actor:GetComponents("TextRenderer")
    end,

    Update = function (self, layer)
        local version = "Square"
        if layer == 1 then
            version = "Circle"
        end
        local so = 101 + (layer - 1) * 2
        self.sr.sorting_order = so - 1
        for index, value in ipairs(self.trs) do
            value.sorting_order = so
            if index == 13 then
                local deaths = tostring(self.sd.fewest_death[version])
                if self.sd.fewest_death[version] == math.maxinteger then
                    deaths = "--"
                elseif #deaths > 3 then
                    deaths = "999"
                end
                local time = ""
                if self.sd.best_time[version] == math.maxinteger then
                    time = "--:--:---"
                elseif self.sd.best_time[version] >= 360000 then
                    time = "99:59:999"
                else
                    local remaining = self.sd.best_time[version] / 60
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
                    time = tostring(minutes) .. ":" .. seconds .. ":" .. string.sub(string.format("%.2f", tostring(milliseconds)),3)
                end
                value.text = "Full Playthrough: " .. deaths .. " Deaths, " .. time
            else
                local deaths = tostring(self.sd.fewest_deaths[index][version])
                if self.sd.fewest_deaths[index][version] == math.maxinteger then
                    deaths = "--"
                elseif #deaths > 3 then
                    deaths = "999"
                end
                local time = ""
                if self.sd.best_times[index][version] == math.maxinteger then
                    time = "--:--:---"
                elseif self.sd.best_times[index][version] >= 360000 then
                    time = "99:59:999"
                else
                    local remaining = self.sd.best_times[index][version] / 60
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
                    time = tostring(minutes) .. ":" .. seconds .. ":" .. string.sub(string.format("%.2f", tostring(milliseconds)),3)
                end
                value.text = "Level " .. index .. ": " .. deaths .. " Deaths, " .. time
            end
        end
    end
}