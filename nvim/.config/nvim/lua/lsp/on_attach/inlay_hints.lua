-- lua/lsp/on_attach/inlay_hints

return function(client, bufnr)
	if client.server_capabilities.inlayHintProvider then
		vim.keymap.set("n", "<leader>th", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
		end, { desc = "Toggle inlay hints" })
	end
end
