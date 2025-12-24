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

vim.api.nvim_create_user_command(
    'Clearregister',
    function(opts)
        vim.cmd("silent! | :let @" .. opts.fargs[1] .. "=''")
    end,
    { nargs = 1 }
)

vim.api.nvim_create_user_command(
    'Setregister',
    function(opts)
        vim.cmd(":let @" .. opts.fargs[1] .. "=" .. opts.fargs[2])
    end,
    { nargs = 1 }
)

-- Run iSort and Black on current buffer
vim.api.nvim_create_user_command('Pyformat', function()
    vim.cmd("silent! | :!isort --profile black -e %")
    vim.cmd("silent! | :!black --line-length 120 %")
end, {})


-- Run iSort and Black on file
vim.api.nvim_create_user_command(
    'Pyformatfile',
    function(opts)
        vim.cmd("silent! | :!isort --profile black -e " .. opts.fargs[1])
        vim.cmd("silent! | :!black --line-length 120 " .. opts.fargs[1])
    end,
    { nargs = 1 }
)

function Virtualtext(state)
    -- Ensure the argument is either 'on' or 'off' (case-insensitive)
    local lower_state = string.lower(state or '')

    if lower_state == 'on' then
        -- Set virtual_text to true (turn on)
        vim.diagnostic.config({
            virtual_text = true,
            -- You might want to include other diagnostic config options here
        })
        print("Neovim diagnostic virtual text is **ON**.")
    elseif lower_state == 'off' then
        -- Set virtual_text to false (turn off)
        vim.diagnostic.config({
            virtual_text = false,
            -- You might want to include other diagnostic config options here
        })
        print("Neovim diagnostic virtual text is **OFF**.")
    else
        -- Handle invalid argument
        print("Invalid argument for Virtualtext. Use 'on' or 'off'.")
    end
end

function Virtuallines(state)
    -- Ensure the argument is either 'on' or 'off' (case-insensitive)
    local lower_state = string.lower(state or '')

    if lower_state == 'on' then
        -- Set virtual_text to true (turn on)
        vim.diagnostic.config({
            virtual_lines = true,
            -- You might want to include other diagnostic config options here
        })
        print("Neovim diagnostic virtual lines is **ON**.")
    elseif lower_state == 'off' then
        -- Set virtual_lines to false (turn off)
        vim.diagnostic.config({
            virtual_lines = false,
            -- You might want to include other diagnostic config options here
        })
        print("Neovim diagnostic virtual lines is **OFF**.")
    else
        -- Handle invalid argument
        print("Invalid argument for Virtuallines. Use 'on' or 'off'.")
    end
end

vim.api.nvim_create_user_command('VirtualtextToggle', function(opts)
    Virtualtext(opts.args)
end, {
    nargs = 1,
    complete = function(arglead, cmdline, cursorpos)
        return { 'on', 'off' }
    end
})

vim.api.nvim_create_user_command('VirtuallinesToggle', function(opts)
    Virtuallines(opts.args)
end, {
    nargs = 1,
    complete = function(arglead, cmdline, cursorpos)
        return { 'on', 'off' }
    end
})

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
        vim.cmd(":lua require('blink.cmp').setup { enabled = false }")
    end,
    { nargs = 0 }
)

-- Custom command to enable autocompletion for buffer
vim.api.nvim_create_user_command(
    'Completeon',
    function()
        vim.cmd(":lua require('blink.cmp').setup { enabled = true }")
    end,
    { nargs = 0 }
)

-- Function to toggle blink completion auto_show
function BlinkAutoShowToggle(state)
    local blink = require('blink.cmp')

    if state then
        -- Use the provided state (on/off)
        local lower_state = string.lower(state)

        if lower_state == 'on' then
            blink.setup({
                completion = {
                    menu = {
                        auto_show = true
                    }
                }
            })
            print("Blink completion auto_show is **ON**.")
        elseif lower_state == 'off' then
            blink.setup({
                completion = {
                    menu = {
                        auto_show = false
                    }
                }
            })
            print("Blink completion auto_show is **OFF**.")
        else
            print("Invalid argument for BlinkAutoShowToggle. Use 'on' or 'off'.")
        end
    else
        -- Toggle current state
        local current_config = blink.config.completion.menu.auto_show
        local new_state = not current_config

        blink.setup({
            completion = {
                menu = {
                    auto_show = new_state
                }
            }
        })

        print("Blink completion auto_show is **" .. (new_state and "ON" or "OFF") .. "**.")
    end
end

-- User command to toggle blink auto_show with optional on/off parameter
vim.api.nvim_create_user_command('BlinkAutoShowToggle', function(opts)
    if opts.args and opts.args ~= "" then
        BlinkAutoShowToggle(opts.args)
    else
        BlinkAutoShowToggle()
    end
end, {
    nargs = '?',
    complete = function(arglead, cmdline, cursorpos)
        return { 'on', 'off' }
    end
})

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

-- Function to change directory the Carium notes directory
vim.api.nvim_create_user_command(
    'Gonotesdir',
    function()
        vim.cmd(":cd ~/Carium/job_notes/")
    end,
    { nargs = 0 }
)

-- Function to change directory to the profiles directory
vim.api.nvim_create_user_command(
    'Goprofilesdir',
    function()
        vim.cmd(":cd ~/github/profiles/profiles/")
    end,
    { nargs = 0 }
)

-- Function to change directory to the github directory
vim.api.nvim_create_user_command(
    'Gogithubpath',
    function(opts)
        vim.cmd(":cd ~/github/" .. opts.fargs[1])
    end,
    { nargs = 1 }
)
