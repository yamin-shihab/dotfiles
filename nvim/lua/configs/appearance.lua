-- Neovim appearance plugins
local startify = require("alpha.themes.startify")
startify.nvim_web_devicons.enabled = false
local fortune = vim.fn.system("fortune -s | cowsay -f vader")
local lines = {}
for l in fortune:gmatch("(.-)\n") do
    table.insert(lines, l)
end
startify.section.header.val = lines
require("alpha").setup(startify.config)

require("dracula").setup({ italic_comment = true, show_end_of_buffer = true })
vim.cmd([[colorscheme dracula]])

require("ibl").setup({
    indent = { char = "│" },
    scope = { enabled = false },
})

require("lualine").setup({
    options = {
        component_separators = { left = "", right = "" },
        globalstatus = true,
        icons_enabled = false,
        section_separators = { left = "", right = "" },
    },
    sections = {
        lualine_b = { "filename" },
        lualine_c = { "filesize" },
    },
    inactive_sections = { nil },
})

require("nvim-highlight-colors").setup({ enable_tailwind = true })

require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = { enable = true },
    indent = { enable = true },
})
vim.keymap.set("n", "<Leader>t", function()
    require("nvim-treesitter.install").update()()
end)

require("rainbow-delimiters.setup").setup({
    highlight = {
        "rainbowcol1",
        "rainbowcol2",
        "rainbowcol3",
        "rainbowcol4",
        "rainbowcol5",
        "rainbowcol6",
        "rainbowcol7",
    },
})

require("stcursorword").setup({ min_word_length = 1 })
