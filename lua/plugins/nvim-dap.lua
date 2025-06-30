return {
  'mfussenegger/nvim-dap',
  dependencies = {
    {
      "igorlfs/nvim-dap-view",
      ---@module 'dap-view'
      ---@type dapview.Config
      opts = {}
    },
  },
  config = function()
    local dap = require("dap")
    local js_debug_path = vim.fn.getenv('VSCODE_JS_DEBUG_DIR') .. 'lib/node_modules/js-debug/dist/src/dapDebugServer.js'

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        -- 💀 Make sure to update this path to point to your installation
        args = { js_debug_path, "${port}" },
      }
    }

    dap.configurations.javascript = {
      {
        name = "Launch file",
        type = "pwa-node",
        request = "launch",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
    }

    local dv = require("dap-view")
    dap.listeners.before.attach["dap-view-config"] = function()
      dv.open()
    end
    dap.listeners.before.launch["dap-view-config"] = function()
      dv.open()
    end
    dap.listeners.before.event_terminated["dap-view-config"] = function()
      dv.close()
    end
    dap.listeners.before.event_exited["dap-view-config"] = function()
      dv.close()
    end
  end,

  keys = {
    { "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>",                                            { desc = "Debugger step into" } },
    { "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>",                                            { desc = "Debugger step over" } },
    { "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>",                                             { desc = "Debugger step out" } },
    { "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>",                                             { desc = "Debugger continue" } },
    { "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>",                                    { desc = "Debugger toggle breakpoint" } },
    { "<Leader>dd", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { desc = "Debugger set conditional breakpoint" } },
    { "<Leader>dx", "<cmd>lua require'dap'.terminate()<CR>",                                            { desc = "Debugger reset" } },
    { "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>",                                             { desc = "Debugger run last" } },

    -- rustaceanvim
    { "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>",                                        { desc = "Debugger testables" } }
  }

}
