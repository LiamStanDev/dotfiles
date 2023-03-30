return {
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "E402" },
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
