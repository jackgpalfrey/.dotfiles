return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
        local dap = require("dap")
        local ui = require("dapui")

        ui.setup()
        dap.listeners.after.event_initialized["dapui_config"] = ui.open
        dap.listeners.before.event_terminated["dapui_config"] = ui.close
        dap.listeners.before.event_exited["dapui_config"] = ui.close
    end
}
