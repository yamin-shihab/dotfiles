-- LSP support
-- local lsp = require("lspconfig")
local servers = { "rust_analyzer", "clangd", "bashls", "pyright", "sumneko_lua", "gdscript" }
for _, server in ipairs(servers) do
	require("lspconfig")[server].setup({ on_attach = function() end })
end
