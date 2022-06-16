-- Packer plugins to install

return {
	setup = function()
		-- Packer packages
		return {
			packages = function(use)
				use("wbthomason/packer.nvim")

				-- LSP
				use({
					"hrsh7th/nvim-cmp",
					requires = {
						"L3MON4D3/LuaSnip",
						"hrsh7th/cmp-nvim-lsp",
						"neovim/nvim-lspconfig",
						"saadparwaiz1/cmp_luasnip",
					},
				})
				use("neovim/nvim-lspconfig")
				use("folke/lsp-colors.nvim")

				-- Treesitter
				use({
					"narutoxy/dim.lua",
					requires = {
						"neovim/nvim-lspconfig",
						"nvim-treesitter/nvim-treesitter",
					},
				})
				use({
					"SmiteshP/nvim-gps",
					requires = { "nvim-treesitter/nvim-treesitter" },
				})
				use("lewis6991/spellsitter.nvim")
				use("nvim-treesitter/nvim-treesitter")
				use("p00f/nvim-ts-rainbow")

				-- Appearance
				use({
					"ojroques/nvim-hardline",
					requres = { "gitsigns.nvim", "nvim-gps" },
				})
				use("Mofiqul/dracula.nvim")
				use("jesseleite/vim-noh")
				use("lewis6991/gitsigns.nvim")
				use("lukas-reineke/indent-blankline.nvim")
				use("mhinz/vim-startify")
				use("norcalli/nvim-colorizer.lua")
				use("tversteeg/registers.nvim")
				use("yamatsum/nvim-cursorline")

				-- Functionality
				use("andweeb/presence.nvim")
				use("ethanholz/nvim-lastplace")
				use("folke/trouble.nvim")
				use("jghauser/mkdir.nvim")
				use("mcauley-penney/tidy.nvim")
				use("nacro90/numb.nvim")
				use("numToStr/Comment.nvim")
				use("sindrets/winshift.nvim")
				use("windwp/nvim-autopairs")
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
		}
	end,
}
