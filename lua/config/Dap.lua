--plugs: Dap
lvim.builtin.dap.ui.config.layouts = {
  {
    elements = {
      { id = "scopes",      size = 0.33 },
      { id = "watches",     size = 0.25 },
      { id = "breakpoints", size = 0.17 },
      { id = "stacks",      size = 0.25 },
    },
    size = 0.33,
    position = "left",
  },
  {
    elements = {
      { id = "console", size = 0.55 },
      { id = "repl",    size = 0.45 },
    },
    size = 0.27,
    position = "bottom",
  },
}
local dap, dapui = require("dap"), require("dapui")
local debug_open = function()
  dapui.open({})
end
local debug_close = function()
  dap.repl.close()
  dapui.close({})
end
dap.listeners.after.event_initialized["dapui_config"] = debug_open
dap.listeners.before.event_terminated["dapui_config"] = debug_close
dap.listeners.before.event_exited["dapui_config"] = debug_close
dap.listeners.before.disconnect["dapui_config"] = debug_close
