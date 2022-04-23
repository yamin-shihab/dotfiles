function pubip -d "Shows the public ip address of the user, using ifconfig.co, can take in arguments"
	curl "ifconfig.co/$argv"
end
