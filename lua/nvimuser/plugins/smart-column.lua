return {
    -- A Neovim plugin hiding your colorcolumn when unneeded.
    "m4xshen/smartcolumn.nvim",
    opts = {
        custom_colorcolumn = { python = { "120" }, lua = { "120" } },
        disabled_filetypes = { "help", "alpha", "text", "markdown", "json" }
    }
}
