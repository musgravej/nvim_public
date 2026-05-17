-- ## Copilot Configuration Options───
local function is_work_machine(val)
    work_computers = { 'foo.local' }
    for index, value in ipairs(work_computers) do
        if value == val then
            return true
        end
    end
    return false
end

local is_work_computer = is_work_machine(vim.uv.os_gethostname())

return {
    {
        -- Key Mappings
        -- Default mappings in the chat interface:
        --
        -- Insert	Normal	Action
        -- <Tab>	-	Trigger/accept completion menu for tokens
        -- <C-c>	q	Close the chat window
        -- <C-l>	<C-l>	Reset and clear the chat window
        -- <C-s>	<CR>	Submit the current prompt
        -- -	grr	Toggle sticky prompt for line under cursor
        -- -	grx	Clear all sticky prompts in prompt
        -- <C-y>	<C-y>	Accept nearest diff
        -- -	gj	Jump to section of nearest diff
        -- -	gqa	Add all answers from chat to quickfix list
        -- -	gqd	Add all diffs from chat to quickfix list
        -- -	gy	Yank nearest diff to register
        -- -	gd	Show diff between source and nearest diff
        -- -	gi	Show info about current chat
        -- -	gc	Show current chat context
        -- -	gh	Show help message

        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "github/copilot.vim" },                                -- or zbirenbaum/copilot.lua
            { "nvim-treesitter/nvim-treesitter" },
            { "nvim-lua/plenary.nvim",          branch = "master" }, -- for curl, log and async functions
        },
        enabled = is_work_computer,
        build = "make tiktoken",                                     -- Only on MacOS or Linux
        opts = {
            window = {
                layout = 'float',
                width = 100,         -- Fixed width in columns
                height = 30,        -- Fixed height in rows
                border = 'rounded', -- 'single', 'double', 'rounded', 'solid'
                title = '🤖 AI Assistant',
                zindex = 100,       -- Ensure window stays on top
            },

            headers = {
                user = '👤 You',
                assistant = '🤖 Copilot',
                tool = '🔧 Tool',
            },

            separator = '━━',
            auto_fold = true, -- Automatically folds non-assistant messages
        },
        -- See Commands section for default commands if you want to lazy load on them
        vim.keymap.set({ "n", "v" }, "<leader>oc", "<cmd>CopilotChat<cr>", { desc = "[O]pen [c]opilot chat" }),
        vim.keymap.set({ "n", "v" }, "<leader>oC", "<cmd>CopilotChatClose<cr>", { desc = "[O]pen [C]lose copilot chat" }),
        vim.keymap.set({ "n", "v" }, "<leader>ot", "<cmd>CopilotChatToggle<cr>", { desc = "[O]pen [t]oggle copilot chat" }),
    },
}
