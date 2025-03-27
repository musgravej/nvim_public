-- custom command format
-- vim.api.nvim_create_user_command(
--     'Customcommand',
--     function()
--     end,
--     {}
-- )
--

function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
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


-- Run iSort and Black on current buffer
vim.api.nvim_create_user_command('Pyformat', function()
    vim.cmd("silent! | :!isort --profile black -e %")
    vim.cmd("silent! | :!black --line-length 120 %")
end, {})


-- Run iSort and Black on file
vim.api.nvim_create_user_command(
    'Pyformatfile',
    function(opts)
        print(opts.fargs[1])
        vim.cmd("silent! | :!isort --profile black -e " .. opts.fargs[1])
        vim.cmd("silent! | :!black --line-length 120 " .. opts.fargs[1])
    end,
    { nargs = 1}
)

-- Insert checkmark (✔)
vim.api.nvim_create_user_command('Ck', function()
  vim.api.nvim_put({ '✔' }, 'c', true, true)
end, {})

-- Insert checkmark (✔)
vim.api.nvim_create_user_command('Ckm', function()
  vim.api.nvim_put({ '✔' }, 'c', true, true)
end, {})

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
    end,
    { nargs = 0 }
)

-- copy current full file path to clipboard
vim.api.nvim_create_user_command(
    'Filepath',
    function()
        vim.cmd(":let @+ = expand('%:p')")
        vim.cmd("echo 'Copy: ' expand('%:p')")
    end,
    { nargs = 0 }
)

-- display current full file path
vim.api.nvim_create_user_command(
    'ShowFilepath',
    function()
        vim.cmd("echo expand('%:p')")
    end,
    { nargs = 0 }
)

-- copy current file directory path to clipboard
vim.api.nvim_create_user_command(
    'Dirpath',
    function()
        vim.cmd(":let @+ = expand('%:p:h')")
        vim.cmd("echo 'Copy: ' expand('%:p:h')")
    end,
    { nargs = 0 }
)

-- sort entire file, case insensitive
vim.api.nvim_create_user_command(
    'Sortfile',
    function()
        vim.cmd(":sort i")
    end,
    { nargs = 0 }
)

-- display directory path
vim.api.nvim_create_user_command(
    'ShowDirpath',
    function()
        vim.cmd("echo expand('%:p:h')")
    end,
    { nargs = 0 }
)

-- Custom command to disable autocompletion for buffer
vim.api.nvim_create_user_command(
    'Completeoff',
    function()
        vim.cmd(":lua require('cmp').setup.buffer { enabled = false }")
    end,
    { nargs = 0 }
)

-- Custom command to enable autocompletion for buffer
vim.api.nvim_create_user_command(
    'Completeon',
    function()
        vim.cmd(":lua require('cmp').setup.buffer { enabled = true }")
    end,
    { nargs = 0 }
)

-- set current file path as the current working directory
vim.api.nvim_create_user_command(
    'Cwdhere',
    function()
        vim.cmd("lcd%:p:h")
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
vim.keymap.set('n', '<leader>www', [[<Cmd>w<CR>]], { desc = "write file" })

vim.api.nvim_create_user_command(
    'Buffersclear',
    function()
        local current_buf = vim.api.nvim_get_current_buf()
        local visible_buffers = {}

        -- Collect all buffers currently visible in all tabs
        for _, tabpage in ipairs(vim.api.nvim_list_tabpages()) do
            for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tabpage)) do
                local buf = vim.api.nvim_win_get_buf(win)
                visible_buffers[buf] = true
            end
        end

        -- Iterate through all buffers and delete the hidden ones
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if not visible_buffers[buf] then
                vim.api.nvim_buf_delete(buf, { force = true })
            end
        end

        -- Ensure the current buffer remains loaded
        if not vim.api.nvim_buf_is_loaded(current_buf) then
            vim.api.nvim_buf_load(current_buf)
        end
    end,
    { nargs = 0 }
)
