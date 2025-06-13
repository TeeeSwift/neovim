vim.cmd[[command! RankAndFile lua vim.fn.setreg('+', vim.fn.expand('%')..':'..vim.fn.line('.'))]]
vim.cmd([[
  command! MERM call system("~/scripts/mermaid_to_clipboard.sh")
]])

