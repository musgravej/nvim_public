vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true
-- opt

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
-- opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
-- vim.opt.foldtext = ""
vim.opt.foldlevel = 20
--
-- remove whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function()
        SAVE_CURSOR = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", SAVE_CURSOR)
    end,
})

vim.filetype.add({
  -- Detect and assign filetype based on the extension of the filename
  extension = {
    -- mdx = "mdx",
  },
  -- Detect and apply filetypes based on the entire filename
  filename = {
    ["ci.txt"] = "requirements",
    ["dev.txt"] = "requirements",
    ["dist.txt"] = "requirements",
    ["base.txt"] = "requirements",
  },
  -- Detect and apply filetypes based on certain patterns of the filenames
  pattern = {
    -- Match filenames like - ".env.example", ".env.local" and so on
    -- ["%.env%.[%w_.-]+"] = "dotenv",
  },
})

-- vim.formatoptions.remove('ro')
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "*",
--     callback = function()
--         vim.opt_local.formatoptions:remove('ro')
--     end,
-- })
