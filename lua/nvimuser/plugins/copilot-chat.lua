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
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-treesitter/nvim-treesitter" },
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    vim.keymap.set({"n", "v"}, "<leader>pc", "<cmd>CopilotChat<cr>", { desc = "Open Copilot Chat" }),
    -- See Commands section for default commands if you want to lazy load on them
  },
}
