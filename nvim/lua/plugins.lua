-- Paq plugins to install and configure
require("paq")({
    "brenoprata10/nvim-highlight-colors",
    "hiphish/rainbow-delimiters.nvim",
    "lukas-reineke/indent-blankline.nvim",
    "mofiqul/dracula.nvim",
    "numtostr/comment.nvim",
    "nvim-lualine/lualine.nvim",
    "nvim-treesitter/nvim-treesitter",
    "savq/paq-nvim",
    "smoka7/hop.nvim",
    "sontungexpt/stcursorword",
    "windwp/nvim-autopairs",
})

require("configs.appearance")
require("configs.functionality")

vim.keymap.set("n", "<Leader>p", function()
    require("paq"):sync()
end)
