# Stuff that adds to the shell
command -v zoxide &> /dev/null && zoxide init fish | source

if test "$TERM" = "linux"
    and test "$TERM_DRACULA" != "true"
    printf %b "\e[40m" "\e[8]"
    printf %b "\e[37m" "\e[8]"
    printf %b "\e]P0282A36"
    printf %b "\e]P86272A4"
    printf %b "\e]P1FF5555"
    printf %b "\e]P9FF7777"
    printf %b "\e]P250FA7B"
    printf %b "\e]PA70FA9B"
    printf %b "\e]P3F1FA8C"
    printf %b "\e]PBFFB86C"
    printf %b "\e]P4BD93F9"
    printf %b "\e]PCCFA9FF"
    printf %b "\e]P5FF79C6"
    printf %b "\e]PDFF88E8"
    printf %b "\e]P68BE9FD"
    printf %b "\e]PE97E2FF"
    printf %b "\e]P7F8F8F2"
    printf %b "\e]PFFFFFFF"
    clear
    set -x TERM_DRACULA "true"
end
