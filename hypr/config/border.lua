-- Hyprland with colors from wallust
-- You can use this template by adding the following to wallust.toml:
-- hypr = { src = "hyprland.conf", dst = "~/.config/hypr/colors.conf" }
-- and then requiring it from hyprland.lua:
-- require("colors")

hl.config({
    general = {
        col = {
            active_border = {
                colors = {
                    "rgb(7D8078)",
                    "rgb(BE8877)",
                    "rgb(A8A597)",
                    "rgb(FAE8D2)",
                    "rgb(A27474)",
                },
            },
            inactive_border = "rgba(151416ee)",
        },
    },
})
