-- LSP
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
-- LSP servers
local lspconfig = require("lspconfig")
local servers = {
	"sumneko_lua",
	"ccls",
	"pyright",
	"bashls",
	"cmake",
	"rust_analyzer",
	"yamlls",
	"asm_lsp",
	"gdscript",
	"gopls",
	"hls",
	"ltex",
	"cssls",
	"eslint",
	"html",
	"jsonls",
}
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({})
end
lspconfig.sumneko_lua.setup({
	settings = {
		Lua = {
			diagnostics = {
				disable = {
					"lowercase-global",
				},
				globals = {
					"vim", -- I have been saved from useless warnings!
				},
			},
		},
	},
})
lspconfig.arduino_language_server.setup({
	cmd = {
		-- Required
		"arduino-language-server",
		"-cli-config",
		"$HOME/.arduino5/arduino-cli.yaml",
		-- Optional
		"-cli",
		"/usr/bin/arduino-cli",
		"-clangd",
		"/usr/bin/clangd",
	},
})
