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
            pylsp = {
                plugins = {
                    autopep8 = { enabled = false },
                    black = { enabled = true, line_length = 120 },
                    flake8 = {
                        enabled = true,
                        maxLineLength = 120,
                        ignore = { "E202", "E251", "E121", "E123", "E126", "E226", "E24", "E704", "E203", "W503" },
                        hangClosing = false,
                        maxComplexity = -1,
                        select = { "E", "F", "I", "W" },
                    },
                    jedi_completion = {
                        enabled = true,
                        -- auto fills parameters in functions move in insert mode <Tab>, <S-Tab>
                        include_params = true,
                        -- include_params = false,
                        eager = false,
                        fuzzy = true,
                    },
                    jedi_hover = { enabled = true },
                    jedi_references = { enabled = true },
                    jedi_signature_help = { enabled = true },
                    jedi_symbols = { enabled = true },
                    mccabe = { enabled = false },
                    preload = { enabled = true },
                    pycodestyle = {
                        enabled = false,
                        maxLineLength = 120,
                        ignore = { "E202", "E251", "E121", "E123", "E126", "E226", "E24", "E704", "E203", "W503" },
                    },
                    pydocstyle = { enabled = false },
                    pyflakes = { enabled = false },
                    pylint = { enabled = false },
                    rope_autoimport = { enabled = false },
                    rope_completion = { enabled = false },
                    yapf = { enabled = false },
                },
            },
        },
    },
}
