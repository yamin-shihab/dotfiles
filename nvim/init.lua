vim.loader.enable()

vim.opt.breakindent = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = { "number" }
vim.opt.expandtab = true
vim.opt.guicursor = {}
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
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.spell = true
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.timeout = false
vim.opt.undofile = true
vim.opt.virtualedit = { "block" }

vim.api.nvim_create_autocmd("BufWinEnter", {
    callback = function()
        vim.opt.formatoptions = {}
    end,
})

require("paq")({
    "echasnovski/mini.nvim",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
    "savq/paq-nvim",
})
vim.keymap.set("n", "<Leader>p", ":PaqSync<CR>")

local palette = {
    base00 = "#282A36",
    base01 = "#21222C",
    base02 = "#44475A",
    base03 = "#6272A4",
    base04 = "#F8F8F2",
    base05 = "#F8F8F2",
    base06 = "#6272A4",
    base07 = "#F8F8F2",
    base08 = "#FFB86C",
    base09 = "#BD93F9",
    base0A = "#8BE9FD",
    base0B = "#F1FA8c",
    base0C = "#FF5555",
    base0D = "#50FA7B",
    base0E = "#FF79C6",
    base0F = "#FF5555",
}
require("mini.base16").setup({ palette = palette })

require("mini.comment").setup({
    mappings = {
        comment = "<Leader>c",
        comment_line = "<Leader>cc",
        comment_visual = "<Leader>c",
        textobject = "<Leader>c",
    },
})

require("mini.completion").setup({
    delay = { completion = 0, info = 0, signature = 0 },
})
vim.keymap.set("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
vim.keymap.set("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

require("mini.cursorword").setup({ delay = 0 })

local hipatterns = require("mini.hipatterns")
hipatterns.setup({
    delay = { text_change = 0, scroll = 0 },
    highlighters = {
        fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
        hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
        note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
        todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },

        hex_color = hipatterns.gen_highlighter.hex_color(),
    },
})

local jump2d = require("mini.jump2d")
require("mini.jump2d").setup({
    labels = "arstneio",
    mappings = { start_jumping = "<Leader>h" },
    silent = true,
    spotter = jump2d.gen_pattern_spotter(),
    view = { n_steps_ahead = 2 },
})

require("mini.misc").setup_restore_cursor()

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

local statusline = require("mini.statusline")
statusline.setup({
    content = {
        active = function()
            local mode, mode_hl = statusline.section_mode({})
            local filename = statusline.section_filename({})
            local fileinfo = statusline.section_fileinfo({})
            local location = statusline.section_location({})
            return statusline.combine_groups({
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

local trailspace = require("mini.trailspace")
trailspace.setup()
vim.api.nvim_create_autocmd("BufWrite", {
    callback = function()
        trailspace.trim()
        trailspace.trim_last_lines()
    end,
})

local lsp = require("lspconfig")
for _, server in pairs({ "ccls", "gdscript", "lua_ls", "pyright", "rust_analyzer" }) do
    lsp[server].setup({
        on_attach = function(client)
            client.server_capabilities.semanticTokensProvider = nil
        end,
    })
end
vim.keymap.set("n", "<Leader>g", vim.lsp.buf.definition)
vim.keymap.set("n", "<Leader>d", vim.lsp.buf.hover)
vim.keymap.set("n", "<Leader>j", vim.diagnostic.goto_next)
vim.keymap.set("n", "<Leader>k", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename)

require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash",
        "c",
        "diff",
        "gdscript",
        "gitcommit",
        "godot_resource",
        "ini",
        "json",
        "lua",
        "luap",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "rust",
        "toml",
        "vim",
        "vimdoc",
    },
    highlight = { enable = true },
    indent = { enable = true },
})
vim.keymap.set("n", "<Leader>t", ":TSUpdate<CR>")
