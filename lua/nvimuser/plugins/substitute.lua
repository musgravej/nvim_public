return {
  "gbprod/substitute.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local substitute = require("substitute")

    substitute.setup()

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    vim.keymap.set("n", "_p", substitute.operator, { desc = "Substitute with motion" })
    vim.keymap.set("n", "_pp", substitute.line, { desc = "Substitute line" })
    vim.keymap.set("n", "_P", substitute.eol, { desc = "Substitute to end of line" })
    vim.keymap.set("x", "_p", substitute.visual, { desc = "Substitute in visual mode" })
  end,
}
