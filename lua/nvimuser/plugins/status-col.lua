-- return {}
return {
    "luukvbaal/statuscol.nvim",
    dependencies = { "lewis6991/gitsigns.nvim" },
    config = function()
        local builtin = require("statuscol.builtin")
        require('statuscol').setup({
            relculright = true,
            ft_ignore = { 'neo-tree' },
            segments = {
                -- {
                --     sign = { namespace = { 'diagnostic' }, maxwidth = 1, auto = false },
                --     click = 'v:lua.ScSa',
                -- },
                {
                    sign = { namespace = { 'gitsigns*' }, maxwidth = 1, colwidth = 2, auto = false },
                    click = 'v:lua.ScSa',
                },
                {
                    sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
                    click = "v:lua.ScSa"
                },
                { text = { builtin.lnumfunc, '  ' }, click = 'v:lua.ScLa' },
                -- { text = { builtin.foldfunc, ' ' },  click = 'v:lua.ScFa' },
            },
        })
    end,
}
