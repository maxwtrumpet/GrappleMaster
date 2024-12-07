-- Component for the Secret Level 10 checkpoint.

Level10secret = {

    -- Block locations to spawn.
    blocks = {Fragile = {Vector2(31,6),Vector2(31,7),Vector2(31,8),Vector2(31,9),Vector2(31,10),Vector2(31,11),Vector2(34,11),Vector2(35,11),Vector2(36,11),Vector2(39,12)},
              Kill = {Vector2(23,2),Vector2(2,5),Vector2(3,5),Vector2(4,5),Vector2(5,4),Vector2(5,5),Vector2(5,6),Vector2(6,4.5),Vector2(6,5.5),Vector2(7,5),Vector2(33,14),Vector2(33,13),Vector2(33,12),Vector2(33,11),Vector2(37,11),Vector2(38,11),Vector2(39,11),Vector2(40,11),Vector2(41,11),Vector2(42,11),Vector2(43,11),Vector2(36,7),Vector2(37,7),Vector2(38,7),Vector2(39,7),Vector2(40,7),Vector2(41,7),Vector2(42,7),Vector2(43,7)}},

    -- On Start function:
    -- Get Checkpoint component and Static Data.
    -- If level is starting on or after this checkpoint, immediately spawn the blocks.
    OnStart = function(self)

        self.cp = self.actor:GetComponent("Checkpoint")

        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")
        if self.sd.level_layout[11]["location"] > 3 then
            self:SpawnBlocks()
        end -- SPAWNED AFTER CHECKPOINT

    end, -- ON START

    -- On Update function:
    -- If checkpoint was reached spawn block and play success sound.
    OnUpdate = function(self)
        if self.cp.enabled == false then
            self:SpawnBlocks()
            Audio.PlaySound("pie_collect.mp3", 4, false)
        end -- CHECKPOINT REACHED
    end, -- ON UPDATE

    -- Spawn Blocks function:
    -- Spawn all stored blocks and disable this component.
    SpawnBlocks = function (self)
        for key, value in pairs(self.blocks) do
            for index, location in ipairs(value) do
                Actor.Instantiate(key):GetComponent("Rigidbody"):SetPosition(location)
            end -- BLOCK LOCATION LOOP
        end -- BLOCK TYPE LOOP
        self.enabled = false
    end

}