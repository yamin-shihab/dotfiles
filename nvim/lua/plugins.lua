-- Lazy plugins to install
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("configs", {
    ui = {
        border = "single",
        icons = {
            cmd = "",
            config = "",
            event = "",
            ft = "",
            init = "",
            import = "",
            keys = "",
            lazy = "",
            loaded = "",
            not_loaded = "",
            plugin = "",
            runtime = "",
            source = "",
            start = "",
            task = "",
            list = {
                "1",
                "2",
                "3",
                "4",
            },
        },
    },
})
