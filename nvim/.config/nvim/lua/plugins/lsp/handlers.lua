local M = {}

cmp_nvim_lsp = require("cmp_nvim_lsp")

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	-- config diagnostic
	-- sourceL: https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
	local config = {
		virtual_text = true, -- show diagnostic after your code
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true, -- underline for diagnostic
		severity_sort = true,
		float = { -- the diagnostic window
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}
	-- setup diagnostic
	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

-- this is private function
local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	-- the following has set in which key
	-- keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
	-- keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
	-- keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	-- keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
	-- keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
	-- keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	-- keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	-- keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	vim.cmd([[command! Format execute "lua vim.lsp.buf.format({ async = true })" ]])
	vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
end

M.on_attach = function(client, bufnr)
	-- set the lsp server conflict with null-ls
	if client.name == "lua_ls" then
		-- cancel the lua_ls formatter, by replacing with stylua in null-ls
		client.server_capabilities.documentFormattingProvider = false
	end
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end
	lsp_keymaps(bufnr)

	local navic = require("nvim-navic")
	-- if client.server_capabilities.documentSymbolProvider then
	navic.attach(client, bufnr)
	vim.g.navic_silence = true
	-- end

	local illuminate = require("illuminate")
	illuminate.on_attach(client)
end

return M -- M has a function call setup define above.
