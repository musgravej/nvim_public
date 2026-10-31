return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
        -- Disable built-in ftplugin mappings to avoid conflicts
        vim.g.no_plugin_maps = true
    end,
    config = function()
        local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")
        local ts_move = require("nvim-treesitter-textobjects.move")
        local ts_select = require("nvim-treesitter-textobjects.select")

        require("nvim-treesitter-textobjects").setup {
            move = {
                set_jumps = true,
            },
            select = {
                lookahead = true,
                selection_modes = {
                    ["@parameter.outer"] = "v",
                    ["@function.outer"] = "V",
                },
                include_surrounding_whitespace = false,
            },
        }

        -- Helper to move and center immediately
        local function move_center(move_fn, capture, group)
            return function()
                move_fn(capture, group)
                vim.cmd("normal! zz")
            end
        end

        -----------------------------------------------------------------
        -- SELECT MAPPINGS
        -----------------------------------------------------------------
        vim.keymap.set({ "x", "o" }, "am", function() ts_select.select_textobject("@function.outer", "textobjects") end)
        vim.keymap.set({ "x", "o" }, "im", function() ts_select.select_textobject("@function.inner", "textobjects") end)
        vim.keymap.set({ "x", "o" }, "ac", function() ts_select.select_textobject("@class.outer", "textobjects") end)
        vim.keymap.set({ "x", "o" }, "ic", function() ts_select.select_textobject("@class.inner", "textobjects") end)
        vim.keymap.set({ "x", "o" }, "as", function() ts_select.select_textobject("@local.scope", "locals") end)

        -----------------------------------------------------------------
        -- MOVE MAPPINGS
        -----------------------------------------------------------------

        -- Class Movement
        vim.keymap.set({ "n", "x", "o" }, "]]", move_center(ts_move.goto_next_start, "@class.outer", "textobjects"),
            { desc = "Next class start" })
        vim.keymap.set({ "n", "x", "o" }, "][", move_center(ts_move.goto_next_end, "@class.outer", "textobjects"),
            { desc = "Next class end" })
        vim.keymap.set({ "n", "x", "o" }, "[[", move_center(ts_move.goto_previous_start, "@class.outer", "textobjects"),
            { desc = "Previous class start" })
        vim.keymap.set({ "n", "x", "o" }, "[]", move_center(ts_move.goto_previous_end, "@class.outer", "textobjects"),
            { desc = "Previous class end" })

        -- Function Movement
        vim.keymap.set({ "n", "x", "o" }, "]f", move_center(ts_move.goto_next_start, "@function.outer", "textobjects"),
            { desc = "Next function start" })
        vim.keymap.set({ "n", "x", "o" }, "]e", move_center(ts_move.goto_next_end, "@function.outer", "textobjects"),
            { desc = "Next function end" })
        vim.keymap.set({ "n", "x", "o" }, "[f",
            move_center(ts_move.goto_previous_start, "@function.outer", "textobjects"),
            { desc = "Previous function start" })
        vim.keymap.set({ "n", "x", "o" }, "[e", move_center(ts_move.goto_previous_end, "@function.outer", "textobjects"),
            { desc = "Previous function end" })

        -- Parameter Movement
        vim.keymap.set({ "n", "x", "o" }, "]a", move_center(ts_move.goto_next_start, "@parameter.inner", "textobjects"),
            { desc = "Next parameter start" })
        vim.keymap.set({ "n", "x", "o" }, "[a",
            move_center(ts_move.goto_previous_start, "@parameter.inner", "textobjects"),
            { desc = "Previous parameter start" })

        -----------------------------------------------------------------
        -- REPEATABLE MOVES (; and ,)
        -----------------------------------------------------------------

        -- Makes ';' repeat forward and ',' repeat backward for treesitter moves
        -- these don't make sense to use, disabled.  Just exlicitly use the mappings above.
        -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
        -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

        -- Optional: Makes standard 'f', 'F', 't', 'T' also work with ';' and ','
        vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
        vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
        vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
        vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
    end,
}
