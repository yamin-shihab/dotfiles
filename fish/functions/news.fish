function news -d 'Shows news from getnews.tech, can take in arguments'
	curl "getnews.tech/$argv" | bat
end
