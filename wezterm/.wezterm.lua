local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.enable_tab_bar = false

-- config.color_scheme = "Tokyo Night"
-- config.color_scheme = "catppuccin-mocha"
config.color_scheme = "Kanagawa (Gogh)"

config.font = wezterm.font("MesloLGS Nerd Font")
config.font_size = 16.0

return config
