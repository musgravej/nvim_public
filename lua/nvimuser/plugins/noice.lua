return {
    "folke/noice.nvim",
    event = "VeryLazy",

    opts = {
        -- add any options here
        views = {
            cmdline_popup = {
                position = {
                    row = 5,
                    col = "50%",
                },
                size = {
                    width = 60,
                    height = "auto",
                },
            },
            popupmenu = {
                relative = "editor",
                position = {
                    row = 8,
                    col = "50%",
                },
                size = {
                    width = 60,
                    height = 10,
                },
                border = {
                    style = "rounded",
                    padding = { 0, 1 },
                },
                win_options = {
                    winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                },
            },
        },
        lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                -- requires hrsh7th/nvim-cmp
                ["cmp.entry.get_documentation"] = true,
            },
            signature = {
                auto_open = {
                    enabled = false,
                },
            }
        },
        status = {},
        -- you can enable a preset for easier configuration
        presets = {
            -- use a classic bottom cmdline for search
            -- bottom_search = true,
            bottom_search = false,
            -- position the cmdline and popupmenu together
            command_palette = true,
            -- long messages will be sent to a split
            -- long_message_to_split = true,
            long_message_to_split = false,
            -- enables an input dialog for inc-rename.nvim
            inc_rename = false,
            -- add a border to hover docs and signature help
            lsp_doc_border = true,
        },
    },
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        {
            "rcarriga/nvim-notify",
            version = "3.15.0",  -- 2025-07-10: this dependecy is failing, pinning to an earlier version
        },
    },

    vim.keymap.set({ "n" }, "<Esc>", function()
            require("noice").cmd("dismiss")
        end,
        { desc = "Dismiss Noice message" }
    ),

    -- comment out this setup for installation
    -- require("noice").setup({})
}
