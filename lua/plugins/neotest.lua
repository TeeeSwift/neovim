return {
  'nvim-neotest/neotest',
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter"
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("rustaceanvim.neotest"),
      },
      quickfix = {
        enabled = true,
      }
    })
  end,
  keys = {
    { "<leader>ta", function() require("neotest").run.run(vim.fn.getcwd()) end,                         desc = "Neotest: Run All Test Files" },
    { "<leader>tr", function() require("neotest").run.run() end,                                        desc = "Neotest: Run Nearest" },
    { "<leader>tl", function() require("neotest").run.run_last() end,                                   desc = "Neotest: Run Last" },
    { "<leader>ts", function() require("neotest").summary.toggle() end,                                 desc = "Neotest: Toggle Summary" },
    { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Neotest: Show Output" },
    { "<leader>tO", function() require("neotest").output_panel.toggle() end,                            desc = "Neotest: Toggle Output Panel" },
  }
}
