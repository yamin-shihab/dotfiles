function connect --wraps="iwctl station wlan0 connect Atheer" --description "alias connect iwctl station wlan0 connect Atheer"
    if test "$argv" = ""
        iwctl station wlan0 connect Atheer
    else
        iwctl station wlan0 connect $argv
    end
end
