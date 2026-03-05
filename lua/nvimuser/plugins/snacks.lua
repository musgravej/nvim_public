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
        picker = {
            enabled = true,
            matchers = {
                frecency = true,
                cwd_bonus = false,
            },
            exclude = {
                ".git",
                "node_modules",
                "dist",
                "build",
            },
            formatters = {
                file = {
                    filename_first = true,
                    filename_only = false,
                    icon_width = 2,
                },
            },
            layout = {
                -- presets options : "default" , "ivy" , "ivy-split" , "telescope" , "vscode", "select" , "sidebar"
                -- override picker layout in keymaps function as a param below
                preset = "telescope", -- defaults to this layout unless overidden
                cycle = false,
            },
            layouts = {
                select = {
                    preview = false,
                    layout = {
                        backdrop = false,
                        width = 0.6,
                        min_width = 80,
                        height = 0.4,
                        min_height = 10,
                        box = "vertical",
                        border = "rounded",
                        title = "{title}",
                        title_pos = "center",
                        { win = "input",   height = 1,          border = "bottom" },
                        { win = "list",    border = "none" },
                        { win = "preview", title = "{preview}", width = 0.6,      height = 0.4, border = "top" },
                    }
                },
                telescope = {
                    reverse = true, -- set to false for search bar to be on top
                    layout = {
                        box = "horizontal",
                        backdrop = false,
                        width = 0.8,
                        height = 0.9,
                        border = "none",
                        {
                            box = "vertical",
                            { win = "list",  title = " Results ", title_pos = "center", border = "rounded" },
                            { win = "input", height = 1,          border = "rounded",   title = "{title} {live} {flags}", title_pos = "center" },
                        },
                        {
                            win = "preview",
                            title = "{preview:Preview}",
                            width = 0.50,
                            border = "rounded",
                            title_pos = "center",
                        },
                    },
                },
                ivy = {
                    layout = {
                        box = "vertical",
                        backdrop = false,
                        width = 0,
                        height = 0.4,
                        position = "bottom",
                        border = "top",
                        title = " {title} {live} {flags}",
                        title_pos = "left",
                        { win = "input", height = 1, border = "bottom" },
                        {
                            box = "horizontal",
                            { win = "list",    border = "none" },
                            { win = "preview", title = "{preview}", width = 0.5, border = "left" },
                        },
                    },
                },
            }
        },
    },
    keys = {
        { "<leader>gB", function() require("snacks").git.blame_line() end,                           desc = "[G]it [B]lame line" },
        { "<leader>gu", function() require("snacks").gitbrowse() end,                                desc = "[G]it open in [u]rl (browser)" },
        { "<leader>gf", function() require("snacks").lazygit.log_file() end,                         desc = "[G]it current [f]ile history" },
        { "<leader>gl", function() require("snacks").lazygit.log() end,                              desc = "[G]it [l]og (cwd)" },
        { "<leader>lg", function() require("snacks").lazygit.open() end,                             desc = "[L]azy[g]it open" },
        -- { "<leader>tt", function() Snacks.terminal() end,         desc = "Toggle Terminal" },

        -- Git Stuff
        { "<leader>gr", function() require("snacks").picker.git_branches({ layout = "select" }) end, desc = "[G]it switch b[r]anches" },

        -- Snacks Picker
        {
            "<leader>fc",
            function() require("snacks").picker.files({ cwd = "~/.config/nvim/lua" }) end,
            desc = "[F]ind [c]onfig file"
        },
        { "<leader>fk", function() require("snacks").picker.keymaps({ layout = "ivy" }) end, desc = "[F]ind [k]eymaps" },
    }
}
