function disconnect -d 'Disconnects from the internet connection, Atheer, using iwctl'
  iwctl station wlan0 disconnect $argv;
end
