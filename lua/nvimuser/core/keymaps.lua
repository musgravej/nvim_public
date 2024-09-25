-- set leader key to space
vim.g.mapleader = " "
-- vim.g.mapleader = ","

local keymap = vim.keymap -- for conciseness

-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", {desc = "Exit insert mode with jk"})
keymap.set("i", ";;", "<ESC>", {desc = "Exit insert mode with ;;"})

-- remap mark recall
keymap.set("n", "<leader>m", "`", {desc = "Remap mark recall"})

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", {desc = "Clear search highlights"})

-- Shortcut to use blackhole register by default
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

-- New mapping for folds
-- keymap.set("n", "<leader>fo", "<cmd>foldopen<CR>", {desc = "Open a fold"} )
keymap.set("n", ", ", 'za', {desc = "Toggle a fold"} )

-- Shortcut to use clipboard with <leader>
keymap.set("n", "<leader>d", "d")
keymap.set("n", "<leader>x", "x")
keymap.set("n", "<leader>X", "X")
keymap.set("n", "<leader>d", "d")
keymap.set("n", "<leader>D", "D")
keymap.set("n", "<leader>c", "c")
keymap.set("n", "<leader>C", "C")

keymap.set("v", "<leader>x", "_x")
keymap.set("v", "<leader>X", "_X")
keymap.set("v", "<leader>d", "_d")
keymap.set("v", "<leader>D", "_D")
keymap.set("v", "<leader>c", "_c")
keymap.set("v", "<leader>C", "_C")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", {desc = "Split window vertically"}) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", {desc = "Split window horizontally"}) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", {desc = "Make splits equal size"}) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", {desc = "Close current split"}) -- close current split window
keymap.set("n", "<leader>wk", "<C-w>l", {desc = "Move window to the right"}) -- close current split window
keymap.set("n", "<leader>wj", "<C-w>h", {desc = "Move window to the left"}) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", {desc = "Open new tab"}) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", {desc = "Close current tab"}) -- close current tab
keymap.set("n", "<leader>tk", "<cmd>tabn<CR>", {desc = "Go to next tab"}) --  go to next tab
keymap.set("n", "<leader>tj", "<cmd>tabp<CR>", {desc = "Go to previous tab"}) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", {desc = "Open current buffer in new tab"}) --  move current buffer to new tab

-- Move lines up or down
if vim.fn.has("mac") == 1 then
    -- MacOS
    -- Normal Mode
    keymap.set("n", "<C-S-k>", "<cmd>m .-2<CR>", {desc = "Move line up"})
    keymap.set("n", "<C-S-j>", "<cmd>m .+1<CR>", {desc = "Move line down"})
    -- Insert Mode
    keymap.set("i", "<C-S-k>", "<Esc><cmd>m .-2<CR>==gi", {desc = "Move line up"})
    keymap.set("i", "<C-S-j>", "<Esc><cmd>m .+1<CR>==gi", {desc = "Move line down"})
    -- Visual Line Mode
    keymap.set("v", "<C-S-j>", ":m '>+1<CR>gv=gv", {desc = "Move line down, Visual Mode"})
    keymap.set("v", "<C-S-k>", ":m '<-2<CR>gv=gv", {desc = "Move line up, Visual Mode"})
else
    -- Linux
    -- Normal Mode
    keymap.set("n", "<A-S-k>", "<cmd>m .-2<CR>", {desc = "Move line up"})
    keymap.set("n", "<A-S-j>", "<cmd>m .+1<CR>", {desc = "Move line down"})
    -- Insert Mode
    keymap.set("i", "<A-S-k>", "<Esc><cmd>m .-2<CR>==gi", {desc = "Move line up"})
    keymap.set("i", "<A-S-j>", "<Esc><cmd>m .+1<CR>==gi", {desc = "Move line down"})
    -- Visual Mode
    keymap.set("v", "<A-S-k>", "<cmd>m '<-2<CR>gv=gv", {desc = "Move line up"})
    keymap.set("v", "<A-S-j>", "<cmd>m '>+1<CR>gv=gv", {desc = "Move line down"})
end

-- Toggle Term
keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", {desc = "Toggle Terminal"})

-- copy to clipboard
-- *copy *line (with cr, without)
keymap.set("n", '<leader>cL', '"*yy', {desc = "Copy line to clipboard, with CRLF"})
keymap.set("v", '<leader>cL', '"*y', {desc = "Copy line to clipboard, with CRLF"})

keymap.set("n", "<leader>cl", 'mz^"*y$`z', {desc = "Copy line to clipboard, without CRLF"})
keymap.set("v", "<leader>cl", 'mz^"*y$`z', {desc = "Copy line to clipboard, without CRLF"})

-- copy file
keymap.set("n", "<leader>cf", 'mzG$"*ygg `z', { desc = "Copy entire file" })
keymap.set("v", "<leader>cf", 'mzG$"*ygg `z', { desc = "Copy entire file" })

-- *paste *line (above, below)
keymap.set("n", "<leader>pl", 'o<Esc>"*p', { desc = "Paste line below, from clipboard" })
keymap.set("n", "<leader>Pl", 'O<Esc>"*p', { desc = "Paste line above, from clipboard" })

-- Scroll and Center
keymap.set("n", "<C-u>", "<C-u>zz", {desc = "Scroll up and center"})
keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Scroll down and center"})

-- Search and center
keymap.set("n", "n", "nzzzv", {desc = "Search and center"})
keymap.set("n", "N", "Nzzzv", {desc = "Search and center"})

-- Move to first non-blank
keymap.set("n", "<BS>", "^", {desc = "Move to first non-blank character"})
keymap.set("n", "<S-BS>", "$", {desc = "Move to the end of the line"})

-- Convenience Search
keymap.set("n", "<leader>ss", ":s/\\v", {desc = "Search and replace on line"})
keymap.set("n", "<leader>SS", ":%s/\\v", {desc = "Search and replace on file"})
keymap.set("v", "<leader>sV", ":s/\\%V", {desc = "Search and replace, only in visual selection"})
keymap.set("v", "<C-S-d>", '"hy:%s/\\v<C-r>h//g<left><left>', {desc= "Change selected text, whole file"})
keymap.set("v", "<C-d>", '"hy:%s/\\v<C-r>h//c<left><left>', {desc= "Change selected text, with confirmation"})

-- Paste from register (register, paste)
keymap.set(
    "i", "<leader>rp",
    function() require("telescope.builtin").registers() end,
    {remap = true, silent = false, desc = "Paste from register prompt"}
)
keymap.set(
    "n", "<leader>rp",
    function() require("telescope.builtin").registers() end,
    {remap = true, silent = false, desc = "Paste from register prompt"}
)

-- Copy current file to buffer
keymap.set(
    "n",
    "<leader>cwf",
    ':let @+ = expand("%:p")<CR>:lua print("Copied path to: " .. vim.fn.expand("%:p"))<CR>',
    { desc = "Copy current file name and path", silent = false}
)
