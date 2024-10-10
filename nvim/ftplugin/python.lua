-- local opt = vim.opt

-- vim.opt_local.foldlevel = 20
-- vim.opt_local.foldmethod = "indent"
-- vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"

-- vim.opt_local.foldmethod = "indent"
vim.keymap.set('n', '<leader>fc', function()
  return ":Ack -F 'class <cword>' <cr>"
end, { expr = true, noremap = true })
vim.keymap.set('n', '<leader>fm', function()
  return ":Ack -F 'def <cword>(' <cr>"
end, { expr = true, noremap = true })
--vim.keymap.set('n', '<leader>fm', function() return ":Ack -F 'def <cword>" end, {expr = true, noremap = true})
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4
