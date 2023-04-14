return function()
	local servers = require("core").null_ls_servers

	require("mason-null-ls").setup({
		ensure_installed = servers,
		automatic_installation = true,
	})
	local sources = {}
	for _, server in ipairs(servers) do
		-- foramtter
		local formatter_ok, formatter = pcall(require, "null-ls.builtins.formatting." .. server)

		if formatter_ok and server ~= "eslint" and server ~= "eslint_d" then -- remove eslint formatter
			-- see: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
			if server == "prettier" then
				table.insert(
					sources,
					formatter.with({
						extra_filetypes = { "toml" },
						extra_args = { "--tab-width", 2, "--single-quote", false },
					})
				)
			else
				table.insert(sources, formatter)
			end
		end

		-- linter
		local linter_ok, linter = pcall(require, "null-ls.builtins.diagnostics." .. server)
		if linter_ok then
			-- see: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
			if server == "eslint_d" or server == "eslint" then
				table.insert(
					sources,
					linter.with({
						-- ignore prettier warnings from eslint-plugin-prettier
						filter = function(diagnostic)
							return diagnostic.code ~= "prettier/prettier"
						end,
					})
				)
			else
				table.insert(sources, linter)
			end
		end
	end
	require("null-ls").setup({
		sources = sources,
	})
end
