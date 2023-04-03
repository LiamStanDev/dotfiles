-- add servers
local servers = {
	"tsserver",
	"omnisharp",
	"html",
	"jsonls",
	"lua_ls",
	"cssls",
	--"pyright",
	"pylsp",
	--"jedi_language_server",
	"bashls",
}

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
	-- keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

	-- Format
	vim.cmd([[command! Format execute "lua vim.lsp.buf.format({ async = true })" ]]) -- Format command
	-- formatting before save
	vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])

	-- add some plugin
	require("nvim-navic").attach(client, bufnr)
	vim.g.navic_silence = true

	require("illuminate").on_attach(client)

	-- add some capabilities filters
	if client.name == "lua_ls" then
		client.server_capabilities.documentFormattingProvider = false
	end
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end
	if client.name == "pyright" then
		client.server_capabilities.documentFormattingProvider = false
	end
	if client.name == "pylsp" then
		client.server_capabilities.documentFormattingProvider = false
	end
end

-- capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities) -- add to cmp

-- auto register lsp service
for _, server in pairs(servers) do
	local opts = {
		capabilities = capabilities,
		on_attach = on_attach,
	}
	-- find ./setting
	local require_ok, conf_opts = pcall(require, "lsp.settings." .. server) -- for the settings folder
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts) -- merge two table with force mode.
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
	virtual_text = { spacing = 4, prefix = "●" }, -- show diagnostic after your code
	signs = {
		active = signs, -- show signs
	},
	update_in_insert = false,
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
})

-- ui
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})
