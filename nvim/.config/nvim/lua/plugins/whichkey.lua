vim.pack.add({
	{ src = vim.g.gh("folke/which-key.nvim") },
})
--[[
require("which-key").setup({
	keys = {
		"<leader>?",
		function()
			require("which-key").show({ global = false })
		end,
		desc = "buffer Local Keymaps (which-key)",
	},
})
--]]
