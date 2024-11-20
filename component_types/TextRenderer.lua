-- The component for rendering sprites.

TextRenderer = {

    -- The text and font type.
    text = "Sample text",
    font_name = "Minecraft",

    -- Color properties.
    r = 0,
    g = 0,
    b = 0,
    a = 255,

    -- Sorting order.
	sorting_order = 0,

    -- Size ,rotation, and offset/pivot points.
    size = 50,
    rotation = 0,
    x_offset = 0,
    y_offset = 0,
    x_pivot = 0.5,
    y_pivot = 0.5,

    -- On Start function:
	-- Initialize position to start as the offset.
	OnStart = function (self)
        self.x = self.x_offset
        self.y = self.y_offset
    end, -- ON START

    -- On Update function:
	-- If actor has a Rigidbody, use that to get position and rotation.
	-- Draw the text with all the given settings.
	OnUpdate = function(self)

		self.rb = self.actor:GetComponent("Rigidbody")
		if self.rb ~= nil then
			local cur_pos = self.rb:GetPosition()
			self.x = cur_pos.x
			self.y = cur_pos.y
			self.rot_degrees = self.rb:GetRotation()
		end -- HAS RIGIDBODY

        Text.Draw(self.text, self.font_name, self.x + self.x_offset, self.y + self.y_offset, self.rotation, self.size, self.x_pivot, self.y_pivot, self.r, self.g, self.b, self.a, self.sorting_order)

    end -- ON UPDATE

} -- TEXT RENDERER