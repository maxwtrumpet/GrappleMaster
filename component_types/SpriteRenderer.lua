-- The component for rendering sprites.

SpriteRenderer = {

	-- The sprite file.
	sprite = "???",

	-- Color properties.
	r = 255,
	g = 255,
	b = 255,
	a = 255,

	-- Sorting order.
	sorting_order = 0,

	-- Scale, offset from Rigidbody, and pivot.
	x_scale = 1.0,
	y_scale = 1.0,
	x_offset = 0,
	y_offset = 0,
	x_pivot = 0.5,
	y_pivot = 0.5,

	-- Image rotation.
	rot_degrees = 0,

	-- On Start function:
	-- Initialize position to start as the offset.
	OnStart = function (self)
        self.x = self.x_offset
        self.y = self.y_offset
    end, -- ON START

	-- On Update function:
	-- If actor has a Rigidbody, use that to get position and rotation.
	-- Draw the image with all the given settings.
	OnUpdate = function(self)

		self.rb = self.actor:GetComponent("Rigidbody")
		if self.rb ~= nil then
			local cur_pos = self.rb:GetPosition()
			self.x = cur_pos.x
			self.y = cur_pos.y
			self.rot_degrees = self.rb:GetRotation()
		end -- HAS RIGIDBODY

		Image.Draw(self.sprite, self.x + self.x_offset, self.y + self.y_offset, self.rot_degrees, self.x_scale, self.y_scale, self.x_pivot, self.y_pivot, self.r, self.g, self.b, self.a, self.sorting_order)

	end -- ON UPDATE

} -- SPRITE RENDERER