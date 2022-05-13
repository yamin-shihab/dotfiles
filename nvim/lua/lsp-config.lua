-- Configuration for Neovim's LSP

return {
	setup = function(mapping)
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
		vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
			pattern = "*.org",
			callback = function()
				vim.opt.filetype = "org"
			end,
		}) -- For LTeX
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
		-- Nvim-cmp
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = mapping,
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			},
		})
		-- Nvim-cmp+nvim-autopairs
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on(
			"confirm_done",
			cmp_autopairs.on_confirm_done({
				map_char = { tex = "" },
			})
		)
		cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"
	end,
}
