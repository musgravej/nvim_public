return {
    "echasnovski/mini.nvim",
    enabled = true,
    config = function()
        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { desc = desc })
        end

        -- mini.ai
        -- Extend and create a/i textobjects
        --
        -- It enhances some builtin textobjects (like a(, a), a', and more), creates new ones (like a*, a<Space>, af, a?, and more),
        -- and allows user to create their own (like based on treesitter, and more).
        -- Supports dot-repeat, v:count, different search methods, consecutive application, and customization via Lua patterns or functions.
        -- Has builtins for brackets, quotes, function call, argument, tag, user prompt, and any punctuation/digit/whitespace character.
        -- Ex: vin[ - visual select inside next [
        -- Ex: v3in[ - visual select inside 3rd next [
        require("mini.ai").setup({
            n_lines = 500,
        })

        -- mini git
        local mini_git = require("mini.git")
        mini_git.setup()
        map({ "n", "x" }, "<leader>ga", mini_git.show_at_cursor, "[G]it show [a]t cursor")
        -- map({ "n", "v" }, "<leader>gh", mini_git.show_range_history, "Git show range history")
        -- map({ "n", "v" }, "<leader>gd", mini_git.show_diff_source, "Git show diff source")

        -- mini diff
        local mini_diff = require("mini.diff")
        mini_diff.setup()
        map("n", "<leader>go", mini_diff.toggle_overlay, "[G]it toggle [o]verlay")

        -- local statusline = require("mini.statusline")
        -- statusline.setup({
        --     use_icons = vim.g.have_nerd_font,
        -- })
    end,
}
