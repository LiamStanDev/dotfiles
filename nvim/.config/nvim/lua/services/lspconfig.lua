return function()
	-- add servers
	local servers = require("core").lsp_servers
	-- connected mason and lspconfig
	require("mason-lspconfig").setup({
		ensure_installed = servers,
		automatic_installation = true,
	})

	-- set behavior for specific buffer
	local function on_attach(client, bufnr)
		-- set keymap
		local opts = { noremap = true, silent = true }
		local keymap = vim.api.nvim_buf_set_keymap
		keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
		keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
		keymap(bufnr, "n", "<space>na", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
		keymap(bufnr, "n", "<space>nd", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
		keymap(bufnr, "n", "<space>nl", "<cmd>lua vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()), 'Info')<CR>", opts)


		-- Format
		vim.cmd([[command! Format execute "lua vim.lsp.buf.format({ async = true })" ]]) -- Format command
		-- formatting before save
		vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])

		-- add some plugin
		require("illuminate").on_attach(client)
		require("lsp_signature").on_attach({
			-- plugin for parameter hint
			bind = true,
			handler_opts = {
				border = "rounded",
			},
			hint_enable = false,
		}, bufnr)

		vim.keymap.set({ "n" }, "<Leader>k", function()
			vim.lsp.buf.signature_help()
		end, { silent = true, noremap = true, desc = "toggle signature" })
		-- remove server formatter
		if client.name ~= "lemminx" then
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
		end
		if client.name == "omnisharp" then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end

	-- capabilities
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities) -- add to cmp
	capabilities.textDocument.completion.completionItem = {
		documentationFormat = { "markdown", "plaintext" },
		snippetSupport = true,
		preselectSupport = true,
		insertReplaceSupport = true,
		labelDetailsSupport = true,
		deprecatedSupport = true,
		commitCharactersSupport = true,
		tagSupport = { valueSet = { 1 } },
		resolveSupport = {
			properties = {
				"documentation",
				"detail",
				"additionalTextEdits",
			},
		},
	}
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities) -- add to cmp

	-- auto register lsp service
	for _, server in ipairs(servers) do
		local opts = {
			capabilities = capabilities,
			on_attach = on_attach,
		}
		-- find ./setting
		local require_ok, conf_opts = pcall(require, "services.settings." .. server) -- for the settings folder
		if require_ok then
			opts = vim.tbl_deep_extend("force", conf_opts, opts)
		end

		require("lspconfig")[server].setup(opts)
	end

	-- setup diagnostic ui
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	vim.diagnostic.config({
		virtual_text = { spacing = 2, prefix = "●" }, -- show diagnostic after your code
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true, -- underline for diagnostic
		severity_sort = true,
		float = {
			-- the diagnostic window
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	})
end
