return {
    {
        "folke/tokyonight.nvim",
        priority = 900, -- make sure to load this before all the other start plugins
        config = function()
            local bg = "#011628"
            local bg_dark = "#011423"
            local bg_highlight = "#143652"
            local bg_search = "#0A64AC"
            local bg_visual = "#275378"
            local fg = "#CBE0F0"
            local fg_dark = "#B4D0E9"
            local fg_gutter = "#627E97"
            local border = "#547998"

            require("tokyonight").setup({
                style = "night",
                on_colors = function(colors)
                    colors.bg = bg
                    colors.bg_dark = bg_dark
                    colors.bg_float = bg_dark
                    colors.bg_highlight = bg_highlight
                    colors.bg_popup = bg_dark
                    colors.bg_search = bg_search
                    colors.bg_sidebar = bg_dark
                    colors.bg_statusline = bg_dark
                    colors.bg_visual = bg_visual
                    colors.border = border
                    colors.fg = fg
                    colors.fg_dark = fg_dark
                    colors.fg_float = fg
                    colors.fg_gutter = fg_gutter
                    colors.fg_sidebar = fg_dark
                end,
            })
            -- set the colorscheme here
            -- vim.cmd([[colorscheme tokyonight]])
            -- vim.cmd([[colorscheme catppuccin-macchiato]])
            -- vim.cmd([[colorscheme kanagawa]])
            vim.cmd([[colorscheme rose-pine-moon]])
        end,
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000, },
    { "rebelot/kanagawa.nvim", name = "kanagawa", priority = 902, lazy = false},
    { "EdenEast/nightfox.nvim", name = "nightfox", lazy = false},
    { "atmosuwiryo/vim-winteriscoming", name = "winteriscoming", lazy = false},
    { "rmehri01/onenord.nvim", name = "onenord", lazy = false},
    { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 901 },
    { "rose-pine/neovim", name = "rose-pine" },
    { "oxfist/night-owl.nvim", name = "night-owl", lazy = false},
    { "ofirgall/ofirkai.nvim", name = "ofirkai", },
    {
        "askfiy/visual_studio_code",
        priority = 998,
        name = "visual_studio_code",
        config = function()
            -- vim.cmd([[colorscheme visual_studio_code]])
        end,
    },
}
