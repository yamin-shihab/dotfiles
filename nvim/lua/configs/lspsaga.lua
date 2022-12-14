-- LSP stuff
require("lspsaga").init_lsp_saga({
	code_action_icon = "!",
	diagnostic_header = { "e", "w", "i", "h" },
	finder_icons = {
		def = "{}",
		ref = "()",
		link = "->",
	},
	symbol_in_winbar = {
		separator = " ",
	},
})
