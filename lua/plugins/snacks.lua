return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    picker = {},
    -- bigfile = { enabled = true },
    -- dashboard = { enabled = true },
    -- indent = { enabled = true },
    -- input = { enabled = true },
    -- notifier = { enabled = true },
    -- quickfile = { enabled = true },
    -- scroll = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },
  },
  keys = {
    { "<leader>pf", function() Snacks.picker.files() end,                                                           desc = "Find Files" },
    { "<leader>pg", function() Snacks.picker.grep() end,                                                            desc = "Grep" },
    { "<leader>pd", function() Snacks.picker.diagnostics() end,                                                     desc = "Diagnostics" },
    { "<leader>ps", function() Snacks.picker.lsp_symbols({ layout = { preset = "vscode", preview = "main" } }) end, desc = "LSP Symbols" },
    { "<leader>pc", function() Snacks.picker.commands() end,                                                        desc = "Commands" },
    { "gr",         function() Snacks.picker.lsp_references() end,                                                  nowait = true,       desc = "References" },
  },
}
