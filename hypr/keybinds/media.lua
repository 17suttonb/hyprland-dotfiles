-- MEDIA & SYSTEM KEYBINDINGS

local vars = require("config.variables")
local volumeBrightness = vars.volumeBrightness

hl.bind("XF86AudioRaiseVolume",   hl.dsp.exec_cmd(volumeBrightness .. " volume_up"),        { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",   hl.dsp.exec_cmd(volumeBrightness .. " volume_down"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",          hl.dsp.exec_cmd(volumeBrightness .. " volume_mute"),      { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",       hl.dsp.exec_cmd(volumeBrightness .. " mic_mute"),         { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",    hl.dsp.exec_cmd(volumeBrightness .. " brightness_up"),    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",  hl.dsp.exec_cmd(volumeBrightness .. " brightness_down"),  { locked = true, repeating = true })
hl.bind("XF86AudioPlay",          hl.dsp.exec_cmd(volumeBrightness .. " play_pause"),       { locked = true })
hl.bind("XF86AudioPause",         hl.dsp.exec_cmd(volumeBrightness .. " play_pause"),       { locked = true })
hl.bind("XF86AudioNext",          hl.dsp.exec_cmd(volumeBrightness .. " next_track"),       { locked = true })
hl.bind("XF86AudioPrev",          hl.dsp.exec_cmd(volumeBrightness .. " prev_track"),       { locked = true })

-- SCREENSHOTS
hl.bind("ALT + SHIFT + F", hl.dsp.exec_cmd("~/.config/scripts/utils/screenshot.sh -r fullscreen"))
hl.bind("ALT + SHIFT + W", hl.dsp.exec_cmd("~/.config/scripts/utils/screenshot.sh -r workspace"))
hl.bind("ALT + SHIFT + S", hl.dsp.exec_cmd("~/.config/scripts/utils/screenshot.sh -r selection"))

-- LAPTOP LID SWITCH HANDLING
-- Note: Remember to modify /etc/systemd/logind.conf before using
hl.bind("switch:on:Lid Switch",  hl.dsp.exec_cmd('hyprctl keyword monitor "eDP-1, disable" & hyprctl reload'), { locked = true }) -- Lid closed
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd('hyprctl keyword monitor "eDP-1, enable" & hyprctl reload'),  { locked = true }) -- Lid opened
