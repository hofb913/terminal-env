vim.pack.add({
	{ src = vim.g.gh("catppuccin/nvim"), name = "catppuccin" },
})

local opts = {
	background = {
		light = "latte",
		dark = "mocha",
	},
	term_colors = true,
	transparent_background = true,
	dim_inactive = {
		enabled = false, -- dims the background color of inactive window
		shade = "dark",
		percentage = 0.15, -- percentage of the shade to apply to the inactive window
	},
	no_italic = false,
	no_bold = false,
	integrations = {
		cmp = true,
		gitsigns = true,
		treesitter = true,
		harpoon = true,
		telescope = true,
		mason = true,
		noice = true,
		notify = true,
		which_key = true,
		fidget = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
	},
}

require("catppuccin").setup(opts)
vim.cmd.colorscheme("catppuccin-nvim")
