-- Comment with keybind
require("Comment").setup({
	toggler = {
		line = "<Leader>cc",
		block = "<Leader>bc",
	},
	opleader = {
		line = "<Leader>c",
		block = "<Leader>b",
	},
	extra = {
		above = "<Leader>c0",
		belove = "<Leader>co",
		eol = "<Leader>cA",
	},
})
