return {
	settings = {
		python = {
			analysis = {
				-- typeCheckingMode = "strict",
				diagnosticMode = "workspace",
				autoSearchPaths = true, -- find "src" if no execution environments in config file
				inlayHints = {
					variableTypes = true,
					functionReturnTypes = true,
				},
				logLevel = "Information",
				autoImportCompletions = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
}
