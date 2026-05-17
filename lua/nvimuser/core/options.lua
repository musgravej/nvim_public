vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- Line numbers & display
opt.number = true         -- Absolute line number on current line
opt.relativenumber = true -- Relative line numbers for easier motion counts
opt.wrap = false          -- Don't wrap long lines
opt.signcolumn = "yes"    -- Always show sign column (prevents layout shift)
opt.termguicolors = true  -- Enable 24-bit RGB colors
opt.background = "dark"   -- Use dark background variants of colorschemes

-- Indentation
opt.tabstop = 4       -- A tab character counts as 4 spaces
opt.shiftwidth = 4    -- Indent/dedent by 4 spaces with < and >
opt.expandtab = true  -- Insert spaces when Tab is pressed
opt.autoindent = true -- Copy indent from current line on new line

-- Search
opt.ignorecase = true -- Case-insensitive search by default
opt.smartcase = true  -- Switch to case-sensitive when query contains uppercase

-- Editing behavior
opt.iskeyword:append("-")          -- Treat dash-separated words as a single word object
opt.backspace = "indent,eol,start" -- Allow backspace over indentation, line breaks, and insert start
opt.errorbells = false             -- No error bells
-- opt.clipboard:append("unnamedplus") -- Uncomment to sync with system clipboard

-- Splits
opt.splitright = true -- Vertical splits open to the right
opt.splitbelow = true -- Horizontal splits open below

-- Performance
opt.updatetime = 300                          -- Faster CursorHold events (affects gitsigns, hover, etc.)
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Time to wait for mapped key sequence (lower triggers which-key faster)
opt.redrawtime = 10000                        -- Max time for syntax highlighting redraw before giving up
opt.maxmempattern = 20000                     -- Max memory (KB) for pattern matching

-- Folding (treesitter-based)
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldcolumn = "0" -- Hide the fold column
opt.foldlevel = 20   -- Start with most folds open

-- File type detection
-- Docs: https://neovim.io/doc/user/lua.html#vim.filetype.add()
-- Pattern syntax: https://gitspartv.github.io/lua-patterns
vim.filetype.add({
    extension = {
        -- mdx = "mdx",
        tfstate = "json",
        ["tfstate.backup"] = "json",
    },
    filename = {
        ["ci.txt"]   = "requirements",
        ["dev.txt"]  = "requirements",
        ["dist.txt"] = "requirements",
        ["base.txt"] = "requirements",
    },
    pattern = {
        -- Match ".env.example", ".env.local", etc.
        ["%.env%.[%w_.-]+"] = "dotenv",
        -- Match "test_requirements.txt", "1_requirements.txt", etc.
        -- Does NOT match "my requirements.txt" or "requirement_sample.txt"
        ["[%d%a%p]*requirements%.txt"] = { "requirements", { priority = 1 } },
    },
})

-- if vim.loop.os_uname().sysname == "Linux" then
-- end

-- vim.formatoptions.remove('ro')
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "*",
--     callback = function()
--         vim.opt_local.formatoptions:remove('ro')
--     end,
-- })
