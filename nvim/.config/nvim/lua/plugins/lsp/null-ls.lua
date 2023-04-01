local servers = {
	"prettier",
	"stylua",
	"black",
	-- "flake8",
	"eslint",
	"cspell",
	"csharpier",
	"beautysh",
}

require("mason-null-ls").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
-- local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = {} }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		formatting.csharpier,
		formatting.beautysh,
		-- diagnostics.flake8,
		diagnostics.eslint,
		code_actions.cspell,
	},
})
