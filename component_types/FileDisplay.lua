FileDisplay = {

    file = 1,
    exists = false,

    deaths = 0,
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
    completion = 0,
    total = 110,

    UpdateData = function (self)
        local save = io.open("resources/.saves/save_" .. tostring(self.file), "r")
        if save == nil then
            self.tr.text = "Empty"
            self.exists = false
        else
            self.exists = true
            self.completion = 0
            io.input(save)
            local deaths = io.read()
            self.deaths = tonumber(string.sub(deaths,9,string.len(deaths)))
            for i = 1, 2, 1 do
                local type = "Square"
                if i == 2 then
                    type = "Circle"
                end
                local reached = io.read()
                reached = io.read()
                self.level_reached[type] = tonumber(string.sub(reached,14,string.len(reached)))
                self.completion = self.completion + self.level_reached[type] - 1
                local progress = io.read()
                progress = string.sub(progress,15,string.len(progress))
                for j = 1, 11, 1 do
                    local space = string.find(progress, " ")
                    self.player_progress[j][type] = tonumber(string.sub(progress,1,space-1))
                    self.completion = self.completion + self.player_progress[j][type] -1
                    progress = string.sub(progress, space+1, string.len(progress))
                end
                self.player_progress[12][type] = tonumber(progress)
                self.completion = self.completion + self.player_progress[12][type] -1
                local secrets = io.read()
                secrets = string.sub(secrets,14,string.len(secrets))
                for j = 1, 11, 1 do
                    local space = string.find(secrets, " ")
                    if string.sub(secrets,1,space-1) == "false" then
                        self.secrets_found[j][type] = false
                    else
                        self.secrets_found[j][type] = true
                        self.completion = self.completion + 1
                    end
                    secrets = string.sub(secrets, space+1, string.len(secrets))
                end
                if secrets == "false" then
                    self.secrets_found[12][type] = false
                else
                    self.secrets_found[12][type] = true
                    self.completion = self.completion + 1
                end
            end
            local percentage = self.completion / self.total * 100
            if percentage == 100 then
                percentage = string.format("%.0f", tostring(percentage))
            elseif percentage < 10 then
                percentage = "0" .. string.format("%.1f", tostring(percentage))
            else
                percentage = string.format("%.1f", tostring(percentage))
            end
            local num_digits = math.ceil(self.deaths + 0.5/10)
            local middle_string = "%         "
            for i = 1, 4 - num_digits, 1 do
                middle_string = middle_string .. " "
            end
            self.tr.text = "Completion: " .. percentage .. middle_string .. deaths
            io.close(save)
        end
    end,

    OnStart = function (self)
        self.tr = self.actor:GetComponent("TextRenderer")
        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        self:UpdateData()
    end,
}