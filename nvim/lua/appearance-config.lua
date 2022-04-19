-- How things look in Neovim

return {
	setup = function()
		-- Git
		require("gitsigns").setup()

		-- Nicer menu
		local wilder = require("wilder")
		wilder.setup({ modes = { ":", "/", "?" } })
		wilder.set_option(
			"renderer",
			wilder.wildmenu_renderer({
				highlighter = wilder.basic_highlighter(),
			})
		)

		-- Key combinations list
		require("which-key").setup({
			icons = {
				breadcrumb = ">>",
				separator = "->",
				group = "+",
			},
		})

		-- Highlight comments
		require("todo-comments").setup({
			keywords = {
				FIX = {
					icon = "f",
					color = "error",
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
				},
				TODO = { icon = "t", color = "info" },
				HACK = { icon = "h", color = "warning" },
				WARN = { icon = "w", color = "warning", alt = { "WARNING", "XXX" } },
				PERF = { icon = "p", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = "n", color = "hint", alt = { "INFO" } },
			},
		})

		-- Visible indents
		require("indent_blankline").setup({
			filetype_exclude = { "startify" },
		})

		-- Status bar / bufferline
		require("hardline").setup({
			bufferline = true,
			theme = "dracula",
			sections = { -- define sections
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
					item = require("hardline.parts.cwd").get_item,
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
					class = "low",
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
