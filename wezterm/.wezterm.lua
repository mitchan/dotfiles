local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- theme
config.color_scheme = "Catppuccin Mocha"

-- tabs
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.enable_tab_bar = true

-- window
config.window_background_opacity = 0.8
config.macos_window_background_blur = 20
-- config.window_decorations = "RESIZE"

-- fonts
config.font = wezterm.font_with_fallback({ "ShureTechMono Nerd Font", "CaskaydiaCove Nerd Font", "JetBrains Mono",
  "MesloLGS Nerd Font" })
config.font_size = 16.0

return config
