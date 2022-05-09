set -Ux XDG_CACHE_HOME "$HOME/.cache"
set -Ux XDG_CONFIG_HOME "$HOME/.config"
set -Ux XDG_DATA_HOME "$HOME/.local/share"
set -Ux XDG_STATE_HOME "$HOME/.local/state"

set -Ux CARGO_HOME "$XDG_DATA_HOME/cargo"
set -Ux NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"
set -Ux RUSTUP_HOME "$XDG_DATA_HOME/rustup"
set -Ux GOPATH "$XDG_DATA_HOME/go"
set -Ux CUDA_CACHE_PATH "$XDG_CACHE_HOME/nv"
set -Ux HISTFILE "$XDG_STATE_HOME/bash/history"

set -Ux PAGER "/usr/bin/bat"
set -Ux BAT_THEME "Dracula"
set -Ux CC "/usr/bin/clang"
set -Ux CXX "/usr/bin/clang++"
set -Ux EDITOR "/usr/bin/nvim"
set -Ux PF_INFO "ascii title host kernel os shell uptime memory wm palette"

fish_add_path "$HOME/.local/bin" "$XDG_DATA_HOME/cargo/bin" "$GOPATH/bin"