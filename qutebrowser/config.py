# Dracula
import draw

draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})

# Options
c.auto_save.session = True
c.colors.webpage.preferred_color_scheme = "dark"
c.content.javascript.can_access_clipboard = True
c.content.pdfjs = True
c.downloads.location.directory = "$HOME/dl"
c.fonts.default_family = "JetBrains Mono NL"
c.fonts.default_size = "10pt"
c.hints.chars = "arstneio"
c.hints.mode = "letter"
c.spellcheck.languages = [ "en-US" ]
c.url.default_page = "https://search.brave.com"
c.url.searchengines = { "DEFAULT": "https://search.brave.com/search?q={}" }
c.url.start_pages = "https://search.brave.com"
c.window.hide_decoration = True

# Don't load autoconfig
config.load_autoconfig(False)
