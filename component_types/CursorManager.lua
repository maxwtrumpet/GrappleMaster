-- The component for handling the cursor.

CursorManager = {

    -- Whether or not the cursor is restricted for grappling.
    restricted = true,

    -- On Start function:
    -- Get the Rigidbody component.
    OnStart = function(self)
        self.rb = self.actor:GetComponent("Rigidbody")
    end, -- ON START

    -- On Update function:
    -- Calculate distance between mouse and camera positions.
    -- If cursor is restricted and will be more than 5 game units away, don't let it move.
    -- Update the Rigidbody location.
    OnUpdate = function(self)

        local camera_pos = Camera.GetPosition()
        local position = Input.GetMousePosition()
        local distance = Vector2(position.x - camera_pos.x, position.y - camera_pos.y)

        if self.restricted and distance:Length() > 5 then
            distance:Normalize()
            position = Vector2(camera_pos.x + distance.x * 5, camera_pos.y + distance.y * 5)
            Input.SetMousePosition(position)
        end -- RESTRICTED AND GOING TOO FAR

        self.rb:SetPosition(position)

    end -- ON UPDATE

} -- CURSOR MANAGER