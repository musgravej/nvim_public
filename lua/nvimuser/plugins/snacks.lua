return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = false },
        bufdelete = { enabled = false },
        debug = { enabled = false },
        git = { enabled = true },
        gitbrowse = { enabled = true },
        lazygit = { enabled = false, },
        notifier = { enabled = false },
        quickfile = { enabled = false },
        rename = { enabled = false },
        statuscolumn = { enabled = true },
        terminal = { enabled = false },
        toggle = { enabled = false },
        win = { enabled = false },
        words = { enabled = false },
    },
    keys = {
        { "<leader>gB", function() Snacks.git.blame_line() end,   desc = "Git Blame Line" },
        { "<leader>gu", function() Snacks.gitbrowse() end,        desc = "Open git line in url (browser)" },
        { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
        { "<leader>gl", function() Snacks.lazygit.log() end,      desc = "Lazygit log (cwd)" },
        { "<leader>lg", function() Snacks.lazygit.open() end,      desc = "Lazygit open" },
        -- { "<leader>tt", function() Snacks.terminal() end,         desc = "Toggle Terminal" },
    }
}
