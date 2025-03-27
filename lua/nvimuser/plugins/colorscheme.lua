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
            -- local fg_gutter = "#627E97"
            local fg_gutter = "#564a72"
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
            -- default, order by compatibility
            vim.cmd([[colorscheme tokyonight-moon]])
            -- vim.cmd([[colorscheme rose-pine-moon]])
            -- vim.cmd([[colorscheme falcon]])
            -- vim.cmd([[colorscheme darkplus]])
            -- vim.cmd([[colorscheme icy]])
            -- vim.cmd([[colorscheme nightfly]])
            -- vim.cmd([[colorscheme catppuccin-macchiato]])
            -- vim.cmd([[colorscheme kanagawa]])
            -- vim.cmd([[colorscheme tokyonight-night]])
        end,
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000, },
    -- { "luisiacc/gruvbox-baby", name = "gruvbox", priority = 1000, },
    { "lunarvim/darkplus.nvim", name = "darkplus", priority = 1000, },
    { "projekt0n/github-nvim-theme", name = "github-nvim", priority = 1000, },
    { "rebelot/kanagawa.nvim", name = "kanagawa", priority = 902, lazy = false},
    { "EdenEast/nightfox.nvim", name = "nightfox", lazy = false},
    { "rmehri01/onenord.nvim", name = "onenord", lazy = false},
    { "fenetikm/falcon", name = "falcon", lazy = false},
    { "elianiva/icy.nvim", name = "icy", lazy = false},
    { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 901 },
    { "rose-pine/neovim", name = "rose-pine" },
    { "oxfist/night-owl.nvim", name = "night-owl", lazy = false},
    {
        "askfiy/visual_studio_code",
        priority = 998,
        name = "visual_studio_code",
        config = function()
            -- vim.cmd([[colorscheme visual_studio_code]])
        end,
    },
}
