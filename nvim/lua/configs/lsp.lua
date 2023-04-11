-- LSP and completion plugins
return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lsp = require("lspconfig")
            require("lspconfig.ui.windows").default_options.border = "single"
            local servers = { "rust_analyzer", "clangd", "bashls", "pyright", "gdscript", "denols" }
            for _, server in ipairs(servers) do
                lsp[server].setup({})
            end
            vim.g.markdown_fenced_languages = {
                "ts=typescript",
            }
            lsp.lua_ls.setup({
                settings = {
                    diagnostics = {
                        disable = { "lowercase-global" },
                    },
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                    },
                },
            })
        end,
    },
    {
        "glepnir/lspsaga.nvim",
        config = function()
            require("lspsaga").setup({
                symbol_in_winbar = {
                    separator = " > ",
                },
                ui = {
                    code_action = "!",
                    collapse = "-",
                    expand = "+",
                    hover = "~",
                    incoming = "<-",
                    outgoing = "->",
                    kind = {
                        ["File"] = { "", "Tag" },
                        ["Module"] = { "", "Exception" },
                        ["Namespace"] = { "", "Include" },
                        ["Package"] = { "", "Label" },
                        ["Class"] = { "", "Include" },
                        ["Method"] = { "", "Function" },
                        ["Property"] = { "", "@property" },
                        ["Field"] = { "", "@field" },
                        ["Constructor"] = { "", "@constructor" },
                        ["Enum"] = { "", "@number" },
                        ["Interface"] = { "", "Type" },
                        ["Function"] = { "", "Function" },
                        ["Variable"] = { "", "@variable" },
                        ["Constant"] = { "", "Constant" },
                        ["String"] = { "", "String" },
                        ["Number"] = { "", "Number" },
                        ["Boolean"] = { "", "Boolean" },
                        ["Array"] = { "", "Type" },
                        ["Object"] = { "", "Type" },
                        ["Key"] = { "", "" },
                        ["Null"] = { "", "Constant" },
                        ["EnumMember"] = { "", "Number" },
                        ["Struct"] = { "", "Type" },
                        ["Event"] = { "", "Constant" },
                        ["Operator"] = { "", "Operator" },
                        ["TypeParameter"] = { "", "Type" },
                        ["TypeAlias"] = { "", "Type" },
                        ["Parameter"] = { "", "@parameter" },
                        ["StaticMethod"] = { "", "Function" },
                        ["Macro"] = { "", "Macro" },
                        ["Text"] = { "", "String" },
                        ["Snippet"] = { "", "@variable" },
                        ["Folder"] = { "", "@parameter" },
                        ["Unit"] = { "", "Number" },
                        ["Value"] = { "", "@variable" },
                    },
                },
            })
        end,
    },
    {
        "ms-jpq/coq_nvim",
        config = function()
            vim.g.coq_settings = {
                display = {
                    ghost_text = { context = { "  ", "  " } },
                    icons = { mode = "none" },
                    preview = { border = "single" },
                    pum = { ellipsis = "...", source_context = { "<", ">" } },
                },
            }
            vim.cmd("COQnow -s")
        end,
    },
    {
        "ms-jpq/coq.artifacts",
        dependencies = { "ms-jpq/coq_nvim" },
    },
}
