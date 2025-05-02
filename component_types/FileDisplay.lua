-- The component for storing and displaying file data.

FileDisplay = {

    -- The file number and whether or not it exists.
    file = 1,
    exists = false,

    -- File data (death/secret count and level progress).
    deaths = 0,
    best_time = {Circle = math.maxinteger, Square = math.maxinteger},
    fewest_death = {Circle = math.maxinteger, Square = math.maxinteger},
    secrets_found = {
        {Circle = false, Square = false},
        {Circle = false, Square = false},
        {Circle = false, Square = false},
        {Circle = false, Square = false},
        {Circle = false, Square = false},
        {Circle = false, Square = false},
        {Circle = false, Square = false},
        {Circle = false, Square = false},
        {Circle = false, Square = false},
        {Circle = false, Square = false},
        {Circle = false, Square = false},
        {Circle = false, Square = false},
    },
    level_reached = {Circle = 1, Square = 1},
    player_progress = {
        {Circle = 1, Square = 1},
        {Circle = 1, Square = 1},
        {Circle = 1, Square = 1},
        {Circle = 1, Square = 1},
        {Circle = 1, Square = 1},
        {Circle = 1, Square = 1},
        {Circle = 1, Square = 1},
        {Circle = 1, Square = 1},
        {Circle = 1, Square = 1},
        {Circle = 1, Square = 1},
        {Circle = 1, Square = 1},
        {Circle = 1, Square = 1},
    },
    best_times = {
        {Circle = math.maxinteger, Square = math.maxinteger},
        {Circle = math.maxinteger, Square = math.maxinteger},
        {Circle = math.maxinteger, Square = math.maxinteger},
        {Circle = math.maxinteger, Square = math.maxinteger},
        {Circle = math.maxinteger, Square = math.maxinteger},
        {Circle = math.maxinteger, Square = math.maxinteger},
        {Circle = math.maxinteger, Square = math.maxinteger},
        {Circle = math.maxinteger, Square = math.maxinteger},
        {Circle = math.maxinteger, Square = math.maxinteger},
        {Circle = math.maxinteger, Square = math.maxinteger},
        {Circle = math.maxinteger, Square = math.maxinteger},
        {Circle = math.maxinteger, Square = math.maxinteger},
    },
    fewest_deaths = {
        {Circle = math.maxinteger, Square = math.maxinteger},
        {Circle = math.maxinteger, Square = math.maxinteger},
        {Circle = math.maxinteger, Square = math.maxinteger},
        {Circle = math.maxinteger, Square = math.maxinteger},
        {Circle = math.maxinteger, Square = math.maxinteger},
        {Circle = math.maxinteger, Square = math.maxinteger},
        {Circle = math.maxinteger, Square = math.maxinteger},
        {Circle = math.maxinteger, Square = math.maxinteger},
        {Circle = math.maxinteger, Square = math.maxinteger},
        {Circle = math.maxinteger, Square = math.maxinteger},
        {Circle = math.maxinteger, Square = math.maxinteger},
        {Circle = math.maxinteger, Square = math.maxinteger},
    },

    -- File and total completion points.
    completion = 0,
    total = 148,

    -- Update Data function.
    UpdateData = function (self)

        -- Get absolute file path and attempt to open the save.
        local file_path = Application.FullPath("resources/.saves/save_" .. tostring(self.file))
        local save = io.open(file_path, "r")

        -- If save doesn't exist, leave the text empty and mark the variable.
        if save == nil then
            self.tr.text = "Empty"
            self.exists = false

        -- Otherwise:
        else

            --  Mark the exists variable, reset the completion count, and update io input.
            self.exists = true
            self.completion = 0
            io.input(save)

            -- Read in the death count and convert it to a number.
            local deaths = io.read()
            self.deaths = tonumber(string.sub(deaths,9))

            -- For both player types:
            for i = 1, 2, 1 do

                -- Get the correct player type based on the iteration count.
                local type = "Square"
                if i == 2 then
                    type = "Circle"
                end -- CIRCLE TYPE

                -- Read in the player type and the number of levels reached, updating completion.
                local reached = io.read()
                reached = io.read()
                self.level_reached[type] = tonumber(string.sub(reached,14))
                self.completion = self.completion + self.level_reached[type] - 1

                local best = io.read()
                self.best_time[type] = tonumber(string.sub(best,16))

                local fewest = io.read()
                self.fewest_death[type] = tonumber(string.sub(fewest,20))

                -- Read in the progress line and get rid of the initial string.
                local progress = io.read()
                progress = string.sub(progress,15)

                -- Read in each level's progress value, updating completion.
                for j = 1, 11, 1 do
                    local space = string.find(progress, " ")
                    self.player_progress[j][type] = tonumber(string.sub(progress,1,space-1))
                    self.completion = self.completion + self.player_progress[j][type] -1
                    progress = string.sub(progress, space+1)
                end -- LEVEL LOOP
                self.player_progress[12][type] = tonumber(progress)
                self.completion = self.completion + self.player_progress[12][type] -1

                local times = io.read()
                times = string.sub(times,12)
                for j = 1, 11, 1 do
                    local space = string.find(times, " ")
                    self.best_times[j][type] = tonumber(string.sub(times,1,space-1))
                    times = string.sub(times, space+1)
                end -- LEVEL LOOP
                self.best_times[12][type] = tonumber(times)

                local death = io.read()
                death = string.sub(death,13)
                for j = 1, 11, 1 do
                    local space = string.find(death, " ")
                    self.fewest_deaths[j][type] = tonumber(string.sub(death,1,space-1))
                    death = string.sub(death, space+1)
                end -- LEVEL LOOP
                self.fewest_deaths[12][type] = tonumber(death)

                -- Read in the secrets line and get rid of the initial string.
                local secrets = io.read()
                secrets = string.sub(secrets,14)

                -- Read in each level's progress boolean and update accordingly.
                for j = 1, 11, 1 do
                    local space = string.find(secrets, " ")
                    if string.sub(secrets,1,space-1) == "false" then
                        self.secrets_found[j][type] = false
                    else
                        self.secrets_found[j][type] = true
                        self.completion = self.completion + 1
                    end -- SECRET STATUS
                    secrets = string.sub(secrets, space+1)
                end
                if secrets == "false" then
                    self.secrets_found[12][type] = false
                else
                    self.secrets_found[12][type] = true
                    self.completion = self.completion + 1
                end -- LAST LEVEL SECRET STATUS

            end -- PLAYER TYPE LOOP

            -- Calculate percentage and make a nicelu formatted string.
            local percentage = self.completion / self.total * 100
            if percentage == 100 then
                percentage = string.format("%.0f", tostring(percentage))
            elseif percentage < 10 then
                percentage = "0" .. string.format("%.1f", tostring(percentage))
            else
                percentage = string.format("%.1f", tostring(percentage))
            end -- PERCENTAGE DIGIT COUNT
            local num_digits = math.ceil(self.deaths + 0.5/10)
            local middle_string = "%         "
            for i = 1, 4 - num_digits, 1 do
                middle_string = middle_string .. " "
            end -- SPACE ADDING LOOP

            -- Update the text with percentage and death count and close the file.
            self.tr.text = "Completion: " .. percentage .. middle_string .. deaths
            io.close(save)

        end -- FILE STATUS

    end, -- UPDATE DATA

    -- On Start function:
    -- Get TextRenderer Component and run UpdataData function.
    OnStart = function (self)
        self.tr = self.actor:GetComponent("TextRenderer")
        self:UpdateData()
    end, -- ON START

} -- FILE DISPLAY