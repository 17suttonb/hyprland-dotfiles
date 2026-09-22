-- INPUT CONFIGURATION

local workspace_nav = require("config.workspace_nav")

hl.config({
    input = {
        kb_layout = "gb",
        kb_variant = "mac",
        kb_options = "caps:escape", -- Map Caps Lock to Escape (Vim-friendly)
        follow_mouse = 1,
        sensitivity = 0,

        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.3,
            clickfinger_behavior = true,
        },
    },

    binds = {
        scroll_event_delay = 0,
    },
})

-- Uses the same workspace_nav function as mainMod + comma/period
-- (keybinds/workspaces.lua) instead of Hyprland's built-in "workspace"
-- gesture action, so the swipe and the keybind behave identically
-- (per-monitor scoping, no auto-create past an already-empty workspace).
-- NOTE: if swipe direction feels reversed, swap "left"/"right" below.
hl.gesture({
    fingers = 3,
    direction = "left",
    action = function() workspace_nav("next", false) end,
})

hl.gesture({
    fingers = 3,
    direction = "right",
    action = function() workspace_nav("prev", false) end,
})

hl.device({
    name = "epic-mouse-v1",
    sensitivity = 0,
    natural_scroll = true,
})
