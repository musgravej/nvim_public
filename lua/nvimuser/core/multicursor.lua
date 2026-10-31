-- ====================================================================
-- Native Multicursor Configuration (Neovim 0.13+)
-- ====================================================================

local keymap = vim.keymap
local multicursor_ns = vim.api.nvim_create_namespace('nvim.multicursor')
keymap.set("n", "[c", "[C", { desc = "Last cursor" })
keymap.set("n", "]c", "]C", { desc = "Next cursor" })

-- Highlight customization (Optional)
-- Native secondary cursors use MCursor and MCursorVisual.
vim.api.nvim_set_hl(0, 'MCursor', { fg = '#000000', bg = '#FFA01C' })
vim.api.nvim_set_hl(0, 'MCursorVisual', { link = 'Visual' })

-- Example: Sublime style "Select Next Occurrence" (Ctrl+D)
-- This performs a search for the word under the cursor and appends a new cursor to the next match
vim.keymap.set('n', '<C-d>', function()
  if vim.fn.expand('<cword>') == '' then return end
  vim.cmd('normal! *')
  -- Feed the native '[count]Q' command to spawn a cursor on the next match
  vim.cmd('normal! 1Q')
end, { desc = 'Multicursor: Add next occurrence' })

-- Add a cursor at the previous match for the word under the cursor.
vim.keymap.set('n', '<C-S-d>', function()
  if vim.fn.expand('<cword>') == '' then return end
  vim.cmd('normal! #')
  -- Feed the native '[count]Q' command to spawn a cursor on the previous match
  vim.cmd('normal! 1Q')
end, { desc = 'Multicursor: Add previous occurrence' })


-- Quick shortcut to clear all cursors with Escape instead of Ctrl+L
vim.keymap.set('n', '<C-p>', function()
  vim.cmd('nohlsearch')
  vim.api.nvim_buf_clear_namespace(0, multicursor_ns, 0, -1)
  vim.cmd('redraw')
end, { desc = 'Clear cursors and search highlights' })

