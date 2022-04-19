-- My Neovim config in Lua!

local keybinds_config = require("keybinds-config").setup()

local packer_config = require("packer-config").setup()

require("lsp-config").setup(keybinds_config.cmp_mapping)

require("functionality-config").setup()

require("options-config").setup()

require("appearance-config").setup()

require("treesitter-config").setup()

-- Packer packages
return require("packer").startup({ packer_config.packages, config = packer_config.config })
