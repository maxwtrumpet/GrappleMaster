-- The ButtonAction component for the File Button on the file menu.

ButtonFile = {

    -- Save/Load mode, file number, and player types.
    mode = "save",
    file = 1,
    player_types = {"Square", "Circle"},

    -- On Start function:
    -- Get static data and file display.
    -- Get file number.
    OnStart = function (self)

        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        self.display = Actor.FindAll("File Display")[self.file]:GetComponent("FileDisplay")

        self.actor:GetComponent("TextRenderer").text = "File " .. self.file

    end, -- ON START

    -- On Click function.
    OnClick = function (self)

        -- If this is the save menu:
        -- Open save file in write mode and assert it's open.
        -- Transfer current game static data to file data and close the file when done.
        -- Update the display data and play the success sound.
        if self.mode == "save" then

            local file_path = Application.FullPath("resources/.saves/save_" .. tostring(self.file))
            local save = io.open(file_path, "w")
            assert(save ~= nil, "Problem opening save")
            io.output(save)

            io.write("Deaths: " .. self.sd.deaths .. "\n")
            for i = 1, 2, 1 do
                io.write(self.player_types[i] .. ":\n    Reached: " .. self.sd.level_reached[self.player_types[i]] .. "\n    Progress:")
                for index, value in ipairs(self.sd.player_progress) do
                    io.write(" " .. tostring(value[self.player_types[i]]))
                end -- PLAYER PROGRESS LOOP
                io.write("\n    Secrets:")
                for index, value in ipairs(self.sd.secrets_found) do
                    io.write(" " .. tostring(value[self.player_types[i]]))
                end -- SECRETS FOUND LOOP
                io.write("\n")
            end -- PLAYER TYPE LOOP
            io.close(save)

            self.display:UpdateData()
            Audio.PlaySound("pie_collect.mp3", 4, false)

        -- Otherwise, this is the load menu:
        else

            -- If selected file exists:
            -- Update the load data again just to be sure.
            -- Transfer file data to current game static data.
            -- Update the menu music based on secrets collected and play the success sound.
            if self.display.exists == true then

                self.display:UpdateData()

                self.sd.deaths = self.display.deaths
                self.sd.level_reached["Square"] = self.display.level_reached["Square"]
                self.sd.level_reached["Circle"] = self.display.level_reached["Circle"]
                for index, value in ipairs(self.sd.player_progress) do
                    value["Square"] = self.display.player_progress[index]["Square"]
                    value["Circle"] = self.display.player_progress[index]["Circle"]
                end -- PLAYER PROGRESS LOOP
                for index, value in ipairs(self.sd.secrets_found) do
                    value["Square"] = self.display.secrets_found[index]["Square"]
                    value["Circle"] = self.display.secrets_found[index]["Circle"]
                end -- SECRETS FOUND LOOP

                local all_found = true
                for index, value in ipairs(self.sd.secrets_found) do
                    if value["Circle"] == false then
                        all_found = false
                        break
                    end -- SECRET NOT FOUND
                end -- SECRETS LOOP
                if all_found == true then
                    self.sd:UpdateMusic(12, "Circle")
                else
                    self.sd:UpdateMusic(12, "Square")
                end -- MENU MUSIC UPDATE
                Audio.PlaySound("pie_collect.mp3", 4, false)

            end -- FILE EXISTS

        end -- MODE CHECK

    end -- ON CLICK

} -- BUTTON FILE