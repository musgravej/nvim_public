return {
    {
        '2kabhishek/termim.nvim',
        cmd = { 'Fterm', 'FTerm', 'Sterm', 'STerm', 'Tterm', 'TTerm', 'Vterm', 'VTerm' },
        config = function()
            local keymap = vim.keymap
        end
    },
    {
        "gh-liu/nvim-winterm",
        enabled = false,
        opts = {
            win = {
                height = 0.3,
            },
        },
        config = function()
            local keymap = vim.keymap
            keymap.set("n", "<leader>wt", "<cmd>Winterm<CR>", { desc = "Toggle Winterm" })
        end
    }
}
