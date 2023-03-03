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

local function config(name)
    return function()
        require("configs/" .. name)
    end
end

require("lazy").setup({
    -- LSP
    {
        "neovim/nvim-lspconfig",
        config = config("lspconfig"),
    },
    {
        "glepnir/lspsaga.nvim",
        config = config("lspsaga"),
    },
    {
        "ms-jpq/coq_nvim",
        config = config("coq"),
    },
    {
        "ms-jpq/coq.artifacts",
        dependencies = { "ms-jpq/coq_nvim" },
    },

    -- Treesitter
    {
        "p00f/nvim-ts-rainbow",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = config("ts-rainbow"),
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = config("treesitter"),
    },

    -- Appearance
    {
        "nvim-lualine/lualine.nvim",
        config = config("lualine"),
    },
    {
        "Mofiqul/dracula.nvim",
        priority = 9001, -- For the memes...
        config = config("dracula"),
    },
    {
        "lewis6991/gitsigns.nvim",
        config = config("gitsigns"),
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = config("indent-blankline"),
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = config("colorizer"),
    },
    {
        "tversteeg/registers.nvim",
        keys = {
            { '"', mode = { "n", "x" } },
            { "<C-R>", mode = "i" },
        },
        cmd = "Registers",
        config = config("registers"),
    },
    "yamatsum/nvim-cursorline",
    "mhinz/vim-startify",

    -- Functionality
    {
        "ms-jpq/chadtree",
        cmd = "CHADopen",
        config = config("chadtree"),
    },
    {
        "ethanholz/nvim-lastplace",
        config = config("lastplace"),
    },
    {
        "mcauley-penney/tidy.nvim",
        event = "BufWritePre",
        config = config("tidy"),
    },
    {
        "nacro90/numb.nvim",
        event = "CmdlineChanged",
        config = config("numb"),
    },
    {
        "numToStr/Comment.nvim",
        keys = {
            "gcc",
            "gbc",
            "gcO",
            "gco",
            "gcA",
            { "gc", mode = { "n", "x" } },
            { "gb", mode = { "n", "x" } },
        },
        config = config("comment"),
    },
    {
        "windwp/nvim-autopairs",
        keys = {
            { "{", mode = "i" },
            { "(", mode = "i" },
            { "[", mode = "i" },
        },
        config = config("autopairs"),
    },
    {
        "gaoDean/autolist.nvim",
        ft = {
            "markdown",
            "text",
            "tex",
            "plaintex",
        },
        config = config("autolist"),
    },
    {
        "https://gitlab.com/yorickpeterse/nvim-window.git",
        lazy = true,
        config = config("window"),
    },
    {
        "jghauser/mkdir.nvim",
        event = "BufWritePre",
    },
    {
        "sindrets/winshift.nvim",
        cmd = "WinShift",
    },
}, {
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
