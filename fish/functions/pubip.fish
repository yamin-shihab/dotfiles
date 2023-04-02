function pubip --description "alias pubip curl -sL ifconfig.co/"
    curl -sL "ifconfig.co/$argv"
end
