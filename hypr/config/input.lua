-- INPUT CONFIGURATION

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

-- Uses Hyprland's built-in "workspace" gesture action rather than the
-- workspace_nav function (keybinds/workspaces.lua) so the swipe animation
-- follows your fingers 1:1. A custom Lua function/table action can't hook
-- into that live-follow renderer -- only the native "workspace" action gets
-- it -- so this trades workspace_nav's per-monitor scoping and no-pileup
-- guard (irrelevant here anyway, since monitors.lua only defines eDP-1)
-- for the smooth native feel.
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

hl.device({
    name = "epic-mouse-v1",
    sensitivity = 0,
    natural_scroll = true,
})
