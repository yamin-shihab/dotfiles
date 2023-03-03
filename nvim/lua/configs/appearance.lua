-- Appearance plugins
return {
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    icons_enabled = false,
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    globalstatus = true,
                },
            })
        end,
    },
    {
        "Mofiqul/dracula.nvim",
        priority = 9001, -- For the memes...
        config = function()
            vim.g.dracula_show_end_of_buffer = true
            vim.g.dracula_italic_comment = true
            vim.cmd("colorscheme dracula")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup({
                filetype_exclude = { "startify", "help" },
            })
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "tversteeg/registers.nvim",
        keys = {
            { '"', mode = { "n", "x" } },
            { "<C-R>", mode = "i" },
        },
        cmd = "Registers",
        config = function()
            require("registers").setup({
                window = {
                    border = "single",
                    transparency = 0,
                },
            })
        end,
    },
    "yamatsum/nvim-cursorline",
    "mhinz/vim-startify",
}
