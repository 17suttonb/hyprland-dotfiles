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
-- Ports scripts/workspace-nav.sh: navigate workspaces on the focused monitor
-- only (not the global workspace list), creating a new one past the end
-- instead of wrapping when going "next".
local function workspace_nav(direction, with_window)
    local mon = hl.get_active_monitor()
    if not mon or not mon.active_workspace then return end

    local cur_id = mon.active_workspace.id
    local all = hl.get_workspaces()

    local on_monitor = {}
    for _, ws in ipairs(all) do
        if ws.monitor and ws.monitor.name == mon.name then
            table.insert(on_monitor, ws.id)
        end
    end
    table.sort(on_monitor)

    local target
    if direction == "next" then
        for _, id in ipairs(on_monitor) do
            if id > cur_id then
                target = id
                break
            end
        end
        if not target then
            local max_global = 0
            for _, ws in ipairs(all) do
                if ws.id > max_global then max_global = ws.id end
            end
            target = max_global + 1
        end
    else
        for i = #on_monitor, 1, -1 do
            if on_monitor[i] < cur_id then
                target = on_monitor[i]
                break
            end
        end
        if not target then return end
    end

    if with_window then
        hl.dispatch(hl.dsp.window.move({ workspace = target }))
    else
        hl.dispatch(hl.dsp.focus({ workspace = target }))
    end
end

hl.bind(mainMod .. " + comma", function() workspace_nav("prev", false) end)
hl.bind(mainMod .. " + period", function() workspace_nav("next", false) end)
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + SHIFT + comma", function() workspace_nav("prev", true) end)
hl.bind(mainMod .. " + SHIFT + period", function() workspace_nav("next", true) end)
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
