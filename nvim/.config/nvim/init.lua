vim.g.mapleader = " " -- space as leader
vim.g.maplocalleader = " " -- space as local leader

-- configurations
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.diagnostics")
require("config.terminal")
require("config.helpers")

-- plugins
require("plugins.catppuccin")
require("plugins.lualine")
require("plugins.oil")
require("plugins.fzflua")
require("plugins.mason")
require("plugins.blink")
require("lsp.lsp_loader")
require("plugins.treesitter")
require("plugins.conform_lint")
require("plugins.gitsigns")
require("plugins.lazygit")
require("plugins.whichkey")
