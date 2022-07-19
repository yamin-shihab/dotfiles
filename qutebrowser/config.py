# Dracula
import draw

draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})

# Keybinds
config.bind("Z", "jseval var dracula=['7=282a36','8=f8f8f2','9=50fa7b','ae=t','t=p','s=m','w=n','m=l','o=s','j=282a36','a=p','aa=bd93f9','u=-1','x=f1fa8c','y=44475a','af=1','ai=1','f=1'];for(var i=0;i<dracula.length;i++)document.cookie=dracula[i];alert('Appearance settings have successfully been updated!');location.reload();")
config.bind("z", "open -t https://raw.githubusercontent.com/qutebrowser/qutebrowser/master/doc/img/cheatsheet-big.png")

# Options
c.hints.chars = "arstneio"
c.hints.mode = "letter"
c.spellcheck.languages = [ "en-US" ]
c.auto_save.session = True
c.colors.webpage.preferred_color_scheme = "dark"
c.downloads.location.directory = "$HOME/downloads/"
c.fonts.default_family = "JetBrains Mono NL"
c.fonts.default_size = "10pt"
c.window.hide_decoration = True
c.content.javascript.can_access_clipboard = True
c.content.pdfjs = True

# Don't load autoconfig
config.load_autoconfig(False)
