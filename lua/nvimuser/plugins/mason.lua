return {
    "williamboman/mason.nvim",
    dependencies = {
        -- "williamboman/mason-lspconfig.nvim",
        "mason-org/mason-lspconfig.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

        -- :Mason - opens a graphical status window
        -- :MasonUpdate - updates all managed registries
        -- :MasonInstall <package> ... - installs/re-installs the provided packages
        -- :MasonUninstall <package> ... - uninstalls the provided packages
        -- :MasonUninstallAll - uninstalls all packages
        -- :MasonLog - opens the mason.nvim log file in a new tab window

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                "lua_ls",      -- Lua LSP
                "pyright",          -- Python LSP
                "pylsp",       -- Python LSP
                "jsonls",      -- JSON LSP
                -- "fixjson",          -- JSON LSP helper
                "bashls",      -- Bash LSP (bonus)
                -- "tsserver",        -- TypeScript/JavaScript LSP (bonus)
                "html",        -- HTML LSP (bonus)
                "cssls",       -- CSS LSP (bonus)
                "terraformls", -- Terraform LSP (bonus)
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
        })
    end,
}
