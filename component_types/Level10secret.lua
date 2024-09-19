Level10secret = {

    OnStart = function(self)
        self.cp = self.actor:GetComponent("Checkpoint")
        self.blocks = {Vector2(31,-6),Vector2(31,-7),Vector2(31,-8),Vector2(31,-9),Vector2(31,-10),Vector2(31,-11)}
    end,

    OnUpdate = function(self)
        if self.cp.enabled == false then
            for i, v in ipairs(self.blocks) do
                local cur_block = Actor.Instantiate("Fragile")
                cur_block:GetComponent("Rigidbody"):SetPosition(v)
            end
            local cur_block = Actor.Instantiate("Kill")
            cur_block:GetComponent("Rigidbody"):SetPosition(Vector2(23,-2))
            self.enabled = false
        end
    end

}