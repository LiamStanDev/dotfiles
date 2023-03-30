local servers = {
	"tsserver",
	"omnisharp",
	"html",
	"jsonls",
	"lua_ls",
	"cssls",
	-- "pyright",
	"pylsp",
}

require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig = require("lspconfig")
local handlers = require("plugins.lsp.handlers")
local opts = {}
for _, server in pairs(servers) do
	opts = {
		on_attach = handlers.on_attach,
		capabilities = handlers.capabilities,
	}
	server = vim.split(server, "@")[1] -- for the server name lau@8

	local require_ok, conf_opts = pcall(require, "plugins.lsp.settings." .. server) -- for the settings folder
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts) -- merge two table with force mode.
	end

	lspconfig[server].setup(opts)
end
