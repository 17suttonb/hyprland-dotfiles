-- AUTOSTART APPLICATIONS
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

local vars = require("config.variables")

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar &")
    hl.exec_cmd("hypridle &")
    hl.exec_cmd("systemctl --user start hyprpolkitagent &")
    hl.exec_cmd("udiskie &")
    hl.exec_cmd("swaync &")
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets &")
    hl.exec_cmd("vicinae server &")
    hl.exec_cmd("systemctl --user start hyprpaper && waytrogen -r -s 1 && ~/.config/scripts/theme/theme-sync.sh")
    hl.exec_cmd("hyprswitch init --show-title --size-factor 5 --workspaces-per-row 4 --custom-css " .. vars.configDir .. "/hyprswitch.css &")
    hl.exec_cmd("hyprpm reload -n &")
end)
