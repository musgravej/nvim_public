return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim", opts = {} },
        -- { "hrsh7th/nvim-cmp" }, -- Required
        -- { "hrsh7th/cmp-buffer" },
        -- { "hrsh7th/cmp-path" },
        -- { "hrsh7th/cmp-cmdline" },
    },
    config = function()
        -- import lspconfig plugin
        local lspconfig = require("lspconfig")

        -- import mason_lspconfig plugin
        local mason_lspconfig = require("mason-lspconfig")

        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf, silent = true }

                -- set keybinds
                opts.desc = "Go to declaration"
                keymap.set("n", "<leader>fD", vim.lsp.buf.declaration, opts) -- go to declaration

                opts.desc = "Show LSP definitions"
                keymap.set("n", "<leader>fd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

                -- opts.desc = "Show LSP implementations"
                -- keymap.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

                -- opts.desc = "Show LSP type definitions"
                -- keymap.set("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

                opts.desc = "See available code LSP code actions"
                keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
                keymap.set({ "n", "v" }, "ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

                opts.desc = "Show buffer LSP diagnostics"
                keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
                keymap.set("n", "D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

                opts.desc = "Show LSP line diagnostics"
                keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts) -- show diagnostics for line

                opts.desc = "Go to previous diagnostic"
                keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

                opts.desc = "Go to next diagnostic"
                keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

                opts.desc = "Show documentation for what is under cursor"
                keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
                keymap.set("n", "<leader>lk", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

                keymap.set("n", "<leader>fm", vim.lsp.buf.format, { desc = "Format file with current LSP" })
            end,
        })

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- (not in youtube nvim video)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        mason_lspconfig.setup_handlers({
            -- default handler for installed servers
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,
            ["lua_ls"] = function()
                -- configure lua server (with special settings)
                lspconfig["lua_ls"].setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            -- make the language server recognize "vim" global
                            diagnostics = {
                                globals = { "vim" },
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                })
            end,
            ["jsonls"] = function()
                lspconfig["jsonls"].setup({
                    capabilities = capabilities,
                    -- on_attach = on_attach,
                    filetypes = { "json" },
                    settings = nil
                })
            end,
            -- ["fixjson"] = function()
            --     lspconfig["fixjson"].setup({
            --         capabilities = capabilities,
            --         -- on_attach = on_attach,
            --         filetypes = {"json"},
            --     })
            -- end,
            ["pylsp"] = function()
                lspconfig["pylsp"].setup({
                    capabilities = capabilities,
                    -- on_attach = on_attach,
                    handlers = {
                        ['textDocument/publishDiagnostics'] = vim.lsp.with(
                            vim.lsp.diagnostic.on_publish_diagnostics, {
                                underline = true,
                                virtual_text = false,
                            }
                        )
                    },
                    filetypes = { "python" },
                    configurationSources = {
                        -- "pycodestyle",
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
                                    signs = false,
                                    virtual_text = false,
                                    maxLineLength = 120,
                                    enabled = true,
                                    ignore = { "E251", "E202",},
                                    hangClosing = false,
                                },
                            },
                        },
                    }
                })
            end,
        })
    end,
}
