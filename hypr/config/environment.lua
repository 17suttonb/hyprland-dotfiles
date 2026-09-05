-- ENVIRONMENT VARIABLES
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

local vars = require("config.variables")

-- CURSOR CONFIGURATION
hl.env("XCURSOR_SIZE", tostring(vars.cursorSize))
hl.env("XCURSOR_THEME", vars.cursorTheme)
hl.env("HYPRCURSOR_SIZE", tostring(vars.cursorSize))
hl.env("HYPRCURSOR_THEME", vars.cursorTheme)

-- WAYLAND APPLICATION SUPPORT
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("OZONE_PLATFORM", "wayland")
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- XDG DESKTOP PORTAL
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- QT CONFIGURATION
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")

-- GTK CONFIGURATION
hl.env("GDK_BACKEND", "wayland,x11")

-- ADDITIONAL WAYLAND VARIABLES
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("ECORE_EVAS_ENGINE", "wayland")
hl.env("ELM_ENGINE", "wayland")
