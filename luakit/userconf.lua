local settings = require "settings"

settings.application.prefer_dark_mode = true

settings.webview.default_monospace_font_size = 12
settings.webview.enable_accelerated_2d_canvas = true
settings.webview.enable_developer_extras = true
settings.webview.enable_fullscreen = true
settings.webview.enable_smooth_scrolling = true
settings.webview.enable_webaudio = true
settings.webview.enable_webgl = true
settings.webview.javascript_can_access_clipboard = true
settings.webview.monospace_font_family = "JetBrainsMono Nerd Font"

settings.window.home_page = "www.duckduckgo.com"
settings.window.new_tab_page = settings.window.home_page

local engines = settings.window.search_engines
engines.aur = "https://aur.archlinux.org/packages.php?O=0&K=%s&do_Search=Go"
engines.aw = "https://wiki.archlinux.org/index.php/Special:Search?fulltext=Search&search=%s"
engines.default = engines.duckduckgo
