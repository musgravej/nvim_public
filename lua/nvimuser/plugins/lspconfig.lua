return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim",                   opts = {} },
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        -- Note: Using modern vim.lsp.config API (Neovim 0.11+) instead of deprecated lspconfig
        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap -- for conciseness

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf, silent = true }

                -- set keybinds
                opts.desc = "Show LSP references"
                keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

                opts.desc = "Go to declaration"
                keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

                opts.desc = "Show LSP definitions"
                keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

                opts.desc = "Show LSP implementations"
                keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

                opts.desc = "Show LSP type definitions"
                keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

                opts.desc = "See available code actions"
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

                opts.desc = "Smart rename"
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

                opts.desc = "Show buffer diagnostics"
                keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

                opts.desc = "Show line diagnostics"
                keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

                opts.desc = "Go to previous diagnostic"
                -- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

                opts.desc = "Go to next diagnostic"
                -- keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

                opts.desc = "Show documentation for what is under cursor"
                keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

                keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format file with current LSP" })
            end,
        })

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Configure diagnostic signs using the modern API
        vim.diagnostic.config({
            virtual_text = false,
            virtual_lines = false,
            underline = {
                severity = { min = vim.diagnostic.severity.WARN },
            },
            signs = {
                numhl = {
                    [vim.diagnostic.severity.WARN] = 'WarningMsg',
                    [vim.diagnostic.severity.WARN] = 'ErrorMsg',
                },
                text = {
                    [vim.diagnostic.severity.ERROR] = " ",
                    [vim.diagnostic.severity.WARN] = " ",
                    [vim.diagnostic.severity.HINT] = "󰠠 ",
                    [vim.diagnostic.severity.INFO] = " ",
                },
            },
        })

        -- Check if we're on Neovim 0.11+ with the new vim.lsp.config API
        if vim.lsp.config then
            -- Modern Neovim 0.11+ approach using vim.lsp.config

            -- configure lua_ls for Lua (with Neovim-specific settings)
            vim.lsp.config.lua_ls = {
                cmd = { "lua-language-server" },
                filetypes = { "lua" },
                root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml" },
                capabilities = capabilities,
                settings = {
                    Lua = {
                        -- make the language server recognize "vim" global
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            -- make language server aware of runtime files
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                        },
                        completion = {
                            callSnippet = "Replace",
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            }

            -- configure python-lsp-server (pylsp) for Python
            vim.lsp.config.pylsp = {
                cmd = { "pylsp" },
                filetypes = { "python" },
                root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
                capabilities = capabilities,
                handlers = {
                    ['textDocument/publishDiagnostics'] = vim.lsp.with(
                        vim.lsp.diagnostic.on_publish_diagnostics, {
                            underline = true,
                            virtual_text = true,
                        }
                    )
                },
                configurationSources = {
                    "flake8",
                    "jedi_completion"
                },
                settings = {
                    pylsp = {
                        plugins = {
                            black = {
                                enabled = true,
                                line_length = 120
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
                                ignore = { "E202" },
                                hangClosing = false,
                            },
                        },
                    },
                },
            }

            -- configure pyright for Python (alternative to pylsp)
            -- vim.lsp.config.pyright = {
            --     cmd = { "pyright-langserver", "--stdio" },
            --     filetypes = { "python" },
            --     root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json" },
            --     capabilities = capabilities,
            --     settings = {
            --         python = {
            --             analysis = {
            --                 autoSearchPaths = true,
            --                 diagnosticMode = "workspace",
            --                 useLibraryCodeForTypes = true
            --             }
            --         }
            --     }
            -- }

            -- configure jsonls for JSON
            vim.lsp.config.jsonls = {
                cmd = { "vscode-json-language-server", "--stdio" },
                filetypes = { "json", "jsonc" },
                capabilities = capabilities,
                settings = {
                    json = {
                        validate = { enable = true },
                        format = {
                            enable = true,
                        },
                    },
                },
            }

            -- configure bashls for Bash
            vim.lsp.config.bashls = {
                cmd = { "bash-language-server", "start" },
                filetypes = { "sh", "bash" },
                capabilities = capabilities,
            }

            -- configure html for HTML
            vim.lsp.config.html = {
                cmd = { "vscode-html-language-server", "--stdio" },
                filetypes = { "html" },
                capabilities = capabilities,
            }

            -- configure cssls for CSS
            vim.lsp.config.cssls = {
                cmd = { "vscode-css-language-server", "--stdio" },
                filetypes = { "css", "scss", "less" },
                capabilities = capabilities,
            }

            -- configure terraformls for Terraform
            vim.lsp.config.terraformls = {
                cmd = { "terraform-ls", "serve" },
                filetypes = { "terraform", "hcl" },
                capabilities = capabilities,
            }
        else
            -- Fallback for older Neovim versions - use lspconfig
            local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
            if not lspconfig_ok then
                vim.notify("Neither vim.lsp.config nor lspconfig available", vim.log.levels.ERROR)
                return
            end

            -- Setup individual LSP servers with their specific configurations

            -- configure lua_ls for Lua (with Neovim-specific settings)
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        -- make the language server recognize "vim" global
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            -- make language server aware of runtime files
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                        },
                        completion = {
                            callSnippet = "Replace",
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            -- configure python-lsp-server (pylsp) for Python
            lspconfig.pylsp.setup({
                capabilities = capabilities,
                handlers = {
                    ['textDocument/publishDiagnostics'] = vim.lsp.with(
                        vim.lsp.handlers['textDocument/publishDiagnostics'], {
                            underline = true,
                            virtual_text = false,
                        }
                    )
                },
                filetypes = { "python" },
                configurationSources = {
                    "flake8",
                    "jedi_completion"
                },
                settings = {
                    pylsp = {
                        plugins = {
                            black = {
                                enabled = true,
                                line_length = 120
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
                                ignore = { "E202" },
                                hangClosing = false,
                            },
                        },
                    },
                },
            })

            -- configure pyright for Python (alternative to pylsp)
            -- lspconfig.pyright.setup({
            --     capabilities = capabilities,
            --     filetypes = { "python" },
            --     settings = {
            --         python = {
            --             analysis = {
            --                 autoSearchPaths = true,
            --                 diagnosticMode = "workspace",
            --                 useLibraryCodeForTypes = true
            --             }
            --         }
            --     }
            -- })

            -- configure jsonls for JSON
            lspconfig.jsonls.setup({
                capabilities = capabilities,
                settings = {
                    json = {
                        validate = { enable = true },
                        format = {
                            enable = true,
                        },
                    },
                },
            })

            -- configure bashls for Bash
            lspconfig.bashls.setup({
                capabilities = capabilities,
            })

            -- configure html for HTML
            lspconfig.html.setup({
                capabilities = capabilities,
            })

            -- configure cssls for CSS
            lspconfig.cssls.setup({
                capabilities = capabilities,
            })

            -- configure terraformls for Terraform
            lspconfig.terraformls.setup({
                capabilities = capabilities,
            })
        end
    end,
}
