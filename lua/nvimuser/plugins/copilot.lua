-- ## Copilot Configuration Options───
local function is_work_machine(val)
    work_computers = { 'foo.local' }
    for index, value in ipairs(work_computers) do
        if value == val then
            return true
        end
    end
    return false
end

local is_work_computer = is_work_machine(vim.uv.os_gethostname())

return {
    {
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
        -- enabled = true,
        enabled = is_work_computer,
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.keymap.set("n", "<leader>pe", "<cmd>Copilot enable<cr>", { desc = "Co[p]ilot [e]nable" })
            vim.keymap.set("n", "<leader>pd", "<cmd>Copilot disable<cr>", { desc = "Co[p]ilot [d]isable" })
            vim.api.nvim_set_keymap("i", "<C-u>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
            vim.api.nvim_set_keymap("i", "<C-i>", 'copilot#Dismiss()', { silent = true, expr = true })
            vim.api.nvim_set_keymap("i", "<C-]>", 'copilot#Next()', { silent = true, expr = true })
            vim.api.nvim_set_keymap("i", "<C-[>", 'copilot#Previous()', { silent = true, expr = true })
        end,
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        event = "BufReadPost",
        enabled = false,
        -- enabled = is_work_computer,

        -- Copilot suggestion is automatically hidden when popupmenu-completion is open.
        -- In case you use a custom menu for completion, you can set the copilot_suggestion_hidden
        -- buffer variable to true to have the same behavior.
        -- vim.api.nvim_create_autocmd("User", {
        --     pattern = "BlinkCmpMenuOpen",
        --     callback = function()
        --         vim.b.copilot_suggestion_hidden = true
        --     end,
        -- }),
        --
        -- vim.api.nvim_create_autocmd("User", {
        --     pattern = "BlinkCmpMenuClose",
        --     callback = function()
        --         vim.b.copilot_suggestion_hidden = false
        --     end,
        -- }),

        opts = {
            suggestion = {
                enabled = not vim.g.ai_cmp,
                auto_trigger = true,
                hide_during_completion = vim.g.ai_cmp,
                keymap = {
                    accept = "<C-u>",
                    dismiss = "<C-i>",
                    next = "<C-]>",
                    prev = "<C-[>",
                },
            },
            panel = { enabled = false },
            filetypes = {
                terraform = true,
                lua = true,
                python = true,
                markdown = true,
                json = true,
                help = true,
                csv = false,
                text = function()
                    local filename = vim.fs.basename(vim.api.nvim_buf_get_name(0))
                    if string.match(filename, '_worksheet$') or string.match(filename, '_worksheet%.%w+$') then
                        return true
                    end
                    return false
                end,
                ["*"] = false,
            },
        },
    }
}
