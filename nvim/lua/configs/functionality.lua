-- Functionality plugins
return {
    {
        "phaazon/hop.nvim",
        cmd = { "HopWord", "HopLineStart", "HopPattern" },
        config = function()
            require("hop").setup({
                keys = "arstneio",
                jump_on_sole_occurrence = false,
            })
        end,
    },
    {
        "ethanholz/nvim-lastplace",
        config = function()
            require("nvim-lastplace").setup()
        end,
    },
    {
        "mcauley-penney/tidy.nvim",
        event = "BufWritePre",
        config = function()
            require("tidy").setup()
        end,
    },
    {
        "nacro90/numb.nvim",
        event = "CmdlineChanged",
        config = function()
            require("numb").setup()
        end,
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
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "windwp/nvim-autopairs",
        keys = {
            { "{", mode = "i" },
            { "(", mode = "i" },
            { "[", mode = "i" },
        },
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true,
            })
        end,
    },
    {
        "gaoDean/autolist.nvim",
        ft = {
            "markdown",
            "text",
            "tex",
            "plaintex",
        },
        config = function()
            require("autolist").setup()
        end,
    },
    {
        "yorickpeterse/nvim-window",
        lazy = true,
        config = function()
            require("nvim-window").setup({
                chars = {
                    "a",
                    "r",
                    "s",
                    "t",
                    "n",
                    "e",
                    "i",
                    "o",
                },
            })
        end,
    },
    {
        "jghauser/mkdir.nvim",
        event = "BufWritePre",
    },
    {
        "sindrets/winshift.nvim",
        cmd = "WinShift",
    },
}
