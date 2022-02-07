if status is-interactive
	# Commands to run in interactive sessions can go here
	fish_add_path "$HOME/.local/bin" "$HOME/.cargo/bin"
	alias pls="sudo"
	alias suspend="sudo systemctl suspend"
	alias connect="iwctl station wlan0 connect Atheer"
	alias disonnect="iwctl station wlan0 disconnect"
	alias destroy-all-orphans="sudo pacman -Rns (pacman -Qtdq)"
	export TERMINAL="/usr/bin/wezterm"
	zoxide init fish | source
end
