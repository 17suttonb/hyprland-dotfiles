-- APPLICATION KEYBINDINGS

local vars = require("config.variables")
local mainMod = vars.mainMod

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(vars.terminal))
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd("[float; size 800 450; center] " .. vars.terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(vars.terminal .. " -e " .. vars.fileManager))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("[float; size 1000 550; center] " .. vars.terminal .. " -e " .. vars.fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(vars.browser))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(vars.launcher))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd("~/.config/scripts/utils/util-launcher.sh"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t"))
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("pgrep wlogout || wlogout -b 2"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("waytrogen -e ~/.config/scripts/theme/theme-sync.sh"))
hl.bind(mainMod .. " + ALT + W", hl.dsp.exec_cmd("pgrep -x waybar >/dev/null && killall waybar || waybar &"))
hl.bind(mainMod .. " + ALT + N", hl.dsp.exec_cmd("~/.config/scripts/restart-swaync.sh"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("[float; size 1000 550; center] " .. vars.terminal .. " -e btop --force-utf"))
