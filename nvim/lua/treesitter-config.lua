-- Treesitter-related stuff

return {
	setup = function()
		-- Treesitter context component
		require("nvim-gps").setup({
			disable_icons = true,
		})

		-- Treesitter + spellchecking
		require("spellsitter").setup()

		-- Dim unused variables
		require("dim").setup()

		-- Tag autorename and autoclose
		require("nvim-ts-autotag").setup()

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
	end,
}
