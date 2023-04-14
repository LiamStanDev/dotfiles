return function()
	local servers = require("core").null_ls_servers

	require("mason-null-ls").setup({
		ensure_installed = servers,
		automatic_installation = true,
	})
	local sources = {}
	for _, server in ipairs(servers) do
		local formatter_ok, formatter = pcall(require, "null-ls.builtins.formatting." .. server)
		if formatter_ok and server ~= "eslint" then
			table.insert(sources, formatter)
		end

		local linter_ok, linter = pcall(require, "null-ls.builtins.diagnostics." .. server)
		if linter_ok then
			table.insert(sources, linter)
		end
	end
	require("null-ls").setup({
		sources = sources,
	})
end
