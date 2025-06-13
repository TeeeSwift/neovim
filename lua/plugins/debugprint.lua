return {
  "andrewferrier/debugprint.nvim",
  -- opts = { … },
  lazy = false,  -- Required to make line highlighting work before debugprint is first used
  version = "*", -- Remove if you DON'T want to use the stable version
  opts = {
    keymaps = {
      normal = {
        plain_below = "g?p",
        plain_above = "g?P",
        variable_below = "g?v",
        variable_above = "g?V",
        variable_below_alwaysprompt = "",
        variable_above_alwaysprompt = "",
        surround_plain = "g?sp",
        surround_variable = "g?sv",
        surround_variable_alwaysprompt = "",
        textobj_below = "g?o",
        textobj_above = "g?O",
        textobj_surround = "g?so",
        toggle_comment_debug_prints = "",
        delete_debug_prints = "",
      },
      insert = {
        plain = "<C-G>p",
        variable = "<C-G>v",
      },
      visual = {
        variable_below = "g?v",
        variable_above = "g?V",
      },
    },
    -- … Other options
  },
}
