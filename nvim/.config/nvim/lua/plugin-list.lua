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
	--color show
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	-- comment
	{ "numToStr/Comment.nvim", event = "VeryLazy" },

	-- auto autopairs
	{ "windwp/nvim-autopairs", event = "VeryLazy" },

	-- for text highlight
	{ "RRethy/vim-illuminate" },

	-- indnet line
	{ "lukas-reineke/indent-blankline.nvim", event = { "BufReadPost", "BufNewFile" } },

	-- ui
	{ "folke/which-key.nvim", event = "VeryLazy" },
	{ "nvim-lua/popup.nvim", event = "VeryLazy" },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "nvim-tree/nvim-tree.lua", event = "VeryLazy" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		event = "VeryLazy",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},
	{ "s1n7ax/nvim-window-picker" },
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
	-- "simrat39/symbols-outline.nvim",
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
	"ahmedkhalf/project.nvim", -- project
	"nvim-telescope/telescope-dap.nvim",

	-- cmp
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
	},

	-- snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		opts = {},
	},

	-- lsp
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependcy = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"Hoffs/omnisharp-extended-lsp.nvim", -- for decompile csharp
		},
	},
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
	-- {
	-- 	"glepnir/dashboard-nvim",
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		require("dashboard").setup({
	-- 			theme = "hyper",
	-- 		})
	-- 	end,
	-- },
}
return M
