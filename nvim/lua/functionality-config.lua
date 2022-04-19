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

		-- File manager (I'm using Joshuto)
		require("fm-nvim").setup({
			ui = {
				default = "float",
				float = {
					border = "single",
					blend = 20,
					height = 0.85,
					width = 0.85,
					x = 0.5,
					y = 0.5,
				},
				split = {
					direction = "topleft",
					size = 32,
				},
			},
		})

		-- Open where left off
		require("nvim-lastplace").setup()

		-- Commenting
		require("Comment").setup()

		-- Automatic pairs
		require("nvim-autopairs").setup({
			check_ts = true,
		})
	end,
}
