return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      markdown = { "prettierd" },
      json = { "prettierd" }
    },
    -- format_on_save = {
    -- These options will be passed to conform.format()
    -- timeout_ms = 500,
    --   lsp_format = "fallback",
    -- },
  },
}
