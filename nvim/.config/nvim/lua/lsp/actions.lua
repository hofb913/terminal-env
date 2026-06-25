local M = {}

-- generic helper
function M.code_action(opts)
	opts = opts or {}

	vim.lsp.buf.code_action({
		context = opts.context,
		apply = opts.apply ~= false,
	})
end

-- generic picker (with fzf-lua)
function M.menu()
	require("fzf-lua").lsp_code_actions()
end

--  fix-all menu (wth fzf-lua)
function M.fix_all_menu()
	require("fzf-lua").lsp_code_actions({
		context = { only = { "source.fixAll" } },
	})
end

-- Organize Imports menu (with fzf-lua)
function M.imports_menu()
	require("fzf-lua").lsp_code_actions({
		context = { only = { "source.organizeImports" } },
	})
end

--[[
-- Fix All (Ruff)
function M.fix_all()
	M.code_action({
		context = { only = { "source.fixAll.ruff" } },
		apply = true,
	})
end

-- Organize imports (Ruff / others)
function M.organize_imports()
	M.code_action({
		context = { only = { "source.organizeImports.ruff" } },
		apply = true,
	})
end
--]]

-- Refactor (interactive)
function M.refactor()
	M.code_action({
		context = { only = { "refactor" } },
	})
end

-- quickfix (generic)
function M.quickfix()
	M.code_action({
		context = { only = { "quickfix" } },
	})
end

return M
