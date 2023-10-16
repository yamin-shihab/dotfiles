-- Neovim autocommands
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    callback = function()
        if vim.tbl_contains({ "markdown", "text" }, vim.opt.filetype:get()) then
            vim.opt.spell = true
        end
        vim.opt.formatoptions = ""
    end,
})

vim.api.nvim_create_autocmd("BufWrite", {
    callback = function()
        save_cursor = vim.fn.getpos(".")
        vim.cmd([[silent! %s/\s\+$//e]])
        vim.cmd([[silent! %s/\%^\_\s*\n//]])
        vim.cmd([[silent! %s#\($\n\s*\)\+\%$##]])
        vim.fn.setpos(".", save_cursor)
    end,
})

vim.api.nvim_create_autocmd("BufWrite", {
    callback = function()
        local dir = vim.fn.expand("<afile>:p:h")
        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, "p")
        end
    end,
})

vim.api.nvim_create_autocmd({ "ModeChanged", "BufEnter" }, {
    callback = function()
        local mode_highlight = "lualine_a" .. require("lualine.highlight").get_mode_suffix()
        vim.api.nvim_set_hl(0, "CursorLineNr", { link = mode_highlight })
    end,
})
