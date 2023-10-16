-- Neovim functionality plugins
require("Comment").setup({
    padding = false,
    toggler = { line = "<Leader>cc", block = "<Leader>bb" },
    opleader = { line = "<Leader>c", block = "<Leader>b" },
    mappings = { basic = true, extra = false },
})

require("hop").setup({ create_hl_autocmd = false, keys = "arstneio" })
vim.keymap.set("", "<Leader>w", function()
    require("hop").hint_words()
end)

require("nvim-autopairs").setup({ check_ts = true })
