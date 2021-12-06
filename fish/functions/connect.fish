function connect --wraps='iwctl station wlan0 connect Atheer' --description 'alias connect iwctl station wlan0 connect Atheer'
  iwctl station wlan0 connect Atheer $argv; 
end
