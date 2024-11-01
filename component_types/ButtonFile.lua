ButtonFile = {

    mode = "save",
    file = 1,
    player_types = {"Square", "Circle"},

    OnStart = function (self)
        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        self.actor:GetComponent("TextRenderer").text = "File " .. self.file
        self.display = Actor.FindAll("File Display")[self.file]:GetComponent("FileDisplay")
    end,

    OnClick = function (self)
        if self.mode == "save" then
            if self.sd.mute_mode == false then
                Audio.PlaySound("pie_collect.mp3", 4, false)
            end
            local save = io.open("resources/.saves/save_" .. tostring(self.file), "w")
            assert(save ~= nil, "Problem opening save")
            io.output(save)
            io.write("Deaths: " .. self.sd.deaths .. "\n")
            for i = 1, 2, 1 do
                io.write(self.player_types[i] .. ":\n    Reached: " .. self.sd.level_reached[self.player_types[i]] .. "\n    Progress:")
                for index, value in ipairs(self.sd.player_progress) do
                    io.write(" " .. tostring(value[self.player_types[i]]))
                end
                io.write("\n    Secrets:")
                for index, value in ipairs(self.sd.secrets_found) do
                    io.write(" " .. tostring(value[self.player_types[i]]))
                end
                io.write("\n")
            end
            io.close(save)
            self.display:UpdateData()
        else
            if self.display.exists == true then
                self.display:UpdateData()
                if self.sd.mute_mode == false then
                    Audio.PlaySound("pie_collect.mp3", 4, false)
                end
                self.sd.deaths = self.display.deaths
                self.sd.level_reached["Square"] = self.display.level_reached["Square"]
                self.sd.level_reached["Circle"] = self.display.level_reached["Circle"]
                for index, value in ipairs(self.sd.player_progress) do
                    value["Square"] = self.display.player_progress[index]["Square"]
                    value["Circle"] = self.display.player_progress[index]["Circle"]
                end
                for index, value in ipairs(self.sd.secrets_found) do
                    value["Square"] = self.display.secrets_found[index]["Square"]
                    value["Circle"] = self.display.secrets_found[index]["Circle"]
                end
                local all_found = true
                for index, value in ipairs(self.sd.secrets_found) do
                    if value["Circle"] == false then
                        all_found = false
                        break
                    end
                end
                if all_found == true then
                    self.sd:UpdateMusic(12, "Circle")
                else
                    self.sd:UpdateMusic(12, "Square")
                end
            end
        end
    end
}