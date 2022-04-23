function connect -d "Connect to the internet connection, Atheer, using iwctl"
  iwctl station wlan0 connect Atheer $argv;
end
