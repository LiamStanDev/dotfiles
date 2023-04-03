local cache_dir = vim.env.HOME .. "/.cache/nvim/"

local options = {
	-- line number
	relativenumber = false,
	number = true,

	-- indentation
	tabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	autoindent = true,

	-- line wrapping
	wrap = false,

	-- search settings
	ignorecase = true,
	smartcase = true,
	hlsearch = true, -- highlight search
	infercase = true,

	-- cursor line
	cursorline = true,

	-- appearance
	termguicolors = true,
	signcolumn = "yes",

	-- typing
	undofile = true, -- can persistent undo

	-- split windows
	splitbelow = true,
	splitright = true,

	-- clipboard
	clipboard = "unnamedplus",

	-- mouse
	mouse = "a",

	hidden = true,
	magic = true,
	virtualedit = "block",
	wildignorecase = true,

	-- swap need to set false, true lead to dead lock
	swapfile = false,
	directory = cache_dir .. "swap/",
	undodir = cache_dir .. "undo/",
	backupdir = cache_dir .. "backup/",
	viewdir = cache_dir .. "view/",
	spellfile = cache_dir .. "spell/en.uft-8.add",

	-- other setting
	history = 2000,
	timeout = true,
	ttimeout = true,
	timeoutlen = 500,
	ttimeoutlen = 10,
	updatetime = 100,
	redrawtime = 1500,
}

for option, val in pairs(options) do
	vim.opt[option] = val
end
