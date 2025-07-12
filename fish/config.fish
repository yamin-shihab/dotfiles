set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_STATE_HOME "$HOME/.local/state"

set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"
set -gx CUDA_CACHE_PATH "$XDG_CACHE_HOME/nv"
set -gx NETHACKOPTIONS "$XDG_CONFIG_HOME/nethack/nethackrc"
set -gx NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"
set -gx RUSTUP_HOME "$XDG_DATA_HOME/rustup"
set -gx WINEPREFIX "$XDG_DATA_HOME/wineprefixes/fuck-this-shit"

fish_add_path "$CARGO_HOME/bin"

set -gx SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS 0
set -gx STEAM_FRAME_FORCE_CLOSE 1
set -gx __GL_SHADER_DISK_CACHE_SKIP_CLEANUP 1

set -gx LESS_TERMCAP_mb (set_color -i yellow)
set -gx LESS_TERMCAP_md (set_color -o blue)
set -gx LESS_TERMCAP_me (set_color normal)
set -gx LESS_TERMCAP_so (set_color -r red)
set -gx LESS_TERMCAP_se (set_color normal)
set -gx LESS_TERMCAP_us (set_color -u green)
set -gx LESS_TERMCAP_ue (set_color normal)
set -gx GROFF_NO_SGR

if type -q dircolors
    eval (dircolors -c)
end

set -g fish_greeting

abbr -a cp cp -iv
abbr -a df df -h
abbr -a du du -bchsx
abbr -a free free -h
abbr -a grep grep -n
abbr -a ip ip --color=auto
abbr -a ls ls -hvAG --group-directories-first
abbr -a mkdir mkdir -pv
abbr -a mv mv -iv
abbr -a rm rm -iv
abbr -a sort sort -h

fish_hybrid_key_bindings
