-- ## Copilot ───
return {
    -- Here are the default keybindings for GitHub Copilot in Neovim when using the official copilot.vim plugin:
    --
    -- - `Tab` or `Ctrl+Tab`: Accept Copilot suggestion (in insert mode)
    -- - `Ctrl+[` or `Ctrl+\\`: Dismiss Copilot suggestion
    -- - `Alt+[` / `Alt+]`: Cycle through Copilot suggestions (previous/next)
    -- - `Ctrl+Enter`: Open Copilot panel (if available)
    --
    -- You can customize these in your Neovim config. For example, to change the accept mapping:
    --
    -- ```vim
    -- imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
    -- ```
    "github/copilot.vim",
    config = function()
        vim.g.copilot_no_tab_map = true
        vim.keymap.set("n", "<leader>pe", "<cmd>Copilot enable<cr>", { desc = "Enable Copilot Suggestions" })
        vim.keymap.set("n", "<leader>pd", "<cmd>Copilot disable<cr>", { desc = "Disable Copilot Suggestions" })
        vim.keymap.set("i", "<C-u>", 'copilot#Accept("<CR>")', { silent = true, expr = true, desc = "Accept Copilot suggestion" })
        vim.keymap.set("i", "<C-i>", 'copilot#Dismiss()', { silent = true, expr = true, desc = "Dismiss Copilot suggestion" })
        vim.keymap.set("i", "<C-]>", 'copilot#Next()', { silent = true, expr = true, desc = "Next Copilot suggestion" })
        vim.keymap.set("i", "<C-[>", 'copilot#Previous()', { silent = true, expr = true, desc = "Previous Copilot suggestion" })
    end,
}
