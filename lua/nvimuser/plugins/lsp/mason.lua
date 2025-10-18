return {
    {
        "williamboman/mason.nvim",
        version = "^1.0.0",
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
        version = "^1.0.0",
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
                    "ember",
                    "fixjson",
                    "html",
                    "htmlhint",
                    "isort",
                    "lua_ls",
                    "mypy",
                    -- "prettier",
                    "pylsp", -- python-lsp-server",
                    "sqlfmt",
                    "sqlls",
                    "superhtml",
                    "tailwindcss",
                    "terraform-ls",
                    -- "docker_compose_language_service",
                    -- "dockerls",
                    -- "htmlbeautifier",
                    -- "jsonls",
                    -- "yamlls",
                },
            })
        end,
    },
}
