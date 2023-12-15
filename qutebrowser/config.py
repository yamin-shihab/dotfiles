# Options
c.auto_save.session = True
c.colors.webpage.bg = ""
c.colors.webpage.preferred_color_scheme = "dark"
c.completion.height = "20%"
c.completion.timestamp_format = "%F %T"
c.content.blocking.hosts.lists = ["file:///etc/hosts"]
c.content.blocking.method = "both"
c.content.cookies.accept = "no-3rdparty"
c.content.javascript.clipboard = "access"
c.content.plugins = True
c.editor.command = ["foot", "nvim", "+call cursor({line}, {column})", "{file}"]
c.fonts.default_size = "12pt"
c.hints.chars = "arstneio"
c.hints.mode = "letter"
c.hints.radius = 0
c.hints.scatter = False
c.input.insert_mode.plugins = True
c.keyhint.radius = 0
c.prompt.radius = 0
c.session.lazy_restore = True
c.spellcheck.languages = [ "en-US" ]
c.tabs.last_close = "close"
c.window.hide_decoration = True

# Custom keybinds
config.bind("z", "spawn --userscript view_in_mpv")

# Dracula color scheme
palette = {
    "background": "#282A36",
    "background-alt": "#282A36",
    "background-attention": "#181920",
    "border": "#282A36",
    "current-line": "#44475A",
    "selection": "#44475A",
    "foreground": "#F8F8F2",
    "foreground-alt": "#E0E0E0",
    "foreground-attention": "#FFFFFF",
    "comment": "#6272A4",
    "cyan": "#8BE9FD",
    "green": "#50FA7B",
    "orange": "#FFB86C",
    "pink": "#FF79C6",
    "purple": "#BD93F9",
    "red": "#FF5555",
    "yellow": "#F1FA8C"
}
padding = { "top": 5, "right": 5, "bottom": 5, "left": 5 }
c.colors.completion.category.bg = palette["background"]
c.colors.completion.category.border.bottom = palette["border"]
c.colors.completion.category.border.top = palette["border"]
c.colors.completion.category.fg = palette["foreground"]
c.colors.completion.even.bg = palette["background"]
c.colors.completion.fg = palette["foreground"]
c.colors.completion.item.selected.bg = palette["selection"]
c.colors.completion.item.selected.border.bottom = palette["selection"]
c.colors.completion.item.selected.border.top = palette["selection"]
c.colors.completion.item.selected.fg = palette["foreground"]
c.colors.completion.match.fg = palette["orange"]
c.colors.completion.odd.bg = palette["background-alt"]
c.colors.completion.scrollbar.bg = palette["background"]
c.colors.completion.scrollbar.fg = palette["foreground"]
c.colors.downloads.bar.bg = palette["background"]
c.colors.downloads.error.bg = palette["background"]
c.colors.downloads.error.fg = palette["red"]
c.colors.downloads.stop.bg = palette["background"]
c.colors.downloads.system.bg = "none"
c.colors.hints.bg = palette["background"]
c.colors.hints.fg = palette["purple"]
c.colors.hints.match.fg = palette["foreground-alt"]
c.colors.keyhint.bg = palette["background"]
c.colors.keyhint.fg = palette["purple"]
c.colors.keyhint.suffix.fg = palette["selection"]
c.colors.messages.error.bg = palette["background"]
c.colors.messages.error.border = palette["background-alt"]
c.colors.messages.error.fg = palette["red"]
c.colors.messages.info.bg = palette["background"]
c.colors.messages.info.border = palette["background-alt"]
c.colors.messages.info.fg = palette["comment"]
c.colors.messages.warning.bg = palette["background"]
c.colors.messages.warning.border = palette["background-alt"]
c.colors.messages.warning.fg = palette["red"]
c.colors.prompts.bg = palette["background"]
c.colors.prompts.border = "1px solid " + palette["background-alt"]
c.colors.prompts.fg = palette["cyan"]
c.colors.prompts.selected.bg = palette["selection"]
c.colors.statusbar.caret.bg = palette["background"]
c.colors.statusbar.caret.fg = palette["orange"]
c.colors.statusbar.caret.selection.bg = palette["background"]
c.colors.statusbar.caret.selection.fg = palette["orange"]
c.colors.statusbar.command.bg = palette["background"]
c.colors.statusbar.command.fg = palette["pink"]
c.colors.statusbar.command.private.bg = palette["background"]
c.colors.statusbar.command.private.fg = palette["foreground-alt"]
c.colors.statusbar.insert.bg = palette["background-attention"]
c.colors.statusbar.insert.fg = palette["foreground-attention"]
c.colors.statusbar.normal.bg = palette["background"]
c.colors.statusbar.normal.fg = palette["foreground"]
c.colors.statusbar.passthrough.bg = palette["background"]
c.colors.statusbar.passthrough.fg = palette["orange"]
c.colors.statusbar.private.bg = palette["background-alt"]
c.colors.statusbar.private.fg = palette["foreground-alt"]
c.colors.statusbar.progress.bg = palette["background"]
c.colors.statusbar.url.error.fg = palette["red"]
c.colors.statusbar.url.fg = palette["foreground"]
c.colors.statusbar.url.hover.fg = palette["cyan"]
c.colors.statusbar.url.success.http.fg = palette["green"]
c.colors.statusbar.url.success.https.fg = palette["green"]
c.colors.statusbar.url.warn.fg = palette["yellow"]
c.colors.tabs.bar.bg = palette["selection"]
c.colors.tabs.even.bg = palette["selection"]
c.colors.tabs.even.fg = palette["foreground"]
c.colors.tabs.indicator.error = palette["red"]
c.colors.tabs.indicator.start = palette["orange"]
c.colors.tabs.indicator.stop = palette["green"]
c.colors.tabs.indicator.system = "none"
c.colors.tabs.odd.bg = palette["selection"]
c.colors.tabs.odd.fg = palette["foreground"]
c.colors.tabs.selected.even.bg = palette["background"]
c.colors.tabs.selected.even.fg = palette["foreground"]
c.colors.tabs.selected.odd.bg = palette["background"]
c.colors.tabs.selected.odd.fg = palette["foreground"]
c.hints.border = "1px solid " + palette["background-alt"]
c.statusbar.padding = padding
c.tabs.favicons.scale = 1
c.tabs.indicator.width = 1
c.tabs.padding = padding

# Don't load autoconfig.yml
config.load_autoconfig(False)
