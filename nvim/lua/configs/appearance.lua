-- Appearance plugins
require("colorizer").setup()

require("dracula").setup({
    italic_comment = true,
    show_end_of_buffer = true,
})
vim.cmd("colorscheme dracula")

require("gitsigns").setup()

require("illuminate").configure({
    delay = 0,
    providers = { "regex" },
})

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
