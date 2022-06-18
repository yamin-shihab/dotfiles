-- Neovim keybinds

return {
	setup = function()
		-- Press escape after searching to clear search highlighting
		vim.keymap.set("", "<Esc>", ":noh<CR><Esc>")

		-- Winshift
		vim.keymap.set("", "<Leader>w", ":WinShift<CR>")

		-- Update packer
		vim.keymap.set("", "<Leader>p", ":PackerSync<CR>:PackerCompile<CR>")

		-- Update treesitter
		vim.keymap.set("", "<Leader>t", ":TSUpdate<CR>")

		-- Luasnip
		local luasnip = require("luasnip")
		-- Nvim-cmp
		local cmp = require("cmp")
		return {
			cmp_mapping = {
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<Tab>"] = function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end,
				["<S-Tab>"] = function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end,
			},
		}
	end,
}
