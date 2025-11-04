--  LSP custom configurations in after/lsp/
--  See https://github.com/neovim/nvim-lspconfig/blob/master/lsp/ for LSP default configs.
return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim",                   opts = {} },
        -- "williamboman/mason.nvim",
        -- "williamboman/mason-lspconfig.nvim",
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
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
    end
}
