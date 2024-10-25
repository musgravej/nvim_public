return {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    branch = "harpoon2",
    config = function()
        require("harpoon"):setup()

        local harpoon = require('harpoon')
        harpoon:setup({})

        harpoon:extend({
            UI_CREATE = function(cx)
                vim.keymap.set("n", "<C-v>", function()
                    harpoon.ui:select_menu_item({ vsplit = true })
                end, { buffer = cx.bufnr, desc = "Open file in v-split" })

                vim.keymap.set("n", "<C-x>", function()
                    harpoon.ui:select_menu_item({ split = true })
                end, { buffer = cx.bufnr, desc = "Open file in h-split" })

                vim.keymap.set("n", "<C-t>", function()
                    harpoon.ui:select_menu_item({ tabedit = true })
                end, { buffer = cx.bufnr , desc = "Open file in new tab"})
            end,
        })
        -- basic telescope configuration
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
            { desc = "Open harpoon window" })
    end,

    keys = {
        { "<leader>ha", function() require("harpoon"):list():add() end, desc = "harpoon file", },
        { "<leader>hx", function() require("harpoon"):list():remove() end, desc = "harpoon file", },
        { "<leader>hm", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "harpoon quick menu", },
        { "<leader>h1", function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1", },
        { "<leader>h2", function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2", },
        { "<leader>h3", function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3", },
        { "<leader>h4", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4", },
        { "<leaer>h5", function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5", },
        -- { "<leader>hk", function() require("harpoon"):list():next() end, desc = "harpoon next in harpoon list", },
        -- { "<leader>hj", function() require("harpoon"):list():prev() end, desc = "harpoon next in harpoon list", },
        { "<leader>k", function() require("harpoon"):list():next() end, desc = "harpoon next in harpoon list", },
        { "<leader>j", function() require("harpoon"):list():prev() end, desc = "harpoon previous in harpoon list", },
    },
}
