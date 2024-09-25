return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
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
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup()
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    -- "tsserver",
                    "html",
                    "cssls",
                    "yamlls",
                    -- "flake8",
                    "black",
                    "fixjson",
                    -- "jinja_lsp",
                    "jsonls",
                    "cmake",
                    "lua_ls",
                    "bashls",
                    "pylsp", -- python-lsp-server",
                    "ruff_lsp", -- ruff
                    "mypy",
                    "jedi_language_server", -- jedi
                    "pyright",
                    "dockerls",
                },
            })
        end,
    },
}
