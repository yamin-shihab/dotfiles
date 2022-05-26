-- Neovim options

return {
	setup = function()
		vim.opt.autoread = true
		vim.opt.background = "dark"
		vim.opt.breakindent = true
		vim.opt.cursorline = true
		vim.opt.ignorecase = true
		vim.opt.incsearch = true
		vim.opt.laststatus = 3
		vim.opt.linebreak = true
		vim.opt.number = true
		vim.opt.relativenumber = true
		vim.opt.ruler = true
		vim.opt.shiftwidth = 0
		vim.opt.showbreak = " > "
		vim.opt.showtabline = 2
		vim.opt.smartcase = true
		vim.opt.spell = true
		vim.opt.tabstop = 4
		vim.opt.termguicolors = true
		vim.opt.timeoutlen = 1000
		vim.opt.title = true
		vim.opt.wrap = true
	end,
}
