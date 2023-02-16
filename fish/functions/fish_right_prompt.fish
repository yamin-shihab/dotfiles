function fish_right_prompt
    set_color brblack
    date --rfc-3339=s
    printf " "
    fish_default_mode_prompt
end
