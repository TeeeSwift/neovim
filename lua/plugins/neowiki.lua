return {
  "echaya/neowiki.nvim",
  config = function()
    local neowiki = require 'neowiki'
    vim.api.nvim_create_user_command(
      'OpenWiki', -- The name of your command (e.g., you'll type :ConformFormat)
      function()
        -- This is the function that gets executed when the command is run
        neowiki.open_wiki_new_tab()
      end,
      {
        -- Options for the command:
        desc = 'Open neowiki', -- Description shown in the command picker (e.g., when you type :Conform)
        nargs = 0,             -- This command takes no arguments
        -- buffer = true,                            -- Uncomment this line if you want the command to be buffer-local
      }
    )

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
