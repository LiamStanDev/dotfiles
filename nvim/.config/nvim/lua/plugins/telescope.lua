local status_telescope, telescope = pcall(require, "telescope")
if not status_telescope then
	print("telescope not found")
	return
end

local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--glob=!.git/",
		},
		file_ignore_patterns = {
			".git/",
			".cache",
			"%.o",
			"%.a",
			"%.out",
			"%.class",
			"%.pdf",
			"%.mkv",
			"%.mp4",
			"%.zip",
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
		live_grep = {
			--@usage don't include the filename in the search results
			only_sort_text = true,
		},
		grep_string = {
			only_sort_text = true,
		},
		buffers = {
			initial_mode = "normal",
			mappings = {
				i = {
					["<C-d>"] = actions.delete_buffer,
				},
				n = {
					["dd"] = actions.delete_buffer,
				},
			},
		},
		planets = {
			show_pluto = true,
			show_moon = true,
		},
		git_files = {
			hidden = true,
			show_untracked = true,
		},
		colorscheme = {
			enable_preview = true,
		},
	},
	extensions = {
		media_files = {
			filetypes = { "png", "webp", "jpg", "jpeg" },
			find_cmd = "rg",
		},
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
	},
})

telescope.load_extension("media_files")
telescope.load_extension("fzf")
telescope.load_extension("projects")
telescope.load_extension("dap")
-- for lazygit
vim.cmd([[
    autocmd BufEnter * :lua require('lazygit.utils').project_root_dir()
]])
telescope.load_extension("lazygit")
