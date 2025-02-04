return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
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
                path_display = { "smart" },
                mappings = {
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

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" })
        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
        keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find string under cursor in buffers" })
        keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
        keymap.set("n", "<leader>fR", "<cmd>Telescope lsp_references<cr>", { desc = "Find references" })
        keymap.set("n", "<leader>fr", "<cmd>Telescope registers<cr>", { desc = "Find registers" })
        keymap.set("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Find in buffer, fuzzy" })
        keymap.set("n", "<leader>fs", function() builtin.lsp_document_symbols() end, { desc = "Find document symbols" })
        keymap.set("n", "<leader>fw", function() builtin.lsp_workspace_symbols() end, { desc = "Find workspce symbols" })
        keymap.set("n", "<leader>ch", "<cmd>Telescope command_history<cr>", { desc = "Show command history" })
    end,
}
