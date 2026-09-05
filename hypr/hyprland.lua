-- HYPRLAND MAIN CONFIGURATION

-- CORE CONFIGURATION MODULES
require("config.variables")
require("config.environment")
require("config.border")
require("config.autostart")
require("config.appearance")
require("config.animations")
require("config.layouts")
require("config.input")
require("config.plugins")

-- KEYBINDING MODULES
require("keybinds.applications")
require("keybinds.windows")
require("keybinds.workspaces")
require("keybinds.media")

-- SYSTEM-SPECIFIC MODULES
require("monitors")
require("hyprrules")
