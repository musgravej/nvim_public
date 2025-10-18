return {
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-refactor",
    event = { "BufReadPre", "BufNewFile" },
    -- The master branch is frozen and provided for backward compatibility only.
    -- All future updates happen on the main branch, which will become the default branch in the future.
    branch = "master",
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    config = function()
        -- if Treesitter doesn't fold, try this:
        -- TSInstall <lang>
        -- set foldmethod=expr
        -- set foldexpr=nvim_treesitter#foldexpr()

        -- ## Configure Treesitter?
        -- import nvim-treesitter plugin
        -- local treesitter = require("nvim-treesitter.configs")
        -- treesitter.setup({

       require('nvim-treesitter.configs').setup {
            -- enable syntax highlighting
            modules = {},
            sync_install = true,
            ignore_install = {},
            highlight = {
                enable = true,
            },

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
        -- })
        }
    end,
}
