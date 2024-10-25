return {
    "NeogitOrg/neogit",
    -- version = "0.0.1",
    dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration
        -- Only one of these is needed, not both.
        "nvim-telescope/telescope.nvim", -- optional
        -- "ibhagwan/fzf-lua",              -- optional
    },
    -- config = true
    config = function ()
        local keymap = vim.keymap
        keymap.set("n", "<leader>ng", "<cmd>Neogit<CR>", { desc = "Launch Neogit" })
    end
}
-- return {}
