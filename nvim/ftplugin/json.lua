-- vim.opt_local.foldmethod = 'syntax'
-- vim.opt_local.foldlevel = 1
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = true -- Enable folding by default
vim.opt.foldlevel = 99 -- Open all folds by default
