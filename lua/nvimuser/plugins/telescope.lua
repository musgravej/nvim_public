return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
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
                    layout_config = { width = 0.55, height = 0.55 }
                }
            }
        })
        telescope.load_extension("fzf")
        telescope.load_extension("persisted")
        -- telescope.load_extension("noice")
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

        -- keymap.set("n", "<leader>fs", function() builtin.lsp_document_symbols(document_symbols_opts) end, { desc = "Find document symbols" })
        keymap.set("n", "z=", "<cmd>Telescope spell_suggest<cr>", { desc = "Spell suggestions" })
        keymap.set("n", "<leader>ch", "<cmd>Telescope command_history<cr>", { desc = "Show command history" })
        keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find string under cursor in buffers" })
        keymap.set("n", "<leader>fd", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in current directory" })
        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>gS", "<cmd>Telescope git_status<cr>", { desc = "Git files status" })
        keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
        keymap.set("n", "<leader>fm", "<cmd>Telescope marks<cr>", { desc = "Fuzzy find marks" })
        keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>fR", "<cmd>Telescope registers<cr>", { desc = "Find registers" })
        -- keymap.set("n", "<leader>fs", function() builtin.lsp_document_symbols() end, { desc = "Find document symbols" })
        -- keymap.set("n", "<leader>fs", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "Find document symbols" })
        -- '<leader>fs' search handled by Aerial plugin
        keymap.set("n", "<leader>fS", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "Find all document symbols" })
        keymap.set("n", "<leader>fT", "<cmd>TodoFzfLua<cr>", { desc = "Find todos" })
        keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
        -- keymap.set("n", "<leader>fw", "<cmd>FzfLua lsp_workspace_symbols<cr>", { desc = "Find workspce symbols" })
        keymap.set("n", "<leader>fh", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Find fuzzy here (in this buffer)" })
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" })
        -- This is any place where you use a symbol that has been defined elsewhere
        -- keymap.set("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", { desc = "Find references" })
        keymap.set("n", "<leader>fr", "<cmd>FzfLua lsp_references<cr>", { desc = "Find references" })
        -- WARNING: local warning
    end,
}
