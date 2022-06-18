-- How things look in Neovim

return {
	setup = function()
		-- Disable spellcheck in terminals
		vim.api.nvim_create_autocmd({ "TermOpen" }, {
			pattern = { "*" },
			callback = function()
				vim.opt_local.spell = false
				vim.opt_local.number = false
				vim.opt_local.relativenumber = false
			end,
		})

		-- Git
		require("gitsigns").setup()

		-- Visible indents
		require("indent_blankline").setup({
			filetype_exclude = { "startify" },
		})

		-- Status bar / bufferline
		require("hardline").setup({
			bufferline = false,
			theme = "dracula",
			sections = {
				{
					class = "mode",
					item = require("hardline.parts.mode").get_item,
				},
				{
					class = "high",
					item = require("hardline.parts.git").get_item,
					hide = 100,
				},
				{
					class = "med",
					item = require("hardline.parts.filename").get_item,
				},
				"%<",
				{
					class = "med",
					item = "%=",
				},
				{
					class = "med",
					item = require("hardline.parts.treesitter-context").get_item,
				},
				{
					class = "med",
					item = require("hardline.parts.wordcount").get_item,
					hide = 100,
				},
				{
					class = "error",
					item = require("hardline.parts.lsp").get_error,
				},
				{
					class = "warning",
					item = require("hardline.parts.lsp").get_warning,
				},
				{
					class = "warning",
					item = require("hardline.parts.whitespace").get_item,
				},
				{
					class = "high",
					item = require("hardline.parts.filetype").get_item,
					hide = 60,
				},
				{
					class = "mode",
					item = require("hardline.parts.line").get_item,
				},
			},
		})

		-- Dracula
		vim.g.dracula_show_end_of_buffer = true
		vim.g.dracula_italic_comment = true
		vim.cmd("colorscheme dracula")

		-- Colorizer
		require("colorizer").setup()
	end,
}
