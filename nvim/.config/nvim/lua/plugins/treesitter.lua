vim.pack.add({
	{ src = vim.g.gh("nvim-treesitter/nvim-treesitter"), branch = "master", build = ".TSUpdate" },
})

local setup_treesitter = function()
	local ensure_installed = {
		"html",
		"css",
		"json",
		"lua",
		"markdown",
		"python",
	}

	local already_installed = require("nvim-treesitter.config").get_installed()

	local parsers_to_install = vim.iter(ensure_installed)
		:filter(function(parser)
			return not vim.tbl_contains(already_installed, parser)
		end)
		:totable()
	require("nvim-treesitter").install(parsers_to_install)

	local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		callback = function(args)
			if
				vim.list_contains(
					require("nvim-treesitter.config").get_installed(),
					vim.treesitter.language.get_lang(args.match)
				)
			then
				vim.treesitter.start(args.buf)
			end
		end,
	})
end

setup_treesitter()
