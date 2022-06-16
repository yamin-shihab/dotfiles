-- Setting up functionality plugins

return {
	setup = function()
		-- S P E E D
		require("impatient")

		-- Diagnostics
		require("trouble").setup({
			icons = false,
			fold_open = "v",
			fold_closed = ">",
			signs = {
				error = "e",
				warning = "w",
				hint = "h",
				information = "i",
			},
			use_diagnostic_signs = false,
		})

		-- Comment with keybind
		require("Comment").setup()

		-- Line peaking
		require("numb").setup()

		-- Open where left off
		require("nvim-lastplace").setup()

		-- Automatic pairs
		require("nvim-autopairs").setup({
			check_ts = true,
		})
	end,
}
