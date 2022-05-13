-- Neovim keybinds

return {
	setup = function()
		-- Substitute is a pain
		vim.keymap.set("", "<M-Space>", ":%s//g<Left><Left>")

		-- Colemak bindings
		vim.keymap.set("", "h", "k")
		vim.keymap.set("", "k", "j")
		vim.keymap.set("", "j", "h")
		vim.keymap.set("", "l", "l")

		-- EZ motions
		vim.keymap.set("", "<M-w>", ":HopWord<CR>")
		vim.keymap.set("", "<M-l>", ":HopLine<CR>")

		-- Update packages
		vim.keymap.set("", "<M-p>", ":PackerSync<CR>")

		-- Sort
		vim.keymap.set("", "<M-`>", ":Sort<CR>")

		-- Telescope
		local function telescope_custom_picker(picker)
			require("telescope.builtin")[picker](require("telescope.themes").get_dropdown({ winblend = 20 }))
		end

		vim.keymap.set("", "<M-b>", function()
			telescope_custom_picker("builtin")
		end)
		vim.keymap.set("", "<M-s>", function()
			telescope_custom_picker("spell_suggest")
		end)
		vim.keymap.set("", "<M-CR>", function()
			telescope_custom_picker("grep_string")
		end)
		vim.keymap.set("", "<M-BS>", function()
			telescope_custom_picker("live_grep")
		end)
		vim.keymap.set("", "<M-m>", function()
			telescope_custom_picker("man_pages")
		end)
		vim.keymap.set("", "<M-i>", function()
			telescope_custom_picker("lsp_implementations")
		end)
		vim.keymap.set("", "<M-d>", function()
			telescope_custom_picker("lsp_definitions")
		end)
		vim.keymap.set("", "<M-t>", function()
			telescope_custom_picker("lsp_type_definitions")
		end)
		vim.keymap.set("", "<M-a>", function()
			telescope_custom_picker("lsp_code_actions")
		end)
		vim.keymap.set("", "<M-c>", function()
			telescope_custom_picker("colorscheme")
		end)

		-- Window navigation
		vim.keymap.set("", "<M-S-w>", ":WinShift<CR>")

		-- Better increment/decrement
		vim.keymap.set("", "<C-a>", ":DialIncrement<CR>")
		vim.keymap.set("", "<C-x>", ":DialDecrement<CR>")

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
