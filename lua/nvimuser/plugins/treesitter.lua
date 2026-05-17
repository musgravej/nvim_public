return {
    "nvim-treesitter/nvim-treesitter",
    -- "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-treesitter/nvim-treesitter-locals",
    event = { "BufReadPre", "BufNewFile" },
    -- main branch is the rewritten version required for Neovim 0.12+
    branch = "main",
    build = ":TSUpdate",
    disable = { "text", }, -- list of language that will be disabled
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    init = function()
        -- Install parsers on startup, skipping already-installed ones
        -- TSInstall bash c css diff dockerfile gitignore graphql html javascript json lua markdown
        -- TSInstall markdown_inline prisma python query regex rust svelte tsx typescript terraform vim vimdoc yaml
        local ensureInstalled = {
            "bash",
            "c",
            "css",
            "diff",
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
            "regex",
            "rust",
            "svelte",
            "tsx",
            "typescript",
            "terraform",
            "vim",
            "vimdoc",
            "yaml",
        }
        local alreadyInstalled = require("nvim-treesitter.config").get_installed()
        local parsersToInstall = vim.iter(ensureInstalled)
            :filter(function(parser)
                return not vim.tbl_contains(alreadyInstalled, parser)
            end)
            :totable()
        if #parsersToInstall > 0 then
            require("nvim-treesitter").install(parsersToInstall)
        end

        -- Enable treesitter highlighting and indentation per filetype
        -- (highlight/indent options removed from setup() in the rewritten plugin)
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                -- Enable treesitter highlighting and disable regex syntax
                pcall(vim.treesitter.start)
                -- Enable treesitter-based indentation
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
    config = function()
        require("nvim-treesitter").setup {
            -- enable autotagging (w/ nvim-ts-autotag plugin)
            autotag = {
                enable = true,
            },
            -- incremental_selection keymaps
            -- Note: Neovim 0.12 has built-in node selection via v+an/in/]n/[n
            -- The plugin still supports custom keymaps below
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        }
    end,
}
