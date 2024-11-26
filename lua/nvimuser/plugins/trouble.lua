return {
    "folke/trouble.nvim",
    dependences = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
    opts = {},
    cmd = "Trouble",
    keys = {
        -- { "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Open/close trouble list" },
        -- { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Open trouble workspace diagnostics" },
        -- { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Open trouble document diagnostics" },
        -- { "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Open trouble quickfix list" },
        -- { "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Open trouble location list" },
        -- { "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble" },
        {
            "<leader>trs",
            "<cmd>Trouble symbols<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            "<leader>trt",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        -- {
        --     "<leader>trf",
        --     "cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        --     desc = "Buffer Diagnostics (Trouble)",
        -- },
        -- {
        --     "<leader>trs",
        --     "<cmd>Trouble symbols toggle focus=false<cr>",
        --     desc = "Symbols (Trouble)",
        -- },
        -- {
        --     "<leader>trL",
        --     "<cmd>Trouble loclist toggle<cr>",
        --     desc = "Location List (Trouble)",
        -- },
        -- {
        --     "<leader>xQ",
        --     "<cmd>Trouble qflist toggle<cr>",
        --     desc = "Quickfix List (Trouble)",
        -- },
    },
}
