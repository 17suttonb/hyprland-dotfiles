#!/bin/bash
# Navigate workspaces on the current monitor only.
# Usage: workspace-nav.sh [next|prev] [move]
#   move: also moves the focused window to the target workspace

DIRECTION=$1
WITH_WINDOW=${2:-""}

MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')
CURRENT_ID=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .activeWorkspace.id')

if [ "$DIRECTION" = "next" ]; then
    NEXT=$(hyprctl workspaces -j | jq --arg m "$MONITOR" --argjson cur "$CURRENT_ID" \
        '[.[] | select(.monitor == $m) | .id] | map(select(. > $cur)) | sort | .[0]')

    if [ "$NEXT" = "null" ] || [ -z "$NEXT" ]; then
        MAX_GLOBAL=$(hyprctl workspaces -j | jq '[.[].id] | max')
        NEXT=$((MAX_GLOBAL + 1))
    fi
else
    NEXT=$(hyprctl workspaces -j | jq --arg m "$MONITOR" --argjson cur "$CURRENT_ID" \
        '[.[] | select(.monitor == $m) | .id] | map(select(. < $cur)) | sort | last')

    if [ "$NEXT" = "null" ] || [ -z "$NEXT" ]; then
        exit 0
    fi
fi

if [ "$WITH_WINDOW" = "move" ]; then
    hyprctl dispatch movetoworkspace "$NEXT"
else
    hyprctl dispatch workspace "$NEXT"
fi
