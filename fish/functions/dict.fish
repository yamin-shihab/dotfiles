function dict -d "Gives definition of word, using dict.org"
	curl "dict://dict.org/d:$argv"
end
