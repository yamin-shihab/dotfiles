-- Treesitter + colored delimiters
require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
		colors = { -- Dracula theme
			"#ff5555",
			"#ffb86c",
			"#f1fa8c",
			"#50fa7b",
			"#8be9fd",
			"#bd93f9",
			"#ff79c6",
		},
	},
})
