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
    -- TODO set message escape
    require("noice").setup({
        lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                -- requires hrsh7th/nvim-cmp
                ["cmp.entry.get_documentation"] = true,
            },
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
            lsp_doc_border = false,
        },
    })
}
