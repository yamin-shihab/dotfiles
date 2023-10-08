-- Functionality plugins
require("Comment").setup()

require("hop").setup({
    keys = "arstneio",
    jump_on_sole_occurrence = false,
})

require("numb").setup()

require("nvim-autopairs").setup({
    check_ts = true,
})

require("nvim-lastplace").setup()

require("tidy").setup()

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
