-- My neovim config in lua!

local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
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
vim.g.dracula_show_end_of_buffer = true  -- default false, Turn on or off EndOfBuffer symbol
vim.g.dracula_transparent_bg = true -- default false, enables transparent background
vim.cmd[[colorscheme dracula]]

-- Custom Neovim keymaps

vim.api.nvim_set_keymap('', '<S-j>', ':tabprevious<CR>', {}) -- Sets switching to the previous tab to Shift + J.
vim.api.nvim_set_keymap('', '<S-k>', ':tabnext<CR>', {}) -- Sets switching to the next tab to Shift + K.


-- LSP

local nvim_lsp = require'lspconfig'

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)

local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})

-- Treesitter
local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}, indent = {enable = true}}

-- Packer.Nvim

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
	}

	use 'neovim/nvim-lspconfig'

	use 'simrat39/rust-tools.nvim'

	use 'hrsh7th/vim-vsnip'

	use 'hrsh7th/cmp-nvim-lsp'

	use 'hrsh7th/cmp-vsnip'

	use 'hrsh7th/cmp-path'

	use 'hrsh7th/cmp-buffer'

	use 'hrsh7th/nvim-cmp'

	use 'Mofiqul/dracula.nvim'
end)

