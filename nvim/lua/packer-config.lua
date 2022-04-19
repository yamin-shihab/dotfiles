-- Packer plugins to install

return {
	setup = function()
		-- Bootstrap packer if it isn't installed
		local fn = vim.fn
		local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
		if fn.empty(fn.glob(install_path)) > 0 then
			packer_bootstrap = fn.system({
				"git",
				"clone",
				"--depth",
				"1",
				"https://github.com/wbthomason/packer.nvim",
				install_path,
			})
		end

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
					"romgrk/nvim-treesitter-context",
					requires = { "nvim-treesitter/nvim-treesitter" },
				})
				use({
					"SmiteshP/nvim-gps",
					requires = { "nvim-treesitter/nvim-treesitter" },
				})
				use("lewis6991/spellsitter.nvim")
				use("nvim-treesitter/nvim-treesitter")
				use("p00f/nvim-ts-rainbow")
				use("windwp/nvim-ts-autotag")

				-- Looks
				use({
					"folke/todo-comments.nvim",
					requires = { "nvim-lua/plenary.nvim" },
				})
				use({
					"ojroques/nvim-hardline",
					requres = { "gitsigns.nvim", "nvim-gps" },
				})
				use("Mofiqul/dracula.nvim")
				use("folke/which-key.nvim")
				use("gelguy/wilder.nvim")
				use("lewis6991/gitsigns.nvim")
				use("lukas-reineke/indent-blankline.nvim")
				use("mhinz/vim-startify")
				use("norcalli/nvim-colorizer.lua")
				use("yamatsum/nvim-cursorline")

				-- Functionality
				use({
					"abecodes/tabout.nvim",
					wants = { "nvim-treesitter" },
					after = { "nvim-cmp" },
					config = function() -- Config here cos it loads after nvim-cmp
						require("tabout").setup()
					end,
				})
				use({
					"nvim-telescope/telescope.nvim",
					requires = { "nvim-lua/plenary.nvim" },
				})
				use({
					"phaazon/hop.nvim",
					branch = "v1",
				})
				use("McAuleyPenney/tidy.nvim")
				use("andweeb/presence.nvim")
				use("ethanholz/nvim-lastplace")
				use("folke/trouble.nvim")
				use("is0n/fm-nvim")
				use("jghauser/mkdir.nvim")
				use("monaqa/dial.nvim")
				use("nacro90/numb.nvim")
				use("numToStr/Comment.nvim")
				use("sQVe/sort.nvim")
				use("seandewar/killersheep.nvim") -- Don't ask why...
				use("seandewar/nvimesweeper")
				use("sindrets/winshift.nvim")
				use("windwp/nvim-autopairs")

				if packer_bootstrap then
					require("packer").sync()
				end
			end,
			config = {
				display = {
					working_sym = "%",
					error_sym = "!",
					done_sym = "*",
					removed_sym = "-",
					moved_sym = "@",
					header_sym = "-",
					open_fn = function()
						return require("packer.util").float({ border = "single" })
					end,
				},
			},
		}
	end,
}
