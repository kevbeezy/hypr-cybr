-------------------
---- AUTOSTART ----
-------------------
-- Go To (gf) ../hyprland.lua
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function ()
   hl.exec_cmd("waybar")
   hl.exec_cmd("systemctl --user start hyprpolkitagent")
   hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")
   hl.exec_cmd("swaync")
   hl.exec_cmd("hypridle")
   hl.exec_cmd("hyprpaper")
   hl.exec_cmd("wl-paste --type text --watch cliphist -max-items 50 store &")
   hl.exec_cmd("wl-paste --type image --watch cliphist -max-items 50 store &")
   hl.exec_cmd("snappy-switcher --daemon")
   hl.exec_cmd("notify-send 'Remember To Edit apps.sh'")
 end)
