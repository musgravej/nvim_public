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
            -- list of LSP servers for mason to install
            ensure_installed = {
                "bashls",      -- Bash LSP
                "cmake",
                "cssls",       -- CSS LSP
                "ember",
                "html",        -- HTML LSP
                "jsonls",      -- JSON LSP
                "lua_ls",      -- Lua LSP
                "pylsp",       -- Python LSP
                "terraformls", -- Terraform LSP
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed

            -- Install formatters and linters, install by command:
            -- :MasonInstall black terraform flake8 isort fixjson prettier htmlhint jsonlint sqlfmt tflint sqlls
        })
    end,
}
