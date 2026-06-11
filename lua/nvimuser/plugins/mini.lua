return {
    "nvim-mini/mini.nvim",
    enabled = true,
    config = function()
        -- local map = function(mode, lhs, rhs, desc)
        --     vim.keymap.set(mode, lhs, rhs, { desc = desc })
        -- end

        local win_config = function()
            local height = math.floor(0.618 * vim.o.lines)
            local width = math.floor(0.618 * vim.o.columns)
            return {
                anchor = 'NW',
                height = height,
                width = width,
                row = math.floor(0.5 * (vim.o.lines - height)),
                col = math.floor(0.5 * (vim.o.columns - width)),
            }
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

        require("mini.git").setup()
        vim.keymap.set("n", "<leader>ga", "<cmd>! git add %<CR>", { silent = true, desc = "[G]it [a]dd current file" })
        vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<CR>", { silent = true, desc = "[G]it [c]ommit" })
        vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>", { silent = true, desc = "[G]it [p]ush" })

        require("mini.pick").setup({
            window = { config = win_config }
        })
        vim.keymap.set("n", "<leader>pb", "<cmd>Pick buffers<CR>", { silent = true, desc = "[P]ick [b]uffer" })
        vim.keymap.set("n", "<leader>pf", "<cmd>Pick files<CR>", { silent = true, desc = "[P]ick [f]iles" })

        -- mini diff
        require("mini.diff").setup({})
        vim.keymap.set("n", "<leader>go", "<cmd>lua MiniDiff.toggle_overlay()<CR>",
            { silent = true, desc = "[G]it toggle [o]verlay" })

        -- local statusline = require("mini.statusline")
        -- statusline.setup({
        --     use_icons = vim.g.have_nerd_font,
        -- })
    end,
}
