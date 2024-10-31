return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        -- add any options here
    },
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
    },
    config = function()
        local keymap = vim.keymap

        keymap.set({ "n" }, "<Esc>", function()
                require("noice").cmd("dismiss")
            end,
            { desc = "Dismiss Noice message" }
        )

        require("noice").setup({
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                -- progress = {
                --     enabled = false,
                --     -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
                --     -- See the section on formatting for more details on how to customize.
                --     --- @type NoiceFormat|string
                --     format = "lsp_progress",
                --     --- @type NoiceFormat|string
                --     format_done = "lsp_progress_done",
                --     throttle = 1000 / 30, -- frequency to update lsp progress message
                --     view = "mini",
                -- },
                -- hover = {
                --     enabled = false,
                --     silent = true, -- set to true to not show a message if hover is not available
                --     view = nil,    -- when nil, use defaults from documentation
                --     ---@type NoiceViewOptions
                --     opts = {},     -- merged with defaults from documentation
                -- },
                -- signature = {
                --     enabled = false,
                --     auto_open = {
                --         enabled = true,
                --         trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
                --         luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
                --         throttle = 50, -- Debounce lsp signature help request by 50ms
                --     },
                --     view = nil, -- when nil, use defaults from documentation
                --     ---@type NoiceViewOptions
                --     opts = {}, -- merged with defaults from documentation
                -- },
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = false, -- requires hrsh7th/nvim-cmp
                },
            },
            --
            -- notify = {
            -- Noice can be used as `vim.notify` so you can route any notification like other messages
            -- Notification messages have their level and other properties set.
            -- event is always "notify" and kind can be any log level as a string
            -- The default routes will forward notifications to nvim-notify
            -- Benefit of using Noice for this is the routing and consistent history view
            --     enabled = true,
            --     view = "mini",
            -- },
            --
            -- messages = {
            --     enabled = true, -- enables the Noice messages UI
            --     view = "notify", -- default view for messages
            --     view_error = "notify", -- view for errors
            --     view_warn = "notify", -- view for warnings
            --     -- view = "mini", -- default view for messages
            --     -- view_error = "mini", -- view for errors
            --     -- view_warn = "mini", -- view for warnings
            --     view_history = "messages", -- view for :messages
            --     view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
            -- },
            --
            -- errors = {
            --     -- options for the message history that you get with `:Noice`
            --     -- view = "popup",
            --     view = "mini",
            --     opts = { enter = true, format = "details"},
            --     filter = { error = true },
            --     filter_opts = { reverse = true },
            -- },
            -- --
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = false,        -- use a classic bottom cmdline for search
                command_palette = true,       -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = true,        -- add a border to hover docs and sign
            },
        })

        -- Hide written messages
        require("noice").setup({
            routes = {
                {
                    filter = {
                        event = "msg_show",
                        kind = "",
                        find = "written",
                    },
                    opts = { skip = true },
                },
            },
        })
    end
}
