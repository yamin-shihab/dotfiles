function gitignore -d 'Generate a .gitignore file from gitignore.io, takes in a tool to print a .gitignore for as an argument'
	curl -L "https://www.gitignore.io/api/$argv"
end
