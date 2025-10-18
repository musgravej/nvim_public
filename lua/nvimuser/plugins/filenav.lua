return {
    "wojciech-kulik/filenav.nvim",
    config = function()
        require("filenav").setup({
            -- next_file_key = "<M-i>",
            -- prev_file_key = "<M-o>",
            max_history = 100,
            remove_duplicates = false,
        })
        -- Go Back to previously opened file
        vim.keymap.set("n", "<leader>gb", "<cmd>FilenavPrev<CR>", {silent = true, desc = "Go Back in file history"})
        vim.keymap.set("n", "<leader>gn", "<cmd>FilenavNext<CR>", {silent = true, desc = "Go Next in file history"})
    end,
}
