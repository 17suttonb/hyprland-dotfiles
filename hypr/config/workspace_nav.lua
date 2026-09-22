-- WORKSPACE NAVIGATION
-- Used by the keyboard bindings (keybinds/workspaces.lua). The touchpad
-- gesture (config/input.lua) uses Hyprland's native "workspace" gesture
-- action instead, to get a swipe animation that follows your fingers.
--
-- Navigates workspaces on the focused monitor only (not the global
-- workspace list), creating a new one past the end instead of wrapping
-- when going "next" -- unless the current workspace is already empty, in
-- which case going "next" again is a no-op rather than piling up empty
-- workspaces (matches Hyprland's native workspace-swipe gesture).

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
            if mon.active_workspace.is_empty then return end

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

return workspace_nav
