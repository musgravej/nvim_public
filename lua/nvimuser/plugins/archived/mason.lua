-- lsp/mason.lua
return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

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
                "tsserver",
                "html",
                "cssls",
                -- "flake8",
                -- "black",
                -- "fixjson",
                "jsonls",
                "cmake",
                "lua_ls",
                "bashls",
                "pylsp", -- python-lsp-server",
                "ruff_lsp", -- ruff
                -- "mypy",
                "jedi_language_server", -- jedi
                "pyright",
            },
        })
    end,
}
