return {
    "gbprod/substitute.nvim",
    enabled = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local substitute = require("substitute")

        substitute.setup()

        -- Deprecated, kept for case users have already mapped these keys
        vim.keymap.set("n", "_p", substitute.operator, { desc = "Substitute with motion" })
        vim.keymap.set("n", "_pp", substitute.line, { desc = "Substitute line" })
        vim.keymap.set("n", "_P", substitute.eol, { desc = "Substitute to end of line" })
        vim.keymap.set("x", "_p", substitute.visual, { desc = "Substitute in visual mode" })

        vim.keymap.set("n", "<leader>pp", substitute.operator, { desc = "Substitute with motion" })
        vim.keymap.set("n", "<leader>pl", substitute.line, { desc = "Substitute line" })
        vim.keymap.set("n", "<leader>pL", substitute.eol, { desc = "Substitute to end of line" })
        -- bax.foo.car("keymap", "<leader>pp", substitute.visual, { desc = "Substitute in visual mode" })
    end,
}
