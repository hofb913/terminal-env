vim.pack.add({
	{ src = vim.g.gh("mason-org/mason.nvim"), name = "mason" },
	{ src = vim.g.gh("mason-org/mason-lspconfig.nvim") },
	{ src = vim.g.gh("WhoIsSethDaniel//mason-tool-installer.nvim") },
})

require("mason").setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-tool-installer").setup({
	-- a list of all tools you want to ensure are installed upon
	-- start
	ensure_installed = {
		"lua_ls", -- lua language server
		"stylua", -- lua formatter
		"luacheck", -- lua linter
		"ty", -- python languare server
		"ruff", -- python linter & formatter
		"prettierd", -- formatter (for many)
		"fixjson", -- json formatter
	},

	auto_update = true,
	run_on_start = true,

	-- By default all integrations are enabled. If you turn on an integration
	-- and you have the required module(s) installed this means you can use
	-- alternative names, supplied by the modules, for the thing that you want
	-- to install. If you turn off the integration (by setting it to false) you
	-- cannot use these alternative names. It also suppresses loading of those
	-- module(s) (assuming any are installed) which is sometimes wanted when
	-- doing lazy loading.
	integrations = {
		["mason-lspconfig"] = true,
		["mason-null-ls"] = false,
		["mason-nvim-dap"] = false,
	},
})
