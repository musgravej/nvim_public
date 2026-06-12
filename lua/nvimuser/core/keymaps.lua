-- https://neovim.io/doc/user/map.html
-- Mac key notation: A = Ctrl Key, S = Shift Key
-- help: key-notation
-- Check keymap: verbose imap <>

vim.g.mapleader = " "
-- vim.g.mapleader = ","
local keymap = vim.keymap

-- Test keymaps here
-- keymap.set("n", "<Bslash>", ":echo 'hello world'<CR>", {})

-- Alternate search
keymap.set("n", "<leader>ss", "/", { desc = "Search forward" })
keymap.set("n", "<leader>sS", "?", { desc = "Search backward" })

-- Completion scanning (related to insert-mode behavior)
-- On complete, do not scan included files (i) or tags (t)
vim.opt.complete:remove("i")
vim.opt.complete:remove("t")

-- ─── UndoTree ───────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>tr", "<cmd>Undotree<CR>", { desc = "Toggle Undo[T][r]ee" })

-- ─── Insert Mode ────────────────────────────────────────────────────────────

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("i", "<c-l>", "<c-x><c-o>", { desc = "Omnifunc completion" })

-- ─── Folding ────────────────────────────────────────────────────────────────

keymap.set("n", "zv", "zMzvzz", { desc = "Close all folds except the current one" })
keymap.set("n", ", ", "za", { desc = "Toggle a fold" })
-- keymap.set("n", "<leader>fo", "<cmd>foldopen<CR>", { desc = "Open a fold" })

-- ─── Editing / Registers ────────────────────────────────────────────────────

-- Keep selection when indenting in visual mode
vim.keymap.set("x", "<", "<gv", { noremap = true })
vim.keymap.set("x", ">", ">gv", { noremap = true })

-- Better paste: doesn't overwrite the unnamed register with the deleted text
vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true })

-- Duplicate current line, preserves the unnamed register
keymap.set("n", "<leader>rl", '<cmd>let @q=@"<CR>"0yyP<cmd>let @"=@q<CR>', { desc = "Duplicate current line above" })

-- Use black hole register by default for d/c/x so clipboard is preserved
keymap.set("n", "x", '"_x')
keymap.set("n", "X", '"_X')
keymap.set("n", "d", '"_d')
keymap.set("n", "D", '"_D')
keymap.set("n", "c", '"_c')
keymap.set("n", "C", '"_C')

keymap.set("v", "x", '"_x')
keymap.set("v", "X", '"_X')
keymap.set("v", "d", '"_d')
keymap.set("v", "D", '"_D')
keymap.set("v", "c", '"_c')
keymap.set("v", "C", '"_C')

-- <leader> prefix to bypass the black hole register (uses default register)
keymap.set("n", "<leader>d", "d")
keymap.set("n", "<leader>D", "D")
keymap.set("n", "<leader>x", "x")
keymap.set("n", "<leader>X", "X")
keymap.set("n", "<leader>c", "c")
keymap.set("n", "<leader>C", "C")

keymap.set("v", "<leader>d", "d")
keymap.set("v", "<leader>D", "D")
keymap.set("v", "<leader>x", "x")
keymap.set("v", "<leader>X", "X")
keymap.set("v", "<leader>c", "c")
keymap.set("v", "<leader>C", "C")

-- Convenience yanks to start/end of line
keymap.set("n", "<leader>yy", "y^", { desc = "Yank to start of line" })
keymap.set("n", "<leader>yY", "y$", { desc = "Yank to end of line" })

-- Paste from register (register, paste), bring up register list
keymap.set(
    "n", "<leader>rp",
    function() require("fzf-lua").registers() end,
    { remap = true, silent = false, desc = "Paste from register prompt" }
)

-- ─── Navigation ─────────────────────────────────────────────────────────────

-- Jump to first non-blank / end of line
keymap.set("n", "<BS>", "^", { desc = "Move to first non-blank character" })
keymap.set("n", "<S-BS>", "$", { desc = "Move to end of line" })

-- Scroll and keep cursor centered
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
keymap.set("n", "<C-S-d>", "<C-u>zz", { desc = "Scroll up and center" })
keymap.set("n", "<C-b>", "<C-b>zz", { desc = "Scroll back (page up) and center" })
keymap.set("n", "<C-f>", "<C-f>zz", { desc = "Scroll forward (page down) and center" })
-- keymap.set("n", "<C-u>", "<Nop>", { desc = "Convenience copy to register" })
-- keymap.set("n", "<C-p>", "<Nop>", { desc = "Convenience paste to register" })

-- ─── Search ─────────────────────────────────────────────────────────────────

-- Clear search highlights
keymap.set("n", " ,", ":nohl<CR>", { desc = "Clear search highlights", silent = true })
-- keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights", silent = true })

-- Keep search results centered in the window
keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
keymap.set("n", "N", "Nzzzv", { desc = "Prev search result (centered)" })

-- ─── Search & Replace ───────────────────────────────────────────────────────

keymap.set("n", "<leader>srl", ":s/\\v", { desc = "Search and replace on line" })
keymap.set("n", "<leader>srf", ":%s/\\v", { desc = "Search and replace in file" })
keymap.set("v", "<leader>srv", ":s/\\%V", { desc = "Search and replace in visual selection" })

-- Replace selected text (whole file, or with confirmation)
keymap.set("v", "<leader>rf", '"hy:%s/\\v<C-r>h//g<left><left>', { desc = "Replace selection in file" })
keymap.set("v", "<leader>rc", '"hy:%s/\\v<C-r>h//c<left><left>', { desc = "Replace selection with confirmation" })

-- ─── Line Movement ──────────────────────────────────────────────────────────

keymap.set("n", "r]", "<cmd>m .-2<CR>", { desc = "Move line up" })
keymap.set("n", "r[", "<cmd>m .+1<CR>", { desc = "Move line down" })
keymap.set("v", "r]", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })
keymap.set("v", "r[", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
keymap.set("i", "r]", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move line up" })
keymap.set("i", "r[", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move line down" })

-- Alternate bindings for Mac (Ctrl+Shift+i/k)
if vim.fn.has("mac") == 1 then
    keymap.set("n", "<C-S-i>", "<cmd>m .-2<CR>", { desc = "Move line up" })
    keymap.set("n", "<C-S-k>", "<cmd>m .+1<CR>", { desc = "Move line down" })
    keymap.set("v", "<C-S-i>", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })
    keymap.set("v", "<C-S-k>", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
    keymap.set("i", "<C-S-i>", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move line up" })
    keymap.set("i", "<C-S-k>", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move line down" })
end

-- ─── Window Management ──────────────────────────────────────────────────────

keymap.set("n", "<leader>wsv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>wsh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>w=", "<C-w>=", { desc = "Equalize split sizes" })
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>wj", "<C-w>h", { desc = "Move cursor to left window" })
keymap.set("n", "<leader>wk", "<C-w>l", { desc = "Move cursor to right window" })
keymap.set("n", "<leader>wh", "<C-w>99h", { desc = "Move cursor to first window" })
keymap.set("n", "<leader>wl", "<C-w>99l", { desc = "Move cursor to last window" })
keymap.set("n", "<leader>wu", "<C-w><Up>", { desc = "Move cursor up a window" })
keymap.set("n", "<leader>w,", "<C-w><Down>", { desc = "Move cursor down a window" })
keymap.set("n", "<leader>wn", "<C-w><C-x>", { desc = "Swap window with the one to the right" })

-- Resize splits (Tab+k/i/j/l)
vim.api.nvim_set_keymap("n", "<Char-011>k", ":resize +4<CR>",
    { noremap = true, silent = true, desc = "Resize window height +" })
vim.api.nvim_set_keymap("n", "<Char-011>i", ":resize -4<CR>",
    { noremap = true, silent = true, desc = "Resize window height -" })
vim.api.nvim_set_keymap("n", "<Char-011>l", ":vertical resize -4<CR>",
    { noremap = true, silent = true, desc = "Resize window width -" })
vim.api.nvim_set_keymap("n", "<Char-011>j", ":vertical resize +4<CR>",
    { noremap = true, silent = true, desc = "Resize window width +" })

-- ─── Tab Management ─────────────────────────────────────────────────────────

keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab (alt)" })
keymap.set("n", "<leader>tk", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tj", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>th", "<cmd>tabfirst<CR>", { desc = "Go to first tab" })
keymap.set("n", "<leader>tl", "<cmd>tablast<CR>", { desc = "Go to last tab" })
keymap.set("n", "<leader>ti", "<cmd>tabmove +1<CR>", { desc = "Move tab right" })
keymap.set("n", "<leader>tu", "<cmd>tabmove -1<CR>", { desc = "Move tab left" })
keymap.set("n", "<leader>tb", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- ─── Clipboard (Mac / Linux) ────────────────────────────────────────────────

if vim.fn.has("mac") == 1 then
    -- Copy line (with / without trailing newline)
    keymap.set("n", "<leader>cL", '"*yy', { desc = "Copy line to clipboard, with CRLF" })
    keymap.set("v", "<leader>cL", '"*y', { desc = "Copy selection to clipboard, with CRLF" })
    keymap.set("n", "<leader>cl", 'mz^"*y$`z', { desc = "Copy line to clipboard, without CRLF" })
    keymap.set("v", "<leader>cl", 'mz^"*y$`z', { desc = "Copy line to clipboard, without CRLF" })

    keymap.set("n", "<leader>cc", '"*y', { desc = "Clipboard copy" })
    keymap.set("v", "<leader>cc", '"*y', { desc = "Clipboard copy" })
    keymap.set("n", "<leader>cw", '<ESC>viw"*y', { desc = "Clipboard copy word", silent = true })
    keymap.set("n", "<leader>cp", '"*p', { desc = "Clipboard paste" })
    keymap.set("v", "<leader>cp", '"*p', { desc = "Clipboard paste" })

    keymap.set("n", "<leader>cf", 'mzG$"*ygg `z', { desc = "Copy entire file" })
    keymap.set("v", "<leader>cf", 'mzG$"*ygg `z', { desc = "Copy entire file" })

    keymap.set("n", "<leader>pl", 'o<Esc>"*p', { desc = "Paste line below from clipboard" })
    keymap.set("n", "<leader>Pl", 'O<Esc>"*p', { desc = "Paste line above from clipboard" })
else
    -- Linux: uses "+ (X11 clipboard) instead of "*
    keymap.set("n", "<leader>cL", '"+yy', { desc = "Copy line to clipboard, with CRLF" })
    keymap.set("v", "<leader>cL", '"+y', { desc = "Copy selection to clipboard, with CRLF" })
    keymap.set("n", "<leader>cl", 'mz^"+y$`z', { desc = "Copy line to clipboard, without CRLF" })
    keymap.set("v", "<leader>cl", 'mz^"+y$`z', { desc = "Copy line to clipboard, without CRLF" })

    keymap.set("n", "<leader>cc", '"+y', { desc = "Clipboard copy" })
    keymap.set("v", "<leader>cc", '"+y', { desc = "Clipboard copy" })
    keymap.set("n", "<leader>cw", '<ESC>viw"+y', { desc = "Clipboard copy word", silent = true })
    keymap.set("n", "<leader>cp", '"+p', { desc = "Clipboard paste" })
    keymap.set("v", "<leader>cp", '"+p', { desc = "Clipboard paste" })

    keymap.set("n", "<leader>cf", 'mzG$"+ygg `z', { desc = "Copy entire file" })
    keymap.set("v", "<leader>cf", 'mzG$"+ygg `z', { desc = "Copy entire file" })

    keymap.set("n", "<leader>pl", 'o<Esc>"+p', { desc = "Paste line below from clipboard" })
    keymap.set("n", "<leader>Pl", 'O<Esc>"+p', { desc = "Paste line above from clipboard" })
end

-- ─── Diff ───────────────────────────────────────────────────────────────────

vim.keymap.set("n", "<leader>bd", ":diffthis<CR>", { desc = "Enable diff mode for this buffer" })
vim.keymap.set("n", "<leader>bO", ":diffoff!<CR>", { desc = "Disable diff mode for all buffers" })
vim.keymap.set("n", "<leader>bo", ":diffoff<CR>", { desc = "Disable diff mode for this buffer" })

-- ─── Diagnostics ────────────────────────────────────────────────────────────

vim.keymap.set("n", "<leader>lv", function()
    local new_config = not vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = "Toggle diagnostic virtual lines" })

vim.keymap.set("n", "<leader>lt", function()
    local new_config = not vim.diagnostic.config().virtual_text
    vim.diagnostic.config({ virtual_text = new_config })
end, { desc = "Toggle diagnostic virtual text" })

-- ─── Misc / Utility ─────────────────────────────────────────────────────────

keymap.set("n", "<leader>sf", ":source %<CR>", { desc = "Source current file", silent = true })
keymap.set("n", "<leader>sp", ":FzfLua spell_suggest<CR>", { desc = "Spell suggestions", silent = true })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit (:q)" })
keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })

-- Blink completion auto-show toggle
keymap.set("n", "<leader>bay", "<cmd>BlinkAutoShowToggle on<CR>", { desc = "Toggle Blink auto-show ON" })
keymap.set("n", "<leader>ban", "<cmd>BlinkAutoShowToggle off<CR>", { desc = "Toggle Blink auto-show OFF" })

-- Copy current file path to clipboard
-- keymap.set(
--     "n",
--     "<leader>cwf",
--     ':let @+ = expand("%:p")<CR>:lua print("Copied path to: " .. vim.fn.expand("%:p"))<CR>',
--     { desc = "Copy current file name and path", silent = false }
-- )

