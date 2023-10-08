-- Appearance plugins
return {
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({
                icons = {
                    breadcrumb = ">>",
                    group = "+ ",
                    separator = "->",
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
                    component_separators = { left = "", right = "" },
                    globalstatus = true,
                    icons_enabled = false,
                    section_separators = { left = "", right = "" },
                },
                tabline = {
                    lualine_a = {
                        {
                            "windows",
                            symbols = { modified = " [+]" },
                        },
                    },
                    lualine_z = { "tabs" },
                },
            })
        end,
    },
    {
        "mofiqul/dracula.nvim",
        priority = 9001, -- For the memes...
        config = function()
            require("dracula").setup({
                italic_comment = true,
                show_end_of_buffer = true,
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
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "rrethy/vim-illuminate",
        config = function()
            require("illuminate").configure({
                delay = 0,
                providers = { "regex" },
            })
        end,
    },
    "mhinz/vim-startify",
}
