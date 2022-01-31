import dracula.draw

# Load existing settings made via :set
config.load_autoconfig()

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})

c.auto_save.session = True
c.colors.webpage.preferred_color_scheme = "dark"
c.downloads.location.directory = "/home/yamin/downloads/"
c.fonts.default_family = "JetBrainsMono Nerd Font"
c.fonts.default_size = "10pt"
c.window.hide_decoration = True
