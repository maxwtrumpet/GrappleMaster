ButtonSwitch = {

    text = {"Square","Circle"},
    index = 2,

    OnStart = function (self)
        self.actor:GetComponent("ButtonManager").enabled = false
        self.tr = self.actor:GetComponent("TextRenderer")
        local settings = Actor.FindAll("Display")
        self.displays = {}
        self.displays[1] = {}
        self.displays[2] = {}
        self.displays[1]["sr"] = settings[1]:GetComponent("SpriteRenderer")
        self.displays[1]["tr"] = settings[1]:GetComponents("TextRenderer")
        self.displays[2]["sr"] = settings[2]:GetComponent("SpriteRenderer")
        self.displays[2]["tr"] = settings[2]:GetComponents("TextRenderer")
    end,

    OnClick = function (self)
        self.index = (self.index % 2) + 1
        self.tr.text = self.text[self.index]
        local so_1 = ((self.displays[1]["sr"].sorting_order - 98) % 4) + 100
        local so_2 = ((self.displays[2]["sr"].sorting_order - 98) % 4) + 100
        self.displays[1]["sr"].sorting_order = so_1
        for index, value in ipairs(self.displays[1]["tr"]) do
            value.sorting_order = so_1 + 1
        end
        self.displays[2]["sr"].sorting_order = so_2
        for index, value in ipairs(self.displays[2]["tr"]) do
            value.sorting_order = so_2 + 1
        end
    end
}