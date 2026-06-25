-- Need to setup Blink before we require any LSP
--      Using LuaSnip for snippets
--      Using lazydev for better lua completions
--
vim.pack.add({
	{ src = vim.g.gh("Saghen/blink.cmp"), version = vim.version.range("^1") },
	{ src = vim.g.gh("folke/lazydev.nvim") },
	{ src = vim.g.gh("L3MON4D3/LuaSnip"), name = "luasnip" },
})

require("blink.cmp").setup({
	keymap = {
		preset = "none",
		["<C-Space>"] = { "show", "hide" },
		["<CR>"] = { "accept", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<Tab>"] = { "snippet_forward", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "fallback" },
	},
	appearance = {
		nerd_font_variant = "mono",
		use_nvim_cmp_as_default = true,
	},
	signature = { enabled = true },

	completion = {
		menu = {
			draw = {
				treesitter = { "lsp" },
				columns = {
					{ "kind_icon" },
					{ "label", "label_description", gap = 1 },
					{ "source_name" },
				},
			},
		},
		documentation = {
			auto_show = true,
		},
	},
	sources = {
		default = { "lsp", "path", "buffer", "snippets" },
	},

	snippets = {
		expand = function(snippet)
			require("luasnip").lsp_expand(snippet)
		end,
	},
	fuzzy = {
		implementation = "prefer_rust_with_warning",
	},
})

require("lazydev").setup({
	library = {
		vim.env.VIMRUNTIME,
		vim.fn.stdpath("config"),
	},
})

-- Load all LSP configs (in lua/lsp)
--require("lsp.lsp_loader")
