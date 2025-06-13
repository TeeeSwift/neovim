return {
  'mrcjkb/rustaceanvim',
  dependencies = { 'mason-org/mason.nvim', 'mason-org/mason-registry' },
  version = '^5', -- Recommended
  lazy = false,   -- This plugin is already lazy
  config = function()
    -- Ensure Mason is set up and desired packages are installed
    require('mason').setup({
      ensure_installed = {
        "rust-analyzer",
        "codelldb",
      },
    })

    -- It's crucial that these packages are installed before Neovim tries to use them.
    -- You might need to restart Neovim after the first run for `ensure_installed` to take effect
    -- and for the executables to be in the PATH.

    local cfg = require('rustaceanvim.config')
    -- --- Step 2: Find the codelldb executable path ---
    -- vim.fn.exepath("codelldb") is the most reliable way to find the executable
    -- that Mason has made available in Neovim's PATH.
    local codelldb_executable_path = vim.fn.exepath("codelldb")
    local liblldb_library_path = vim.fn.expand(
      "~/.local/share/nvim/mason/packages/codelldb/extension/lldb/lib/liblldb.dylib")


    vim.g.rustaceanvim = {
      dap = {},
      server = {
        cmd = function()
          -- For rust-analyzer, since Mason 2.0 puts it in PATH,
          -- `vim.fn.exepath` is the most reliable way to get its absolute path.
          local ra_path = vim.fn.exepath('rust-analyzer')
          if ra_path and vim.fn.filereadable(ra_path) then
            return { ra_path }
          else
            vim.notify(
              "Error: 'rust-analyzer' executable not found. Ensure it's installed via Mason or available globally.",
              vim.log.levels.ERROR)
            return { 'rust-analyzer' } -- Fallback to global if not found, but expect errors
          end
        end,
      },
    }
  end
}

--
-- return {
--   'mrcjkb/rustaceanvim',
--   dependencies = { 'mason-org/mason.nvim', 'mason-org/mason-registry' },
--   version = '^5', -- Recommended
--   lazy = false,   -- This plugin is already lazy
--   config = function()
--     require('mason').setup({})
--     -- local mason_registry = require('mason-registry')
--     -- local codelldb = mason_registry.get_package("codelldb")
--     -- local extension_path = codelldb:get_install_path() .. "/extension/"
--     -- local codelldb_path = extension_path .. "adapter/codelldb"
--     -- local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
--     local cfg = require('rustaceanvim.config')
--
--     vim.g.rustaceanvim = {
--       dap = {
--         -- adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
--         adapter = cfg.get_codelldb_adapter(),
--       },
--       server = {
--         cmd = function()
--           local mason_registry = require('mason-registry')
--           if mason_registry.is_installed('rust-analyzer') then
--             -- This may need to be tweaked depending on the operating system.
--             -- local ra = mason_registry.get_package('rust-analyzer')
--             -- local ra_filename = ra:get_receipt():get().links.bin['rust-analyzer']
--             -- return { ('%s/%s'):format(ra:get_install_path(), ra_filename or 'rust-analyzer') }
--             return { 'rust-analyzer' }
--           else
--             -- global installation
--             return { 'rust-analyzer' }
--           end
--         end,
--       },
--     }
--   end
-- }
