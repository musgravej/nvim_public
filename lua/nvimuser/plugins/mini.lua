return {
    'nvim-mini/mini.nvim',
    version = false,
    config = function()
        -- mini.ai
        require("mini.ai").setup({})
        -- Extend and create a/i textobjects
        --
        -- It enhances some builtin textobjects (like a(, a), a', and more), creates new ones (like a*, a<Space>, af, a?, and more),
        -- and allows user to create their own (like based on treesitter, and more).
        -- Supports dot-repeat, v:count, different search methods, consecutive application, and customization via Lua patterns or functions.
        -- Has builtins for brackets, quotes, function call, argument, tag, user prompt, and any punctuation/digit/whitespace character.
        -- Ex: vin[ - visual select inside next [
        -- Ex: v3in[ - visual select inside 3rd next [

        -- require("mini.snippets").setup({})
        -- require("mini.operators").setup({})
        -- require("mini.splitjoin").setup({})
    end
}
