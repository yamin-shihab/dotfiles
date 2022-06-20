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
