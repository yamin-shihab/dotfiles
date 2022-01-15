local wezterm = require 'wezterm';

return {
	font = wezterm.font("JetBrainsMono Nerd Font"),
	color_scheme = "Dracula",
	hide_tab_bar_if_only_one_tab = true,
	window_padding = {
		left = 5,
		right = 5,
		top = 5,
		bottom = 5,
	},
	warn_about_missing_glyphs = false,
}
