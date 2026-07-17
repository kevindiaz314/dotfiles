------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

-- Built-in laptop display.
hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "auto",
	scale = "1.67",
})

hl.monitor({
	output = "DP-1",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})
