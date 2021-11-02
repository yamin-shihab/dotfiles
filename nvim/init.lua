-- My neovim config in lua!

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
vim.opt.smartindent = true -- Autoindent but works better for programming languages.
vim.opt.shiftwidth = 0 -- The amount of tab to delete or move through, 0 sets it to tabstop.
vim.opt.termguicolors = true -- Allows more colors to be used.

-- Custom Neovim keymaps

vim.api.nvim_set_keymap('', '<S-j>', ':tabprevious<CR>', {}) -- Sets switching to the previous tab to Shift + J.
vim.api.nvim_set_keymap('', '<S-k>', ':tabnext<CR>', {}) -- Sets switching to the next tab to Shift + K.
