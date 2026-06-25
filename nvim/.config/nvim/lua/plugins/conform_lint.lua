-- Linter and Formatter plugins
--     Linters and Formatters are downloaded via Mason plugin

vim.pack.add({
	{ src = vim.g.gh("stevearc/conform.nvim") },
	{ src = vim.g.gh("mfussenegger/nvim-lint") },
})

-- Formatter --> Conform
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = {
			"ruff_fix",
			"ruff_format",
			"ruff_organize_imports",
		},
		markdown = { "prettierd" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
	format_on_save = function(bufnr)
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end

		local bufname = vim.api.nvim_buf_get_name(bufnr)

		if bufname:match("/node_modules") then
			return
		end

		return { timeout_ms = 500, lsp_format = "fallback" }
	end,
})

-- Linter --> nvim-lint
require("lint").linters_by_ft = {
	--	python = { "ruff" },
	lua = { "luacheck" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	group = vim.api.nvim_create_augroup("lint", { clear = true }),
	callback = function()
		require("lint").try_lint()
	end,
})
