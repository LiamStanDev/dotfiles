return {
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "E402", "E266", "W503", "E501" },
					maxLineLength = 100,
				},
				flake8 = {
					enabled = false,
				},
				pyflakes = {
					enabled = false,
				},
			},
		},
	},
}
