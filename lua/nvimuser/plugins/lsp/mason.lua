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
                "cssls",
                "html",
                "jsonls",
                "lua_ls",
                "pylsp",
                "terraformls",
                "tofu_ls",
                "ts_ls",
            }
            -- Install manually through Mason UI, from Linter or Formatter list
            -- :MasonInstall bash-language-server black cmake-language-server css-lsp fixjson flake8
            -- :MasonInstall html-lsp isort json-lsp lua-language-server prettier python-lsp-server
            -- :MasonInstall sqlls terraform terraform-ls tflint tofu-ls typescript-language-server
        },
        dependencies = {
            {
                "mason-org/mason.nvim", opts = {}
            },
            "neovim/nvim-lspconfig",
        },
    },
}
