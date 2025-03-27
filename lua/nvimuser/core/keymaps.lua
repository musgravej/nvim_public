-- https://neovim.io/doc/user/map.html
-- Mac
-- A: Ctrl Key
-- S: Shift Key
--
-- help: key-notation
--
-- set leader key to space
vim.g.mapleader = " "
-- vim.g.mapleader = ","

local keymap = vim.keymap

-- Test kemaps here
-- keymap.set("n", "<Bslash>", ":echo 'hello world'<CR>", {})

-- General Keymaps -------------------

keymap.set("n", "<leader>ss", ":FzfLua spell_suggest<CR>", { desc = "Suggest spelling", silent = true})
keymap.set("n", "<leader>sf", ":source %<CR>", { desc = "Source this file", silent = true})

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("i", ";;", "<ESC>", { desc = "Exit insert mode with ;;" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Fast quit, alias for :q" })

-- remap mark recall
keymap.set("n", "<leader>m", "`", { desc = "Remap mark recall" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights", silent = true })
keymap.set("n", " ,", ":nohl<CR>", { desc = "Clear search highlights", silent = true })

-- hacky remap jump to start / end of functions
keymap.set("n", "[e", ":exe 'normal [m'<CR>", { desc = "Previous method start", silent = true})
keymap.set("n", "]e", ":exe 'normal ]m'<CR>", { desc = "Next method start", silent = true})
keymap.set("n", "[r", ":exe 'normal [M'<CR>", { desc = "Previous method end", silent = true})
keymap.set("n", "]r", ":exe 'normal ]M'<CR>", { desc = "Next method end", silent = true})

-- New mapping for folds
-- keymap.set("n", "<leader>fo", "<cmd>foldopen<CR>", {desc = "Open a fold"} )
keymap.set("n", ", ", 'za', { desc = "Toggle a fold" })

-- Shortcut to use clipboard with <leader>
keymap.set("n", "<leader>d", "d")
keymap.set("n", "<leader>x", "x")
keymap.set("n", "<leader>X", "X")
keymap.set("n", "<leader>d", "d")
keymap.set("n", "<leader>D", "D")
keymap.set("n", "<leader>c", "c")
keymap.set("n", "<leader>C", "C")

keymap.set("v", "<leader>x", "x")
keymap.set("v", "<leader>X", "X")
keymap.set("v", "<leader>d", "d")
keymap.set("v", "<leader>D", "D")
keymap.set("v", "<leader>c", "c")
keymap.set("v", "<leader>C", "C")
--
-- Shortcut to use black hole register by default
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
--

-- window management (split)
keymap.set("n", "<leader>wsv", "<C-w>v", { desc = "Copy buffer (window) to new vertical split" }) -- split window vertically
keymap.set("n", "<leader>wsh", "<C-w>s", { desc = "Copy buffer (window) to new horizontal split" }) -- split window horizontally
keymap.set("n", "<leader>w=", "<C-w>=", { desc = "Window split splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split (window)" }) -- close current split window
keymap.set("n", "<leader>wk", "<C-w>l", { desc = "Move cursor right window" })
keymap.set("n", "<leader>wj", "<C-w>h", { desc = "Move cursor left window" })
keymap.set("n", "<leader>wl", "<C-w>99l", { desc = "Move cursor to the last window" })
keymap.set("n", "<leader>wh", "<C-w>99h", { desc = "Move cursor to the first window" })
keymap.set("n", "<leader>wu", "<C-w><Up>", { desc = "Move cursor up window" })
keymap.set("n", "<leader>wd", "<C-w><Down>", { desc = "Move cursor down window" })
keymap.set("n", "<leader>wn", "<C-w><C-x>", { desc = "Swap window next to the right" })

-- tab management
keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab (tab, new)" }) -- open new tab
keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close current tab (tab, close)" }) -- close current tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab (tab, exit)" }) -- close current tab
keymap.set("n", "<leader>tk", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tj", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>th", "<cmd>tabfirst<CR>", { desc = "Go to first tab" }) --  go to first tab
keymap.set("n", "<leader>tl", "<cmd>tablast<CR>", { desc = "Go to last tab" }) --  go to last tab
keymap.set("n", "<leader>ti", "<cmd>tabmove<CR>", { desc = "Move tab to the right" }) --  move tab to the right
keymap.set("n", "<leader>tu", "<cmd>tabmove -1<CR>", { desc = "Move tab to the left" }) -- move tab to the left
keymap.set("n", "<leader>tb", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab (tab, buffer)" }) --  move current buffer to new tab

-- Set for deletion, once fully tested
-- Move lines up or down
if vim.fn.has("mac") == 1 then
    -- Normal Mode
    keymap.set("n", "<C-S-i>", "<cmd>m .-2<CR>", { desc = "Move line up" })
    keymap.set("n", "<C-S-k>", "<cmd>m .+1<CR>", { desc = "Move line down" })
    -- Visual Line Mode
    keymap.set("v", "<C-S-i>", ":m '<-2<CR>gv=gv", { desc = "Move line up, Visual Mode", silent = true })
    keymap.set("v", "<C-S-k>", ":m '>+1<CR>gv=gv", { desc = "Move line down, Visual Mode", silent = true  })
    -- Insert Mode
    keymap.set("i", "<C-S-i>", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move line up" })
    keymap.set("i", "<C-S-k>", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move line down" })
-- else
    -- Linux
    -- Normal Mode
    -- keymap.set("n", "<M-i>", "<cmd>m .-2<CR>", { desc = "Move line up" })
    -- keymap.set("n", "<M-k>", "<cmd>m .+1<CR>", { desc = "Move line down" })
    -- Insert Mode
    -- keymap.set("i", "<C-S-i>", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move line up" })
    -- keymap.set("i", "<C-S-k>", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move line down" })
    -- Visual Mode
    -- keymap.set("v", "<C-S-i>", "<cmd>m '<-2<CR>gv=gv", { desc = "Move line up" })
    -- keymap.set("v", "<C-S-k>", "<cmd>m '>+1<CR>gv=gv", { desc = "Move line down" })
 end

-- Toggle Term
keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", {desc = "Toggle Terminal"})

-- Go Back to previously opened file
keymap.set("n", "<leader>gb", "<C-^>", {desc = "Go Back to previously opened file"})

-- copy to clipboard
-- *copy *line (with cr, without)
keymap.set("n", '<leader>cL', '"*yy', { desc = "Copy line to clipboard, with CRLF" })
keymap.set("v", '<leader>cL', '"*y', { desc = "Copy line to clipboard, with CRLF" })

keymap.set("n", "<leader>cl", 'mz^"*y$`z', { desc = "Copy line to clipboard, without CRLF" })
keymap.set("v", "<leader>cl", 'mz^"*y$`z', { desc = "Copy line to clipboard, without CRLF" })

-- Use these for common copy / paste commands
-- *clipboard *copy
keymap.set("n", "<leader>cc", '"*y', { desc = "Clipboard Copy"})
keymap.set("v", "<leader>cc", '"*y', { desc = "Clipboard Copy"})

-- *clipboard *copy word
keymap.set("n", "<leader>cw", '<ESC>viw"*y', { desc = "Clipboard Copy this word", silent = true})

-- *clipboard *paste
keymap.set("n", "<leader>cp", '"*p', { desc = "Clipboard Paste"})
keymap.set("v", "<leader>cp", '"*p', { desc = "Clipboard Paste"})

-- *copy *file
keymap.set("n", "<leader>cf", 'mzG$"*ygg `z', { desc = "Copy entire file" })
keymap.set("v", "<leader>cf", 'mzG$"*ygg `z', { desc = "Copy entire file" })

-- *paste *line (above, below)
keymap.set("n", "<leader>pl", 'o<Esc>"*p', { desc = "Paste line below, from clipboard" })
keymap.set("n", "<leader>Pl", 'O<Esc>"*p', { desc = "Paste line above, from clipboard" })

-- Page Up / Down and center
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })

-- Page Up / Down and center TODO: remap this to easy yank / paste register?
-- keymap.set("n", "<C-u>", "<Nop>", { desc = "Convenience copy to register" })
-- keymap.set("n", "<C-p>", "<Nop>", { desc = "Convenience paste to register" })

-- Convenience yanks to start / end of line
keymap.set("n", "<leader>yy", "y^", { desc = "Convenience yank, to start of line" })
keymap.set("n", "<leader>yY", "y$", { desc = "Convenience yank, to end of line" })

-- Scroll and Center
keymap.set("n", "<C-b>", "<C-b>zz", { desc = "Scroll back and center" })
keymap.set("n", "<C-f>", "<C-f>zz", { desc = "Scroll forward and center" })

-- Search and center
keymap.set("n", "n", "nzzzv", { desc = "Search and center" })
keymap.set("n", "N", "Nzzzv", { desc = "Search and center" })

-- Move to first non-blank
keymap.set("n", "<BS>", "^", { desc = "Move to first non-blank character" })
keymap.set("n", "<S-BS>", "$", { desc = "Move to the end of the line" })

-- Convenience Search
keymap.set("n", "<leader>srl", ":s/\\v", { desc = "Search and replace on line" })
keymap.set("n", "<leader>srf", ":%s/\\v", { desc = "Search and replace on file" })
keymap.set("v", "<leader>srv", ":s/\\%V", { desc = "Search and replace, only in visual selection" })
-- Replace selected text
keymap.set("v", "<leader>c*", '"hy:%s/\\v<C-r>h//g<left><left>', { desc = "Change selection text, whole file" })
keymap.set("v", "<leader>c#", '"hy:%s/\\v<C-r>h//c<left><left>', { desc = "Change selection text, with confirmation" })
--
-- Duplicates current line, keeps unnamed register (copy a line without losing last register)
keymap.set("n", "<leader>rl", '<cmd>let @q=@"<CR>"0yyP<cmd>let @"=@q<CR>', { desc = "Repeat current line above" })
-- keymap.set("n", "<leader>R", "", { desc = "Duplicate current line above, with auto comment" })

-- Paste from register (register, paste), bring up register list
keymap.set(
    "n", "<leader>rp",
    function() require("telescope.builtin").registers() end,
    { remap = true, silent = false, desc = "Paste from register prompt" }
)

-- Copy current file to buffer
-- keymap.set(
--     "n",
--     "<leader>cwf",
--     ':let @+ = expand("%:p")<CR>:lua print("Copied path to: " .. vim.fn.expand("%:p"))<CR>',
--     { desc = "Copy current file name and path", silent = false }
-- )

-- Resize splits (<Tab-> k, i, k, l)
vim.api.nvim_set_keymap("n", "<Char-011>k", ":resize +4<CR>", { noremap = true, silent = true, desc = "Resize window height +"})
vim.api.nvim_set_keymap("n", "<Char-011>i", ":resize -4<CR>", { noremap = true, silent = true, desc = "Resize window height -"})
vim.api.nvim_set_keymap("n", "<Char-011>l", ":vertical resize -4<CR>", { noremap = true, silent = true, desc = "Resize window width +" })
vim.api.nvim_set_keymap("n", "<Char-011>j", ":vertical resize +4<CR>", { noremap = true, silent = true, desc = "Resize window width -" })
