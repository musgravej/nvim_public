return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    width = .45,
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        -- :Mason - opens a graphical status window
        -- :MasonUpdate - updates all managed registries
        -- :MasonInstall <package> ... - installs/re-installs the provided packages
        -- :MasonUninstall <package> ... - uninstalls the provided packages
        -- :MasonUninstallAll - uninstalls all packages
        -- :MasonLog - opens the mason.nvim log file in a new tab window

        opts = {
            automatic_installation = true, -- not the same as ensure_installed
            -- Installed through Mason from LSP list
            ensure_installed = {
                "bashls",
                "cmake",
                "cssls", -- CSS LSP
                "html",  -- HTML LSP
                "jsonls",
                "lua_ls",
                "pylsp", -- python-lsp-server
                "sqlls",
                "terraformls",
                "tflint",
            },
            -- Install formatters and linters, install by command:
            -- :MasonInstall black terraform flake8 isort fixjson prettier htmlhint jsonlint sqlfmt tflint sqlls
            -- }
        },
        dependencies = {
            {
                "mason-org/mason.nvim", opts = {}
            },
            "neovim/nvim-lspconfig",
        },
    },
}
