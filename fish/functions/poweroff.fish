function poweroff --description 'alias poweroff sudo systemctl poweroff'
  sudo systemctl poweroff $argv; 
end
