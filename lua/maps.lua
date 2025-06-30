local keymap = vim.keymap

vim.g.mapleader = " "
keymap.set('n', '<leader>w', ":w<CR>")
keymap.set('n', '<leader>q<CR>', ":q<CR>")
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Screen movement
keymap.set({ 'n', 'x', 'o' }, 'H', "_")
keymap.set({ 'n', 'x', 'o' }, 'L', "$")

-- don't yank with x
keymap.set({ 'n', 'x' }, 'x', '"_x')
keymap.set({ 'n', 'x' }, 'c', '"_c')
keymap.set('n', 'C', '"_C')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-a>')


-- Split window
keymap.set('n', 'sp', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'vsp', ':vsplit<Return><C-w>w', { silent = true })

-- movement
keymap.set('v', "J", ":m '>+1<CR>gv=gv")
keymap.set('v', "K", ":m '>-2<CR>gv=gv")
keymap.set('n', 'k', [[(v:count > 1 ? "m'" . v:count : "g") . 'k']], { expr = true })
keymap.set('n', 'j', [[(v:count > 1 ? "m'" . v:count : "g") . 'j']], { expr = true })



keymap.set('n', "J", "mzJ`z")
keymap.set('n', "<C-d>", "<C-d>zz")
keymap.set('n', "<C-u>", "<C-u>zz")
keymap.set('n', "n", "nzzzv")
keymap.set('n', "N", "Nzzzv")

keymap.set('n', "]b", ":bnext<CR>");
keymap.set('n', "[b", ":bprev<CR>");

-- format
keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end)

vim.api.nvim_create_user_command(
  'ConformFormat', -- The name of your command (e.g., you'll type :ConformFormat)
  function()
    -- This is the function that gets executed when the command is run
    require('conform').format()
  end,
  {
    -- Options for the command:
    desc = 'Format current buffer with Conform', -- Description shown in the command picker (e.g., when you type :Conform)
    nargs = 0,                                   -- This command takes no arguments
    -- buffer = true,                            -- Uncomment this line if you want the command to be buffer-local
  }
)

-- replace word currently on
vim.keymap.set("n", "<leader>sc", function()
  vim.api.nvim_buf_set_mark(0, "O", vim.fn.line("."), vim.fn.col("."), {}) -- Set global mark 'O'
  vim.api.nvim_command("edit ~/Documents/notes/scratch.md")                -- Open the scratch.md buffer
end, { noremap = true, silent = true })



-- Function to toggle the quickfix window
function ToggleQuickfix()
  local quickfix_open = vim.fn.getqflist({ winid = 0 }).winid > 0

  if quickfix_open then
    vim.cmd('cclose')
  else
    vim.cmd('copen')
  end
end

-- Map <Space>q to toggle the quickfix window
vim.api.nvim_set_keymap('n', '<leader>qf', ':lua ToggleQuickfix()<CR>', { noremap = true, silent = true })

keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition" })
keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action" })
keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename symbol" })




-- Function to create or switch to the terminal buffer
-- Lua variable to store the terminal buffer ID
local term_buf_id = nil
local last_non_term_buf_id = 0

local function ToggleTerm()
  if vim.bo.buftype == 'terminal' then
    vim.api.nvim_set_current_buf(last_non_term_buf_id)
  else
    if term_buf_id and vim.api.nvim_buf_is_valid(term_buf_id) then
      last_non_term_buf_id = vim.api.nvim_get_current_buf()
      vim.api.nvim_set_current_buf(term_buf_id)
      vim.cmd.startinsert()
    else
      last_non_term_buf_id = vim.api.nvim_get_current_buf()
      vim.cmd.enew()     -- Open a vertical split
      vim.cmd.terminal() -- Start the terminal
      vim.cmd.startinsert()

      -- Store the new terminal buffer ID
      term_buf_id = vim.api.nvim_get_current_buf()
    end
  end
end

vim.keymap.set({ 'n', 't' }, '<C-x>', ToggleTerm, { silent = true })
-- Remap "jj" to exit terminal insert mode
vim.keymap.set('t', '<C-\\>', [[<C-\><C-n>]], { noremap = true, silent = true })
