Level10secret = {

    OnStart = function(self)
        self.cp = self.actor:GetComponent("Checkpoint")
        self.fragiles = {Vector2(31,-6),Vector2(31,-7),Vector2(31,-8),Vector2(31,-9),Vector2(31,-10),Vector2(31,-11),Vector2(34,-11),Vector2(35,-11),Vector2(36,-11),Vector2(39,-12)}
        self.kills = {Vector2(23,-2),Vector2(2,-5),Vector2(3,-5),Vector2(4,-5),Vector2(5,-4),Vector2(5,-5),Vector2(5,-6),Vector2(6,-4.5),Vector2(6,-5.5),Vector2(7,-5),Vector2(33,-14),Vector2(33,-13),Vector2(33,-12),Vector2(33,-11),Vector2(37,-11),Vector2(38,-11),Vector2(39,-11),Vector2(36,-7),Vector2(37,-7),Vector2(38,-7),Vector2(39,-7),Vector2(40,-7),Vector2(41,-7),Vector2(42,-7)}
        local player_type = nil
        if Actor.Find("Player"):GetComponent("CircleManager") == nil then
            player_type = "Square"
        else
            player_type = "Circle"
        end
        if Actor.Find("StaticData"):GetComponent("StaticData").player_progress[11][player_type] > 3 then
            self.cp.enabled = false
            self:SpawnBlocks()
        end
    end,

    OnUpdate = function(self)
        if self.cp.enabled == false then
            self:SpawnBlocks()
        end
    end,

    SpawnBlocks = function (self)
        for i, v in ipairs(self.fragiles) do
            local cur_block = Actor.Instantiate("Fragile")
            cur_block:GetComponent("Rigidbody"):SetPosition(v)
        end
        for i, v in ipairs(self.kills) do
            local cur_block = Actor.Instantiate("Kill")
            cur_block:GetComponent("Rigidbody"):SetPosition(v)
        end
        self.enabled = false
    end

}