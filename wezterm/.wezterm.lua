local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- theme
config.color_scheme = "Catppuccin Mocha"

-- tabs
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.enable_tab_bar = true

-- window
config.window_background_opacity = 0.8
config.window_decorations = "RESIZE"
config.macos_window_background_blur = 30

-- fonts
config.font = wezterm.font_with_fallback({ "JetBrains Mono", "MesloLGS Nerd Font" })
config.font_size = 20.0

-- tmux
local act = wezterm.action

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
	{
		mods = "LEADER",
		key = "c",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "LEADER",
		key = "x",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	{
		mods = "LEADER",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "LEADER",
		key = "j",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "k",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		mods = "LEADER",
		key = "l",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
}

for i = 1, 7 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

return config
