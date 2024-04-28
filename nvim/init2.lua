vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local function add(value, str, sep)
  sep = sep or ','
  str = str or ''
  value = type(value) == 'table' and table.concat(value, sep) or value
  return str ~= '' and table.concat({ value, str }, sep) or value
end

vim.o.nu = true
vim.cmd [[colorscheme desert]]
vim.o.grepprg = [[rg --no-heading --smart-case --vimgrep]]
vim.o.grepformat = add('%f:%l:%c:%m', vim.o.grepformat)


vim.keymap.set('n', '<c-j>', "<c-w>j", options)
vim.keymap.set('n', '<c-k>', "<c-w>k", options)
vim.keymap.set('n', '<c-h>', "<c-w>h", options)
vim.keymap.set('n', '<c-l>', "<c-w>l", options)
vim.keymap.set('n', '<leader>wo', vim.cmd.only)

vim.keymap.set('n', '<leader>bl', "<c-^><cr>", options)
vim.o.swapfile = false
vim.o.cursorline = true
vim.o.scrolloff = 4
vim.o.hlsearch = true
vim.o.mouse = ''
vim.o.conceallevel = 3

vim.keymap.set('n', '<leader>fg', ":grep ")
vim.keymap.set('v', '<leader>vy', '"+y', { noremap = true })
vim.keymap.set('n', '<leader>vp', '"+p', { noremap = true })

vim.keymap.set('n', '<leader>cc', ':botright cope<cr>', { noremap = true })
vim.keymap.set('n', '<leader>cn', ':cn<cr>', { noremap = true })
vim.keymap.set('n', '<leader>cp', ':cp<cr>', { noremap = true })
vim.keymap.set('n', '<leader>bo', ':execute "%bd|e#|bd#"<cr>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>nn', ":Vex<cr>")
vim.keymap.set('n', '<leader>nf', ":Vex<cr>")



vim.opt.foldlevel = 10
vim.o.foldmethod = "syntax"
vim.o.foldenable = false
vim.o.foldlevelstart = 1
vim.o.foldnestmax = 10
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"



-- augroup quickfix
--     autocmd!
--     autocmd QuickFixCmdPost [^l]* cwindow
--     autocmd QuickFixCmdPost l* lwindow
-- augroup END