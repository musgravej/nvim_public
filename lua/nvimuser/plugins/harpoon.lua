return {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    branch = "harpoon2",
    config = function()
      require("harpoon"):setup()
    end,
    keys = {
      { "<leader>ha", function() require("harpoon"):list():add() end, desc = "harpoon file", },
      { "<leader>hd", function() require("harpoon"):list():remove() end, desc = "harpoon file", },
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
