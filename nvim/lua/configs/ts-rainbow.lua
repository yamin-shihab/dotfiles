-- Colored delimiters using treesitter
require("nvim-treesitter.configs").setup({
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
})
