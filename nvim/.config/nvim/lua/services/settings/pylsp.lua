return {
	settings = {
		pylsp = {
			-- auto completion root is the first directory with __init__.py
			-- so the "./src" directory shouldn't have __init__.py if you don't
			-- import like "import src.your.modeule"
			plugins = {
				-- style checking
				pycodestyle = {
					enabled = false,
					maxLineLength = 100,
					ignore = { "E266" },
				},
				-- error linter
				pyflakes = { enabled = false },
				flake8 = {
					enabled = true,
					ignore = { "E501", "E266", "W503", "W504", "E731", "E402" },
				},
				-- code complexity linter
				mccabe = {
					enable = false,
					threshold = 15,
				},
				-- code formatting
				autopep8 = { enabled = false },
				yapf = { endabled = false },
				-- Completions and renaming
				rope_autoimport = { enabled = false },
				rope_completion = { enabled = false },
			},
		},
	},
}
