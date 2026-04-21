# Vim environment notes for config files
* Examples printing to console:
    - `:lua print("hello world")`
    - `:lua print(vim.uv.os_gethostname())`
    - `:lua print(vim.inspect(vim.api))`
        - use `inspect` to print tables in a readable format
    - `:messages` - view all messages printed to the console

# Getting information about your computer and environment:
* `vim.uv.os_uname().sysname` - "Linux", "Darwin", etc
    - use for Neovim > 0.10
* `jit.os` - "Linux", "OSX", "Windows"
    - use for Neovim <= 0.10
* `vim.fn.has()` - check for specific features or OS
    - `vim.fn.has("win32")` - returns 1 if on Windows
    - `vim.fn.has("mac")` - returns 1 if on macOS
    - `vim.fn.has("unix")` - returns 1 if on Unix/Linux
* `vim.uv.os_gethostname()` - get the hostname of the machine
    - useful for setting up machine-specific configurations
    - ex: "CorpLaptop-1", "Jim's Home-PC", "WorkDesktop-2"

# Using OS information in config files:
```lua
-- Default keymaps
keymap.set("n", "<leader>ch", "<cmd>Telescope command_history<cr>", { desc = "[C]ommand [h]istory" })

-- OS keymap
if vim.uv.os_uname().sysname == "Linux" then
    keymap.set("n", "<leader>ch", "<cmd>FzfLua command_history<cr>", { desc = "[C]ommand [h]istory" })
end

-- OS keymap
if jit.os == "Windows" then
    keymap.set("n", "<leader>ch", "<cmd>FzfLua command_history<cr>", { desc = "[C]ommand [h]istory" })
end
```

# Lazy plugins
```lua
-- Machine-specific configuration, lazy.nvim
local hostname = vim.uv.os_gethostname()

return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    ...
    enabled = hostname == "MyWorkComputer-1123",
}
```

```lua
-- Machine-specific configuration, lazy.nvim

local function is_work_machine(val)
    work_computers = {'MyWorkComputer-1123', 'ENIAC-1'}
    for index, value in ipairs(work_computers) do
        if value == val then
            return true
        end
    end
    return false
end

local is_work_computer = is_work_machine(vim.uv.os_gethostname())

return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    ...
    enabled = is_work_computer,
}
```
