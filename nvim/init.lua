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

local mini_path = vim.fn.stdpath("data") .. "/site/pack/deps/opt/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
    local clone_cmd = {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/echasnovski/mini.nvim",
        mini_path,
    }
    vim.fn.system(clone_cmd)
    vim.cmd("packadd mini.nvim | helptags ALL")
else
    vim.cmd("packadd mini.nvim")
end

require("mini.base16").setup({
    palette = {
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
    },
})

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

local deps = require("mini.deps")
deps.setup()
deps.add("echasnovski/mini.nvim")
deps.add("neovim/nvim-lspconfig")
deps.add("nvim-treesitter/nvim-treesitter")
vim.keymap.set("n", "<Leader>p", function()
    deps.clean({ force = true })
    deps.update(nil, { force = true })
    require("nvim-treesitter.install").update()()
end)

local jump2d = require("mini.jump2d")
require("mini.jump2d").setup({
    labels = "arstneio",
    mappings = { start_jumping = "<Leader>h" },
    silent = true,
    spotter = jump2d.gen_spotter.pattern(),
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
                { hl = mode_hl,                  strings = { mode } },
                "%<",
                { hl = "MiniStatuslineFileinfo", strings = { filename } },
                "%=",
                { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
                { hl = mode_hl,                  strings = { location } },
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
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
for _, server in pairs({
    "bashls",
    "clangd",
    "cssls",
    "gdscript",
    "gdshader_lsp",
    "html",
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "zls",
}) do
    lsp[server].setup({ capabilities = capabilities })
end
vim.keymap.set("n", "<Leader>d", vim.lsp.buf.hover)
vim.keymap.set("n", "<Leader>g", vim.lsp.buf.definition)
vim.keymap.set("n", "<Leader>j", vim.diagnostic.goto_next)
vim.keymap.set("n", "<Leader>k", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename)
vim.keymap.set("n", "<Leader>t", vim.lsp.buf.type_definition)

require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "diff",
        "gitcommit",
        "html",
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
        "zig",
    },
    highlight = { enable = true },
    indent = { enable = true },
})
