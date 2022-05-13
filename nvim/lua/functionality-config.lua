-- Setting up functionality plugins

return {
	setup = function()
		-- EZ motions
		require("hop").setup()

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

		-- Better increment/decrement
		local augend = require("dial.augend")
		require("dial.config").augends:register_group({
			default = {
				augend.constant.new({
					elements = { "and", "or" },
					word = true,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { "&&", "||" },
					word = false,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { "true", "false" },
					word = true,
					cyclic = true,
				}),
			},
		})

		-- Open where left off
		require("nvim-lastplace").setup()

		-- Automatic pairs
		require("nvim-autopairs").setup({
			check_ts = true,
		})
	end,
}
