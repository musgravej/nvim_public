return {
    'nvim-mini/mini.nvim',
    version = false,
    config = function()
        -- mini.ai
        require("mini.ai").setup({
            -- Extend and create a/i textobjects
            --
            -- It enhances some builtin textobjects (like a(, a), a', and more), creates new ones (like a*, a<Space>, af, a?, and more),
            -- and allows user to create their own (like based on treesitter, and more).
            -- Supports dot-repeat, v:count, different search methods, consecutive application, and customization via Lua patterns or functions.
            -- Has builtins for brackets, quotes, function call, argument, tag, user prompt, and any punctuation/digit/whitespace character.
            -- Ex: vin[ - visual select inside next [
            -- Ex: v3in[ - visual select inside 3rd next [
        })
        require("mini.operators").setup({
            -- Each entry configures one operator.
            -- `prefix` defines keys mapped during `setup()`: in Normal mode
            -- to operate on textobject and line, in Visual - on selection.
            -- Evaluate text and replace with output
            exchange = {
                -- NOTE: Default `gx` is remapped to `gX`
                prefix = 'gx',
                -- Whether to reindent new text to match previous indent
                reindent_linewise = true,
            },
            -- Exchange text regions
            evaluate = {
                prefix = 'g=',
                -- Function which does the evaluation
                func = nil,
            },
            -- Multiply (duplicate) text
            multiply = {
                prefix = 'gm',
                -- Function which can modify text before multiplying
                func = nil,
            },
            -- Replace text with register
            replace = {
                -- NOTE: Default `gr*` LSP mappings are removed
                prefix = 'gr',
                -- Whether to reindent new text to match previous indent
                reindent_linewise = true,
            },
            -- Sort text
            sort = {
                prefix = 'gs',
                -- Function which does the sort
                func = nil,
            }
        })
        -- require("mini.splitjoin").setup({})
    end
}
