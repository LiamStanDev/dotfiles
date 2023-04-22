-- the core plugins
local g_configs = require("core")

-- set color theme here
g_configs.colorscheme = "tokyonight-night"

-- whether to see navigator bar in the top
g_configs.navigator_on = true

-- set the logo. see ./lua/ui/style/header.lua
g_configs.dashboard_logo = "AstronautSmall"

-- file filter for explorer(only for dotfiles)
g_configs.filter_files = {
	".git",
	".DS_Store",
	".vscode",
}
g_configs.code_hight_servers = {
	"json",
	"javascript",
	"tsx",
	"html",
	"css",
	"markdown",
	"markdown_inline",
	"bash",
	"lua",
	"vim",
	"dockerfile",
	"gitignore",
	"c_sharp",
}
-- register lsp server for auto completion
g_configs.lsp_servers = { -- see https://github.com/williamboman/mason-lspconfig.nvim
	"tsserver",
	"tailwindcss",
	"omnisharp",
	-- "csharp_ls",
	"rust_analyzer",
	"html",
	"jsonls",
	"lua_ls",
	"cssls",
	"pylsp", -- python lsp
	"bashls",
	"dockerls",
	"docker_compose_language_service",
	"taplo", -- toml lsp
	"lemminx", -- xml lsp
	"prismals",
	"gopls",
}

-- register formatting and diagnostics server
g_configs.null_ls_servers = {
	"prettier",
	"black", -- python formatter
	"stylua", -- lua formatter
	"beautysh", -- bash formatter
	"csharpier", -- csharp formatter
	"eslint_d",
	"rustfmt", -- rust formatter
	"clippy", -- rust linter
	"prismaFmt",
	"gofmt",
}

-- register debuger server
g_configs.dap_servers = {
	"coreclr", -- csharp
	"python",
	"codelldb",
}

-- setup all plugin
require("plugins-setup")

-- for neovide
if vim.g.neovide then
	vim.g.neovide_input_use_logo = false -- true on macOS
	vim.g.neovide_input_macos_alt_is_meta = true
	vim.g.neovide_cursor_vfx_mode = "pixiedust"
	vim.g.neovide_scale_factor = 1.0
	vim.g.neovide_padding_top = 1
	vim.g.neovide_padding_bottom = 1
	vim.g.neovide_padding_right = 1
	vim.g.neovide_padding_left = 1
	vim.g.neovide_transparency = 0.8
	vim.g.neovide_refresh_rate = 60
	vim.g.neovide_refresh_rate_idle = 5 -- for not using
	vim.g.neovide_remember_window_size = true
end
