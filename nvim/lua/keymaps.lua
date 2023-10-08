-- Vim
vim.keymap.set({ "n", "x" }, "<Esc>", ":noh<CR><Esc>")

-- Updating
vim.keymap.set({ "n", "x" }, "<Leader>l", function()
    require("lazy").sync()
end)
vim.keymap.set({ "n", "x" }, "<Leader>u", vim.cmd.TSUpdate)

-- Window management
vim.keymap.set({ "n", "x" }, "<Leader>p", function()
    require("nvim-window").pick()
end)
vim.keymap.set({ "n", "x" }, "<Leader>w", function()
    require("winshift").cmd_winshift()
end)

-- Hopping around
vim.keymap.set({ "n", "x" }, "<Leader>h", function()
    require("hop").hint_words()
end)
vim.keymap.set({ "n", "x" }, "<Leader>s", function()
    require("hop").hint_patterns()
end)

-- Chad undotree
vim.keymap.set({ "n", "x" }, "<Leader>t", ":UndotreeToggle | UndotreeFocus<CR>")

-- LSP shenanigans
vim.keymap.set({ "n", "x" }, "<Leader>d", function()
    vim.lsp.buf.hover()
end)
vim.keymap.set({ "n", "x" }, "<Leader>e", function()
    require("trouble").toggle()
end)
vim.keymap.set({ "n", "x" }, "<Leader>r", function()
    require("trouble").open("lsp_references")
end)
