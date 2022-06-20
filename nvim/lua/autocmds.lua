-- Autocommands for Neovim

-- Disable spellcheck in terminals
vim.api.nvim_create_autocmd({ "TermOpen" }, {
	pattern = "*",
	callback = function()
		vim.opt_local.spell = false
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end,
})

-- Org file LSP support
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.org",
	callback = function()
		vim.opt.filetype = "org"
	end,
})

-- Stop adding a comment after I press enter!
vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = "*", command = "set fo-=c fo-=r fo-=o" })
