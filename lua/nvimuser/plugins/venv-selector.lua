-- return {
--     'linux-cultist/venv-selector.nvim',
--     dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python', },
--     -- require('venv-selector').setup {
--     --     pyenv_path = '$HOME/.pyenv/versions',
--     -- },
--     opts = {
--         stay_on_this_version = true,
--         -- Your options go here
--         name = { ".venv", "venv", "venv_38", "venv_39", "venv_310", "venv_311", "venv_312" },
--         -- auto_refresh = false
--     },
--     event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
--     keys = {
--         -- Keymap to open VenvSelector to pick a venv.
--         { '<leader>vs', '<cmd>VenvSelect<cr>' },
--         -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
--         { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
--     },
-- }
return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } }, -- optional: you can also use fzf-lua, snacks, mini-pick instead.
    },
    ft = "python",                                                                                     -- Load when opening Python files
    keys = {
        { '<leader>vs', '<cmd>VenvSelect<cr>' },                                                               -- Open picker on keymap
    },
    opts = {                                                                                           -- this can be an empty lua table - just showing below for clarity.
        search = {},                                                                                   -- if you add your own searches, they go here.
        options = {},                                                                                  -- if you add plugin options, they go here.
        name = { ".venv", "venv", "venv_38", "venv_39", "venv_310", "venv_311", "venv_312" }
    },
}
