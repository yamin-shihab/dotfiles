-- LSP support
local lsp = require("lspconfig")
require("lspconfig.ui.windows").default_options.border = "single"
local servers = { "rust_analyzer", "clangd", "bashls", "pyright", "gdscript" }
for _, server in ipairs(servers) do
    lsp[server].setup({})
end
lsp.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
        },
    },
})
