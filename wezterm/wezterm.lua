local wezterm = require 'wezterm';

return {
	font = wezterm.font("JetBrainsMono Nerd Font"),
	hide_tab_bar_if_only_one_tab = true,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	warn_about_missing_glyphs = false,
	colors = {
		foreground = "#f8f8f2",
		background = "#282a36",
		cursor_bg = "#6272a4",
		cursor_border = "#6272a4",
		cursor_fg = "#ffffff",
		selection_bg = "#44475a",
		selection_fg = "#f8f8f8",

		ansi = {"#282a36", "#ff5555", "#50fa7b", "#f1fa8c", "#bd93f9", "#ff79c6", "#8be9fd", "#f8f8f8"},
		brights = {"#282a36", "#ff5555", "#50fa7b", "#f1fa8c", "#bd93f9", "#ff79c6","#8be9fd", "#f8f8f8"},
  	},
}
