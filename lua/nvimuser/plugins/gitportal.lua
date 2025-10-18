return {
    'trevorhauter/gitportal.nvim',
    config = function()
        local gitportal = require("gitportal")

        gitportal.setup({
            always_include_current_line = true, -- Include the current line in permalinks by default
        })

        -- Generates and copies the permalink of your current file to your clipboard.
        -- When in visual mode, selected lines are included in the permalink.
        vim.keymap.set({"n", "v"}, "<leader>gc", gitportal.copy_link_to_clipboard, { desc = "Copy git permalink to clipboard"})
    end
}
