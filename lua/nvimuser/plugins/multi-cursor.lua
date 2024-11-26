return {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
        'nvimtools/hydra.nvim',
    },
    opts = {
        hint_config = {
            float_opts = {
                border = 'rounded',
            },
            position = 'bottom-right',
        },
        generate_hints = {
            normal = true,
            insert = true,
            extend = true,
            config = {
                column_count = 1,
            },
        },
    },
    cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
    keys = {
        {
            mode = { 'v', 'n' },
            '<Leader>M',
            '<cmd>MCstart<cr>',
            desc = 'Create a selection for selected text or word under the cursor',
        },
    },
    vim.api.nvim_set_hl(0, 'MultiCursor',
        { fg = '#DBEC6B', bg = '#EA0AF2' }
    ),
    vim.api.nvim_set_hl( 0, 'MultiCursorMain',
        { fg = '#D6F31F', bg = '#161714', bold = true }
    ),
    -- The
    -- quick brown fox
    -- jumped over the lazy dog
}
