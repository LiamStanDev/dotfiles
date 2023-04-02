return {
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					enabled = false,
					maxLineLength = 100,
				},
				flake8 = {
					enabled = true,
					ignore = { "E402", "E266", "W503", "E501", "F403", "F405" },
				},
				pyflakes = {
					enabled = false,
				},
			},
		},
	},
}
