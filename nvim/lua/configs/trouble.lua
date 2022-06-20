-- Diagnostics
require("trouble").setup({
	icons = false,
	fold_open = "v",
	fold_closed = ">",
	signs = {
		error = "e",
		warning = "w",
		hint = "h",
		information = "i",
	},
	use_diagnostic_signs = false,
})
