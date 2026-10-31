return {
    {
        "folke/tokyonight.nvim",
        priority = 900, -- make sure to load this before all the other start plugins
        config = function()
            local bg = "#011628"
            local bg_dark = "#011423"

            -- color when doing a selection highlight (e.g. from a dropdown menu)
            local bg_highlight = "#143652"

            -- color showing all matching search results
            -- local bg_search = "#0A64AC"
            local bg_search = "#950606"

            -- color when selecting text in visual mode
            -- local bg_visual = "#275378"
            -- local bg_visual = "#2C5779"  -- slightly lighter
            -- local bg_visual = "#573275"
            local bg_visual = "#795A2C"

            --
            local fg = "#CBE0F0"
            local fg_dark = "#B4D0E9"
            -- local fg_gutter = "#627E97"
            -- local fg_gutter = "#564a72"
            local fg_gutter = "#756599"
            local border = "#547998"

            -- local comment = "#795A2C"

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
                    -- colors.comment = comment
                    colors.fg = fg
                    colors.fg_dark = fg_dark
                    colors.fg_float = fg
                    colors.fg_gutter = fg_gutter
                    colors.fg_sidebar = fg_dark
                end,
            })
            -- set the colorscheme here: init.lua
        end,
    },
    { "catppuccin/nvim",             name = "catppuccin",  priority = 1000, },
    -- { "luisiacc/gruvbox-baby", name = "gruvbox", priority = 1000, },
    { "lunarvim/darkplus.nvim",      name = "darkplus",    priority = 1000, },
    { "projekt0n/github-nvim-theme", name = "github-nvim", priority = 1000, },
    { "rebelot/kanagawa.nvim",       name = "kanagawa",    priority = 902,  lazy = false },
    { "EdenEast/nightfox.nvim",      name = "nightfox",    lazy = false },
    { "rmehri01/onenord.nvim",       name = "onenord",     lazy = false },
    { "fenetikm/falcon",             name = "falcon",      lazy = false },
    { "elianiva/icy.nvim",           name = "icy",         lazy = false },
    { "bluz71/vim-nightfly-colors",  name = "nightfly",    lazy = false,    priority = 901 },
    { "rose-pine/neovim",            name = "rose-pine" },
    { "oxfist/night-owl.nvim",       name = "night-owl",   lazy = false },
    {
        "askfiy/visual_studio_code",
        priority = 998,
        name = "visual_studio_code",
        config = function()
        end,
    },
}
