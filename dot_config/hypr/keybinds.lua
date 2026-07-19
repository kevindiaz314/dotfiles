-- ▗▖ ▗▖▗▄▄▄▖▗▖  ▗▖▗▄▄▖ ▗▄▄▄▖▗▖  ▗▖▗▄▄▄  ▗▄▄▖
-- ▐▌▗▞▘▐▌    ▝▚▞▘ ▐▌ ▐▌  █  ▐▛▚▖▐▌▐▌  █▐▌
-- ▐▛▚▖ ▐▛▀▀▘  ▐▌  ▐▛▀▚▖  █  ▐▌ ▝▜▌▐▌  █ ▝▀▚▖
-- ▐▌ ▐▌▐▙▄▄▖  ▐▌  ▐▙▄▞▘▗▄█▄▖▐▌  ▐▌▐▙▄▄▀▗▄▄▞▘

local terminal = "ghostty"
local fileManager = "dolphin"
local menu = "vicinae toggle"
local webBrowser = "helium-browser"
local ide = "cursor"

local mainMod = "SUPER"

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(
	mainMod .. " + SHIFT + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit")
)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(ide))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(webBrowser))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("todoist"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("env -u DISPLAY spotify"))

-- Move focus left, right, up, down
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Swap window to the left, right, up, down
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.swap({ direction = "down" }))

-- Screenshots: region / active window / focused display, piped to satty for annotation
local sattyPipe = [[ | satty --filename - --output-filename ~/Pictures/Screenshots/satty-$(date +%Y%m%d-%H%M%S).png]]
hl.bind("Print", hl.dsp.exec_cmd([[grim -g "$(slurp -d)" - | wl-copy]]))
hl.bind(
	"ALT + Print",
	hl.dsp.exec_cmd(
		[[grim -g "$(hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')" -]] .. sattyPipe
	)
)
hl.bind(
	"CTRL + Print",
	hl.dsp.exec_cmd([[grim -o "$(hyprctl -j monitors | jq -r '.[] | select(.focused) | .name')" -]] .. sattyPipe)
)

-- Resize the current column in the scrolling layout
hl.bind(mainMod .. " + R", hl.dsp.layout("colresize +conf"))

-- ╔══════════════════════════════════════════════════════════════════════════════╗
-- ║                             Noctalia Bindings                                ║
-- ╚══════════════════════════════════════════════════════════════════════════════╝
local noctalia = "noctalia msg"

hl.bind(mainMod .. " + COMMA", hl.dsp.exec_cmd(noctalia .. " settings-toggle"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(noctalia .. " panel-toggle session"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(noctalia .. " volume-up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(noctalia .. " volume-down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(noctalia .. " volume-mute"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(noctalia .. " brightness-up"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(noctalia .. " brightness-down"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(noctalia .. " mic-mute"))

-- Switch workspaces with mainMod + [1-5]
-- Move active window to a workspace with mainMod + SHIFT + [1-5]
for i = 1, 5 do
	local key = tostring(i)
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move active window to other monitor
hl.bind(mainMod .. " + O", hl.dsp.window.move({ monitor = "+1" }))

-- Move current workspace to other monitor
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.workspace.move({ monitor = "+1" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
