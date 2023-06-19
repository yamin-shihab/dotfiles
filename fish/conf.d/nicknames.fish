# Aliases that I use (it's called nicknames so that it gets evaluated after exports)
function fish_load_root_function
    function s
        set root "$(command -v doas &> /dev/null && printf doas || printf sudo)"
        if functions -q -- "$argv[1]"
            set cmdline (
                for arg in $argv
                    printf "\"%s\" " $arg
                end
            )
            set -x function_src (string join "\n" (string escape --style=var (functions "$argv[1]")))
            set argv fish -c 'string unescape --style=var (string split "\n" $function_src) | source; '$cmdline
            if test $root = sudo
                command sudo -E $argv
            else
                command doas $argv
            end
        else
            command $root $argv
        end
    end
end

alias ahoythereapirateslifeformetimetosailthehighseasseriouslyiswearpiracyisethicalman "if [ ! -f wgcf-account.toml ]; wgcf register; end; wgcf generate && wg-quick up wgcf-profile.conf"
alias c "cpz"
alias ca "$PAGER"
alias co "cargo"
alias connect "iwctl station wlan0 connect Atheer"
alias crypto 'curl -sL "rate.sx/$argv"'
alias ctl "systemctl"
alias dad 'curl -sL "icanhazdadjoke.com/$argv"'
alias dconnect "iwctl station wlan0 disconnect"
alias g "gitui"
alias gignore 'curl -sL "gitignore.io/api/$argv"'
alias i "ip -c=auto"
alias ka "killall"
alias l "exa --git -Fas=Name --group-directories-first"
alias ll "exa --git -Flas=Name --group-directories-first"
alias m "batman"
alias mk "colormake"
alias mkd "mkdir -p"
alias music "mpv --vo=null --vid=no --term-osd-bar --volume=45 --shuffle"
alias oopsnvmthefedsareaftermedamnispcopyrighttrollsanddmcaletters "wg-quick down wgcf-profile.conf"
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
alias wttr 'curl -sL "wttr.in/$argv"'
alias x "xclip"
alias ytm "yt-dlp --embed-thumbnail --download-archive download-archive.txt --no-post-overwrites -iwx --audio-format opus -o '%(channel)s - %(title)s.%(ext)s' 'https://youtube.com/playlist?list=PLycMymTUi1MAfwgu-0tZgBNMPh8Of3ht6'"

fish_load_root_function
