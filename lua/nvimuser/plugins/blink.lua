return {
    -- blink.cmp is a completion plugin with support for LSPs, cmdline, signature help and snippets.
    -- It uses an optional custom fuzzy matcher for typo resistance.
    -- It provides extensibility via pluggable sources (LSP, buffer, snippets, etc), component based rendering and scripting for the configuration.
    'saghen/blink.cmp',
    event = "InsertEnter",
    -- optional: provides snippets for the snippet source
    dependencies = {
        -- "giuxtaposition/blink-cmp-copilot",
    },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = 'super-tab', -- Custom keymap configuration

            -- Completion navigation
            ['<C-n>'] = { 'select_next', 'fallback' },
            ['<C-p>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ['<Up>'] = { 'select_prev', 'fallback' },

            -- Tab behavior: only navigate completions when menu is open
            ['<Tab>'] = { 'select_next', 'fallback' },
            ['<S-Tab>'] = { 'select_prev', 'fallback' },

            -- Accept completion
            ['<CR>'] = { 'accept', 'fallback' },
            -- ['<C-y>'] = { 'select_and_accept', 'fallback' }, --  This is the default, think ctrl-Yes!
            ['<C-l>'] = { 'select_and_accept', 'fallback' },
            ['<C-S-l>'] = { 'cancel', 'fallback' },

            -- Documentation and menu control

            ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>'] = { 'hide', 'fallback' },
            ['<Esc>'] = { 'hide', 'fallback' },

            -- Documentation scrolling
            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

            -- Snippet navigation
            ['<C-j>'] = { 'snippet_forward', 'fallback' },
            ['<C-k>'] = { 'snippet_backward', 'fallback' },
        },

        -- Explicitly disable / enable by filetype
        -- enabled = function() return not vim.tbl_contains({ "text", "markdown" }, vim.bo.filetype) end,

        appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono',
            kind_icons = {
                Copilot = "",
                Text = '󰉿',
                Method = '󰊕',
                Function = '󰊕',
                Constructor = '󰒓',

                Field = '󰜢',
                Variable = '󰆦',
                Property = '󰖷',

                Class = '󱡠',
                Interface = '󱡠',
                Struct = '󱡠',
                Module = '󰅩',

                Unit = '󰪚',
                Value = '󰦨',
                Enum = '󰦨',
                EnumMember = '󰦨',

                Keyword = '󰻾',
                Constant = '󰏿',

                Snippet = '󱄽',
                Color = '󰏘',
                File = '󰈔',
                Reference = '󰬲',
                Folder = '󰉋',
                Event = '󱐋',
                Operator = '󰪚',
                TypeParameter = '󰬛',
            },
        },

        completion = {
            accept = {
                -- experimental auto-brackets support
                auto_brackets = {
                    -- enabled = true,
                    enabled = false,
                },
            },
            menu = {
                -- Disable automatically showing the menu while typing, instead press
                -- `<C-space>` (by default) to show it manually or per filetype
                -- auto_show = function(ctx, items) return vim.bo.filetype == 'markdown' end,
                -- this option can be toggled with BlinkAutoShowToggle or <leader>ba
                -- auto_show = false,
                auto_show = true,

                -- Delay before showing the completion menu while typing or per filetype
                -- auto_show_delay_ms = function(ctx, items) return vim.bo.filetype == 'markdown' and 1000 or 0 end,
                -- auto_show_delay_ms = 3000, -- 3 second delay
                auto_show_delay_ms = 1000, -- 1 second delay
                -- auto_show_delay_ms = 250,

                border = 'single',
                -- max_items = 200, -- Limit menu items for better performance
                draw = {
                    -- too slow
                    -- treesitter = { "lsp" },
                    columns = {
                        { "kind_icon" },
                        { "label",      "label_description", gap = 1 },
                        { "kind" },
                        { "source_name" },
                    },
                },
            },
            documentation = {
                treesitter_highlighting = false, -- turn off treesitter highlighting in documentation for better performance
                -- auto_show = true,
                auto_show = false,
                auto_show_delay_ms = 200,
                window = {
                    border = 'single',
                },
            },
            ghost_text = {
                enabled = false,
            },
            list = {
                -- max_items = 100,
                max_items = 40,
                selection = { preselect = true, auto_insert = false }
                -- selection = { preselect = false, auto_insert = false }
                -- selection = { preselect = false, auto_insert = true }
            },
            -- Trigger settings
            trigger = {
            },
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { 'lsp', 'omni', 'buffer', 'path', 'snippets' },
            -- default = { 'lsp', 'copilot', 'buffer', 'path', 'snippets' },
            providers = {
                lsp = {
                    name = 'LSP',
                    module = 'blink.cmp.sources.lsp',
                    -- score_offset = 1000, -- Prioritize LSP completions
                    min_keyword_length = 0,
                    max_items = 50
                },
                -- copilot = {
                --     name = "copilot",
                --     module = "blink-cmp-copilot",
                --     score_offset = 100,
                --     async = true,
                -- },
                path = {
                    name = 'Path',
                    module = 'blink.cmp.sources.path',
                    score_offset = 3,
                    fallbacks = { 'buffer' },
                    min_keyword_length = 0,
                    max_items = 20,
                    opts = {
                        trailing_slash = true,
                        label_trailing_slash = true,
                        get_cwd = function(context) return vim.fn.expand(('#%d:p:h'):format(context.bufnr)) end,
                        show_hidden_files_by_default = false,
                        -- Treat `/path` as starting from the current working directory (cwd) instead of the root of your filesystem
                        ignore_root_slash = false,
                    }
                },
                snippets = {
                    -- Save custom snippets in `~/.config/nvim/snippets/` in VSCode format
                    name = 'Snippets',
                    module = 'blink.cmp.sources.snippets',
                    score_offset = 100,
                    max_items = 10,
                    min_keyword_length = 3
                },
                buffer = {
                    name = 'Buffer',
                    module = 'blink.cmp.sources.buffer',
                    max_items = 10, -- Limit buffer completions
                    min_keyword_length = 3,
                    opts = {
                        get_bufnrs = function() -- Only scan visible buffers
                            -- Current buffer only
                            return { vim.api.nvim_get_current_buf() }
                            -- Performance optimizations for buffer source
                            --     local bufs = {}
                            --     for _, win in ipairs(vim.api.nvim_list_wins()) do
                            --         local buf = vim.api.nvim_win_get_buf(win)
                            --         if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
                            --             bufs[#bufs + 1] = buf
                            --         end
                            --     end
                            --     return bufs
                        end,
                    },
                },
            },
            per_filetype = {
                -- For Python files, prioritize LSP and snippets, reduce buffer scanning
                -- python = { 'lsp', 'snippets', 'path' },
                text = { 'path', 'snippets' },
                markdown = { 'path', 'buffer' }
            },
        },

        signature = {
            window = { border = 'single' },
            enabled = true,
        },

        cmdline = {
            keymap = {
                -- recommended, as the default keymap will only show and select the next item
                ['<Tab>'] = { 'show_and_insert_or_accept_single', 'select_next' },
                ['<S-Tab>'] = { 'show_and_insert_or_accept_single', 'select_prev' },

                ['<C-space>'] = { 'show', 'fallback' },

                ['<C-n>'] = { 'select_next', 'fallback' },
                ['<C-p>'] = { 'select_prev', 'fallback' },
                ['<Down>'] = { 'select_next', 'fallback' },
                ['<Up>'] = { 'select_prev', 'fallback' },

                -- Defaults
                -- ['<C-y>'] = { 'select_and_accept', 'fallback' },
                -- ['<C-e>'] = { 'cancel', 'fallback' },
                -- ['<C-S-y>'] = { 'cancel', 'fallback' },

                ['<C-l>'] = { 'select_and_accept', 'fallback' },
                ['<C-S-l>'] = { 'cancel', 'fallback' },
            },
            completion = { menu = { auto_show = true } },
        },

        -- Optimized fuzzy matcher settings for better performance
        fuzzy = {
            implementation = "prefer_rust_with_warning",
            -- Performance optimizations
            -- max_items = 200,                      -- Limit fuzzy matching items
            sorts = { "score", "kind", "label" }, -- Sort by relevance first
        }
    },
    opts_extend = { "sources.default" }
}
