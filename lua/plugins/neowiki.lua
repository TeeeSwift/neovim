return {
  "echaya/neowiki.nvim",
  config = function()
    local neowiki = require 'neowiki'

    vim.keymap.set("n", "<leader>zk", function()
      neowiki.open_wiki_floating()
    end, { desc = "Open Work Wiki" })

    vim.api.nvim_create_user_command(
      "OpenWiki", -- The name of your command (e.g., :HelloNvim)
      function()
        neowiki.open_wiki_new_tab()
      end,
      {} -- Optional attributes table (more on this below)
    )



    neowiki.setup({
      wiki_dirs = {
        { name = "e1",      path = "~/Documents/wiki/e1" },
        { name = "spp",     path = "~/Documents/wiki/spp" },
        { name = "chiman",  path = "~/Documents/wiki/chiman" },
        { name = "updates", path = "~/Documents/wiki/weekly" },
      },
      keymaps = {
        toggle_task = "<C-k>",
      }
    })
  end,


}
