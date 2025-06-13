return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>a", function() require('harpoon'):list():add() end },
    { "<C-e>",     function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end },
    { "<C-g>",     function() require('harpoon'):list():select(1) end },
    { "<C-h>",     function() require('harpoon'):list():select(2) end },
    { "<C-n>",     function() require('harpoon'):list():select(3) end },
    { "<C-m>",     function() require('harpoon'):list():select(4) end }
  }
}
