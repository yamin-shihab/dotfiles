-- My Neovim config in Lua!

-- Btw, I have no idea why vim.api.nvim_set_keymap sometimes throws an error saying I'm missing a Lua string, so I'll just use commands for now

-- Functions
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Neovim options
vim.opt.autoread = true -- When a file has been changed outside of vim and not inside vim, automatically update the vim version
vim.opt.background = "dark" -- Enables syntax colors for dark color schemes
vim.opt.breakindent = true -- Wrapped lines have the same indentation as the previous
vim.opt.cursorline = true -- Shows line under current line
vim.opt.ignorecase = true -- Searches ignore query case (uppercase or lowercase)
vim.opt.incsearch = true -- Searches start without pressing the Enter key
vim.opt.laststatus = 2 -- Always show statusline
vim.opt.linebreak = true -- Line wraps don't split a word
vim.opt.number = true -- Shows line number to the left of each line
vim.opt.relativenumber = true -- Shows line number to the left of each line, relative to the current position
vim.opt.ruler = true -- Shows the current line number above the status line
vim.opt.shiftwidth = 0 -- The amount of tab to delete or move through, 0 sets it to tabstop
vim.opt.showbreak = " > " -- Shown before wrapped line
vim.opt.showtabline = 2 -- Always show tabline
vim.opt.smartcase = true -- Adding a capital letter to a search query makes it case sensitive
vim.opt.spell = true -- Spell checking
vim.opt.tabstop = 4 -- The number of spaces per tab
vim.opt.termguicolors = true -- Allows more colors to be used
vim.opt.timeoutlen = 500 -- Timeout time in MS
vim.opt.title = true -- Whether Neovim has a title or not
vim.opt.winblend = 20 -- Transparency of windows
vim.opt.wrap = true -- Whether to wrap long lines or not

-- Treesitter context component
require("nvim-gps").setup({
	disable_icons = true,
})

-- Markdown viewer
vim.g.glow_border = "single"

-- Update packages
map("", "<M-p>", ":PackerSync<CR>")

-- LSP progress
require("fidget").setup()

-- Git
require("gitsigns").setup()

-- Sort
map("", "<M-S-s>", ":Sort<CR>")

-- Telescope
map(
	"",
	"<M-b>",
	":lua require('telescope.builtin').builtin(require('telescope.themes').get_dropdown({ winblend = 20}))<CR>"
)
map(
	"",
	"<M-g>",
	":lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown({ winblend = 20}))<CR>"
)
map(
	"",
	"<M-m>",
	":lua require('telescope.builtin').man_pages(require('telescope.themes').get_dropdown({ winblend = 20, border = 'single'}))<CR>"
)
map(
	"",
	"<M-s>",
	":lua require('telescope.builtin').spell_suggest(require('telescope.themes').get_dropdown({ winblend = 20 , border = 'single'}))<CR>"
)
map(
	"",
	"<M-i>",
	":lua require('telescope.builtin').lsp_implementations(require('telescope.themes').get_dropdown({ winblend = 20 , border = 'single'}))<CR>"
)
map(
	"",
	"<M-d>",
	":lua require('telescope.builtin').lsp_definitions(require('telescope.themes').get_dropdown({ winblend = 20 , border = 'single'}))<CR>"
)
map(
	"",
	"<M-t>",
	":lua require('telescope.builtin').lsp_type_definitions(require('telescope.themes').get_dropdown({ winblend = 20 , border = 'single'}))<CR>"
)

-- Nicer menu
local wilder = require("wilder")
wilder.setup({ modes = { ":", "/", "?" } })
wilder.set_option("pipeline", {
	wilder.branch(wilder.cmdline_pipeline(), wilder.search_pipeline()),
})
wilder.set_option(
	"renderer",
	wilder.wildmenu_renderer({
		highlighter = wilder.basic_highlighter(),
	})
)

-- Explains regex rules
require("regexplainer").setup()

-- Stabilize buffer
require("stabilize").setup()

-- Treesitter + spellchecking
require("spellsitter").setup()

-- Dim outside chunks of code
require("twilight").setup()

-- Dim unused variables
require("dim").setup()

-- Key combinations list
require("which-key").setup({
	icons = {
		breadcrumb = ">>", -- symbol used in the command line area that shows your active key combo
		separator = "->", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
})

-- Highlight comments
require("todo-comments").setup({
	keywords = {
		FIX = {
			icon = "f",
			color = "error",
			alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
		},
		TODO = { icon = "t", color = "info" },
		HACK = { icon = "h", color = "warning" },
		WARN = { icon = "w", color = "warning", alt = { "WARNING", "XXX" } },
		PERF = { icon = "p", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
		NOTE = { icon = "n", color = "hint", alt = { "INFO" } },
	},
})

-- Zen mode
require("zen-mode").setup()

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

-- Show context
require("treesitter-context").setup({
	patterns = {
		default = {
			"class",
			"function",
			"method",
			"for",
			"while",
			"if",
			"switch",
			"case",
		},
	},
})

-- Window navigation
map("", "<M-w>", ":lua require('nvim-window').pick()<CR>")
map("", "<M-S-w>", ":WinShift<CR>")

-- Better increment/decrement
map("n", "<C-a>", require("dial.map").inc_normal())
map("n", "<C-x>", require("dial.map").dec_normal())
map("v", "<C-a>", require("dial.map").inc_visual())
map("v", "<C-x>", require("dial.map").dec_visual())
map("v", "g<C-a>", require("dial.map").inc_gvisual())
map("v", "g<C-x>", require("dial.map").dec_gvisual())

-- Tag autorename and autoclose
require("nvim-ts-autotag").setup()

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

-- Colored delimiters
require("nvim-treesitter.configs").setup({
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

-- Commenting
require("Comment").setup()

-- Visible indents
require("indent_blankline").setup({
	filetype_exclude = { "startify" },
})

-- Automatic pairs
require("nvim-autopairs").setup({
	check_ts = true,
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
	sections = { -- define sections
		{
			class = "mode",
			item = require("hardline.parts.mode").get_item,
		},
		{
			class = "high",
			item = require("hardline.parts.git").get_item,
			hide = 100,
		},
		{
			class = "med",
			item = require("hardline.parts.cwd").get_item,
		},
		{
			class = "med",
			item = require("hardline.parts.filename").get_item,
		},
		"%<",
		{
			class = "med",
			item = "%=",
		},
		{
			class = "med",
			item = require("hardline.parts.treesitter-context").get_item,
		},
		{
			class = "low",
			item = require("hardline.parts.wordcount").get_item,
			hide = 100,
		},
		{
			class = "error",
			item = require("hardline.parts.lsp").get_error,
		},
		{
			class = "warning",
			item = require("hardline.parts.lsp").get_warning,
		},
		{
			class = "warning",
			item = require("hardline.parts.whitespace").get_item,
		},
		{
			class = "high",
			item = require("hardline.parts.filetype").get_item,
			hide = 60,
		},
		{
			class = "mode",
			item = require("hardline.parts.line").get_item,
		},
	},
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
		capabilities = capabilities,
	})
end

vim.cmd([[ autocmd BufRead,BufNewFile *.org set filetype=org ]]) -- For LTeX

lspconfig.arduino_language_server.setup({
	cmd = {
		-- Required
		"arduino-language-server",
		"-cli-config",
		"/home/yamin/.arduino5/arduino-cli.yaml",
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
-- Nvim-cmp+nvim-autopairs
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on(
	"confirm_done",
	cmp_autopairs.on_confirm_done({ map_char = { tex = "" } })
)
cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"

-- Colorizer
require("colorizer").setup()

-- Theme
vim.cmd([[colorscheme dracula]])

-- Packer packages
return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	-- LSP
	use("L3MON4D3/LuaSnip")
	use("folke/lsp-colors.nvim")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/nvim-cmp")
	use("neovim/nvim-lspconfig")
	use("saadparwaiz1/cmp_luasnip")

	-- Treesitter
	use({
		"narutoxy/dim.lua",
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"neovim/nvim-lspconfig",
		},
	})
	use("folke/twilight.nvim")
	use("lewis6991/spellsitter.nvim")
	use("norcalli/nvim-colorizer.lua")
	use("nvim-treesitter/nvim-treesitter")
	use("p00f/nvim-ts-rainbow")
	use("windwp/nvim-ts-autotag")

	-- Looks
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})
	use({
		"romgrk/nvim-treesitter-context",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({
		"bennypowers/nvim-regexplainer",
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"MunifTanjim/nui.nvim",
		},
	})
	use({
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({
		"ojroques/nvim-hardline",
		requres = { "gitsigns.nvim", "nvim-gps" },
	})
	use("Mofiqul/dracula.nvim")
	use("folke/which-key.nvim")
	use("folke/zen-mode.nvim")
	use("gelguy/wilder.nvim")
	use("j-hui/fidget.nvim")
	use("lewis6991/gitsigns.nvim")
	use("mhinz/vim-startify")
	use("sunjon/shade.nvim")
	use("yamatsum/nvim-cursorline")

	-- Functionality
	use({
		"abecodes/tabout.nvim",
		config = function()
			require("tabout").setup()
		end,
		wants = { "nvim-treesitter" },
		after = { "nvim-cmp" },
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use("McAuleyPenney/tidy.nvim")
	use("andweeb/presence.nvim")
	use("ekickx/clipboard-image.nvim")
	use("ellisonleao/glow.nvim")
	use("ethanholz/nvim-lastplace")
	use("folke/trouble.nvim")
	use("https://gitlab.com/yorickpeterse/nvim-window.git")
	use("is0n/fm-nvim")
	use("jghauser/mkdir.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("luukvbaal/stabilize.nvim")
	use("mizlan/iswap.nvim")
	use("monaqa/dial.nvim")
	use("nacro90/numb.nvim")
	use("numToStr/Comment.nvim")
	use("sQVe/sort.nvim")
	use("seandewar/nvimesweeper")
	use("sindrets/winshift.nvim")
	use("windwp/nvim-autopairs")
end)
