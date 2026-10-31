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

        -- for mini, all git commands use upper case for second letter
        require("mini.git").setup()
        vim.keymap.set("n", "<leader>gA", "<cmd>! git add %<CR>", { silent = true, desc = "[G]it [A]dd current file" })
        vim.keymap.set("n", "<leader>gC", "<cmd>Git commit<CR>", { silent = true, desc = "[G]it [C]ommit" })
        vim.keymap.set("n", "<leader>gP", "<cmd>Git push<CR>", { silent = true, desc = "[G]it [P]ush" })

        -- mini files
        require("mini.files").setup(
            {

                -- Customization of shown content
                content = {
                    -- Predicate for which file system entries to show
                    filter = nil,
                    -- Highlight group to use for a file system entry
                    highlight = nil,
                    -- Prefix text and highlight to show to the left of file system entry
                    prefix = nil,
                    -- Order in which to show file system entries
                    sort = nil,
                },

                -- Module mappings created only inside explorer.
                -- Use `''` (empty string) to not create one.
                mappings = {
                    close       = 'q',
                    go_in       = 'l',
                    go_in_plus  = 'L',
                    go_out      = 'h',
                    go_out_plus = 'H',
                    mark_goto   = "'",
                    mark_set    = 'm',
                    reset       = '<BS>',
                    reveal_cwd  = '@',
                    show_help   = 'g?',
                    synchronize = '=',
                    trim_left   = '<',
                    trim_right  = '>',
                },

                -- General options
                options = {
                    -- Whether to delete permanently or move into module-specific trash
                    permanent_delete = true,
                    -- Whether to use for editing directories
                    use_as_default_explorer = true,
                    -- Timeout for synchronous LSP integration requests
                    lsp_timeout = 1000,
                },

                -- Customization of explorer windows
                windows = {
                    -- Maximum number of windows to show side by side
                    max_number = math.huge,
                    -- Whether to show preview of file/directory under cursor
                    preview = false,
                    -- Width of focused window
                    width_focus = 50,
                    -- Width of non-focused window
                    width_nofocus = 15,
                    -- Width of preview window
                    width_preview = 25,
                },
            }
        )
        vim.keymap.set("n", "<leader>ii", "<cmd>lua MiniFiles.open()<CR>",
            { silent = true, desc = "M[i]n[i] Files Open" })

        -- Fuzzy find a file (via mini.pick) and reveal it in mini.files
        local minifiles_fuzzy_find = function()
            require("mini.pick").builtin.files(nil, {
                source = {
                    choose = function(file_path)
                        if file_path and #file_path > 0 then
                            require("mini.files").open(vim.fn.fnamemodify(file_path, ":p"), false)
                        end
                    end,
                },
            })
        end
        vim.keymap.set("n", "<leader>if", minifiles_fuzzy_find,
            { silent = true, desc = "M[i]n[i] Files [F]uzzy find" })

        -- mini diff
        require("mini.diff").setup({})
        vim.keymap.set("n", "<leader>gO", "<cmd>lua MiniDiff.toggle_overlay()<CR>",
            { silent = true, desc = "[G]it toggle [O]verlay" })

        require("mini.pick").setup({
            window = { config = win_config }
        })
        vim.keymap.set("n", "<leader>pb", "<cmd>Pick buffers<CR>", { silent = true, desc = "[P]ick [b]uffer" })
        vim.keymap.set("n", "<leader>pf", "<cmd>Pick files<CR>", { silent = true, desc = "[P]ick [f]iles" })

        -- local statusline = require("mini.statusline")
        -- statusline.setup({
        --     use_icons = vim.g.have_nerd_font,
        -- })
    end,
}
