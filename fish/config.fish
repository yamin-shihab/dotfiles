# Fish plugins to install using fundle
fundle plugin "acomagu/fish-async-prompt"
fundle plugin "dracula/fish"
fundle plugin "franciscolourenco/done"
fundle plugin "jorgebucaran/autopair.fish"
fundle plugin "oh-my-fish/plugin-foreign-env"

fundle init

# Export variables for programs and the system
fenv source /etc/profile

command -v bat &> /dev/null && set -x PAGER "bat -p"
command -v ninja &> /dev/null && set -x CMAKE_GENERATOR "Ninja"
command -v nvim &> /dev/null && set -x EDITOR "nvim" && set -x VISUAL "nvim"
command -v chromium &> /dev/null && set -x BROWSER "chromium"

set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_STATE_HOME "$HOME/.local/state"

set -x ASPELL_CONF "per-conf $XDG_CONFIG_HOME/aspell/aspell.conf; personal $XDG_CONFIG_HOME/aspell/en.pws; repl $XDG_CONFIG_HOME/aspell/en.prepl"
set -x CARGO_HOME "$XDG_DATA_HOME/cargo"
set -x CRAWL_DIR "$XDG_DATA_HOME/crawl"
set -x CUDA_CACHE_PATH "$XDG_CACHE_HOME/nv"
set -x GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
set -x HISTFILE "$XDG_STATE_HOME/zsh/history"
set -x INPUTRC "$XDG_CONFIG_HOME/readline/inputrc"
set -x RANDFILE "$XDG_CACHE_HOME/openssl/rnd"
set -x RUSTUP_HOME "$XDG_DATA_HOME/rustup"
set -x WINEPREFIX "$XDG_DATA_HOME/wineprefixes/default"
set -x XAUTHORITY "$XDG_RUNTIME_DIR/Xauthority"
set -x XINITRC "$XDG_CONFIG_HOME/xorg/xinitrc"

set -x BAT_THEME "Dracula"
set -x EXA_COLORS "da=35"
set -x LS_COLORS "rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"
set -x MCFLY_KEY_SCHEME "vim"
set -x PF_INFO "ascii title host kernel os shell uptime memory wm palette"
set -x SUDO_PROMPT "$(tput setab 1 setaf 7 bold bel; printf '[')sudo]$(tput sgr0) $(tput setaf 6)password for$(tput sgr0) $(tput setaf 5)%p$(tput sgr0): "

fish_add_path -P "$HOME/.local/bin", "$CARGO_HOME/bin" "/usr/local/games" "/usr/games"
fish_hybrid_key_bindings

bind -M insert \es "fish_commandline_prepend s"
bind -M visual \es "fish_commandline_prepend s"
bind \es "fish_commandline_prepend s"

# Stuff that adds to the shell
command -v zoxide &> /dev/null && zoxide init fish | source

if test "$TERM_DRACULA" != "true"
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
    set TERM_DRACULA "true"
end

# Aliases that I use (it's called nicknames so that it gets evaluated after exports)
function fish_load_root_function
    function s
        if functions -q -- "$argv[1]"
            set cmdline (
                for arg in $argv
                    printf "\"%s\" " $arg
                end
            )

            set -x function_src (string join "\n" (string escape --style=var (functions "$argv[1]")))
            set argv fish -c 'string unescape --style=var (string split "\n" $function_src) | source; '$cmdline

            command sudo -E $argv
        else
            command sudo $argv
        end
    end
end

alias c "cpz"
alias co "cargo"
alias connect "iwctl station wlan0 connect Atheer"
alias crypto 'curl -sL "rate.sx/$argv"'
alias ct "$PAGER"
alias ctl "systemctl"
alias d "duf -theme=ansi"
alias dad 'curl -sL "icanhazdadjoke.com/$argv"'
alias disconnect "iwctl station wlan0 disconnect"
alias dt "dict"
alias g "git"
alias gitignore 'curl -sL "gitignore.io/api/$argv"'
alias i "ip -c=auto"
alias imgcat "wezterm imgcat"
alias ka "killall"
alias l "eza -Fas=Name --git --group-directories-first --time-style long-iso"
alias ll "eza -Flas=Name --git --group-directories-first --time-style long-iso"
alias m "batman"
alias mk "colormake"
alias mkd "mkdir -p"
alias music "mpv --vo=null --vid=no --term-osd-bar --volume=40 --shuffle"
alias p "paru"
alias parrot "curl -sL parrot.live"
alias pkgclean "paru -c; paru -Sc; paccache -r -k 1"
alias pm "pulsemixer"
alias pp "prettyping"
alias pubip 'curl -sL "ifconfig.co/$argv"'
alias r "rmz"
alias sx "startx"
alias tp "btop"
alias v "$EDITOR"
alias warp-down "wg-quick down wgcf-profile.conf"
alias warp-up "if [ ! -f wgcf-account.toml ]; wgcf register; end; wgcf generate && wg-quick up wgcf-profile.conf"
alias x "xclip"
alias ytm "yt-dlp --embed-thumbnail --download-archive download-archive.txt --no-post-overwrites -iwx --audio-format opus -o '%(channel)s - %(title)s [%(id)s].%(ext)s' 'https://www.youtube.com/playlist?list=PLycMymTUi1MAVImVNyHThM0aKvbtDxwCc'"

fish_load_root_function

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
