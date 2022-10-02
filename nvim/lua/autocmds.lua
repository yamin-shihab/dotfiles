-- Autocommands for Neovim
vim.api.nvim_create_autocmd({ "TermOpen" }, {
	pattern = "*",
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})
