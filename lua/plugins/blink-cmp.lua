return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = {
    "rafamadriz/friendly-snippets",
    {"folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
},

-- use a release tag to download pre-built binaries
version = 'v1.*',
-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
-- build = 'cargo build --release',
-- If you use nix, you can build from source using latest nightly rust with:
-- build = 'nix run .#build-plugin',

---@module 'blink.cmp'
---@type blink.cmp.Config
opts = {
  -- 'default' for mappings similar to built-in completion
  -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
  -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
  -- see the "default configuration" section below for full documentation on how to define
  -- your own keymap.
  keymap = {
    preset = 'default',
    ['<C-space>'] = {},
    ['<C-k>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ['<Tab>'] = {},
    ['<S-Tab>'] = {},
    ['<C-f>'] = { 'snippet_forward', 'fallback' },
    ['<C-b>'] = { 'snippet_backward', 'fallback' },
    ['<Up>'] = { 'scroll_documentation_up', 'fallback' },
    ['<Down>'] = { 'scroll_documentation_down', 'fallback' },
  },

  appearance = {
    -- Sets the fallback highlight groups to nvim-cmp's highlight groups
    -- Useful for when your theme doesn't support blink.cmp
    -- will be removed in a future release
    -- use_nvim_cmp_as_default = true,
    -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- Adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'mono'
  },

  -- (Default) Only show the documentation popup when manually triggered
  completion = { documentation = { auto_show = false } },


  -- default list of enabled providers defined so that you can extend it
  -- elsewhere in your config, without redefining it, via `opts_extend`
  sources = {
    -- default = { 'lsp', 'path', 'snippets', 'buffer' },
    default = { 'buffer', 'lsp',  'path', 'snippets', 'lazydev' },
    providers = {
        -- dont show LuaLS require statements when lazydev has items
        lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", fallbacks = { "lsp" } },
      },
      -- optionally disable cmdline completions
      -- cmdline = {},
    },

    -- experimental signature help support
    signature = { enabled = true },

    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    completion = {
      menu = {
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind" },
            {"source_name"}
          }
        }
      }
    }

  },
  opts_extend = { "sources.default" },


}
