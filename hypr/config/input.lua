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
