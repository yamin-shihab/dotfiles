function narrate -d "Gives a Super Smash Bros. narrator success or failure sound depending on given command; needs ffplay"
 	if not type ffplay > /dev/null 2>&1
	 	echo "ffplay isn't installed"
	 	return
	end

	set melee_sound_dir "$HOME/.config/fish/narrate_sounds"

 	$argv

	if test $status = 0
		ffplay -loglevel error -nodisp -autoexit "$melee_sound_dir/success.mp3" > /dev/null &
 	else
		ffplay -loglevel error -nodisp -autoexit "$melee_sound_dir/failure.mp3" > /dev/null &
	end
end
