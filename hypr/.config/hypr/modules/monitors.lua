------------------
---- MONITORS ----
------------------
-- Go To (gf) ../hyprland.lua
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

   --- ACER MONITOR (Primary, Left, 144Hz) ---
-- Positioned at 0x0
hl.monitor({
    output = "DP-2",
    mode = "1920x1080@144",
    position = "0x0",
    scale = 1
})

   --- ANCOR MONITOR (Secondary, Right, 60Hz) ---
-- Positioned exactly to the right of the Acer (starting at pixel 1920)
hl.monitor({
    output = "DP-1",
    mode = "1920x1200@60",
    position = "1920x0",
    scale = 1
})

