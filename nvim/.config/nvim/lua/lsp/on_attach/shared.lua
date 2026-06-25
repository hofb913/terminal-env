-- lua/lsp/on_attach/shared.lua
--    Shared lsp functionality

local actions = require("lsp.actions")

return function(client, bufnr)
	-- disable LSP formatting (using Conform for this)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false

	-- Common keymaps
	local map = function(keys, fn)
		vim.keymap.set("n", keys, fn, { buffer = bufnr })
	end

	vim.keymap.set("n", "<leader>ca", actions.menu, {
		buffer = bufnr,
		desc = "Code Action: (fzf)",
	})

	vim.keymap.set("n", "<leader>cf", actions.fix_all_menu, {
		buffer = bufnr,
		desc = "Fix All (fzf)",
	})

	vim.keymap.set("n", "<leader>ci", actions.imports_menu, {
		buffer = bufnr,
		desc = "Organize Imports (fzf)",
	})

	map("K", vim.lsp.buf.hover)
	--	map("gd", vim.lsp.buf.definition)
	--	map("<leader>rn", vim.lsp.buf.rename)
end
