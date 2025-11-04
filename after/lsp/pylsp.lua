return {
	-- Command to start the LSP server
	cmd = { "pylsp" },
	-- Filetypes this LSP should attach to
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
	configurationSources = {
		"flake8",
		"jedi_completion",
	},
	settings = {
		pylsp = {
			plugins = {
				black = {
					enabled = true,
					line_length = 120,
				},
				autopep8 = { enabled = false },
				jedi_hover = { enabled = true },
				jedi_references = { enabled = true },
				jedi_signature_help = { enabled = true },
				jedi_symbols = { enabled = true },
				mccabe = { enabled = false },
				preload = { enabled = true },
				pydocstyle = { enabled = false },
				pylint = { enabled = false },
				rope_autoimport = { enabled = false },
				rope_completion = { enabled = false },
				yapf = { enabled = false },
				pyflakes = { enabled = false },
				jedi_completion = {
					enabled = true,
					include_params = true,
					eager = true,
				},
				pycodestyle = {
					maxLineLength = 120,
					ignore = { "E251", "E202", "F841" },
					enabled = false,
				},
				flake8 = {
					maxLineLength = 120,
					enabled = true,
					ignore = { "E202", "E251" },
					hangClosing = false,
				},
			},
		},
	},
}
