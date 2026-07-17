---------------
---- INPUT ----
---------------

hl.config({
	input = {
		repeat_rate = 55,
		repeat_delay = 200,
		follow_mouse = 1,

		sensitivity = 0.6,

		touchpad = {
			natural_scroll = true,
		},
	},
})

-- Three-finger swipe sideways to switch workspaces
hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Three-finger swipe up to close the focused window
hl.gesture({
	fingers = 3,
	direction = "up",
	action = "close",
})

-- Four-finger swipe up to toggle the workspace overview
hl.gesture({
	fingers = 4,
	direction = "swipe",
	action = "move",
})

-- MoErgo's go60 mouse
hl.device({
	name = "go60-mouse",
	sensitivity = 1,
})
