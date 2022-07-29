-- Packer plugins to install

require("packer").startup({
	function(use)
		-- To be loaded first
		use({ "lewis6991/impatient.nvim", config = require("configs/impatient") })
		use("wbthomason/packer.nvim")

		-- Treesitter
		use({
			"SmiteshP/nvim-gps",
			requires = { "nvim-treesitter/nvim-treesitter" },
			config = require("configs/gps"),
		})
		use({ "lewis6991/spellsitter.nvim", config = require("configs/spellsitter") })
		use("nvim-treesitter/nvim-treesitter")
		use({ "p00f/nvim-ts-rainbow", config = require("configs/treesitter") })

		-- Appearance
		use({
			"ojroques/nvim-hardline",
			requres = { "gitsigns.nvim", "nvim-gps" },
			config = require("configs/hardline"),
		})
		use({ "Mofiqul/dracula.nvim", config = require("configs/dracula") })
		use({ "lewis6991/gitsigns.nvim", config = require("configs/gitsigns") })
		use({ "lukas-reineke/indent-blankline.nvim", config = require("configs/indent-blankline") })
		use("mhinz/vim-startify")
		use({ "norcalli/nvim-colorizer.lua", config = require("configs/colorizer") })
		use("tversteeg/registers.nvim")
		use("yamatsum/nvim-cursorline")

		-- Functionality
		use("andweeb/presence.nvim")
		use({ "ethanholz/nvim-lastplace", config = require("configs/lastplace") })
		use("https://gitlab.com/yorickpeterse/nvim-window.git")
		use("jghauser/mkdir.nvim")
		use("mcauley-penney/tidy.nvim")
		use({ "nacro90/numb.nvim", config = require("configs/numb") })
		use({ "numToStr/Comment.nvim", config = require("configs/comment") })
		use("sindrets/winshift.nvim")
		use({ "windwp/nvim-autopairs", config = require("configs/autopairs") })
	end,
	config = {
		display = {
			done_sym = "*",
			error_sym = "!",
			header_sym = "-",
			moved_sym = "@",
			removed_sym = "-",
			working_sym = "%",
		},
	},
})
