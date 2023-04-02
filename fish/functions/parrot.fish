function parrot --wraps="curl -sL parrot.live" --description "alias parrot curl -sL parrot.live"
    curl -sL parrot.live $argv
end
