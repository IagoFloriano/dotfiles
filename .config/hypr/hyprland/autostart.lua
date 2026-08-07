-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)

hl.on("hyprland.start", function()
  hl.exec_cmd("waybar")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("dunst")
  hl.exec_cmd("lxqt-policykit-agent")
  hl.exec_cmd("volumeicon &")
  hl.exec_cmd("nm-applet &")
  hl.exec_cmd("discord")
  hl.exec_cmd("whatsdesk")
  -- hl.exec_cmd("Telegram")
  hl.exec_cmd("thunderbird")
  hl.exec_cmd("qbittorrent")
  hl.exec_cmd("pcmanfm -d")
  hl.exec_cmd("steam -silent")
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)
