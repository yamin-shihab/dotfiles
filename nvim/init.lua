-- My neovim config in Lua!

-- Functions

local key_mapper = function(mode, key, result)
  	vim.api.nvim_set_keymap(
    	mode,
    	key,
    	result,
    		{noremap = true, silent = true}
  	)
end

-- Neovim options

vim.opt.tabstop = 4 -- The number of spaces per tab.
vim.opt.ignorecase = true -- Searches ignore query case (uppercase or lowercase).
vim.opt.smartcase = true -- Adding a capital letter to a search query makes it case sensitive.
vim.opt.linebreak = true -- Line wraps don't split a word.
vim.opt.wrap = true -- Wether to wrap long lines or not.
vim.opt.ruler = true -- Shows the current line number above the status line.
vim.opt.laststatus = 2 -- Always shows status line in all windows.
vim.opt.cursorline = true -- Shows line under current line.
vim.opt.number = true -- Shows line number to the left of each line.
vim.opt.title = true -- Wether neovim has a title or not.
vim.opt.background = 'dark' -- Enables syntax colors for dark color schemes.
vim.opt.incsearch = true -- Searches start without pressing the Enter key.
vim.opt.autoread = true -- When a file has been changed outside of vim and not inside vim, automatically update the vim version.
vim.opt.breakindent = true -- Wrapped lines have the same indentation as the previous.
vim.opt.showbreak = ' > ' -- Shown before wrapped line.
vim.opt.shiftwidth = 0 -- The amount of tab to delete or move through, 0 sets it to tabstop.
vim.opt.termguicolors = true -- Allows more colors to be used.

-- Custom Neovim keymaps

key_mapper('', '<S-j>', ':tabprevious<CR>') -- Sets switching to the previous tab to Shift + J.
key_mapper('', '<S-k>', ':tabnext<CR>') -- Sets switching to the next tab to Shift + K.
key_mapper('', 'ff', '<cmd>Telescope find_files<cr>')
key_mapper('', 'fb', '<cmd>Telescope file_browser<cr>')
key_mapper('', 'gs', '<cmd>Telescope grep_string<cr>')
key_mapper('', 'lg', '<cmd>Telescope live_grep<cr>')

-- Treesitter

local configs = require'nvim-treesitter.configs'
configs.setup {
  	ensure_installed = "maintained",
  	highlight = {
    	enable = true,
  	},
  	indent = {
    	enable = true
  	}
}

-- LSP

key_mapper('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
key_mapper('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
key_mapper('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
key_mapper('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
key_mapper('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
key_mapper('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
key_mapper('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
key_mapper('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
key_mapper('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
key_mapper('n', '<leader>af', ':lua vim.lsp.buf.code_action()<CR>')
key_mapper('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

-- Colorizer
require'colorizer'.setup()

-- Theme
vim.cmd[[colorscheme dracula]]

-- Packer packages

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	use 'nvim-treesitter/nvim-treesitter'
	
	use 'neovim/nvim-lspconfig'

	use 'williamboman/nvim-lsp-installer'

	use 'ms-jpq/coq_nvim'

	use 'tversteeg/registers.nvim'

	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'}}
	}

	use 'norcalli/nvim-colorizer.lua'

	use {
		"folke/twilight.nvim",
		config = function()
		require("twilight").setup {
      			-- your configuration comes here
      			-- or leave it empty to use the default settings
      			-- refer to the configuration section below
    		}
  		end
	}

	use {
  		"folke/zen-mode.nvim",
  		config = function()
    		require("zen-mode").setup {
      			-- your configuration comes here
      			-- or leave it empty to use the default settings
      			-- refer to the configuration section below
    		}
  		end
	}

	use 'sunjon/shade.nvim'

	use 'Mofiqul/dracula.nvim'

	use {
		'jghauser/mkdir.nvim',
		config = function()
			require('mkdir')
		end
	}

	use {
  		'yamatsum/nvim-nonicons',
  		requires = {'kyazdani42/nvim-web-devicons'}
	}
end)

