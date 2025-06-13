vim.cmd [[command! RankAndFile lua vim.fn.setreg('+', vim.fn.expand('%')..':'..vim.fn.line('.'))]]
