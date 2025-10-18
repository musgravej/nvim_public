return {
    "benomahony/oil-git.nvim",
    dependencies = { "stevearc/oil.nvim" },
    -- No opts or config needed! Works automatically
    config = function()
        require("oil-git").setup({
            highlights = {
                OilGitAdded = { fg = "#a6e3a1" }, -- green
                OilGitModified = { fg = "#f9e2af" }, -- yellow
                OilGitRenamed = { fg = "#cba6f7" }, -- purple
                OilGitUntracked = { fg = "#89b4fa" }, -- blue
                OilGitIgnored = { fg = "#6c7086" }, -- gray
            }
        })
    end
}

