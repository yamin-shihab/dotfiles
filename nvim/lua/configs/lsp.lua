-- LSP and completion plugins
return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lsp = require("lspconfig")
            require("lspconfig.ui.windows").default_options.border = "single"
            local servers = { "rust_analyzer", "clangd", "bashls", "pyright", "gdscript", "denols", "ltex" }
            local on_attach = function(client)
                client.server_capabilities.semanticTokensProvider = nil
            end

            for _, server in ipairs(servers) do
                lsp[server].setup({ on_attach = on_attach })
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
                on_attach = on_attach,
            })
        end,
    },
    {
        "nvimdev/lspsaga.nvim",
        event = "LspAttach",
        config = function()
            require("lspsaga").setup({
                symbol_in_winbar = {
                    separator = " > ",
                },
                lightbulb = {
                    sign = false,
                    virtual_text = false,
                },
                ui = {
                    devicon = false,
                    expand = "+",
                    collapse = "-",
                    code_action = "!",
                    actionfix = "",
                    imp_sign = "",
                    kind = {
                        Array = { "# ", "Type" },
                        Boolean = { "# ", "Boolean" },
                        Class = { "# ", "Include" },
                        Constant = { "# ", "Constant" },
                        Constructor = { "# ", "@constructor" },
                        Enum = { "# ", "@number" },
                        EnumMember = { "# ", "Number" },
                        Event = { "# ", "Constant" },
                        Field = { "# ", "@field" },
                        File = { "# ", "Tag" },
                        Folder = { "# ", "Title" },
                        Function = { "# ", "Function" },
                        Interface = { "# ", "Type" },
                        Key = { "# ", "Constant" },
                        Macro = { "# ", "Macro" },
                        Method = { "# ", "Function" },
                        Module = { "# ", "Exception" },
                        Namespace = { "# ", "Include" },
                        Null = { "# ", "Constant" },
                        Number = { "# ", "Number" },
                        Object = { "# ", "Type" },
                        Operator = { "# ", "Operator" },
                        Package = { "# ", "Label" },
                        Parameter = { "# ", "@parameter" },
                        Property = { "# ", "@property" },
                        Snippet = { "# ", "@variable" },
                        StaticMethod = { "# ", "Function" },
                        String = { "# ", "String" },
                        Struct = { "# ", "Type" },
                        Text = { "# ", "String" },
                        TypeAlias = { "# ", "Type" },
                        TypeParameter = { "# ", "Type" },
                        Unit = { "# ", "Number" },
                        Value = { "# ", "@variable" },
                        Variable = { "# ", "@variable" },
                    },
                },
                beacon = {
                    enable = false,
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
