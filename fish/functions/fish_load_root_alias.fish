function fish_load_root_alias --description "Loads a doas/sudo function with alias/function expansion"
    function s --description "doas/sudo with alias/function expansion"
        set root "$(command -v doas &> /dev/null && echo doas || echo sudo)"
        if functions -q -- "$argv[1]"
            set cmdline (
                for arg in $argv
                    printf "\"%s\" " $arg
                end
            )
            set -x function_src (string join "\n" (string escape --style=var (functions "$argv[1]")))
            set argv fish -c 'string unescape --style=var (string split "\n" $function_src) | source; '$cmdline
            command $root $argv
        else
            command $root $argv
        end
    end
end
