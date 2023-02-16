command -v mcfly &> /dev/null && mcfly init fish | source
command -v zoxide &> /dev/null && zoxide init fish | source

if test "$TERM" = "linux"
    printf %b "\e[40m" "\e[8]"
    printf %b "\e[37m" "\e[8]"
    printf %b "\e]P0282a36"
    printf %b "\e]P86272a4"
    printf %b "\e]P1ff5555"
    printf %b "\e]P9ff7777"
    printf %b "\e]P250fa7b"
    printf %b "\e]PA70fa9b"
    printf %b "\e]P3f1fa8c"
    printf %b "\e]PBffb86c"
    printf %b "\e]P4bd93f9"
    printf %b "\e]PCcfa9ff"
    printf %b "\e]P5ff79c6"
    printf %b "\e]PDff88e8"
    printf %b "\e]P68be9fd"
    printf %b "\e]PE97e2ff"
    printf %b "\e]P7f8f8f2"
    printf %b "\e]PFffffff"
    clear
end
