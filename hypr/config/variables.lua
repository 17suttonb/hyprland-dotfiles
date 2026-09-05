-- GLOBAL VARIABLES & CONSTANTS
--
-- NOTE: config/variables.conf (hyprlang) still exists alongside this file.
-- hypridle.conf and hyprlock.conf are separate hypr* tools that have NOT
-- moved to lua, and they `source` that .conf file for $timeoutDim, $fontMono,
-- etc. Keep both files' values in sync by hand until those tools gain lua
-- configs of their own.

return {
    -- APPLICATION VARIABLES
    mainMod = "SUPER",
    terminal = "alacritty",
    fileManager = "yazi",
    browser = "chromium",
    -- launcher = "wofi --show drun --matching --insensitive",
    launcher = "vicinae toggle",
    volumeBrightness = "~/.config/scripts/media/volume-brightness.sh",

    -- DIRECTORY PATHS
    configDir = "~/.config/hypr",
    scriptsDir = "~/.config/scripts",
    wallpaperDir = "~/Pictures/Wallpapers",
    screenshotDir = "~/Pictures/Screenshots",

    -- THEME VARIABLES
    cursorTheme = "Bibata-Modern-Ice",
    cursorSize = 24,
    fontFamily = "SF Pro",
    fontMono = "Liga SFMono Nerd Font",

    -- LAYOUT CONSTANTS
    gapsIn = 2,
    gapsOut = 4,
    borderSize = 3,
    rounding = 8,
    masterRatio = 0.6,

    -- ANIMATION TIMING
    animSpeed = 2,
    animSpeedFast = 1,
    animSpeedSlow = 3.5,

    -- OPACITY VALUES
    opacityActive = 1.0,
    opacityInactive = 0.8,
    opacityFloat = 0.90,
    opacitySpecial = 0.6,

    -- TIMEOUT VALUES (in seconds) -- kept here too for reference/consistency
    -- with config/variables.conf, though hyprland.lua itself doesn't use these.
    timeoutDim = 300,      -- 5 minutes
    timeoutLock = 600,     -- 10 minutes
    timeoutScreen = 900,   -- 15 minutes
    timeoutSuspend = 1200, -- 20 minutes
}
