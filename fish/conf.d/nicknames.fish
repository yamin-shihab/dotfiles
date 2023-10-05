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
alias ytm "yt-dlp --embed-thumbnail --download-archive download-archive.txt --no-post-overwrites -iwx --audio-format opus -o '%(title)s.%(ext)s' 'https://www.youtube.com/playlist?list=PLycMymTUi1MAVImVNyHThM0aKvbtDxwCc'"

fish_load_root_function
