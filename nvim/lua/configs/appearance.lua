-- Appearance plugins
return {
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({
                icons = {
                    breadcrumb = ">>",
                    separator = "->",
                    group = "+ ",
                },
                window = {
                    border = "single",
                },
            })
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "mofiqul/dracula.nvim" },
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
        "mofiqul/dracula.nvim",
        priority = 9001, -- For the memes...
        config = function()
            require("dracula").setup({
                show_end_of_buffer = true,
                italic_comment = true,
            })
            vim.cmd("colorscheme dracula")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        dependencies = { "mofiqul/dracula.nvim" },
        config = function()
            require("gitsigns").setup()
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        dependencies = { "mofiqul/dracula.nvim" },
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
    "yamatsum/nvim-cursorline",
    "mhinz/vim-startify",
}
