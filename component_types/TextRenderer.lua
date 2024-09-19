TextRenderer = {
    text = "Sample text",
    x_centered = true,
    y_centered = true,
    r = 0,
    g = 0,
    b = 0,
    a = 255,
    size = 50,
    sorting_order = 0,
    rotation = 0,
    font_name = "Minecraft",
    x_offset = 0,
    y_offset = 0,
    x_pivot = 0.5,
    y_pivot = 0.5,

    OnStart = function (self)
        self.x = self.x_offset
        self.y = self.y_offset
    end,

    OnUpdate = function (self)
        
        self.rb = self.actor:GetComponent("Rigidbody")
		if self.rb ~= nil then
			local cur_pos = self.rb:GetPosition()
			self.x = cur_pos.x
			self.y = cur_pos.y
			self.rot_degrees = self.rb:GetRotation()
		end
        
        Text.DrawEx(self.text, self.font_name, self.x + self.x_offset, self.y + self.y_offset, self.rotation, self.size, self.x_pivot, self.y_pivot, self.r, self.g, self.b, self.a, self.sorting_order)
    end
}