local M = {}
-- global access for plugins
M.plugins = {
	-- colorscheme
	{ "olimorris/onedarkpro.nvim", opts = { options = { transparency = true } } },
	{ "folke/tokyonight.nvim" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = { transparent_background = true, no_italic = true },
	},
	{
		"sainnhe/everforest",
		config = function()
			vim.g.everforest_transparent_background = 1
		end,
	},
	{
		"sainnhe/gruvbox-material",
		config = function()
			vim.g.gruvbox_material_disable_italic_comment = 1
			vim.g.gruvbox_material_transparent_background = 1
		end,
	},
	--color show
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- comment
	{ "numToStr/Comment.nvim", event = "VeryLazy", config = require("editor.comment") },

	-- auto autopairs
	{ "windwp/nvim-autopairs", event = "VeryLazy", config = require("editor.autopairs") },
	{ "m4xshen/autoclose.nvim", event = "VeryLazy", config = require("editor.autoclose") },
	-- for text highlight
	{ "RRethy/vim-illuminate", event = "VeryLazy", config = require("editor.illuminate") },

	-- indnet line
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = require("editor.indentline"),
	},
	-- need set here
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = { "BufReadPre", "BufNewFile" },
		init = require("editor.indentscope").init,
		config = require("editor.indentscope").config,
	},

	-- ui
	{ "folke/which-key.nvim", event = "VeryLazy" },
	{ "nvim-lua/popup.nvim", event = "VeryLazy" },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "nvim-tree/nvim-tree.lua", event = "VeryLazy" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		event = "VeryLazy",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"s1n7ax/nvim-window-picker",
		},
	},
	{
		"s1n7ax/nvim-window-picker",
		version = "v1.*",
	},
	{ "nvim-lualine/lualine.nvim", event = "VeryLazy" },
	{ "akinsho/bufferline.nvim", event = "VeryLazy" },
	{ "moll/vim-bbye" }, -- can delete buffers (close files)
	{
		"stevearc/dressing.nvim", -- for input, and select ui
		config = function()
			require("dressing").setup()
		end,
	},
	{
		"folke/noice.nvim", -- for command line pop window and nottify
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
	-- { "rcarriga/nvim-notify" },
	{
		"SmiteshP/nvim-navic", -- for top nav bar
		dependencies = "neovim/nvim-lspconfig",
	},
	-- { "simrat39/symbols-outline.nvim" },
	-- "xiyaowong/transparent.nvim",
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},

	-- telescopte
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-telescope/telescope-media-files.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope-project.nvim" }, -- project
	{ "nvim-telescope/telescope-dap.nvim" },

	-- cmp
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = require("editor.luasnippet"),
	},
	{
		"hrsh7th/nvim-cmp",
		version = false, -- last release is way too old
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
		},
		config = require("editor.nvim-cmp"),
	},

	-- lsp
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"Hoffs/omnisharp-extended-lsp.nvim", -- for decompile csharp
		},
	},
	{ "Hoffs/omnisharp-extended-lsp.nvim" }, -- for decompile csharp
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = require("editor.treesitter"),
	},
	{ "p00f/nvim-ts-rainbow" }, -- rainbow brasket for treesitter extension
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "windwp/nvim-ts-autotag" },

	-- formatting & linting
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "jay-babu/mason-null-ls.nvim" },

	-- git
	{ "lewis6991/gitsigns.nvim" },
	{ "kdheepak/lazygit.nvim" }, --toggle term with lazygit extension

	-- toggle term
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	-- dap
	{ "mfussenegger/nvim-dap" },
	"jay-babu/mason-nvim-dap.nvim",
	{ "rcarriga/nvim-dap-ui" },

	-- alpha
	{ "goolord/alpha-nvim" },
}
return M
