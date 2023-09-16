-- Config setup
local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Main settings
config.bold_brightens_ansi_colors = false
config.color_scheme = "Dracula (Official)"
config.enable_tab_bar = false
config.font = wezterm.font_with_fallback({ "monospace" })
config.font_size = 16
config.visual_bell = {
    fade_in_duration_ms = 100,
    fade_in_function = "Constant",
    fade_out_duration_ms = 100,
    fade_out_function = "Constant",
}
config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
    top = 0,
    bottom = 0,
    left = 0,
    right = 0,
}

return config
