-- Neovim keybinds

-- Press escape after searching to clear search highlighting
vim.keymap.set("", "<Esc>", ":noh<CR><Esc>")

-- Winshift
vim.keymap.set("", "<Leader><S-w>", ":WinShift<CR>")

-- Nvim-window
vim.keymap.set("", "<Leader>w", function()
	require("nvim-window").pick()
end)

-- Update packer
vim.keymap.set("", "<Leader>p", ":PackerSync<CR>:PackerCompile<CR>")

-- Update treesitter
vim.keymap.set("", "<Leader>t", ":TSUpdate<CR>")
