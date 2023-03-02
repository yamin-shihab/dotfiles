-- Neovim keybinds
vim.keymap.set("", "<Esc>", ":noh<CR><Esc>")
-- Updating
vim.keymap.set("", "<Leader>p", ":PackerSync<CR>")
vim.keymap.set("", "<Leader>u", ":TSUpdate<CR>")
-- Window management
vim.keymap.set("", "<Leader><S-w>", ":WinShift<CR>")
vim.keymap.set("", "<Leader>w", function()
    require("nvim-window").pick()
end)
-- LSP
vim.keymap.set("", "<Leader>d", ":Lspsaga hover_doc<CR>")
vim.keymap.set("", "<Leader>f", ":Lspsaga lsp_finder<CR>")
vim.keymap.set("", "<Leader>j", ":Lspsaga diagnostic_jump_prev<CR>")
vim.keymap.set("", "<Leader>k", ":Lspsaga diagnostic_jump_next<CR>")
vim.keymap.set("", "<Leader>r", ":Lspsaga rename<CR>")
vim.keymap.set("", "<Leader>t", ":Lspsaga term_toggle<CR>")
-- File manager
vim.keymap.set("", "<Leader>o", ":CHADopen<CR>")
