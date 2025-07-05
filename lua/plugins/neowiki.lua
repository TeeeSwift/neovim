return {
  "echaya/neowiki.nvim",
  config = function()
    local neowiki = require 'neowiki'
    vim.keymap.set("n", "<leader>zk", function()
      neowiki.open_wiki_floating()
    end, { desc = "Open Work Wiki" })

    neowiki.setup({
      wiki_dirs = {
        { name = "wiki", path = "~/Documents/wiki" },
      },
      keymaps = {
        toggle_task = "<C-k>",
      }
    })
  end,


}
