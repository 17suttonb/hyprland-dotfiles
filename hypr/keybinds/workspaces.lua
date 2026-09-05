-- WORKSPACE KEYBINDINGS

local vars = require("config.variables")
local mainMod = vars.mainMod

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + ALT + S", hl.dsp.window.move({ workspace = "special:magic", follow = false }))

-- WORKSPACE SCROLLING
hl.bind(mainMod .. " + comma", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + period", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + SHIFT + comma", hl.dsp.window.move({ workspace = "r-1" }))
hl.bind(mainMod .. " + SHIFT + period", hl.dsp.window.move({ workspace = "r+1" }))
hl.bind(mainMod .. " + SHIFT + mouse_down", hl.dsp.window.move({ workspace = "r-1" }))
hl.bind(mainMod .. " + SHIFT + mouse_up", hl.dsp.window.move({ workspace = "r+1" }))

-- WINDOW SWITCHING (NOTE: Requires `hyprswitch`)
local mod = "SUPER"
local key = "tab"
local reverse = "grave"
hl.bind(mod .. " + " .. key,
    hl.dsp.exec_cmd("hyprswitch gui --mod-key " .. mod .. " --key " .. key ..
        " --close mod-key-release --reverse-key=key=" .. reverse ..
        " --sort-recent --max-switch-offset 0 && hyprswitch dispatch"))

-- Hyprexpo
-- disabled for now as hyprexpo wont initalize on aarch64
-- hl.bind(mainMod .. " + G", hl.dsp.layout("hyprexpo:expo toggle"))
