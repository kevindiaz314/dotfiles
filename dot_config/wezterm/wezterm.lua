-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

config.font = wezterm.font "MonoLisa Trial"
config.font_size = 15

config.window_decorations = "RESIZE"

-- Disable tab bar
config.enable_tab_bar = false

-- Color scheme
config.color_scheme = 'tokyonight_night'

-- Opacity
-- config.window_background_opacity = 0.2
-- config.macos_window_background_blur = 0

-- Limits the maximum number of frames per second
config.max_fps = 120

return config

