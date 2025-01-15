-- The component for handling the cursor.

CursorManager = {

    -- Whether or not the cursor is restricted for grappling.
    restricted = true,

    -- On Start function:
    -- Get the Rigidbody component.
    OnStart = function(self)
        self.rb = self.actor:GetComponent("Rigidbody2D")
    end, -- ON START

    -- On Update function:
    -- Calculate distance between mouse and camera positions.
    -- If cursor is restricted and will be more than 5 game units away, don't let it move.
    -- Update the Rigidbody location.
    OnUpdate = function(self)

        local position = Input.GetMousePosition()
        --Debug.Log("(" .. position.x .. "," .. position.y .. ")")

        if self.restricted and Vector2.Length(position) > 5 then
            position = Vector2.Normalize(position)
            position.x = position.x * 5
            position.y = position.y * 5
            Input.SetMousePosition(position)
        end -- RESTRICTED AND GOING TOO FAR

        self.rb:SetPosition(position)

    end -- ON UPDATE

} -- CURSOR MANAGER