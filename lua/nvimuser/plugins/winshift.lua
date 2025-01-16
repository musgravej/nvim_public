return {
    "sindrets/winshift.nvim",

    keys = {
        { '<leader>wwh', '<cmd>WinShift left<CR>', desc = "Move to left window"},
        { '<leader>wwl', '<cmd>WinShift right<CR>', desc = "Move to right window"},
        { '<leader>wwk', '<cmd>WinShift up<CR>', desc = "Move to window above"},
        { '<leader>wwj', '<cmd>WinShift down<CR>', desc = "Move to window below"},
        { '<leader>wwX', '<cmd>WinShift swap<CR>', desc = "Swap with other window (A, B, C, ...)"}
    }
}
