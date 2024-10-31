function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    -- vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    -- terminal commands
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
    vim.keymap.set('t', '<C-S>t', [[<Cmd>ToggleTerm<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- TODO Need function to save keymaps to file

-- A better way to do this?
-- format current json file
vim.api.nvim_create_user_command(
  'Jsonfix',
  function()
        vim.cmd("silent! :%s/\\cFalse/false/g")
        vim.cmd("silent! :%s/\\cNone/null/g")
        vim.cmd("silent! :%s/\\cTrue/true/g")
        -- vim.cmd("silent! :%!jq --indent 4 .")
        -- vim.cmd(vim.lsp.buf.format)
  end,
  { nargs = 0 }
)

-- copy current full file path to clipboard
vim.api.nvim_create_user_command(
  'Filepath',
  function()
        vim.cmd(":let @+ = expand('%:p')")
  end,
  { nargs = 0 }
)

-- copy current file directory path to clipboard
vim.api.nvim_create_user_command(
  'Dirpath',
  function()
        vim.cmd(":let @+ = expand('%:h')")
  end,
  { nargs = 0 }
)

-- copy current file name to clipboard
vim.api.nvim_create_user_command(
  'Filename',
  function()
        vim.cmd(":let @+ = expand('%:t')")
  end,
  { nargs = 0 }
)

-- save from insert mode
vim.keymap.set('n', '<leader>www', [[<Cmd>w<CR>]])

