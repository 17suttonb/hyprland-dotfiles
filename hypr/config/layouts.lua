-- LAYOUT CONFIGURATION

local vars = require("config.variables")

hl.config({
    dwindle = {
        preserve_split = true,
        smart_split = false,
        smart_resizing = false,
    },

    master = {
        new_status = "master",
        mfact = vars.masterRatio,
    },
})
