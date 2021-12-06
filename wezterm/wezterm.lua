local wezterm = require 'wezterm';

return {
	font = wezterm.font("JetBrainsMono Nerd Font"),
	window_padding = {
    	left = 5,
    	right = 5,
    	top = 5,
    	bottom = 1,
  	},
	color_scheme = "Dracula",
	window_background_opacity = 8.0,
	hide_tab_bar_if_only_one_tab = true,
}
