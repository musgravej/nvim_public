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
                    "bashls",
                    "black",
                    "cmake",
                    "cssls",
                    "django-template-lsp",
                    -- "docker_compose_language_service",
                    -- "dockerls",
                    "ember",
                    "fixjson",
                    "html",
                    -- "htmlbeautifier",
                    "htmlhint",
                    "isort",
                    -- "jsonls",
                    "lua_ls",
                    "mypy",
                    "pylsp", -- python-lsp-server",
                    "sqlfmt",
                    "sqlls",
                    "superhtml",
                    "terraform-ls",
                    -- "yamlls",
                },
            })
        end,
    },
}
