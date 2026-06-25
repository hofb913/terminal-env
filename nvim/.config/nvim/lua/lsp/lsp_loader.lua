-- LSP Loader
--   LSP Configs are found in -> lsp/servers
--   on_attach configs are found in -> lsp/on_attach

-- This loader is called from plugin -> lsp.lua

local capabilities = require("lsp.capabilities").get()
local shared = require("lsp.on_attach.shared")
local inlay = require("lsp.on_attach.inlay_hints")
--local ruff = require("lsp.on_attach.ruff").on_attach()

-- servers to be loaded - each must have a corresponding config file in lsp/server
local servers = {
	"lua_ls",
	"ty",
	"ruff",
}

-- chain on_attach configs
local chain_on_attach = function(...)
	local funcs = { ... }

	return function(client, bufnr)
		for _, fn in ipairs(funcs) do
			if fn then
				fn(client, bufnr)
			end
		end
	end
end

-- lsp loader
for _, name in ipairs(servers) do
	local ok, config = pcall(require, "lsp.servers." .. name)
	if ok then
		config.capabilities = capabilities or config.capabilities
		config.on_attach = chain_on_attach(shared, inlay, config.on_attach)

		vim.lsp.config(name, config)
		vim.lsp.enable(name)
	else
		vim.notify("LSP config missing: " .. name, vim.log.levels.WARN)
	end
end
