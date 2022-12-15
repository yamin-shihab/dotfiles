-- LSP support
local lsp = require("lspconfig")
local servers = { "rust_analyzer", "clangd", "bashls", "pyright", "sumneko_lua", "gdscript" }
for _, server in ipairs(servers) do
    lsp[server].setup(
        require("chadtree").lsp_ensure_capabilities(
            require("coq").lsp_ensure_capabilities({ on_attach = function() end })
        )
    )
end
lsp.sumneko_lua.setup(require("chadtree").lsp_ensure_capabilities(require("coq").lsp_ensure_capabilities({
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
        },
    },
    on_attach = function() end,
})))
