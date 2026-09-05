-- OPACITY WINDOW RULES

local vars = require("config.variables")
local floatOpacity = vars.opacityFloat .. " " .. vars.opacityFloat

hl.window_rule({ match = { class = "^(hyprswitch)$" }, opacity = floatOpacity })
-- hl.window_rule({ match = { class = "^(Dunst)$" }, opacity = floatOpacity })
hl.window_rule({ match = { class = "^(thunar)$" }, opacity = floatOpacity })
hl.window_rule({ match = { class = "^(code)$" }, opacity = floatOpacity })
hl.window_rule({ match = { class = "^(cursor)$" }, opacity = floatOpacity })
hl.window_rule({ match = { class = "^(kiro-url-handler)$" }, opacity = floatOpacity })
hl.window_rule({ match = { title = "^(nvim.*)$" }, opacity = floatOpacity })
hl.window_rule({ match = { title = "^(zsh*)$" }, opacity = floatOpacity })

-- Special opacity for typing test
hl.window_rule({ match = { class = "zen", title = "^Monkeytype$" }, opacity = "0.75 0.75" })
