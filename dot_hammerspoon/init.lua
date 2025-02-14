-- Reload Hammerspoon configuration with Cmd + Alt + R
hs.hotkey.bind({"cmd", "alt"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.notify.new({title="Hammerspoon,", informativeText="Hello World"}):send()
end)

-- Key bindings for Yabai
hs.hotkey.bind({"alt"}, "h", function()
  os.execute("/opt/homebrew/bin/yabai -m window --focus west")
end)

hs.hotkey.bind({"alt"}, "j", function()
  os.execute("/opt/homebrew/bin/yabai -m window --focus south")
end)

hs.hotkey.bind({"alt"}, "k", function()
  os.execute("/opt/homebrew/bin/yabai -m window --focus north")
end)

hs.hotkey.bind({"alt"}, "l", function()
  os.execute("/opt/homebrew/bin/yabai -m window --focus east")
end)

hs.hotkey.bind({"shift", "alt"}, "M", function ()
  os.execute("/opt/homebrew/bin/yabai -m window --toggle zoom-fullscreen")
end)

hs.hotkey.bind({"shift", "alt"}, "H", function ()
  os.execute("/opt/homebrew/bin/yabai -m window --display west; /opt/homebrew/bin/yabai -m display --focus west")
end)

hs.hotkey.bind({"shift", "alt"}, "L", function ()
  os.execute("/opt/homebrew/bin/yabai -m window --display east; /opt/homebrew/bin/yabai -m display --focus east")
end)

hs.hotkey.bind({"shift", "alt"}, "J", function ()
  os.execute("/opt/homebrew/bin/yabai -m window --display south; /opt/homebrew/bin/yabai -m display --focus east")
end)
