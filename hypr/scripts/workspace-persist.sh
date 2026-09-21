#!/bin/bash
# Recreate non-rightmost workspaces when they are deleted empty,
# preserving the workspace structure on each monitor.
#
# Uses workspace recreation rather than persistent:true/false rules because
# hyprctl keyword workspace only appends rules — persistent:false cannot
# override a previously set persistent:true.

declare -A WS_MONITOR  # ws_id -> monitor name

init_state() {
    while IFS='|' read -r id monitor; do
        [[ -n "$id" && -n "$monitor" ]] && WS_MONITOR["$id"]="$monitor"
    done < <(hyprctl workspaces -j | jq -r '.[] | "\(.id)|\(.monitor)"')
}

handle_destroy() {
    local ws_id="$1"
    local monitor="${WS_MONITOR[$ws_id]}"
    unset WS_MONITOR["$ws_id"]

    [[ -z "$monitor" ]] && return

    local max_remaining
    max_remaining=$(hyprctl workspaces -j | jq --arg m "$monitor" \
        '[.[] | select(.monitor == $m) | .id] | if length > 0 then max else 0 end')

    # Only recreate if a higher-ID workspace still exists on this monitor,
    # meaning the deleted workspace was not the rightmost
    (( ws_id < max_remaining )) || return

    local cur_mon cur_ws
    cur_mon=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')
    cur_ws=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .activeWorkspace.id')

    hyprctl keyword animations:enabled 0 >/dev/null 2>&1

    if [[ "$cur_mon" == "$monitor" ]]; then
        hyprctl --batch "dispatch workspace $ws_id ; dispatch workspace $cur_ws" >/dev/null 2>&1
    else
        hyprctl --batch \
            "dispatch focusmonitor $monitor ; \
             dispatch workspace $ws_id ; \
             dispatch focusmonitor $cur_mon ; \
             dispatch workspace $cur_ws" >/dev/null 2>&1
    fi

    hyprctl keyword animations:enabled 1 >/dev/null 2>&1
    WS_MONITOR["$ws_id"]="$monitor"
}

init_state

SOCK="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"
socat -U - "UNIX-CONNECT:$SOCK" | while IFS= read -r line; do
    if [[ "$line" == "createworkspace>>"* ]]; then
        ws_id="${line#createworkspace>>}"
        monitor=$(hyprctl workspaces -j | jq -r --arg id "$ws_id" \
            '.[] | select(.name == $id) | .monitor' 2>/dev/null)
        [[ -n "$monitor" ]] && WS_MONITOR["$ws_id"]="$monitor"
    elif [[ "$line" == "destroyworkspace>>"* ]]; then
        handle_destroy "${line#destroyworkspace>>}"
    elif [[ "$line" == "moveworkspace>>"* ]]; then
        data="${line#moveworkspace>>}"
        WS_MONITOR["${data%%,*}"]="${data#*,}"
    fi
done
