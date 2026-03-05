return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
            end

            -- Navigation
            map("n", "]g", function()
                vim.cmd("Gitsigns next_hunk")
                vim.defer_fn(function()
                    vim.cmd("normal! zz")
                end, 10)
            end,
            "Next [g]it Hunk")

            map("n", "[g", function()
                vim.cmd("Gitsigns prev_hunk")
                vim.defer_fn(function()
                    vim.cmd("normal! zz")
                end, 10)
            end, "Prev [g]it Hunk")

            -- Actions
            map("n", "<leader>hs", gs.stage_hunk, "[H]unk [s]tage")
            map("n", "<leader>hr", gs.reset_hunk, "[H]unk [r]eset")

            -- Stage hunk
            map("v", "<leader>hs", function()
                gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, "[H]unk [s]tage")

            -- Reset hunk
            map("v", "<leader>hr", function()
                gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, "[H]unk [r]eset")

            map("n", "<leader>hS", gs.stage_buffer, "[H]unk [S]tage buffer")
            map("n", "<leader>hR", gs.reset_buffer, "[H]unk [R]eset buffer")

            map("n", "<leader>hu", gs.undo_stage_hunk, "[H]unk [u]ndo stage")

            map("n", "<leader>hp", gs.preview_hunk, "[H]unk [p]review")

            map("n", "<leader>hb", function()
                gs.blame_line({ full = true })
            end, "[H]unk [b]lame line")
            map("n", "<leader>hB", gs.toggle_current_line_blame, "[H]unk [B]lame toggle")

            map("n", "<leader>hd", gs.diffthis, "[H]unk [d]iff this")
            map("n", "<leader>hD", function()
                gs.diffthis("~")
            end, "[H]unk [D]iff this ~")

            -- Text object
            -- map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
        end,
    },
}
