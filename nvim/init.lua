-- Built-in stuff
vim.loader.enable()
vim.opt.breakindent = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.guicursor = ""
vim.opt.ignorecase = true
vim.opt.laststatus = 3
vim.opt.lazyredraw = true
vim.opt.linebreak = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 3
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.showtabline = 0
vim.opt.sidescrolloff = 3
vim.opt.smartcase = true
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.timeout = false
vim.opt.title = true
vim.opt.ttimeout = false
vim.opt.virtualedit = "block"
vim.keymap.set("n", "<Esc>", function()
    vim.cmd([[noh]])
end)

-- Modify some options for specific filetypes
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    callback = function()
        if vim.tbl_contains({ "markdown", "text" }, vim.opt.filetype:get()) then
            vim.opt.spell = true
        end
        vim.opt.formatoptions = ""
    end,
})

-- Automatically clean up whitespace upon writing the buffer
vim.api.nvim_create_autocmd("BufWrite", {
    callback = function()
        save_cursor = vim.fn.getpos(".")
        vim.cmd([[silent! %s/\s\+$//e]])
        vim.cmd([[silent! %s/\%^\_\s*\n//]])
        vim.cmd([[silent! %s#\($\n\s*\)\+\%$##]])
        vim.fn.setpos(".", save_cursor)
    end,
})

-- Automatically create any needed directories upon writing the buffer
vim.api.nvim_create_autocmd("BufWrite", {
    callback = function()
        local dir = vim.fn.expand("<afile>:p:h")
        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, "p")
        end
    end,
})

-- Change the number line cursor color depending on the current Vim mode
vim.api.nvim_create_autocmd({ "ModeChanged", "BufEnter" }, {
    callback = function()
        local mode_highlight = "lualine_a" .. require("lualine.highlight").get_mode_suffix()
        vim.api.nvim_set_hl(0, "CursorLineNr", { link = mode_highlight })
    end,
})

-- Neovim plugins to install with Paq
require("paq")({
    "brenoprata10/nvim-highlight-colors",
    "goolord/alpha-nvim",
    "hiphish/rainbow-delimiters.nvim",
    "lukas-reineke/indent-blankline.nvim",
    "mofiqul/dracula.nvim",
    "numtostr/comment.nvim",
    "nvim-lualine/lualine.nvim",
    "nvim-treesitter/nvim-treesitter",
    "savq/paq-nvim",
    "smoka7/hop.nvim",
    "sontungexpt/stcursorword",
    "windwp/nvim-autopairs",
})
vim.keymap.set("n", "<Leader>p", function()
    require("paq"):sync()
end)

-- Sexy startup screen
local startify = require("alpha.themes.startify")
startify.nvim_web_devicons.enabled = false
local fortune = vim.fn.system("fortune -s | cowsay -f vader")
local lines = {}
for l in fortune:gmatch("(.-)\n") do
    table.insert(lines, l)
end
startify.section.header.val = lines
require("alpha").setup(startify.config)

-- Smart comment toggling
require("Comment").setup({
    padding = false,
    toggler = { line = "<Leader>cc", block = "<Leader>bb" },
    opleader = { line = "<Leader>c", block = "<Leader>b" },
    mappings = { basic = true, extra = false },
})

-- The best color scheme ever
require("dracula").setup({ italic_comment = true, show_end_of_buffer = true })
vim.cmd([[colorscheme dracula]])

-- Faster movement
require("hop").setup({ create_hl_autocmd = false, keys = "arstneio" })
vim.keymap.set("", "<Leader>w", function()
    require("hop").hint_words()
end)

-- Show visual indent guides
require("ibl").setup({
    indent = { char = "│" },
    scope = { enabled = false },
})

-- Nicer statusline
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

-- Automatically pair delimiters
require("nvim-autopairs").setup({ check_ts = true })

-- Highlight color codes with the color they represent
require("nvim-highlight-colors").setup({ enable_tailwind = true })

-- Better syntax highlighting and some other useful language utilities
require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = { enable = true },
    indent = { enable = true },
})
vim.keymap.set("n", "<Leader>t", function()
    require("nvim-treesitter.install").update()()
end)

-- Make delimiter colors different per scope level
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

-- Underline similar words under cursor
require("stcursorword").setup({ min_word_length = 1 })
