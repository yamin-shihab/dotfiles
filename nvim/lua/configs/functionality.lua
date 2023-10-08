-- Functionality plugins
return {
    {
        "ethanholz/nvim-lastplace",
        config = function()
            require("nvim-lastplace").setup()
        end,
    },
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                fold_closed = ">",
                fold_open = "v",
                icons = false,
                signs = {
                    error = "e",
                    hint = "h",
                    information = "i",
                    other = "o",
                    warning = "w",
                },
                use_diagnostic_signs = false,
            })
        end,
    },
    {
        "jghauser/mkdir.nvim",
        event = "BufWritePre",
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
        "numtostr/comment.nvim",
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
        "sindrets/winshift.nvim",
        cmd = "WinShift",
    },
    {
        "smoka7/hop.nvim",
        cmd = { "HopWord", "HopLineStart", "HopPattern" },
        config = function()
            require("hop").setup({
                keys = "arstneio",
                jump_on_sole_occurrence = false,
            })
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true,
            })
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
    "mbbill/undotree",
}
