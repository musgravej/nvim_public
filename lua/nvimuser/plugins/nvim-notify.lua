return {
    "rcarriga/nvim-notify",
    enabled = false,
    config = function()
        local nvim_notify = require("notify")
        nvim_notify.setup({
            render = "compact",
            stages = "fade",
            timeout = 1
        })
    end
}
