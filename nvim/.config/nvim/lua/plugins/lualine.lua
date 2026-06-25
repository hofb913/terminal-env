vim.pack.add({
	{ src = vim.g.gh("nvim-lualine/lualine.nvim"), name = "lualine" },
	{ src = vim.g.gh("nvim-tree/nvim-web-devicons") },
})

require("lualine").setup()
