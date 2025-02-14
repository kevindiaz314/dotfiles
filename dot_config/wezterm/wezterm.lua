-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

config.font = wezterm.font "MonoLisa Preview Variable"
config.font_size = 15

config.window_decorations = "RESIZE"

-- Hide tab bar when there is only one tab
config.hide_tab_bar_if_only_one_tab = true

-- Color scheme
config.color_scheme = 'tokyonight_night'

-- Opacity
config.window_background_opacity = 0.90
config.macos_window_background_blur = 10

-- Limits the maximum number of frames per second
config.max_fps = 120

-- Key bindings for splits and navigation
config.keys = {
  -- Vertical split (Command + D)
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitPane {
      direction = 'Right',
      size = { Percent = 50 }
    }
  },
  -- Horizontal split (Shift + Command + D)
  {
    key = 'd',
    mods = 'SHIFT|CMD',
    action = wezterm.action.SplitPane {
      direction = 'Down',
      size = { Percent = 50 }
    }
  },
  -- Pane navigation
  -- Move to left pane
  {
    key = 'h',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  -- Move to right pane
  {
    key = 'l',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  -- Move to upper pane
  {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  -- Move to lower pane
  {
    key = 'j',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  -- Close current pane
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
}

return config

