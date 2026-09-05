-- PICTURE-IN-PICTURE (PIP) RULES

local pipMatch = { class = "(firefox|google-chrome|zen)", title = ".*(Picture-in-Picture|Picture in Picture).*" }

hl.window_rule({ match = pipMatch, float = true })
hl.window_rule({ match = pipMatch, pin = true })
hl.window_rule({ match = pipMatch, size = { 480, 270 } })
hl.window_rule({ match = pipMatch, no_blur = true })
hl.window_rule({ match = pipMatch, move = { "74.5%", "4.25%" } })
hl.window_rule({ match = pipMatch, animation = "slide" })
hl.window_rule({ match = pipMatch, opaque = true })

-- Image viewer Qview
hl.window_rule({ match = { class = "(com.interversehq.qView)" }, opaque = true })
