return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "saghen/blink.cmp" },
        { "antosha417/nvim-lsp-file-operations", config = true },
        -- { "folke/neodev.nvim",                   opts = {} },
        { "folke/lazydev.nvim",                  opts = {} },
        {
            "j-hui/fidget.nvim",
            config = function()
                require 'fidget'.setup(
                    {
                        -- Options related to LSP progress subsystem
                        -- Options available: https://github.com/j-hui/fidget.nvim/blob/main/doc/fidget-option.txt
                        progress = {
                            poll_rate = 0,              -- How and when to poll for progress messages
                            suppress_on_insert = true,  -- Suppress new messages while in insert mode
                            ignore_done_already = true, -- Ignore new tasks that are already complete
                            ignore = {},                -- List of LSP servers to ignore

                            -- Options related to how LSP progress messages are displayed as notifications
                            display = {
                                render_limit = 8, -- How many LSP messages to show at once
                                done_ttl = 1,     -- How long a message should persist after completion
                            }
                        }
                    }
                )
            end,
        },
        { "mason-org/mason-lspconfig.nvim" }, -- Ensure mason-lspconfig loads first
    },

    -- https://github.com/neovim/nvim-lspconfig/tree/master/lsp
    -- example using `opts` for defining servers
    opts = {},
    config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        local keymap = vim.keymap

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf, silent = true }

                -- See Native lsp keybindings gr*

                -- set keybinds
                opts.desc = "LSP: Show references (py)"
                keymap.set("n", "gr", "<cmd>FzfLua lsp_references<CR>", opts)                                       -- show definition, references
                keymap.set("n", "<leader>lu", "<cmd>FzfLua lsp_references<CR>", { desc = " [L]SP: Find [u]sages" }) -- show definition, references

                opts.desc = "LSP: Go to declaration"
                -- keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
                keymap.set("n", "gD", "<cmd>FzfLua lsp_declarations<CR>", opts)                                            -- go to declaration
                keymap.set("n", "<leader>lc", "<cmd>FzfLua lsp_declarations<CR>", { desc = "[L]SP: Go to de[c]laration" }) -- go to declaration

                opts.desc = "LSP: Show definitions (py)"
                -- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
                keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", opts)                              -- show lsp definitions
                keymap.set("n", "<leader>le", "<cmd>FzfLua lsp_definitions<CR>",
                    { desc = "[L]SP: Show d[e]finitions" })                                                 -- show lsp definitions

                keymap.set("n", "<leader>lb", "<cmd>FzfLua lsp_finder<CR>", { desc = "[L]SP: Finder [b]" }) -- show lsp definitions

                keymap.set("n", "<leader>ls", "<cmd>FzfLua lsp_document_symbols<CR>",
                    { desc = "[L]SP: Document [s]ymbols" }) -- show lsp definitions

                opts.desc = "LSP: Show implementations"
                -- keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
                keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts) -- show lsp implementations
                keymap.set("n", "<leader>li", "<cmd>FzfLua lsp_implementations<CR>",
                    { desc = "[L]SP: Show [i]mplementations" })                    -- show lsp implementations

                -- no use for this?
                opts.desc = "LSP: Show type definitions"
                -- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
                -- keymap.set("n", "<leader>lt", "<cmd>FzfLua lsp_type_definitions<CR>", opts) -- show lsp type definitions

                keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action,
                    { desc = "[L]SP: Code [a]ctions" })                                         -- see available code actions, in visual mode will apply to selection

                keymap.set("n", "<leader>ln", vim.lsp.buf.rename, { desc = "[L]SP: Re[n]ame" }) -- smart rename

                -- keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
                keymap.set("n", "<leader>lD", "<cmd>FzfLua lsp_document_diagnostics<CR>",
                    { desc = "[L]SP: Show buffer [D]iagnostics" })                                                    -- show  diagnostics for file

                keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "[L]SP: Show line [d]iagnostics" }) -- show diagnostics for line

                opts.desc = "Go to previous diagnostic"
                -- "[d" is the default keymap for this

                opts.desc = "Go to next diagnostic"
                -- "]d" is the default keymap for this

                opts.desc = "LSP: Show documentation"
                keymap.set("n", "K", vim.lsp.buf.hover, opts)                                           -- show documentation for what is under cursor
                keymap.set("n", "<leader>lk", vim.lsp.buf.hover, { desc = "[L]SP: Documentation [K]" }) -- show documentation for what is under cursor

                keymap.set("n", "<leader>lR", ":LspRestart<CR>", { desc = "[L]SP: [R]estart" })         -- mapping to restart lsp if necessary

                keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "[L]SP: [f]ormat file" })
            end,
        })

        -- reload: Lazy reload nvim-lspconfig
        vim.diagnostic.config({
            -- virtual_text = true,
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
                    [vim.diagnostic.severity.HINT]  = "",
                    [vim.diagnostic.severity.ERROR] = "✘",
                    [vim.diagnostic.severity.INFO]  = "◉",
                    [vim.diagnostic.severity.WARN]  = ""
                    -- [vim.diagnostic.severity.HINT]  = "󰠠 ",
                    -- [vim.diagnostic.severity.ERROR] = " ",
                    -- [vim.diagnostic.severity.INFO]  = " ",
                    -- [vim.diagnostic.severity.WARN]  = " "
                }
            }
        })

        vim.lsp.config('pylsp', {
            capabilities = capabilities,
            filetypes = { "python" },
            settings = {
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
                            exclude = { "migrations", "env" }
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
                        pylsp_mypy = { enabled = false },
                        rope_autoimport = { enabled = false },
                        rope_completion = { enabled = false },
                        yapf = { enabled = false },
                    },
                },
            }
        })

        vim.lsp.config('ts_ls', {
            settings = {
                typescript = {
                    format = {
                        enable = true,
                        semicolons = "insert",
                        indentSize = 2,
                        convertTabsToSpaces = true,
                    },
                    suggest = {
                        completeFunctionCalls = true,
                    },
                },
                javascript = {
                    format = {
                        enable = true,
                    },
                },
                completions = {
                    completeFunctionCalls = true,
                },
            },
            init_options = {
                hostInfo = "neovim",
            },
        })

        vim.lsp.config('lua_ls', {
            cmd = { "lua-language-server" },
            filetypes = { "lua" },
            root_markers = {
                ".luarc.json",
                ".luarc.jsonc",
                ".luacheckrc",
                ".stylua.toml",
                "stylua.toml",
                "selene.toml",
                "selene.yml",
            },
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
    end,
}
