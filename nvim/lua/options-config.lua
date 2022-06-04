-- Neovim options

return {
	setup = function()
		vim.opt.background = "dark"
		vim.opt.breakindent = true
		vim.opt.cursorline = true
		vim.opt.ignorecase = true
		vim.opt.laststatus = 3
		vim.opt.lazyredraw = true
		vim.opt.linebreak = true
		vim.opt.number = true
		vim.opt.relativenumber = true
		vim.opt.ruler = true
		vim.opt.scrolljump = 5
		vim.opt.shiftwidth = 4
		vim.opt.showbreak = " > "
		vim.opt.showtabline = 2
		vim.opt.smartcase = true
		vim.opt.softtabstop = 4
		vim.opt.spell = true
		vim.opt.tabstop = 4
		vim.opt.termguicolors = true
		vim.opt.title = true
	end,
}
