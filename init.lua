-- Mod Name: Time Freezer
-- Author: Stormwindsky
-- License: CC0 1.0 Universal
-- Description: Freezes the time of day at noon and stops the clock.

minetest.log("action", "[timefreezer] Initializing time freeze...")

-- Function to lock the world clock
local function lock_time()
    -- Sets time to 12:00 PM (midday)
    minetest.set_timeofday(0.5)
    
    -- Sets the progression speed of time to zero
    minetest.settings:set("time_speed", "0")
    
    minetest.log("action", "[timefreezer] Day/Night cycle disabled. Time is now frozen.")
end

-- Run the freeze when the server starts
minetest.register_on_mods_loaded(function()
    lock_time()
end)

-- Extra check to ensure time stays frozen when players join
minetest.register_on_joinplayer(function(player)
    minetest.settings:set("time_speed", "0")
end)
