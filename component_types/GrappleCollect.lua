-- The component for the Grapple collectible in level 5.

GrappleCollect = {

    -- On Start function:
    -- Get Static Data.
    -- If player isn't starting at the beginning, immediately enable. 
    OnStart = function (self)

        self.sd = Actor.Find("StaticData"):GetComponent("StaticData")

        if self.sd.level_layout[5]["location"] > 1 then
            self:EnableGrapple(Actor.Find("Player"):GetComponentByKey("Manager"))
        end -- PLAYER 

    end, -- ON START

    -- Enable grapple function:
    -- Turn on player grapple ability, update music, and destroy self.
    -- Update the music.
    -- Destroy self.
    EnableGrapple = function (self, pm)
        pm.can_grapple = true
        self.sd:UpdateMusic(5)
        Actor.Destroy(self.actor)
    end, -- ENABLE GRAPPPLE

    -- On Trigger Enter function:
    -- Confirm the player triggered the event.
    -- Enable the grapple and play the collect sound.
    OnTriggerEnter = function(self, contact)

        local pm = contact.other:GetComponentByKey("Manager")
        if pm ~= nil then

            self:EnableGrapple(pm)
            Audio.PlaySound("pie_collect.mp3", 4, false)

        end -- PLAYER TRIGGER EVENT

    end -- ON TRIGGER ENTER

} -- GRAPPLE COLLECT