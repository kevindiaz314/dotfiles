-- Reload Hammerspoon configuration with Cmd + Alt + R
hs.hotkey.bind({"cmd", "alt"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.notify.new({title="Hammerspoon,", informativeText="Hello World"}):send()
end)

--[[
==========================================================================
                              YABAI KEYBINDS
==========================================================================
]]--

-- Window navigation - move focus between windows using vim-like hjkl keys
-- Focus window to the left
hs.hotkey.bind({"alt"}, "h", function()
  os.execute("/opt/homebrew/bin/yabai -m window --focus west")
end)

-- Focus window below
hs.hotkey.bind({"alt"}, "j", function()
  os.execute("/opt/homebrew/bin/yabai -m window --focus south")
end)

-- Focus window above
hs.hotkey.bind({"alt"}, "k", function()
  os.execute("/opt/homebrew/bin/yabai -m window --focus north")
end)

-- Focus window to the right
hs.hotkey.bind({"alt"}, "l", function()
  os.execute("/opt/homebrew/bin/yabai -m window --focus east")
end)

-- Window management
-- Toggle floating mode for current window
hs.hotkey.bind({"alt"}, "f", function()
  os.execute("/opt/homebrew/bin/yabai -m window --toggle float")
end)

-- Toggle fullscreen mode for current window
hs.hotkey.bind({"alt"}, "M", function ()
  os.execute("/opt/homebrew/bin/yabai -m window --toggle zoom-fullscreen")
end)

-- Multi-display management
-- Move window to west display and focus that display
hs.hotkey.bind({"shift", "alt"}, "W", function ()
  os.execute("/opt/homebrew/bin/yabai -m window --display west; /opt/homebrew/bin/yabai -m display --focus west")
end)

-- Move window to east display and focus that display
hs.hotkey.bind({"shift", "alt"}, "E", function ()
  os.execute("/opt/homebrew/bin/yabai -m window --display east; /opt/homebrew/bin/yabai -m display --focus east")
end)

-- Move window to south display and focus that display
hs.hotkey.bind({"shift", "alt"}, "S", function ()
  os.execute("/opt/homebrew/bin/yabai -m window --display south; /opt/homebrew/bin/yabai -m display --focus south")
end)
