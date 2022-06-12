# Dracula
import draw

# Load existing settings made via :set
config.load_autoconfig()

# Dracula
draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})

c.hints.chars = "arstneio" # For Colemak
c.hints.mode = "letter"
c.spellcheck.languages = [ "en-CA" ]
c.auto_save.session = True
c.colors.webpage.preferred_color_scheme = "dark"
c.downloads.location.directory = "$HOME/downloads/"
c.fonts.default_family = "Comic Mono"
c.fonts.default_size = "10pt"
c.window.hide_decoration = True
c.content.javascript.can_access_clipboard = True
c.content.pdfjs = True

# Cheatsheet
config.bind("z", "open -t https://raw.githubusercontent.com/qutebrowser/qutebrowser/master/doc/img/cheatsheet-big.png")

# Dracula for Duckduckgo
config.bind("Z", "jseval var dracula=['7=282a36','8=f8f8f2','9=50fa7b','ae=t','t=p','s=m','w=n','m=l','o=s','j=282a36','a=p','aa=bd93f9','u=-1','x=f1fa8c','y=44475a','af=1','ai=1','f=1'];for(var i=0;i<dracula.length;i++)document.cookie=dracula[i];alert('Appearance settings have successfully been updated!');location.reload();")

# Colemak bindings
config.bind("n", "scroll left", mode="caret")
config.bind("e", "scroll down", mode="caret")
config.bind("i", "scroll up", mode="caret")
config.bind("o", "scroll right", mode="caret")

config.bind("n", "move-to-prev-char", mode="caret")
config.bind("e", "move-to-next-line", mode="caret")
config.bind("i", "move-to-prev-line", mode="caret")
config.bind("o", "move-to-next-char", mode="caret")

config.bind("N", "back")
config.bind("E", "tab-next")
config.bind("I", "tab-prev")
config.bind("O", "forward")

config.bind("n", "scroll left")
config.bind("e", "scroll down")
config.bind("i", "scroll up")
config.bind("o", "scroll right")

config.bind("j", "move-to-end-of-word", mode="caret")
config.bind("h", "selection-reverse", mode="caret")
config.bind("H", "set-cmd-text -s :open -t")
config.bind("K", "search-prev")
config.bind("l", "mode-enter insert")
config.bind("k", "search-next")
config.bind("h", "set-cmd-text -s :open")
