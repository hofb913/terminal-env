vim.pack.add({
	{ src = vim.g.gh("kdheepak/lazygit.nvim") },
	{ src = vim.g.gh("nvim-lua/plenary.nvim") },
})

require("plenary")
require("lazygit")

vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
