function pkgclean --wraps="paru -c && paru -Sc && paccache -r" --description "alias pkgclean paru -c && paru -Sc && paccache -r"
    paru -c && paru -Sc && paccache -r $argv
end
