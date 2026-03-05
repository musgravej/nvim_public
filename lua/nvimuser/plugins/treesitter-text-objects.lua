return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
        -- Disable entire built-in ftplugin mappings to avoid conflicts.
        -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
        vim.g.no_plugin_maps = true

        -- or, disable per filetype (add as you like)
        -- vim.g.no_python_maps = true
        -- vim.g.no_ruby_maps = true
        -- vim.g.no_rust_maps = true
        -- vim.g.no_go_maps = true
    end,
    config = function()
        require("nvim-treesitter-textobjects").setup {
            move = {
                -- whether to set jumps in the jumplist
                set_jumps = true,
            },
            select = {
                -- automatically jump forward to textobj, similar to targets.vim
                lookahead = true,
                -- you can choose the select mode (default is charwise 'v')
                --
                -- can also be a function which gets passed a table with the keys
                -- * query_string: eg '@function.inner'
                -- * method: eg 'v' or 'o'
                -- and should return the mode ('v', 'v', or '<c-v>') or a table
                -- mapping query_strings to modes.
                selection_modes = {
                    ['@parameter.outer'] = 'v', -- charwise
                    ['@function.outer'] = 'v',  -- linewise
                    -- ['@class.outer'] = '<c-v>', -- blockwise
                },
                -- if you set this to `true` (default is `false`) then any textobject is
                -- extended to include preceding or succeeding whitespace. succeeding
                -- whitespace has priority in order to act similarly to eg the built-in
                -- `ap`.
                --
                -- can also be a function which gets passed a table with the keys
                -- * query_string: eg '@function.inner'
                -- * selection_mode: eg 'v'
                -- and should return true of false
                include_surrounding_whitespace = false,
            },
        }
    end,

    -- keymaps SELECT
    -- You can use the capture groups defined in `textobjects.scm`
    vim.keymap.set({ "x", "o" }, "am", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
    end),
    vim.keymap.set({ "x", "o" }, "im", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
    end),
    vim.keymap.set({ "x", "o" }, "ac", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
    end),
    vim.keymap.set({ "x", "o" }, "ic", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
    end),
    -- You can also use captures from other query groups like `locals.scm`
    vim.keymap.set({ "x", "o" }, "as", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")
    end),

    -- keymaps MOVE
    -- keymaps
    -- You can use the capture groups defined in `textobjects.scm`
    vim.keymap.set({ "n", "x", "o" }, "]f", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
    end),
    vim.keymap.set({ "n", "x", "o" }, "]]", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
    end),

    vim.keymap.set({ "n", "x", "o" }, "]e", function()
        require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
    end),
    vim.keymap.set({ "n", "x", "o" }, "][", function()
        require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
    end),

    vim.keymap.set({ "n", "x", "o" }, "[f", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
    end),
    vim.keymap.set({ "n", "x", "o" }, "[[", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
    end),

    vim.keymap.set({ "n", "x", "o" }, "[e", function()
        require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
    end),
    vim.keymap.set({ "n", "x", "o" }, "[]", function()
        require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
    end),

}
-- "nvim-treesitter/nvim-treesitter-textobjects",
-- after = "nvim-treesitter",
-- requires = "nvim-treesitter/nvim-treesitter",
-- config = function()
--     require("nvim-treesitter.configs").setup({
--         textobjects = {
--             select = {
--                 enable = true,
--                 -- keymaps for selecting text objects
--                 -- for example, 'af' for around function, 'if' for inside function
--                 -- you can customize these as needed for python
--                 keymaps = {
--                     ["af"] = "@function.outer",
--                     ["if"] = "@function.inner",
--                     ["ac"] = "@class.outer",
--                     ["ic"] = "@class.inner",
--                     ["aa"] = "@parameter.outer",
--                     ["ia"] = "@parameter.inner",
--                     ["i("] = "@conditional.inner",
--                     ["a("] = "@conditional.outer",
--                     -- add more for python-specific text objects like 'alist' for list, 'adict' for dictionary
--                 },
--             },
--             move = {
--                 enable = true,
--                 set_jumps = true,
--                 -- keymaps for moving between text objects
--                 -- customize for python functions, classes, etc.
--                 keys = {
--                     ["[f"] = "@function.outer",
--                     ["]f"] = "@function.outer",
--                     ["[c"] = "@class.outer",
--                     ["]c"] = "@class.outer",
--                 },
--             },
--             swap = {
--                 enable = true,
--                 -- keymaps for swapping text objects
--                 -- useful for parameters, function arguments, etc.
--                 -- swap_next = { ["<leader>a"] = "@parameter.inner" },
--                 -- swap_previous = { ["<leader>a"] = "@parameter.inner" },
--             },
--         },
--     })
-- end,
