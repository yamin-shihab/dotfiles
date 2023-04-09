-- Neovim keybinds
vim.keymap.set({ "n", "x" }, "<Esc>", ":noh<CR><Esc>")
-- Updating
vim.keymap.set({ "n", "x" }, "<Leader>l", ":Lazy sync<CR>")
vim.keymap.set({ "n", "x" }, "<Leader>u", ":TSUpdate<CR>")
-- Window management
vim.keymap.set({ "n", "x" }, "<Leader><S-w>", ":WinShift<CR>")
vim.keymap.set({ "n", "x" }, "<Leader>w", ":lua require('nvim-window').pick()<CR>")
-- LSP
vim.keymap.set({ "n", "x" }, "<Leader>d", ":Lspsaga hover_doc<CR>")
vim.keymap.set({ "n", "x" }, "<Leader>f", ":Lspsaga lsp_finder<CR>")
vim.keymap.set({ "n", "x" }, "<Leader>j", ":Lspsaga diagnostic_jump_prev<CR>")
vim.keymap.set({ "n", "x" }, "<Leader>k", ":Lspsaga diagnostic_jump_next<CR>")
vim.keymap.set({ "n", "x" }, "<Leader>r", ":Lspsaga rename<CR>")
vim.keymap.set({ "n", "x" }, "<Leader>t", ":Lspsaga term_toggle<CR>")
