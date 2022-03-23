function suspend -d 'Suspends the system, using systemctl'
	systemctl suspend $argv
end
