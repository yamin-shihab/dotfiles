-- My Neovim config in Lua!

local packer_config = require("packer-config").setup()
local keybinds_config = require("keybinds-config").setup()
require("options-config").setup()
require("functionality-config").setup()
require("lsp-config").setup(keybinds_config.cmp_mapping)
require("treesitter-config").setup()
require("appearance-config").setup()

-- Packer packages
return require("packer").startup({ packer_config.packages, config = packer_config.config })
