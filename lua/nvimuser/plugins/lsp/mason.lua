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
                    "html",
                    "docker_compose_language_service",
                    "dockerls",
                    "sqlfmt",
                    "sqlls",
                    "cssls",
                    "yamlls",
                    "black",
                    "fixjson",
                    "jsonls",
                    "cmake",
                    "lua_ls",
                    "bashls",
                    "pylsp", -- python-lsp-server",
                    "mypy",
                    "terraform-ls",
                    "dockerls",
                },
            })
        end,
    },
}
