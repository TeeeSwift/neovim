local obsidian_vault = vim.fn.expand("~") .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents"

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  -- ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    "BufReadPre " .. obsidian_vault .. "/**/*.md",
    "BufNewFile " .. obsidian_vault .. "/**/*.md",
  },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    workspaces = {
      -- {
      --   name = "dnd",
      --   path = obsidian_vault .. "/dnd",
      -- },
      {
        name = "work",
        path = obsidian_vault .. "/work",
      },
    },
    legacy_commands = false,
    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
      name = "snacks.pick",
      -- Optional, configure key mappings for the picker. These are the defaults.
      -- Not all pickers support all mappings.
      note_mappings = {
        -- Create a new note from your query.
        new = "<C-x>",
        -- Insert a link to the selected note.
        insert_link = "<C-l>",
      },
      tag_mappings = {
        -- Add tag(s) to current note.
        tag_note = "<C-x>",
        -- Insert a tag at the current location.
        insert_tag = "<C-l>",
      },
    },
    completion = {
      -- Enables completion using nvim_cmp
      nvim_cmp = false,
      -- Enables completion using blink.cmp
      blink = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
      -- Set to false to disable new note creation in the picker
      create_new = true,
    },

    -- see below for full list of options 👇
  },
}
