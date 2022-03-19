-- My neovim config in Lua!

-- Functions
local key_mapper = function(mode, key, result)
  	vim.api.nvim_set_keymap(
    		mode,
    		key,
    		result,
    		{
				noremap = true,
				silent = true,
			}
  	)
end

-- Neovim options
vim.opt.tabstop = 4 -- The number of spaces per tab
vim.opt.ignorecase = true -- Searches ignore query case (uppercase or lowercase)
vim.opt.smartcase = true -- Adding a capital letter to a search query makes it case sensitive
vim.opt.linebreak = true -- Line wraps don't split a word
vim.opt.wrap = true -- Wether to wrap long lines or not
vim.opt.ruler = true -- Shows the current line number above the status line
vim.opt.cursorline = true -- Shows line under current line
vim.opt.relativenumber = true -- Shows line number to the left of each line, relative to the current position
vim.opt.title = true -- Wether neovim has a title or not
vim.opt.background = 'dark' -- Enables syntax colors for dark color schemes
vim.opt.incsearch = true -- Searches start without pressing the Enter key
vim.opt.autoread = true -- When a file has been changed outside of vim and not inside vim, automatically update the vim version
vim.opt.breakindent = true -- Wrapped lines have the same indentation as the previous
vim.opt.showbreak = ' > ' -- Shown before wrapped line
vim.opt.shiftwidth = 0 -- The amount of tab to delete or move through, 0 sets it to tabstop
vim.opt.termguicolors = true -- Allows more colors to be used
vim.opt.laststatus = 2 -- Always show statusline
vim.opt.showtabline = 2 -- Always show tabline

-- Open where left off
require('nvim-lastplace').setup()

-- Colored delimiters
require('nvim-treesitter.configs').setup {
  rainbow = {
    enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		colors = { -- Dracula theme
			'#ff5555',
			'#ffb86c',
			'#f1fa8c',
			'#50fa7b',
			'#8be9fd',
			'#bd93f9',
			'#ff79c6',
		},
	}
}

-- Commenting
require('Comment').setup()

-- Visible indents
require('indent_blankline').setup {
	filetype_exclude = { 'alpha' },
}

-- Treesitter
require('nvim-treesitter.configs').setup {
  	ensure_installed = 'maintained',
  	highlight = {
    	enable = true,
  	},
  	indent = {
    	enable = true,
  	},
}

-- Status bar / bufferline
require('hardline').setup {
 	bufferline = true,
 	theme = "dracula"
}

-- LSP
require('nvim-lsp-installer').on_server_ready(function(server)
    server:setup({}) -- Setup for each server
end)

-- Automatic pairs
require('pears').setup()

-- Colorizer
require('colorizer').setup()

-- Theme
vim.cmd[[colorscheme dracula]]

-- Telescope
require('telescope').load_extension('zoxide')

require('telescope').setup {
	pickers = {
		find_files = {
			hidden = true, -- Search hidden folders too
		},
	},
}

key_mapper('', 'ff', '<cmd>Telescope find_files<cr>')
key_mapper('', 'fb', '<cmd>Telescope file_browser<cr>')
key_mapper('', 'gs', '<cmd>Telescope grep_string<cr>')
key_mapper('', 'tg', '<cmd>Telescope live_grep<cr>')
key_mapper('', 'zl', '<cmd>Telescope zoxide list<cr>')

-- Coq
vim.g.coq_settings = {
	auto_start = 'shut-up',
	clients = {
		tabnine = {
			-- enabled = true,
			enabled = false,
		},
	},
}

-- Packer packages
return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	use 'nvim-treesitter/nvim-treesitter'

	use 'neovim/nvim-lspconfig'

	use 'williamboman/nvim-lsp-installer'

	use {
		'ms-jpq/coq_nvim',
		'ms-jpq/coq.artifacts',
	}

	use 'tversteeg/registers.nvim'

	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		},
	}

	use {
		'norcalli/nvim-colorizer.lua',
	}

	use {
		'folke/twilight.nvim',
		config = function()
			require('twilight').setup()
  		end,
	}

	use {
  		'folke/zen-mode.nvim',

  		config = function()
    		require("zen-mode").setup()
  		end,
	}

	use 'sunjon/shade.nvim'

	use 'Mofiqul/dracula.nvim'

	use {
		'jghauser/mkdir.nvim',
		config = function()
			require('mkdir')
		end,
	}

	use {
  		'yamatsum/nvim-nonicons',
  		requires = {
			'kyazdani42/nvim-web-devicons',
		},
	}

	use 'yamatsum/nvim-cursorline'

	use {
    	'goolord/alpha-nvim',
    	config = function ()
        	require('alpha').setup(require('alpha.themes.dashboard').opts)
    	end,
	}

	use 'lukas-reineke/indent-blankline.nvim'

	use {
    	'numToStr/Comment.nvim',
    	config = function()
        	require('Comment').setup()
    	end,
	}

	use 'steelsojka/pears.nvim'

	use 'p00f/nvim-ts-rainbow'

	use 'ethanholz/nvim-lastplace'

	use 'McAuleyPenney/tidy.nvim'

	use 'andweeb/presence.nvim'

	use {
  		'folke/trouble.nvim',
  		requires = 'kyazdani42/nvim-web-devicons',
  		config = function()
    		require('trouble').setup()
  		end,
	}

	use 'folke/lsp-colors.nvim'

	use {
		'jvgrootveld/telescope-zoxide',
		requires = {
			'nvim-lua/popup.nvim',
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim',
		},
	}

	use 'ojroques/nvim-hardline'

	use {
  		'nvim-lualine/lualine.nvim',
  		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
	}

	use {
  		"narutoxy/dim.lua",
  		requires = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
  		config = function()
    		require('dim').setup({})
  		end
	}
end)
