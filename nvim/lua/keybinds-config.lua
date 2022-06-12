-- Neovim keybinds

return {
	setup = function()
		-- Colemak bindings
		vim.keymap.set("", "n", "h")
		vim.keymap.set("", "N", "H")
		vim.keymap.set("", "e", "j")
		vim.keymap.set("", "i", "k")
		vim.keymap.set("", "o", "l")
		vim.keymap.set("", "O", "L")
		vim.keymap.set("", "k", "n")
		vim.keymap.set("", "K", "N")
		vim.keymap.set("", "l", "i")
		vim.keymap.set("", "L", "I")
		vim.keymap.set("", "h", "o")
		vim.keymap.set("", "H", "O")
		vim.keymap.set("", "j", "e")
		vim.keymap.set("", "J", "E")

		-- Substitute is a pain
		vim.keymap.set("", "<M-s>", ":%s//g<Left><Left>")

		-- Update packages
		vim.keymap.set("", "<M-p>", ":PackerSync<CR>")

		-- Update treesitter
		vim.keymap.set("", "<M-t>", ":TSUpdate<CR>")

		-- Window navigation
		vim.keymap.set("", "<M-w>", ":WinShift<CR>")

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
