function fish_load_root_function
    function s
        set root "$(command -v doas &> /dev/null && printf doas || printf sudo)"
        if functions -q -- "$argv[1]"
            set cmdline (
                for arg in $argv
                    printf "\"%s\" " $arg
                end
            )
            set -x function_src (string join "\n" (string escape --style=var (functions "$argv[1]")))
            set argv fish -c 'string unescape --style=var (string split "\n" $function_src) | source; '$cmdline
            if test $root = sudo
                command sudo -E $argv
            else
                command doas $argv
            end
        else
            command $root $argv
        end
    end
end
