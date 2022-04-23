function crypto -d "Shows crypto prices, can take in arguments"
	curl "rate.sx/$argv"
end
