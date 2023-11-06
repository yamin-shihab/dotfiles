# Fish plugins to install using fundle
fundle plugin "dracula/fish"
fundle plugin "franciscolourenco/done"
fundle plugin "jorgebucaran/autopair.fish"
fundle plugin "oh-my-fish/plugin-foreign-env"
fundle init

# Fish environment variables
fenv source /etc/profile
fish_add_path -P "$HOME/.local/bin", "$CARGO_HOME/bin" "/usr/local/games" "/usr/games"
fish_hybrid_key_bindings

# Program environment variables
command -v ninja &> /dev/null && set -x CMAKE_GENERATOR "Ninja"
command -v nvim &> /dev/null && set -x EDITOR "nvim" && set -x VISUAL "nvim"
command -v qutebrowser &> /dev/null && set -x BROWSER "qutebrowser"

# Option environment variables
set -x FZF_DEFAULT_COMMAND "find /"
set -x FZF_DEFAULT_OPTS "--height 40% --layout=reverse --no-separator --no-scrollbar --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"
set -x GROFF_NO_SGR 1
set -x LESS_TERMCAP_mb \e"[1;31m"
set -x LESS_TERMCAP_md \e"[1;34m"
set -x LESS_TERMCAP_me \e"[0m"
set -x LESS_TERMCAP_se \e"[0m"
set -x LESS_TERMCAP_so \e"[01;45;37m"
set -x LESS_TERMCAP_ue \e"[0m"
set -x LESS_TERMCAP_us \e"[01;36m"
set -x LS_COLORS "rs=0:di=01;38;2;189;147;249:ln=01;38;2;139;233;253:mh=00:pi=48;2;33;34;44;38;2;241;250;140:so=01;38;2;255;121;198:do=01;38;2;255;121;198:bd=48;2;33;34;44;38;2;241;250;140;01:cd=48;2;33;34;44;38;2;241;250;140;01:or=48;2;33;34;44;38;2;255;85;85;01:mi=00:su=38;2;248;248;242;48;2;255;85;85:sg=38;2;33;34;44;48;2;241;250;140:ca=00:tw=38;2;33;34;44;48;2;80;250;123:ow=38;2;189;147;249;48;2;80;250;123:st=38;2;248;248;242;48;2;189;147;249:ex=01;38;2;80;250;123:*.tar=01;38;2;255;85;85:*.tgz=01;38;2;255;85;85:*.arc=01;38;2;255;85;85:*.arj=01;38;2;255;85;85:*.taz=01;38;2;255;85;85:*.lha=01;38;2;255;85;85:*.lz4=01;38;2;255;85;85:*.lzh=01;38;2;255;85;85:*.lzma=01;38;2;255;85;85:*.tlz=01;38;2;255;85;85:*.txz=01;38;2;255;85;85:*.tzo=01;38;2;255;85;85:*.t7z=01;38;2;255;85;85:*.zip=01;38;2;255;85;85:*.z=01;38;2;255;85;85:*.dz=01;38;2;255;85;85:*.gz=01;38;2;255;85;85:*.lrz=01;38;2;255;85;85:*.lz=01;38;2;255;85;85:*.lzo=01;38;2;255;85;85:*.xz=01;38;2;255;85;85:*.zst=01;38;2;255;85;85:*.tzst=01;38;2;255;85;85:*.bz2=01;38;2;255;85;85:*.bz=01;38;2;255;85;85:*.tbz=01;38;2;255;85;85:*.tbz2=01;38;2;255;85;85:*.tz=01;38;2;255;85;85:*.deb=01;38;2;255;85;85:*.rpm=01;38;2;255;85;85:*.jar=01;38;2;255;85;85:*.war=01;38;2;255;85;85:*.ear=01;38;2;255;85;85:*.sar=01;38;2;255;85;85:*.rar=01;38;2;255;85;85:*.alz=01;38;2;255;85;85:*.ace=01;38;2;255;85;85:*.zoo=01;38;2;255;85;85:*.cpio=01;38;2;255;85;85:*.7z=01;38;2;255;85;85:*.rz=01;38;2;255;85;85:*.cab=01;38;2;255;85;85:*.wim=01;38;2;255;85;85:*.swm=01;38;2;255;85;85:*.dwm=01;38;2;255;85;85:*.esd=01;38;2;255;85;85:*.avif=01;38;2;255;121;198:*.jpg=01;38;2;255;121;198:*.jpeg=01;38;2;255;121;198:*.mjpg=01;38;2;255;121;198:*.mjpeg=01;38;2;255;121;198:*.gif=01;38;2;255;121;198:*.bmp=01;38;2;255;121;198:*.pbm=01;38;2;255;121;198:*.pgm=01;38;2;255;121;198:*.ppm=01;38;2;255;121;198:*.tga=01;38;2;255;121;198:*.xbm=01;38;2;255;121;198:*.xpm=01;38;2;255;121;198:*.tif=01;38;2;255;121;198:*.tiff=01;38;2;255;121;198:*.png=01;38;2;255;121;198:*.svg=01;38;2;255;121;198:*.svgz=01;38;2;255;121;198:*.mng=01;38;2;255;121;198:*.pcx=01;38;2;255;121;198:*.mov=01;38;2;255;121;198:*.mpg=01;38;2;255;121;198:*.mpeg=01;38;2;255;121;198:*.m2v=01;38;2;255;121;198:*.mkv=01;38;2;255;121;198:*.webm=01;38;2;255;121;198:*.webp=01;38;2;255;121;198:*.ogm=01;38;2;255;121;198:*.mp4=01;38;2;255;121;198:*.m4v=01;38;2;255;121;198:*.mp4v=01;38;2;255;121;198:*.vob=01;38;2;255;121;198:*.qt=01;38;2;255;121;198:*.nuv=01;38;2;255;121;198:*.wmv=01;38;2;255;121;198:*.asf=01;38;2;255;121;198:*.rm=01;38;2;255;121;198:*.rmvb=01;38;2;255;121;198:*.flc=01;38;2;255;121;198:*.avi=01;38;2;255;121;198:*.fli=01;38;2;255;121;198:*.flv=01;38;2;255;121;198:*.gl=01;38;2;255;121;198:*.dl=01;38;2;255;121;198:*.xcf=01;38;2;255;121;198:*.xwd=01;38;2;255;121;198:*.yuv=01;38;2;255;121;198:*.cgm=01;38;2;255;121;198:*.emf=01;38;2;255;121;198:*.ogv=01;38;2;255;121;198:*.ogx=01;38;2;255;121;198:*.aac=00;38;2;139;233;253:*.au=00;38;2;139;233;253:*.flac=00;38;2;139;233;253:*.m4a=00;38;2;139;233;253:*.mid=00;38;2;139;233;253:*.midi=00;38;2;139;233;253:*.mka=00;38;2;139;233;253:*.mp3=00;38;2;139;233;253:*.mpc=00;38;2;139;233;253:*.ogg=00;38;2;139;233;253:*.ra=00;38;2;139;233;253:*.wav=00;38;2;139;233;253:*.oga=00;38;2;139;233;253:*.opus=00;38;2;139;233;253:*.spx=00;38;2;139;233;253:*.xspf=00;38;2;139;233;253:*~=00;38;2;98;114;164:*#=00;38;2;98;114;164:*.bak=00;38;2;98;114;164:*.crdownload=00;38;2;98;114;164:*.dpkg-dist=00;38;2;98;114;164:*.dpkg-new=00;38;2;98;114;164:*.dpkg-old=00;38;2;98;114;164:*.dpkg-tmp=00;38;2;98;114;164:*.old=00;38;2;98;114;164:*.orig=00;38;2;98;114;164:*.part=00;38;2;98;114;164:*.rej=00;38;2;98;114;164:*.rpmnew=00;38;2;98;114;164:*.rpmorig=00;38;2;98;114;164:*.rpmsave=00;38;2;98;114;164:*.swp=00;38;2;98;114;164:*.tmp=00;38;2;98;114;164:*.ucf-dist=00;38;2;98;114;164:*.ucf-new=00;38;2;98;114;164:*.ucf-old=00;38;2;98;114;164:"
set -x PF_INFO "ascii title host kernel os shell uptime memory wm palette"
set -x SUDO_PROMPT "$(tput setab 1 setaf 7 bold bel; printf '[')sudo]$(tput sgr0) $(tput setaf 6)password for$(tput sgr0) $(tput setaf 5)%p$(tput sgr0): "

# Directory environment variables
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_STATE_HOME "$HOME/.local/state"

set -x CARGO_HOME "$XDG_DATA_HOME/cargo"
set -x CRAWL_DIR "$XDG_DATA_HOME/crawl"
set -x CUDA_CACHE_PATH "$XDG_CACHE_HOME/nv"
set -x GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
set -x INPUTRC "$XDG_CONFIG_HOME/readline/inputrc"
set -x PARALLEL_HOME "$XDG_CONFIG_HOME/parallel"
set -x RANDFILE "$XDG_CACHE_HOME/openssl/rnd"
set -x RUSTUP_HOME "$XDG_DATA_HOME/rustup"
set -x WINEPREFIX "$XDG_DATA_HOME/wineprefixes/default"
set -x XAUTHORITY "$XDG_RUNTIME_DIR/Xauthority"
set -x XINITRC "$XDG_CONFIG_HOME/X11/xinitrc"

# TTY color scheme
if test "$TERM" = "linux"
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
end

# Abbreviations that I use
abbr connect "iwctl station wlan0 connect Atheer"
abbr cp "cp -iv"
abbr df "df -h"
abbr diff "diff --color=auto"
abbr disconnect "iwctl station wlan0 disconnect"
abbr gitignore "curl -Lfs https://gitignore.io/api/"
abbr grep "grep -r --color=auto"
abbr imgcat "wezterm imgcat"
abbr ip "ip --color=auto"
abbr ls "ls -AFGNhqv --color=auto --group-directories-first --time-style long-iso"
abbr mkdir "mkdir -pv"
abbr music "mpv --vo=null --vid=no --term-osd-bar --volume=40 --shuffle"
abbr mv "mv -iv"
abbr pkgclean "paru -c; paru -Sc; paccache -r -k 1"
abbr pubip "curl -Lfs https://ifconfig.co/"
abbr rm "rm -Iv"
abbr warp-down "wg-quick down wgcf-profile.conf"
abbr warp-up "if test ! -f wgcf-account.toml; wgcf register; end; wgcf generate && wg-quick up wgcf-profile.conf"
abbr wttr "curl -Lfs https://wttr.in/"
abbr ytm "yt-dlp --embed-thumbnail --download-archive download-archive.txt --no-post-overwrites -iwx --audio-format opus -o '%(channel)s - %(title)s [%(id)s].%(ext)s' 'https://www.youtube.com/playlist?list=PLycMymTUi1MAVImVNyHThM0aKvbtDxwCc'"

# Customized built-in functions
function fish_greeting
    if command -v pfetch > /dev/null
        pfetch
    end
end

function fish_mode_prompt --description "Displays the current mode"

end

function fish_prompt --description "Write out the prompt"
    set true_status $status
    set_color -o "magenta"
    printf "["
    set_color -o "green"
    printf "$USER"
    set_color -o "magenta"
    printf "@"
    set_color -o "blue"
    printf "$hostname "
    set_color -o "yellow"
    printf "$(prompt_pwd)"
    set_color -o "magenta"
    printf "] "
    set_color -o "red"
    printf "$true_status"
    set_color -o "cyan"
    printf "$(fish_is_root_user && printf \# || printf \$) "
    set_color "normal"
end

function fish_right_prompt
    set_color -o brblack
    date --rfc-3339=s
    printf " "
    fish_default_mode_prompt
end
