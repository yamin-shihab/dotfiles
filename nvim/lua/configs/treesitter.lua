-- Treesitter plugins
return {
    {
        "hiphish/rainbow-delimiters.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "mofiqul/dracula.nvim" },
        config = function()
            vim.g.rainbow_delimiters = {
                highlight = {
                    "rainbowcol1",
                    "rainbowcol2",
                    "rainbowcol3",
                    "rainbowcol4",
                    "rainbowcol5",
                    "rainbowcol6",
                    "rainbowcol7",
                },
            }
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        dependencies = { "mofiqul/dracula.nvim" },
        main = "ibl",
        config = function()
            require("ibl").setup({
                exclude = { filetypes = { "startify" } },
                scope = {
                    highlight = {
                        "rainbowcol1",
                        "rainbowcol2",
                        "rainbowcol3",
                        "rainbowcol4",
                        "rainbowcol5",
                        "rainbowcol6",
                        "rainbowcol7",
                    },
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = { "mofiqul/dracula.nvim" },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = "all",
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
            })
        end,
    },
}
