-- My neovim config in Lua!

-- Neovim options
vim.opt.tabstop = 4 -- The number of spaces per tab
vim.opt.ignorecase = true -- Searches ignore query case (uppercase or lowercase)
vim.opt.smartcase = true -- Adding a capital letter to a search query makes it case sensitive
vim.opt.linebreak = true -- Line wraps don't split a word
vim.opt.wrap = true -- Wether to wrap long lines or not
vim.opt.ruler = true -- Shows the current line number above the status line
vim.opt.cursorline = true -- Shows line under current line
vim.opt.relativenumber = true -- Shows line number to the left of each line, relative to the current position
vim.opt.number = true -- Shows line number to the left of each line
vim.opt.title = true -- Wether neovim has a title or not
vim.opt.background = "dark" -- Enables syntax colors for dark color schemes
vim.opt.incsearch = true -- Searches start without pressing the Enter key
vim.opt.autoread = true -- When a file has been changed outside of vim and not inside vim, automatically update the vim version
vim.opt.breakindent = true -- Wrapped lines have the same indentation as the previous
vim.opt.showbreak = " > " -- Shown before wrapped line
vim.opt.shiftwidth = 0 -- The amount of tab to delete or move through, 0 sets it to tabstop
vim.opt.termguicolors = true -- Allows more colors to be used
vim.opt.laststatus = 2 -- Always show statusline
vim.opt.showtabline = 2 -- Always show tabline

-- Smooth scrolling
require("neoscroll").setup()

-- Open where left off
require("nvim-lastplace").setup()

-- Colored delimiters
require("nvim-treesitter.configs").setup({
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
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

-- Commenting
require("Comment").setup()

-- Visible indents
require("indent_blankline").setup({
	filetype_exclude = { "alpha" },
})

-- Treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained",
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})

-- Status bar / bufferline
require("hardline").setup({
	bufferline = true,
	theme = "dracula",
})

-- LSP
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
-- LSP servers
local lspconfig = require("lspconfig")

local servers = {
	"sumneko_lua",
	"clangd",
	"pyright",
	"bashls",
	"cmake",
	"rust_analyzer",
	"yamlls",
	"asm_lsp",
	"gdscript",
	"gopls",
	"hls",
	"ltex",
	"cssls",
	"eslint",
	"html",
	"jsonls",
}
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		-- on_attach = my_custom_on_attach,
		capabilities = capabilities,
	})
end

vim.cmd([[ autocmd BufRead,BufNewFile *.org set filetype=org ]]) -- For LTeX

lspconfig.arduino_language_server.setup({
	cmd = {
		-- Required
		"arduino-language-server",
		"-cli-config",
		"$HOME/.arduino5/arduino-cli.yaml",
		-- Optional
		"-cli",
		"/usr/bin/arduino-cli",
		"-clangd",
		"/usr/bin/clangd",
	},
})
-- Luasnip
local luasnip = require("luasnip")
-- Nvim-cmp
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
})

-- Automatic pairs
require("pears").setup()

-- Colorizer
require("colorizer").setup()

-- Theme
vim.cmd([[colorscheme dracula]])

-- Telescope
require("telescope").load_extension("zoxide")

require("telescope").setup({
	pickers = {
		find_files = {
			hidden = true, -- Search hidden folders too
		},
	},
})

-- Packer packages
return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	-- LSP
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
	use("neovim/nvim-lspconfig")
	use("folke/lsp-colors.nvim")

	-- Treesitter
	use({
		"narutoxy/dim.lua",
		requires = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
		config = function()
			require("dim").setup({})
		end,
	})
	use({
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup()
		end,
	})
	use("nvim-treesitter/nvim-treesitter")
	use("norcalli/nvim-colorizer.lua")
	use("p00f/nvim-ts-rainbow")

	-- Looks
	use({
		"folke/zen-mode.nvim",

		config = function()
			require("zen-mode").setup()
		end,
	})
	use({
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").opts)
		end,
	})
	use({
		"yamatsum/nvim-nonicons",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	})
	use("sunjon/shade.nvim")
	use("Mofiqul/dracula.nvim")
	use("yamatsum/nvim-cursorline")
	use("ojroques/nvim-hardline")
	use("karb94/neoscroll.nvim")

	-- Functionality
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup()
		end,
	})
	use({
		"jvgrootveld/telescope-zoxide",
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use({
		"jghauser/mkdir.nvim",
		config = function()
			require("mkdir")
		end,
	})
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use("lukas-reineke/indent-blankline.nvim")
	use("tversteeg/registers.nvim")
	use("steelsojka/pears.nvim")
	use("ethanholz/nvim-lastplace")
	use("McAuleyPenney/tidy.nvim")
	use("andweeb/presence.nvim")
end)
