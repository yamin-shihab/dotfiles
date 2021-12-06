if status is-interactive
	# Commands to run in interactive sessions can go here
	alias nvim="nvim -p"
	alias pls="sudo"
	alias please="sudo"
	alias i3lock-color='i3lock --blur=7.5 -k --noinput-text="No input" --lock-text="Locking..." --lockfailed-text="Lock failed!" --wrong-text="Incorrect" --verif-text="Verifying..." --radius="120" --date-color="FFFFFF" --time-color="FFFFFF" --greeter-color="FFFFFF" --layout-color="FFFFFF" --time-font="JetBrainsMono Nerd Font" --date-font="JetBrainsMono Nerd Font" --layout-font="JetBrainsMono Nerd Font" --verif-font="JetBrainsMono Nerd Font" --wrong-font="JetBrainsMono Nerd Font" --greeter-font="JetBrainsMono Nerd Font"'
	alias exa="exa -l --color-scale -a --group-directories-first -B -h -m --git --sort name"
	zoxide init fish | source
	export PATH="$PATH:~/.cargo/bin"
	export TERMINAL="/usr/bin/wezterm"
end
