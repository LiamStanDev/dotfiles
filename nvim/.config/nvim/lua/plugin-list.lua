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
	"RRethy/vim-illuminate",

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
			{
				-- only needed if you want to use the commands with "_with_window_picker" suffix
				"s1n7ax/nvim-window-picker",
				tag = "v1.*",
				config = function()
					require("window-picker").setup({
						autoselect_one = true,
						include_current = false,
						filter_rules = {
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { "neo-tree", "neo-tree-popup", "notify" },

								-- if the buffer type is one of following, the window will be ignored
								buftype = { "terminal", "quickfix" },
							},
						},
						other_win_hl_color = "#e35e4f",
					})
				end,
			},
		},
	},
	{ "nvim-lualine/lualine.nvim", event = "VeryLazy" },
	{ "akinsho/bufferline.nvim", event = "VeryLazy" },
	"moll/vim-bbye", -- can delete buffers (close files)
	{
		"stevearc/dressing.nvim", -- for input, and select ui
		config = function()
			require("dressing").setup()
		end,
	},
	{
		"folke/noice.nvim", -- for command line pop window and nottify
		opts = {
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
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			background_colour = "#000000",
			level = vim.log.levels.WARN,
		},
	},
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
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-media-files.nvim",
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
			config = function()
				local snippet_loader = require("luasnip.loaders.from_vscode")
				-- snipet from friendly-snippet
				snippet_loader.lazy_load()
				-- my custom snippet(I don't know why the following not working)
				snippet_loader.lazy_load({ paths = { "./lua/plugins/snippets" } }) -- csharp snippets
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
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
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({})
			local keymap = vim.keymap.set
			-- C-t: go back
			keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
			keymap("n", "gD", "<cmd>Lspsaga goto_definition<CR>")
			-- Go to definition
			-- keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

			-- Peek type definition
			-- You can edit the file containing the type definition in the floating window
			-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
			-- It also supports tagstack
			-- Use <C-t> to jump back
			keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
			keymap("n", "gT", "<cmd>Lspsaga goto_type_definition<CR>")
			--keymap("n", "gl", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
			keymap("n", "gb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
			keymap("n", "gh", "<cmd>Lspsaga hover_doc ++keep<CR>")
			-- Go to type definition
			-- keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")
		end,
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
