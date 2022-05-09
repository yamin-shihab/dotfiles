zoxide init fish | source

if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end
fundle plugin "franciscolourenco/done"
fundle plugin "jorgebucaran/replay.fish"
fundle plugin "andreiborisov/sponge"
fundle plugin "jorgebucaran/autopair.fish"
fundle plugin "oh-my-fish/theme-fishbone"
fundle init
