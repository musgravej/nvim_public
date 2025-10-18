-- install markdown-preview.nvim without yarn or npm
-- return {
--     'iamcco/markdown-preview.nvim',
--     -- :Lazy build markdown-preview.nvim
--     cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
--     ft = { 'markdown' },
--     build = function()
--         vim.fn['mkdp#util#install']()
--     end,
-- }
--
-- install with yarn or npm
-- npm install -g yarn
-- cd $HOME/.local/share/nvim/lazy/markdown-preview.nvim && yarn install
return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
}
