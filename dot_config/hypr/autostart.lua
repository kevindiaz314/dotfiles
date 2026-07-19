--  ▗▄▖ ▗▖ ▗▖▗▄▄▄▖▗▄▖  ▗▄▄▖▗▄▄▄▖▗▄▖ ▗▄▄▖▗▄▄▄▖
-- ▐▌ ▐▌▐▌ ▐▌  █ ▐▌ ▐▌▐▌     █ ▐▌ ▐▌▐▌ ▐▌ █
-- ▐▛▀▜▌▐▌ ▐▌  █ ▐▌ ▐▌ ▝▀▚▖  █ ▐▛▀▜▌▐▛▀▚▖ █
-- ▐▌ ▐▌▝▚▄▞▘  █ ▝▚▄▞▘▗▄▄▞▘  █ ▐▌ ▐▌▐▌ ▐▌ █

hl.on("hyprland.start", function()
	-- Unlock kwallet first: anything touching the Secret Service would
	-- D-Bus-activate kwalletd without PAM credentials and prompt for a password
	hl.exec_cmd("/usr/lib/pam_kwallet_init")
	hl.exec_cmd("noctalia")
	hl.exec_cmd("vicinae server")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("QT_QPA_PLATFORMTHEME", "kde")
-- KDE apps (notably Dolphin's "Open With") need Plasma's menu prefix
-- to find the application menu/services correctly outside a Plasma session.
hl.env("XDG_MENU_PREFIX", "plasma-")
