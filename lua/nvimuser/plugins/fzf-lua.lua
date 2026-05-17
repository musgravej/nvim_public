return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- calling `setup` is optional for customization
        -- require("fzf-lua").setup({})
        -- require("fzf-lua").lsp_finder({})

        local keymap = vim.keymap

        keymap.set("n", "<leader>ch", "<cmd>FzfLua command_history<cr>", { desc = "[C]ommand [h]istory" })
        keymap.set("n", "<leader>fI", "<cmd>FzfLua live_grep resume=true<cr>", { desc = "[F]ind [I]nteractive grep resume" })
        keymap.set("n", "<leader>fR", "<cmd>FzfLua registers<cr>", { desc = "[F]ind [R]egisters" })
        keymap.set("n", "<leader>fl", "<cmd>FzfLua grep_last<cr>", { desc = "[F]ind [L]ast Search pattern" })
        keymap.set("n", "<leader>fS", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "[F]ind all document [S]ymbols" })
        keymap.set("n", "<leader>fT", "<cmd>TodoFzfLua<cr>", { desc = "[F]ind [T]odos" })
        keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "[F]ind [b]uffers" })
        keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "[F]ind [f]iles in cwd" })
        keymap.set("n", "<leader>fw", "<cmd>FzfLua grep_cword<cr>", { desc = "[F]ind [w]ord in project" })
        keymap.set("n", "<leader>fh", "<cmd>FzfLua grep_curbuf<cr>", { desc = "[F]ind fuzzy [h]ere (in buffer)" })
        keymap.set("n", "<leader>fi", "<cmd>FzfLua live_grep<cr>", { desc = "[F]ind [i]nteractive grep" })
        keymap.set("n", "<leader>fm", "<cmd>FzfLua marks<cr>", { desc = "[F]ind [m]arks" })
        keymap.set("n", "<leader>fo", "<cmd>FzfLua oldfiles<cr>", { desc = "[F]ind [o]ld files" })
        keymap.set("n", "<leader>fp", "<cmd>FzfLua grep_project<cr>", { desc = "[F]ind string in [p]roject files" })
        keymap.set("n", "<leader>fr", "<cmd>FzfLua lsp_references<cr>", { desc = "[F]ind [r]eferences" })
        keymap.set("n", "<leader>fu", "<cmd>FzfLua lsp_references<cr>", { desc = "[F]ind [u]sages" })
        keymap.set("n", "<leader>ft", "<cmd>TodoFzfLua<cr>", { desc = "[F]ind [t]odos" })
        keymap.set("n", "<leader>gS", "<cmd>FzfLua git_status<cr>", { desc = "[G]it files [S]tatus" })
        keymap.set("n", "z=", "<cmd>FzfLua spell_suggest<cr>", { desc = "Spell suggestions" })
    end
}
