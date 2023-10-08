-- Vim
vim.keymap.set({ "n", "x" }, "<Esc>", ":noh<CR><Esc>")

-- Updating
vim.keymap.set({ "n", "x" }, "<Leader>p", ":PaqSync<CR>")
vim.keymap.set({ "n", "x" }, "<Leader>u", ":TSUpdate<CR>")

-- Hopping around
vim.keymap.set({ "n", "x" }, "<Leader>w", ":HopWord<CR>")

-- Chad undotree
vim.keymap.set({ "n", "x" }, "<Leader>t", ":UndotreeToggle | UndotreeFocus<CR>")

-- LSP shenanigans
vim.keymap.set({ "n", "x" }, "<Leader>d", ":TroubleToggle<CR>")
vim.keymap.set({ "n", "x" }, "<Leader>h", ":lua vim.lsp.buf.hover()<CR>")
vim.keymap.set({ "n", "x" }, "<Leader>r", ":Trouble lsp_references<CR>")
