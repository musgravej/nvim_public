return {
    "rcarriga/nvim-notify",
    config = function()
        local nvim_notify = require("notify")
        nvim_notify.setup({
            render = "compact",
            stages = "fade",
            timeout = 1
        })
    end
}
