-- Neovim keybinds
vim.keymap.set("", "<Esc>", ":noh<CR><Esc>")
vim.keymap.set("", "<Leader><S-w>", ":WinShift<CR>")
vim.keymap.set("", "<Leader>p", ":PackerSync<CR>")
vim.keymap.set("", "<Leader>t", ":TSUpdate<CR>")
vim.keymap.set("", "<Leader>w", function()
	require("nvim-window").pick()
end)
