local status, null_ls = pcall(require, "null-ls")
if not status then
	vim.notify("null-ls not found", "Warning")
	return
end

local formatters = {
	"prettier",
	"black",
	"stylua",
	"beautysh",
	"csharpier",
}

local linters = {
	"eslint",
	"cspell",
}

local services = {}
for _, formatter in ipairs(formatters) do
	table.insert(services, 0, formatter)
end
for _, linter in ipairs(linters) do
	table.insert(services, 0, linter)
end

require("mason-null-ls").setup({
	ensure_installed = services,
	automatic_installation = true,
})

local function setup_sources()
	local sources = {}
	-- register formatters
	for _, formatter in ipairs(formatters) do
		if formatter == "black" then
			table.insert(
				sources,
				0,
				require("null-ls.builtins.formatting." .. formatter).with({ extra_args = { "--fast" } })
			)
		else
			table.insert(sources, 0, require("null-ls.builtins.formatting." .. formatter))
		end
	end
	-- register linters
	for _, linter in ipairs(linters) do
		table.insert(sources, 0, require("null-ls.builtins.diagnostics." .. linter))
		table.insert(sources, 0, require("null-ls.builtins.code_actions." .. linter))
	end
	return sources
end

null_ls.setup({
	debug = true,
	sources = setup_sources(),
})
