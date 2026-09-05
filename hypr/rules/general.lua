-- GENERAL WINDOW RULES

-- Ignore maximize requests from apps
hl.window_rule({
    name = "suppress-maximize",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
-- hl.window_rule({
--     name = "fix-xwayland-drags",
--     match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
--     no_focus = true,
-- })

-- No blur for empty class/title
hl.window_rule({
    name = "no-blur-empty",
    match = { class = "^()$", title = "^()$" },
    no_blur = true,
})
