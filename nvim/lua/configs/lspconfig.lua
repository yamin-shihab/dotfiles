-- LSP support
local lsp = require("lspconfig")
local servers = { "rust_analyzer", "clangd", "bashls", "pyright", "sumneko_lua", "gdscript" }
for _, server in ipairs(servers) do
    lsp[server].setup({})
end
lsp.sumneko_lua.setup({
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
        },
    },
})
