-- Built-in stuff
vim.loader.enable()
vim.opt.breakindent = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.expandtab = true
vim.opt.fillchars = "eob: "
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
vim.opt.showbreak = " > "
vim.opt.showmode = false
vim.opt.showtabline = 0
vim.opt.sidescrolloff = 3
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.spell = true
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.timeout = false
vim.opt.title = true
vim.opt.ttimeout = false
vim.opt.undofile = true
vim.opt.virtualedit = "block"
vim.opt.wrap = true
vim.keymap.set("n", "<Esc>", function()
    vim.cmd("noh")
end)

-- Modify some options per buffer
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    callback = function()
        vim.opt.formatoptions = ""
    end,
})

-- Update mini.nvim package
vim.keymap.set("n", "<Leader>p", function()
    local path = vim.fn.stdpath("data") .. "/site/pack/plugins/start"
    if vim.fn.isdirectory(path .. "/mini.nvim") == 1 then
        vim.fn.jobstart("git pull --recurse-submodules", {
            cwd = path .. "/mini.nvim",
        })
        print("Pulling updates for mini.nvim")
    else
        vim.fn.mkdir(path, "p")
        vim.fn.jobstart("git clone --recurse-submodules https://github.com/echasnovski/mini.nvim", {
            cwd = path,
        })
        print("Cloning mini.nvim as package")
    end
    vim.cmd("helptags ALL")
end)

-- Automatic Base16 color scheme generator
local palette = {
    base00 = "#282A36",
    base01 = "#44475A",
    base02 = "#44475A",
    base03 = "#6272A4",
    base04 = "#F8F8F2",
    base05 = "#F8F8F2",
    base06 = "#44475A",
    base07 = "#282A36",
    base08 = "#FFB86C",
    base09 = "#BD93F9",
    base0A = "#8BE9FD",
    base0B = "#F1FA8c",
    base0C = "#FF5555",
    base0D = "#50FA7B",
    base0E = "#FF79C6",
    base0F = "#F8F8F2",
}
require("mini.base16").setup({ palette = palette })
vim.api.nvim_set_hl(0, "Comment", { fg = palette.base03, italic = true })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = palette.base00, bold = true, italic = true })
vim.api.nvim_set_hl(0, "LineNr", { fg = palette.base03 })
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = palette.base03 })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = palette.base03 })
vim.api.nvim_set_hl(0, "SpecialComment", { fg = palette.base0C, italic = true })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = palette.base03, bg = palette.base00 })

-- Comment lines with automatic string detection
require("mini.comment").setup({
    mappings = {
        comment = "<Leader>c",
        comment_line = "<Leader>cc",
        comment_visual = "<Leader>c",
        textobject = "<Leader>c",
    },
})

-- Automatic completion
require("mini.completion").setup({
    delay = { completion = 0, info = 0, signature = 0 },
})
vim.keymap.set("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
vim.keymap.set("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

-- Automatically highlight words matching word under cursor
require("mini.cursorword").setup({ delay = 0 })

-- Highlight hexadecimal color codes
local hipatterns = require("mini.hipatterns")
hipatterns.setup({
    delay = { text_change = 0, scroll = 0 },
    highlighters = { hex_color = hipatterns.gen_highlighter.hex_color() },
})

--- Quickly jump within visible lines
local jump2d = require("mini.jump2d")
require("mini.jump2d").setup({
    labels = "arstneio",
    mappings = { start_jumping = "<Leader>j" },
    silent = true,
    spotter = jump2d.gen_pattern_spotter(),
    view = { n_steps_ahead = 2 },
})

-- Miscellaneous functionality
require("mini.misc").setup_restore_cursor()

-- Automatically pair certain characters together
require("mini.pairs").setup({
    mappings = {
        ["'"] = {
            action = "closeopen",
            pair = "''",
            neigh_pattern = "[^%a\\&].",
            register = { cr = false },
        },
    },
})

-- Helpful start screen
local starter = require("mini.starter")
starter.setup({
    content_hooks = {
        starter.gen_hook.adding_bullet(""),
        starter.gen_hook.indexing("all", { "Builtin actions" }),
        starter.gen_hook.padding(3, 1),
    },
    evaluate_single = true,
    footer = vim.api.nvim_exec2([[version]], { output = true }).output:match("(.*)Compilation:"),
    header = [[
            _
 _ ____   _(_)_ __ ___
| '_ \ \ / / | '_ ` _ \
| | | \ V /| | | | | | |
|_| |_|\_/ |_|_| |_| |_|
    ]],
    items = {
        starter.sections.builtin_actions(),
        starter.sections.recent_files(5, false),
        starter.sections.recent_files(5, true),
    },
    silent = true,
})

-- Better status line
require("mini.statusline").setup({
    content = {
        active = function()
            local mode, mode_hl = MiniStatusline.section_mode({})
            local filename = MiniStatusline.section_filename({})
            local fileinfo = MiniStatusline.section_fileinfo({})
            local location = MiniStatusline.section_location({})
            return MiniStatusline.combine_groups({
                { hl = mode_hl, strings = { mode } },
                "%<",
                { hl = "MiniStatuslineFileinfo", strings = { filename } },
                "%=",
                { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
                { hl = mode_hl, strings = { location } },
            })
        end,
    },
    use_icons = false,
    set_vim_settings = false,
})

-- Highlight and remove trailing space and lines
local trailspace = require("mini.trailspace")
trailspace.setup()
vim.api.nvim_create_autocmd("BufWrite", {
    callback = function()
        trailspace.trim()
        trailspace.trim_last_lines()
    end,
})
