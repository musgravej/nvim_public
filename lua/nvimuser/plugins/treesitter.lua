return {
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-refactor",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    config = function()
        -- import nvim-treesitter plugin
        local treesitter = require("nvim-treesitter.configs")

        -- configure treesitter
        treesitter.setup({
            -- enable syntax rjghlighting
            highlight = {
                enable = true,
            },
            -- refactor = {
            --     highlight_current_scope = { enable = true },
            --     smart_rename = {
            --         enable = true,
            --         keymaps = {
            --             smart_rename = "<leader>grr"
            --         }
            --     }
            -- },
            highlight_definitions = { enable = true },
            -- enable indentation
            indent = {
                enable = true
            },
            -- enable autotagging (w/ nvim-ts-autotag plugin)
            autotag = {
                enable = true,
            },
            auto_install = true,
            -- ensure these language parsers are installed
            ensure_installed = {
                "bash",
                "c",
                "css",
                "dockerfile",
                "gitignore",
                "graphql",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "prisma",
                "python",
                "query",
                "rust",
                "svelte",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        })
    end,
}
