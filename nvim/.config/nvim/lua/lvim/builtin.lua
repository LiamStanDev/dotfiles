local M = {}
-- global access for plugins
M.plugins = {
	-- colorscheme
	"olimorris/onedarkpro.nvim",
	-- comment
	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	-- auto autopairs
	"windwp/nvim-autopairs",
	"p00f/nvim-ts-rainbow", -- rainbow brasket for treesitter extension
	-- "HiPhish/nvim-ts-rainbow2", -- another rainbow brasket for treesitter extension
	-- -- Better Navigate
	-- "christoomey/vim-tmux-navigator",
	-- auto tag
	"windwp/nvim-ts-autotag",
	-- for text highlight
	"RRethy/vim-illuminate",
	-- indnet line
	"lukas-reineke/indent-blankline.nvim",
	"folke/which-key.nvim",
	-- ui
	"nvim-lua/popup.nvim",
	{ "kyazdani42/nvim-web-devicons", lazy = true },
	"nvim-tree/nvim-tree.lua",
	"nvim-lualine/lualine.nvim",
	"akinsho/bufferline.nvim",
	"moll/vim-bbye", -- can delete buffers (close files)
	{
		"stevearc/dressing.nvim", -- for input, and select ui
		config = function()
			require("dressing").setup()
		end,
	},
	{
		"folke/noice.nvim", -- for command line pop window and nottify
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
				level = vim.log.levels.WARN,
			})
		end,
	},
	{
		"SmiteshP/nvim-navic", -- for top nav bar
		dependencies = "neovim/nvim-lspconfig",
	},
	"simrat39/symbols-outline.nvim",
	"xiyaowong/transparent.nvim",
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	-- telescopte
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-media-files.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"ahmedkhalf/project.nvim", -- project
	"nvim-telescope/telescope-dap.nvim",

	-- cmp
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	-- snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	"saadparwaiz1/cmp_luasnip",
	-- lsp
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	-- treesitter
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	"windwp/nvim-ts-autotag",
	-- formatting & linting
	"jose-elias-alvarez/null-ls.nvim",
	"jay-babu/mason-null-ls.nvim",
	-- git
	"lewis6991/gitsigns.nvim",
	"kdheepak/lazygit.nvim", --toggle term with lazygit extension
	-- toggle term
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	-- dap
	"mfussenegger/nvim-dap",
	"jay-babu/mason-nvim-dap.nvim",
	"rcarriga/nvim-dap-ui",
	-- alpha
	"goolord/alpha-nvim",
	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "hyper",
			})
		end,
	},
}
return M
