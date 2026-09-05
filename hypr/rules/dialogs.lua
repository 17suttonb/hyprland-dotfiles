-- DIALOG WINDOW RULES

local vars = require("config.variables")

hl.window_rule({ match = { title = "^(Open File)(.*)$" }, float = true })
hl.window_rule({ match = { title = "^(Select a File)(.*)$" }, float = true })
hl.window_rule({ match = { title = "^(Choose wallpaper)(.*)$" }, float = true })
hl.window_rule({ match = { title = "^(Open Folder)(.*)$" }, float = true })
hl.window_rule({ match = { title = "^(Save As)(.*)$" }, float = true })
hl.window_rule({ match = { title = "^(Library)(.*)$" }, float = true })
hl.window_rule({ match = { title = "^(File Upload)(.*)$" }, float = true })
hl.window_rule({ match = { title = "^(File Operation Progress)$" }, float = true })
hl.window_rule({ match = { title = "^(Confirm to replace files)$" }, float = true })
hl.window_rule({ match = { class = "^(" .. vars.browser .. ")$", title = ".*accounts.*" }, float = true })

-- File dialogs with specific sizes
hl.window_rule({ match = { class = "^(firefox|google-chrome|zen)$", title = "^(Save As)$" }, size = { 800, 600 } })
hl.window_rule({ match = { class = "^(firefox|google-chrome|zen)$", title = "^(Choose Files)$" }, size = { 800, 600 } })
hl.window_rule({ match = { class = "^(firefox|google-chrome|zen)$", title = "^(Open File)$" }, size = { 800, 600 } })
hl.window_rule({ match = { class = "^(firefox|google-chrome|zen)$", title = "^(Open Folder)$" }, size = { 800, 600 } })

-- APPLICATION-SPECIFIC DIALOGS
-- qView image viewer
hl.window_rule({ match = { class = "^(com.interversehq.qView)$" }, size = { 800, 450 } })
hl.window_rule({ match = { class = "^(com.interversehq.qView)$" }, fullscreen_state = "1 3" })
hl.window_rule({ match = { class = "^(com.interversehq.qView)$" }, content = "photo" })
hl.window_rule({ match = { class = "^(com.interversehq.qView)$" }, no_blur = true })
