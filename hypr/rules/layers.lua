-- LAYER RULES

hl.layer_rule({ match = { namespace = "wofi" }, blur = true })
hl.layer_rule({ match = { namespace = "wofi" }, xray = true })
hl.layer_rule({ match = { namespace = "wofi" }, dim_around = true })
-- hl.layer_rule({ match = { namespace = "wofi" }, ignorezero = true })
hl.layer_rule({ match = { namespace = "wofi" }, ignore_alpha = 0.9 })

-- hl.layer_rule({ match = { namespace = "waybar" }, blur = true })
hl.layer_rule({ match = { namespace = "waybar" }, xray = true })
-- hl.layer_rule({ match = { namespace = "waybar" }, ignorezero = true })
hl.layer_rule({ match = { namespace = "waybar" }, blur_popups = true })

hl.layer_rule({ match = { namespace = "hyprswitch" }, no_anim = true })

hl.layer_rule({ match = { namespace = "swaync-notification-window" }, blur = true })
hl.layer_rule({ match = { namespace = "swaync-control-center" }, blur = true })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, xray = true })
hl.layer_rule({ match = { namespace = "swaync-control-center" }, xray = true })
-- hl.layer_rule({ match = { namespace = "swaync-notification-window" }, ignorezero = true })
-- hl.layer_rule({ match = { namespace = "swaync-control-center" }, ignorezero = true })
hl.layer_rule({ match = { namespace = "swaync-control-center" }, ignore_alpha = 0.45 })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, ignore_alpha = 0.45 })
hl.layer_rule({ match = { namespace = "swaync-control-center" }, animation = "slide right" })

hl.layer_rule({ match = { namespace = "logout_dialog" }, blur = true })
