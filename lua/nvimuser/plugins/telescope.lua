return {
    "nvim-telescope/telescope.nvim",
    -- branch = "0.1.x",
    branch = "master",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                -- path_display = { "smart" },
                path_display = {
                    truncate = {
                        len = 5
                    },
                    shorten = {
                        len = 10,
                        exclude = { -1, -2, -3 }
                    }
                },
                mappings = {
                    -- <C-x> go to file selection as a split
                    -- <C-v> go to file selection as a vsplit
                    -- <C-t> go to a file in a new tab
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next,     -- move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            },
            extensions = {
                persisted = {
                    layout_config = { width = 80, height = 0.45 }
                }
            }
        })
        telescope.load_extension("bookmarks")
        telescope.load_extension("fzf")
        telescope.load_extension("persisted")
        telescope.load_extension("noice")
        local builtin = require("telescope.builtin")
        -- telescope.load_extension("yank_history")
        -- telescope.load_extension('remote-sshfs')
        telescope.load_extension("diff")
        -- TODO: local todo

        -- https://github.com/nvim-telescope/telescope.nvim/blob/78857db9e8d819d3cc1a9a7bdc1d39d127a36495/doc/telescope.txt#L1712
        -- local document_symbols_opts = {
        --     symbol_width = 50,
        --     symbols = {
        --         "class",
        --         "function",
        --         "method",
        --     }
        -- }
        -- if vim.bo.filetype == "python" then
        --     document_symbols_opts.symbols = {
        --         "class",
        --         "method",
        --         "function",
        --     }
        -- elseif vim.bo.filetype == "lua" then
        --     document_symbols_opts.symbols = {
        --         "variable",
        --         "function",
        --     }
        -- end

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        -- Telescope is broken for any file previewers.  All previewers are moved to FzfLua or Snacks
        -- WARNING: local warning
    end,
}
