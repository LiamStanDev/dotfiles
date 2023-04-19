return {
	handlers = {
		["textDocument/definition"] = require("csharpls_extended").handler,
	},
}
