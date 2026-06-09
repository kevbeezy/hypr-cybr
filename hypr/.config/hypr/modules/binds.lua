---------------------
---- MY PROGRAMS ----
---------------------
-- Go To (gf) ../hyprland.lua
-- Set programs that you use
local terminal    = "kitty"
local fileManager = "kitty -e yazi"
local menu        = "~/.config/rofi/type-2/launcher.sh"
local command     = "rofi -show run"
local browser     = "zen-browser"
local editor      = "neovide"

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local secondMod = "SUPER + SHIFT" -- Sets "Windows + Shift" as second modifier
local thirdMod = "SUPER + CTRL" -- Sets "Windows + Ctrl" as third modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(editor))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("~/.config/waybar/scripts/settings.sh"))
hl.bind("ALT + P", hl.dsp.exec_cmd("hyprpicker -a -n"))
local closeWindowBind = hl.bind(thirdMod .. " + W", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(secondMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("ALT + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(command))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(thirdMod .. " + I", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Taking a screenshot
hl.bind(secondMod .. " + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind(thirdMod .. " + S", hl.dsp.exec_cmd("hyprshot -m window --clipboard-only"))

-- Kill selected window
hl.bind(mainMod .. " + DELETE", hl.dsp.exec_cmd("hyprctl kill | notify-send 'Kill Ready' 'Select A Window To Kill'"))

-- Locking the screen
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("hyprlock"))

-- Clipboard History
hl.bind(secondMod .. " + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy"))

-- Move focus with mainMod + vim
hl.bind(mainMod .. " + h",  hl.dsp.focus({ direction = "left" }), { repeating = true })
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }), { repeating = true })
hl.bind(mainMod .. " + k",    hl.dsp.focus({ direction = "up" }), { repeating = true })
hl.bind(mainMod .. " + j",  hl.dsp.focus({ direction = "down" }), { repeating = true })

-- Move window with secondMod + vim
hl.bind(secondMod .. " + h",  hl.dsp.window.move({ direction = "left" }))
hl.bind(secondMod .. " + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(secondMod .. " + k",    hl.dsp.window.move({ direction = "up" }))
hl.bind(secondMod .. " + j",  hl.dsp.window.move({ direction = "down" }))

-- Resize window with thirdMod + vim
hl.bind(thirdMod .. " + h",  hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind(thirdMod .. " + l",  hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
hl.bind(thirdMod .. " + k",  hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
hl.bind(thirdMod .. " + j",  hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })

-- Alt+Tab (standard MRU)
hl.bind("ALT + Tab", hl.dsp.exec_cmd("snappy-switcher next --mod alt"))

-- Super+Tab (workspace-filtered)
hl.bind("SUPER + TAB", hl.dsp.exec_cmd("snappy-switcher next --workspace --mod super"))


hl.bind(secondMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(secondMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(secondMod .. " + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
-- hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Other Misc
hl.bind("PRINT + SPACE", hl.dsp.exec_cmd("~/.config/waybar/scripts/launch.sh")) --Reloads waybar
