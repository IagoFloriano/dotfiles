-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({ output = "DP-1", mode = "1920x1080@144", position = "0x0", scale = "1" })
hl.monitor({ output = "DP-2", mode = "1440x900@60", position = "-1440x480", scale = "1" })
hl.monitor({ output = " ", mode = "preferred", position = "auto", scale = "1" })

------------------
---- REQUIRES ----
------------------

require("hyprland.autostart")
require("hyprland.keybinds")

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("XCURSOR_THEME", "dracula-cursors")


-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission({ binary = "/usr/(bin|local/bin)/grim", type = "screencopy", mode = "allow" })
-- hl.permission({ binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", type = "screencopy", mode = "allow" })
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
  general = {
    gaps_in          = 2,
    gaps_out         = 2,

    border_size      = 2,

    col              = {
      active_border   = "rgb(ff79c5)",
      inactive_border = "rgb(4d4d4d)",
    },

    -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
    resize_on_border = false,

    -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
    allow_tearing    = true,

    layout           = "master",
  },

  decoration = {
    rounding         = 4,
    rounding_power   = 2,

    -- Change transparency of focused and unfocused windows
    active_opacity   = 1.0,
    inactive_opacity = 1.0,

    shadow           = {
      enabled = false,
    },

    blur             = {
      enabled  = true,
      size     = 3,
      passes   = 1,
      vibrancy = 0.1696,
    },
  },

  animations = {
    enabled = true,
  },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 2.50, bezier = "quick" })
hl.animation({ leaf = "border", enabled = true, speed = 1.34, bezier = "quick" })
hl.animation({ leaf = "windows", enabled = true, speed = 1.19, bezier = "quick" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 1.02, bezier = "quick", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 0.37, bezier = "quick", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 0.43, bezier = "quick" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 0.36, bezier = "quick" })
hl.animation({ leaf = "fade", enabled = true, speed = 0.75, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 0.95, bezier = "quick" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 1.00, bezier = "quick", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 0.37, bezier = "quick", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 0.44, bezier = "quick" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 0.34, bezier = "quick" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 0.48, bezier = "quick", style = "slide" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 0.30, bezier = "quick", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 0.48, bezier = "quick", style = "slide" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 1.75, bezier = "quick" })

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
  master = {
    mfact = 0.5,
    new_status = "inherit",
    new_on_top = true,
  },
})

----------------
----  MISC  ----
----------------

hl.config({
  misc = {
    force_default_wallpaper = -1,   -- Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
  },
})

---------------
---- INPUT ----
---------------

hl.config({
  input = {
    kb_layout          = "us",
    kb_variant         = "intl",
    kb_model           = "",
    kb_options         = "",
    kb_rules           = "",

    numlock_by_default = true,

    follow_mouse       = 1,
    mouse_refocus      = true,

    sensitivity        = -1.0, -- -1.0 - 1.0, 0 means no modification.

    touchpad           = {
      natural_scroll = false,
    },

    tablet             = {
      output = "current"
    },
  },
  cursor = {
    no_warps = true,
    -- no_warps = false,
    -- persistent_warps = true,
    zoom_rigid = true,
    zoom_detached_camera = false,
  },
})

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

hl.window_rule({ match = { class = "gimp" }, workspace = "2 silent" })
hl.window_rule({ match = { class = "krita" }, workspace = "2 silent" })
hl.window_rule({ match = { class = "discord" }, workspace = "4 silent" })
hl.window_rule({ match = { class = "whatsdesk" }, workspace = "4 silent" })
hl.window_rule({ match = { class = "org.telegram.desktop" }, workspace = "4 silent" })
hl.window_rule({ match = { class = "org.gnome.Rhythmbox3" }, workspace = "5 silent" })
hl.window_rule({ match = { class = "steam" }, workspace = "7 silent" })
hl.window_rule({ match = { class = "org.mozilla.Thunderbird" }, workspace = "9 silent" })
hl.window_rule({ match = { class = "Aseprite" }, workspace = "2 silent" })
hl.window_rule({ match = { class = "waybar" }, rounding = 0 })
hl.window_rule({ match = { class = "discord" }, rounding = 0 })
hl.window_rule({ match = { class = "org.telegram.desktop" }, rounding = 0 })
hl.window_rule({ match = { class = "whatsdesk" }, rounding = 0 })

hl.workspace_rule({ workspace = "4", gaps_out = 0, border_size = 0 })

-- Apps to float

hl.window_rule {
  name = "Torrent",
  match = { class = "^(org.qbittorrent.qBittorrent)$" },

  float = true,
  size = "monitor_w*0.75 monitor_h*0.75",
  center = true,
}

hl.window_rule {
  name = "Gtk Desktop Portal",
  match = { class = "xdg-desktop-portal-gtk" },

  float = true,
  size = "monitor_w*0.75 monitor_h*0.75",
  center = true,
}

hl.window_rule {
  name = "Calculator",
  match = { class = "galculator" },

  float = true,
  size = "monitor_w*0.50 monitor_h*0.50",
  center = true,
}

hl.window_rule {
  name = "Emoji Selector",
  match = { class = "jome" },

  float = true,
  size = "monitor_w*0.75 monitor_h*0.75",
  center = true,
}

hl.window_rule {
  name = "Calendar",
  match = { class = "gsimplecal" },

  float = true,
  size = "monitor_w*0.4 monitor_h*0.15",
  center = true,
}

hl.window_rule {
  name = "Polkit",
  match = { class = "lxqt-policykit-agent" },

  float = true,
  size = "monitor_w*0.25 monitor_h*0.15",
  center = true,
}

hl.window_rule {
  name = "Gimp Search Actions",
  match = { initial_title = "Search Actions" },

  float = true,
  size = "monitor_w*0.5 monitor_h*0.5",
  center = true,
}

hl.window_rule({ match = { class = "file-png" }, float = true })
hl.window_rule({ match = { initial_title = "^Media viewer$" }, float = true })

-- Apps to not get focus when opened
hl.window_rule({ match = { class = "org.mozilla.Thunderbird" }, no_initial_focus = true })
hl.window_rule({ match = { class = "whatsdesk" }, no_initial_focus = true })
hl.window_rule({ match = { class = "discord" }, no_initial_focus = true })
hl.window_rule({ match = { class = "org.telegram.desktop" }, no_initial_focus = true })



-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
  -- Ignore maximize requests from all apps. You'll probably like this.
  name           = "suppress-maximize-events",
  match          = { class = ".*" },

  suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(true)
