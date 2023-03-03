-- Autocommands for Neovim
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "text,markdown",
    callback = function()
        vim.opt.spell = true
    end,
})
