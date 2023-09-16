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
alias ca "$PAGER"
alias co "cargo"
alias connect "iwctl station wlan0 connect Atheer"
alias crypto 'curl -sL "rate.sx/$argv"'
alias ctl "systemctl"
alias d "dict"
alias dad 'curl -sL "icanhazdadjoke.com/$argv"'
alias dconnect "iwctl station wlan0 disconnect"
alias g "git"
alias gignore 'curl -sL "gitignore.io/api/$argv"'
alias i "ip -c=auto"
alias ka "killall"
alias l "eza --git -Fas=Name --group-directories-first"
alias ll "eza --git -Flas=Name --group-directories-first"
alias m "batman"
alias mk "colormake"
alias mkd "mkdir -p"
alias msc "mpv --vo=null --vid=no --term-osd-bar --volume=60 --shuffle"
alias p "paru"
alias parrot "curl -sL parrot.live"
alias pkgclean "paru -c && paru -Sc && paccache -r"
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
