-- ANIMATION CONFIGURATION

local vars = require("config.variables")

hl.config({
    animations = {
        enabled = true,
    },
})

-- Curves
hl.curve("linear",   { type = "bezier", points = { {0, 0},       {1, 1}    } })
hl.curve("easeIn",   { type = "bezier", points = { {0.42, 0.0},  {1, 1}    } })
hl.curve("easeOut",  { type = "bezier", points = { {0.0, 0.0},   {0.58, 1} } })
hl.curve("balanced", { type = "bezier", points = { {0.2, 0},     {0.3, 1}  } })
hl.curve("smooth",   { type = "bezier", points = { {0.25, 0.1},  {0.25, 1} } })
hl.curve("crisp",    { type = "bezier", points = { {0.3, 0},     {0.4, 1}  } })
hl.curve("flow",     { type = "bezier", points = { {0.15, 0},    {0.35, 1} } })

-- Window animations
hl.animation({ leaf = "windows",     enabled = true, speed = 4, bezier = "smooth" })
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 3, bezier = "balanced", style = "slide" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 2, bezier = "crisp",    style = "slide" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3, bezier = "flow" })

-- Fade animations
hl.animation({ leaf = "fadeLayers", enabled = true, speed = 2, bezier = "smooth" })

-- Layer animations - overlays, notifications, menus
hl.animation({ leaf = "layers",    enabled = true, speed = 2, bezier = "balanced" })
hl.animation({ leaf = "layersIn",  enabled = true, speed = 2, bezier = "smooth", style = "slide" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1, bezier = "crisp",  style = "slide" })

-- Border animations - responsive feedback
hl.animation({ leaf = "border", enabled = true, speed = 4, bezier = "balanced" })

-- workspaces
hl.animation({ leaf = "workspaces", enabled = true, speed = 4, bezier = "flow", style = "slide" })

-- specialWorkspace
hl.animation({ leaf = "specialWorkspaceIn",  enabled = true, speed = vars.animSpeedFast, bezier = "easeIn",  style = "fade" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = vars.animSpeedFast, bezier = "easeOut", style = "fade" })
