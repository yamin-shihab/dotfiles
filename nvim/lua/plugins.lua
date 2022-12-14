-- Packer plugins to install
require("packer").startup({
	function(use)
		-- To be loaded first
		use({
			"lewis6991/impatient.nvim",
			config = function()
				require("configs/impatient")
			end,
		})
		use("wbthomason/packer.nvim")

		-- LSP
		use({
			"neovim/nvim-lspconfig",
			config = function()
				require("configs/lspconfig")
			end,
		})
		use({
			"glepnir/lspsaga.nvim",
			config = function()
				require("configs/lspconfig")
			end,
		})
		use({
			"ms-jpq/coq_nvim",
			config = function()
				require("configs/coq")
			end,
		})
		use({
			"ms-jpq/chadtree",
			config = function()
				require("configs/chadtree")
			end,
		})
		use("ms-jpq/coq.artifacts")

		-- Treesitter
		use({
			"p00f/nvim-ts-rainbow",
			config = function()
				require("configs/treesitter")
			end,
		})
		use("nvim-treesitter/nvim-treesitter")

		-- Appearance
		use({
			"nvim-lualine/lualine.nvim",
			config = function()
				require("configs/lualine")
			end,
		})
		use({
			"Mofiqul/dracula.nvim",
			config = function()
				require("configs/dracula")
			end,
		})
		use({
			"lewis6991/gitsigns.nvim",
			config = function()
				require("configs/gitsigns")
			end,
		})
		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("configs/indent-blankline")
			end,
		})
		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("configs/colorizer")
			end,
		})
		use({
			"tversteeg/registers.nvim",
			config = function()
				require("configs/registers")
			end,
		})
		use("yamatsum/nvim-cursorline")
		use("mhinz/vim-startify")

		-- Functionality
		use({
			"ethanholz/nvim-lastplace",
			config = function()
				require("configs/lastplace")
			end,
		})
		use({
			"mcauley-penney/tidy.nvim",
			config = function()
				require("configs/tidy")
			end,
		})
		use({
			"nacro90/numb.nvim",
			config = function()
				require("configs/numb")
			end,
		})
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("configs/comment")
			end,
		})
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("configs/autopairs")
			end,
		})
		use({
			"gaoDean/autolist.nvim",
			config = function()
				require("configs/autolist")
			end,
		})
		use("https://gitlab.com/yorickpeterse/nvim-window.git")
		use("jghauser/mkdir.nvim")
		use("sindrets/winshift.nvim")
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
