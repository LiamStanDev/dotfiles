return {
	settings = {
		pylsp = {
			plugins = {
				-- style checking
				pycodestyle = {
					enabled = false,
					maxLineLength = 100,
				},
				-- error linter
				pyflakes = { enabled = false },
				flake8 = {
					enabled = true,
					ignore = { "E501", "E266" },
				},
				-- code complexity linter
				mccabe = {
					enable = true,
					threshold = 15,
				},
				-- code formatting
				autopep8 = { enabled = false },
				yapf = { endabled = true },
				-- Completions and renaming
				rope_autoimport = { enabled = true },
				rope_completion = { enabled = true },
			},
		},
	},
}
