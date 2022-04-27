import draw

# Load existing settings made via :set
config.load_autoconfig()

draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})

c.auto_save.session = True
c.colors.webpage.preferred_color_scheme = "dark"
c.downloads.location.directory = "$HOME/downloads/"
c.fonts.default_family = "Comic Mono"
c.fonts.default_size = "10pt"
c.window.hide_decoration = True
c.content.javascript.can_access_clipboard = True
c.content.pdfjs = True

# Colemak bindings.key_mappings
config.bind("H", "scroll up", mode="caret")
config.bind("K", "scroll down", mode="caret")
config.bind("J", "scroll left", mode="caret")
config.bind("L", "scroll right", mode="caret")

config.bind("h", "move-to-prev-line", mode="caret")
config.bind("k", "move-to-next-line", mode="caret")
config.bind("j", "move-to-prev-char", mode="caret")
config.bind("l", "move-to-next-char", mode="caret")

config.bind("H", "tab-prev")
config.bind("K", "tab-next")
config.bind("J", "back")
config.bind("L", "forward")

config.bind("h", "scroll up")
config.bind("k", "scroll down")
config.bind("j", "scroll left")
config.bind("l", "scroll right")
