-- Treesitter plugins
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

require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
})

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
