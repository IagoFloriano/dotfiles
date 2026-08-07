---------------------
---- KEYBINDINGS ----
---------------------
-- See https://wiki.hypr.land/Configuring/Basics/Binds/

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local menu = "rofi -show drun"
local menu2 = "rofi -show run"
local terminal = "alacritty"
local fileManager = "pcmanfm"
local browser = "firefox"

-- Audio volume control
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 5"), { locked = true, repeating = true })                   -- increase volume by 5%
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 5"), { locked = true, repeating = true })                   -- decrease volume by 5%
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pamixer -t"), { locked = true, repeating = true })                            -- toggles mute
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, repeating = true })                  -- play/pause using playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true, repeating = true })                        -- next song using playerctl
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true, repeating = true })                    -- previous song using playerctl
hl.bind("SHIFT + XF86AudioPlay", hl.dsp.exec_cmd("rhythmbox-client --play-pause"), { locked = true, repeating = true }) -- play/pause on rhythmbox
hl.bind("SHIFT + XF86AudioNext", hl.dsp.exec_cmd("rhythmbox-client --next"), { locked = true, repeating = true })       -- next song on rhythmbox
hl.bind("SHIFT + XF86AudioPrev", hl.dsp.exec_cmd("rhythmbox-client --previous"), { locked = true, repeating = true })   -- previous song on rhythmbox

-- Window control
hl.bind(mainMod .. "+ C", hl.dsp.window.close())                                               -- Closes window in focus
hl.bind(mainMod .. "+ T", hl.dsp.window.float({ action = "toggle", window = "activewindow" })) -- Toggles window floating
hl.bind(mainMod .. "+ 0", hl.dsp.window.pin({ action = "toggle", window = "activewindow" }))   -- Pins the current window to all workspaces (toggle)
hl.bind(mainMod .. "+ SHIFT + Q", hl.dsp.exit())                                               -- Logs out
hl.bind(mainMod .. "+ SHIFT + F",
  hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle", window = "activewindow" }))
hl.bind(mainMod .. "+ CONTROL + F",
  hl.dsp.window.fullscreen_state({ internal = 2, client = 0, action = "set", window = "activewindow" }))
hl.bind(mainMod .. "+ ALT + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle"}))
hl.bind(mainMod .. "+ ALT + F", hl.dsp.group.toggle())
hl.bind(mainMod .. "+ equal", hl.dsp.window.alter_zorder({ mode = "top" }))
hl.bind(mainMod .. "+ minus", hl.dsp.window.alter_zorder({ mode = "bottom" }))

-- -- System
hl.bind(mainMod .. "+ SHIFT + Escape", hl.dsp.exec_cmd("/home/yv/bin/myshutdown"))   -- shutdown menu
hl.bind("Print", hl.dsp.exec_cmd("/home/yv/bin/waylandscreenshot"))                  -- screenshot
hl.bind(mainMod .. "+ Print", hl.dsp.exec_cmd("/home/yv/bin/waylandfullscreenshot")) -- screenshot
hl.bind(mainMod .. "+ Escape", hl.dsp.exec_cmd("hyprlock"))                          -- Lock screen
hl.bind(mainMod .. "+ SHIFT + equal", hl.dsp.exec_cmd("killall waybar; waybar"))     -- restart waybar

-- Master layout binds
hl.bind(mainMod .. "+ J", hl.dsp.layout("cyclenext"), { repeating = true })                  -- Cycle to the next window on the stack
hl.bind(mainMod .. "+ K", hl.dsp.layout("cycleprev"), { repeating = true })                  -- Cycle to the prev window on the stack
hl.bind(mainMod .. "+ SHIFT + J", hl.dsp.layout("swapnext"), { repeating = true })           -- Swap with the next window on the stack
hl.bind(mainMod .. "+ SHIFT + K", hl.dsp.layout("swapprev"), { repeating = true })           -- Swap with the prev window on the stack
hl.bind(mainMod .. "+ M", hl.dsp.layout("focusmaster master"), { repeating = true })         -- Focus the master window
hl.bind(mainMod .. "+ RETURN", hl.dsp.layout("swapwithmaster master"), { repeating = true }) -- Swap with the master window
hl.bind(mainMod .. "+ H", hl.dsp.layout("mfact -0.03"), { repeating = true })                -- Shrinks the master area
hl.bind(mainMod .. "+ L", hl.dsp.layout("mfact +0.03"), { repeating = true })                -- Grows the master area
hl.bind(mainMod .. "+ EQUAL", hl.dsp.layout("mfact exact 0.50"), { repeating = true })       -- Resets master area

-- Change monitor focus
hl.bind(mainMod .. "+ PERIOD", hl.dsp.focus({ monitor = "+1" }), { repeating = true })
hl.bind(mainMod .. "+ COMMA", hl.dsp.focus({ monitor = "-1" }), { repeating = true })

hl.bind(mainMod .. "+ SHIFT + PERIOD", hl.dsp.focus({ monitor = "DP-1" }), { repeating = true })
hl.bind(mainMod .. "+ SHIFT + PERIOD", hl.dsp.cursor.move({ x = "960", y = "540" }), { repeating = true })

hl.bind(mainMod .. "+ SHIFT + COMMA", hl.dsp.focus({ monitor = "DP-2" }), { repeating = true })
hl.bind(mainMod .. "+ SHIFT + COMMA", hl.dsp.cursor.move({ x = "-720", y = "930" }), { repeating = true })

-- Launch apps
hl.bind(mainMod .. "+ P", hl.dsp.exec_cmd(menu))                          --  Open run prompt
hl.bind(mainMod .. "+ CONTROL + P", hl.dsp.exec_cmd(menu2))               --  Open run prompt
hl.bind(mainMod .. "+ SHIFT + RETURN", hl.dsp.exec_cmd(terminal))         --  Opens terminal
hl.bind(mainMod .. "+ SHIFT + H", hl.dsp.exec_cmd(terminal .. "-e htop")) --  Opens htop
hl.bind(mainMod .. "+ F", hl.dsp.exec_cmd(fileManager))                   --  Opens file manager
hl.bind(mainMod .. "+ F4", hl.dsp.exec_cmd("pavucontrol"))                --  Opens pavucontrol
hl.bind(mainMod .. "+ B", hl.dsp.exec_cmd(browser))                       --  Opens browser
hl.bind(mainMod .. "+ D", hl.dsp.exec_cmd("discord"))                     --  Opens discord
hl.bind(mainMod .. "+ G", hl.dsp.exec_cmd("gimp"))                        --  Opens gimp
hl.bind(mainMod .. "+ U", hl.dsp.exec_cmd("godot"))                       --  Opens godot
hl.bind(mainMod .. "+ Y", hl.dsp.exec_cmd("freetube"))                    --  Opens freetube
hl.bind(mainMod .. "+ SHIFT + P", hl.dsp.exec_cmd("hyprpicker -a"))       --  Opens color picker
hl.bind(mainMod .. "+ SHIFT + U", hl.dsp.exec_cmd("krita"))               --  Opens krita
hl.bind(mainMod .. "+ ALT + Q", hl.dsp.exec_cmd("qbittorrent"))           --  Torrent
hl.bind(mainMod .. "+ ALT + C", hl.dsp.exec_cmd("galculator"))            --  Galculator
hl.bind(mainMod .. "+ ALT + D", hl.dsp.exec_cmd("gsimplecal"))            --  Calendar
hl.bind(mainMod .. "+ ALT + J", hl.dsp.exec_cmd("wl-copy $(jome)"))       --  Emoji selector
hl.bind(mainMod .. "+ ALT + R", hl.dsp.exec_cmd("rhythmbox"))             --  Emoji selector

-- Permapastebin
hl.bind(mainMod .. "+ V", hl.dsp.exec_cmd("/home/yv/bin/permpastebin"))          --  Open perma pastebing selection prompt
hl.bind(mainMod .. "+ CONTROL + V", hl.dsp.exec_cmd("/home/yv/bin/addpastebin")) --  Open perma pastebing addition prompt
hl.bind(mainMod .. "+ ALT + V", hl.dsp.exec_cmd("/home/yv/bin/rmvpastebin"))     --  Open perma pastebing remotion prompt

-- Switch workspaces with mainMod + [1-9]
for i = 1, 9 do
  hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i, on_current_monintor = true }))
  hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- bind = $mainMod, 1, focusworkspaceoncurrentmonitor, 1
-- bind = $mainMod, 2, focusworkspaceoncurrentmonitor, 2
-- bind = $mainMod, 3, focusworkspaceoncurrentmonitor, 3
-- bind = $mainMod, 4, focusworkspaceoncurrentmonitor, 4
-- bind = $mainMod, 5, focusworkspaceoncurrentmonitor, 5
-- bind = $mainMod, 6, focusworkspaceoncurrentmonitor, 6
-- bind = $mainMod, 7, focusworkspaceoncurrentmonitor, 7
-- bind = $mainMod, 8, focusworkspaceoncurrentmonitor, 8
-- bind = $mainMod, 9, focusworkspaceoncurrentmonitor, 9
--
-- -- Move active window to a workspace with mainMod + SHIFT + [0-9]
-- bind = $mainMod SHIFT, 1, movetoworkspacesilent, 1
-- bind = $mainMod SHIFT, 2, movetoworkspacesilent, 2
-- bind = $mainMod SHIFT, 3, movetoworkspacesilent, 3
-- bind = $mainMod SHIFT, 4, movetoworkspacesilent, 4
-- bind = $mainMod SHIFT, 5, movetoworkspacesilent, 5
-- bind = $mainMod SHIFT, 6, movetoworkspacesilent, 6
-- bind = $mainMod SHIFT, 7, movetoworkspacesilent, 7
-- bind = $mainMod SHIFT, 8, movetoworkspacesilent, 8
-- bind = $mainMod SHIFT, 9, movetoworkspacesilent, 9
--
-- Move to last workspace
hl.bind(mainMod .. "+ TAB", hl.dsp.focus({ workspace = "previous_per_monitor" }))


-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Global shortcuts
hl.bind("XF86Launch6", hl.dsp.pass({ window = "class:^(discord)$" }))
hl.bind("XF86Launch7", hl.dsp.pass({ window = "class:^(discord)$" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. "+ mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. "+ mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Zoom
hl.bind(mainMod .. "+ mouse:274", hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor 1f"),
  { mouse = true, release = true })
hl.bind(mainMod .. "+ mouse:274", hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor 2.5f"), { mouse = true })
