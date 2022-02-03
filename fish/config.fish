if status is-interactive
	# Commands to run in interactive sessions can go here
	fish_add_path "$HOME/.local/bin" "$HOME/.cargo/bin"
	alias pls="sudo"
	alias please="sudo"
	alias connect="iwctl station wlan0 connect Atheer"
	alias disonnect="iwctl station wlan0 disconnect"
	export TERMINAL="/usr/bin/wezterm"
	zoxide init fish | source
	if test -n "$DESKTOP_SESSION"
    	set -x (gnome-keyring-daemon --start | string split "=")
	end
end
