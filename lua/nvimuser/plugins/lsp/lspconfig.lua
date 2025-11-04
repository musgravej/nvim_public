return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "saghen/blink.cmp" },
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim",                   opts = {} },
        { "mason-org/mason-lspconfig.nvim" }, -- Ensure mason-lspconfig loads first
    },

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
                opts.desc = "LSP: Show references"
                keymap.set("n", "gr", "<cmd>FzfLua lsp_references<CR>", opts)         -- show definition, references
                keymap.set("n", "<leader>lr", "<cmd>FzfLua lsp_references<CR>", opts) -- show definition, references

                opts.desc = "LSP: Go to declaration"
                -- keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
                keymap.set("n", "gD", "<cmd>FzfLua lsp_declarations<CR>", opts)         -- go to declaration
                keymap.set("n", "<leader>lc", "<cmd>FzfLua lsp_declarations<CR>", opts) -- go to declaration

                opts.desc = "LSP: Show definitions"
                -- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
                keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", opts)         -- show lsp definitions
                keymap.set("n", "<leader>le", "<cmd>FzfLua lsp_definitions<CR>", opts) -- show lsp definitions

                opts.desc = "LSP: Show implementations"
                -- keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
                keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts)         -- show lsp implementations
                keymap.set("n", "<leader>li", "<cmd>FzfLua lsp_implementations<CR>", opts) -- show lsp implementations

                -- no use for this?
                opts.desc = "LSP: Show type definitions"
                -- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
                -- keymap.set("n", "<leader>lt", "<cmd>FzfLua lsp_type_definitions<CR>", opts) -- show lsp type definitions

                opts.desc = "LSP: See available code actions"
                keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

                opts.desc = "LSP: Smart rename"
                keymap.set("n", "<leader>ln", vim.lsp.buf.rename, opts) -- smart rename

                opts.desc = "LSP: Show buffer diagnostics"
                -- keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
                keymap.set("n", "<leader>lD", "<cmd>FzfLua lsp_document_diagnostics<CR>", opts) -- show  diagnostics for file

                opts.desc = "LSP: Show line diagnostics"
                keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts) -- show diagnostics for line

                opts.desc = "Go to previous diagnostic"
                -- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

                opts.desc = "Go to next diagnostic"
                -- keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

                opts.desc = "LSP: Show documentation"
                keymap.set("n", "K", vim.lsp.buf.hover, opts)          -- show documentation for what is under cursor
                keymap.set("n", "<leader>lk", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

                opts.desc = "LSP: Restart"
                keymap.set("n", "<leader>lR", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

                opts.desc = "LSP: Format file"
                keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)
            end,
        })

        vim.diagnostic.config({
            virtual_text = true,
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
                    -- [vim.diagnostic.severity.HINT]  = "",
                    -- [vim.diagnostic.severity.ERROR] = "✘",
                    -- [vim.diagnostic.severity.INFO]  = "◉",
                    -- [vim.diagnostic.severity.WARN]  = ""
                    [vim.diagnostic.severity.HINT]  = "󰠠 ",
                    [vim.diagnostic.severity.ERROR] = " ",
                    [vim.diagnostic.severity.INFO]  = " ",
                    [vim.diagnostic.severity.WARN]  = " "
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
                        rope_autoimport = { enabled = false },
                        rope_completion = { enabled = false },
                        yapf = { enabled = false },
                    },
                },
            }
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
-- return {
--     "neovim/nvim-lspconfig",
--     -- version = "^1.0.0",
--     event = { "BufReadPre", "BufNewFile" },
--     dependencies = {
--         { "antosha417/nvim-lsp-file-operations", config = true },
--         { "folke/neodev.nvim",                   opts = {} },
--         { "saghen/blink.cmp" },               -- Completion engine for capabilities
--         { "mason-org/mason-lspconfig.nvim" }, -- Ensure mason-lspconfig loads first
--     },
--     config = function()
--         -- Get blink.cmp capabilities for LSP servers
--         local capabilities = require('blink.cmp').get_lsp_capabilities()
--
--         -- Check if mason-lspconfig is available
--         -- local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
--         -- if not mason_lspconfig_ok then
--         --     vim.notify("mason-lspconfig not found, setting up LSP servers directly", vim.log.levels.WARN)
--         -- end
--
--         local keymap = vim.keymap
--
--         vim.api.nvim_create_autocmd("LspAttach", {
--             group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--             callback = function(ev)
--                 -- Buffer local mappings.
--                 -- See `:help vim.lsp.*` for documentation on any of the below functions
--                 local opts = { buffer = ev.buf, silent = true }
--
--                 -- See Native lsp keybindings gr*
--
--                 -- set keybinds
--                 opts.desc = "LSP: Show references"
--                 keymap.set("n", "gr", "<cmd>FzfLua lsp_references<CR>", opts)         -- show definition, references
--                 keymap.set("n", "<leader>lr", "<cmd>FzfLua lsp_references<CR>", opts) -- show definition, references
--
--                 opts.desc = "LSP: Go to declaration"
--                 -- keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
--                 keymap.set("n", "gD", "<cmd>FzfLua lsp_declarations<CR>", opts)         -- go to declaration
--                 keymap.set("n", "<leader>lc", "<cmd>FzfLua lsp_declarations<CR>", opts) -- go to declaration
--
--                 opts.desc = "LSP: Show definitions"
--                 -- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
--                 keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", opts)         -- show lsp definitions
--                 keymap.set("n", "<leader>le", "<cmd>FzfLua lsp_definitions<CR>", opts) -- show lsp definitions
--
--                 opts.desc = "LSP: Show implementations"
--                 -- keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
--                 keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts)         -- show lsp implementations
--                 keymap.set("n", "<leader>li", "<cmd>FzfLua lsp_implementations<CR>", opts) -- show lsp implementations
--
--                 -- no use for this?
--                 opts.desc = "LSP: Show type definitions"
--                 -- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
--                 -- keymap.set("n", "<leader>lt", "<cmd>FzfLua lsp_type_definitions<CR>", opts) -- show lsp type definitions
--
--                 opts.desc = "LSP: See available code actions"
--                 keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
--
--                 opts.desc = "LSP: Smart rename"
--                 keymap.set("n", "<leader>ln", vim.lsp.buf.rename, opts) -- smart rename
--
--                 opts.desc = "LSP: Show buffer diagnostics"
--                 -- keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
--                 keymap.set("n", "<leader>lD", "<cmd>FzfLua lsp_document_diagnostics<CR>", opts) -- show  diagnostics for file
--
--                 opts.desc = "LSP: Show line diagnostics"
--                 keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts) -- show diagnostics for line
--
--                 opts.desc = "Go to previous diagnostic"
--                 -- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
--
--                 opts.desc = "Go to next diagnostic"
--                 -- keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
--
--                 opts.desc = "LSP: Show documentation"
--                 keymap.set("n", "K", vim.lsp.buf.hover, opts)          -- show documentation for what is under cursor
--                 keymap.set("n", "<leader>lk", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
--
--                 opts.desc = "LSP: Restart"
--                 keymap.set("n", "<leader>lR", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
--
--                 opts.desc = "LSP: Format file"
--                 keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)
--             end,
--         })
--
--         vim.diagnostic.config({
--             virtual_text = false,
--             virtual_lines = false,
--             underline = {
--                 severity = { min = vim.diagnostic.severity.WARN },
--             },
--             signs = {
--                 numhl = {
--                     [vim.diagnostic.severity.WARN] = 'WarningMsg',
--                     [vim.diagnostic.severity.WARN] = 'ErrorMsg',
--                 },
--                 text = {
--                     -- [vim.diagnostic.severity.HINT]  = "",
--                     -- [vim.diagnostic.severity.ERROR] = "✘",
--                     -- [vim.diagnostic.severity.INFO]  = "◉",
--                     -- [vim.diagnostic.severity.WARN]  = ""
--                     [vim.diagnostic.severity.HINT]  = "󰠠 ",
--                     [vim.diagnostic.severity.ERROR] = " ",
--                     [vim.diagnostic.severity.INFO]  = " ",
--                     [vim.diagnostic.severity.WARN]  = " "
--                 }
--             }
--         })
--
--         -- Set up LSP servers using the new Neovim 0.11 API
--         vim.lsp.config('lua_ls', {
--             cmd = { "lua-language-server" },
--             filetypes = { "lua" },
--             root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml" },
--             capabilities = capabilities,
--             settings = {
--                 Lua = {
--                     -- make the language server recognize "vim" global
--                     diagnostics = {
--                         globals = { "vim" },
--                     },
--                     workspace = {
--                         -- make language server aware of runtime files
--                         library = {
--                             [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--                             [vim.fn.stdpath("config") .. "/lua"] = true,
--                         },
--                     },
--                     completion = {
--                         callSnippet = "Replace",
--                     },
--                     telemetry = {
--                         enable = false,
--                     },
--                 },
--             },
--         })
--
--         vim.lsp.config('pylsp', {
--             capabilities = capabilities,
--             -- handlers = {
--             --     ['textDocument/publishDiagnostics'] = vim.lsp.with(
--             --         vim.lsp.handlers['textDocument/publishDiagnostics'], {
--             --             underline = true,
--             --             virtual_text = false,
--             --         }
--             --     )
--             -- },
--             filetypes = { "python" },
--             settings = {
--                 pylsp = {
--                     plugins = {
--                         black = {
--                             enabled = true,
--                             line_length = 120
--                         },
--                         autopep8 = { enabled = false },
--                         jedi_hover = { enabled = true },
--                         jedi_references = { enabled = true },
--                         jedi_signature_help = { enabled = true },
--                         jedi_symbols = { enabled = true },
--                         mccabe = { enabled = false },
--                         preload = { enabled = true },
--                         pydocstyle = { enabled = false },
--                         pylint = { enabled = false },
--                         rope_autoimport = { enabled = false },
--                         rope_completion = { enabled = false },
--                         yapf = { enabled = false },
--                         pyflakes = { enabled = false },
--                         jedi_completion = {
--                             enabled = true,
--                             include_params = true,
--                             eager = false, -- Changed from true to improve performance
--                             fuzzy = true,  -- Enable fuzzy matching for better performance
--                         },
--                         pycodestyle = {
--                             maxLineLength = 120,
--                             ignore = { "E251", "E202", "F841" },
--                             enabled = false,
--                         },
--                         flake8 = {
--                             maxLineLength = 120,
--                             enabled = true,
--                             ignore = { "E251", "E202", },
--                             hangClosing = false,
--                         },
--                     },
--                 },
--             }
--         })
--
--     end,
-- }
