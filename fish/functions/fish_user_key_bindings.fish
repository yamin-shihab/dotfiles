function fish_user_key_bindings
    fish_hybrid_key_bindings

    bind -M insert \es "fish_commandline_prepend s"
    bind -M visual \es "fish_commandline_prepend s"
    bind \es "fish_commandline_prepend s"
end
