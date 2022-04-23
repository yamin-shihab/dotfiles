function weather -d "Shows the weather, using wttr.in, can take in arguments"
	curl "wttr.in/$argv"
end
