require("formatter").setup({
  filetype = {
    python = {
      require("formatter.filetypes.python").black,
    },
    html = {
      require("formatter.filetypes.html").htmlbeautify,
    },
    javascript = {
      require("formatter.filetypes.javascript").prettier,
    },
    javascriptreact = {
      require("formatter.filetypes.javascript").prettier,
    },
    json = {
      require("formatter.filetypes.json").prettier,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
})

-- require 'nvim-web-devicons'.setup {
--   -- your personnal icons can go here (to override)
--   -- you can specify color or cterm_color instead of specifying both of them
--   -- DevIcon will be appended to `name`
--   override = {
--     zsh = {
--       icon = "",
--       color = "#428850",
--       cterm_color = "65",
--       name = "Zsh"
--     }
--   };
--   -- globally enable different highlight colors per icon (default to true)
--   -- if set to false all icons will have the default icon's color
--   color_icons = true;
--   -- globally enable default icons (default to false)
--   -- will get overriden by `get_icons` option
--   default = true;
-- }

---------------- nvim-tree-------------------
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
--
-- -- set termguicolors to enable highlight groups
--
-- -- empty setup using defaults
-- -- require("nvim-tree").setup()
-- require("nvim-tree").setup({
--   sort_by = "case_sensitive",
--   view = {
--     width = 40,
--     adaptive_size = true,
--     mappings = {
--       list = {
--         { key = "u", action = "dir_up" },
--       },
--     },
--   },
--   renderer = {
--     group_empty = true,
--   },
--   filters = {
--     dotfiles = true,
--   },
-- })


-------------------------------------------



--------------------
local fn = vim.fn
local function add(value, str, sep)
  sep = sep or ','
  str = str or ''
  value = type(value) == 'table' and table.concat(value, sep) or value
  return str ~= '' and table.concat({ value, str }, sep) or value
end

local executable = function(e)
  return fn.executable(e) > 0
end
if executable('rg') then
  vim.g.ackprg = 'rg -S --no-heading --vimgrep'

  vim.o.grepprg =
  [[rg --hidden --no-heading --smart-case --vimgrep ]]
  vim.o.grepformat = add('%f:%l:%c:%m', vim.o.grepformat)
end
--------------------

-- vim.o.termguicolors = false
-- vim.cmd [[colorscheme gruvbox]]
vim.cmd [[hi Search cterm=NONE ctermfg=black ctermbg=Grey ]]
-- vim.cmd [[hi CursorLine   cterm=NONE ctermbg=240 ctermfg=white ]]
vim.cmd [[hi CursorLine   ctermbg=240 ]]

local options = { noremap = true }

vim.keymap.set('n', '<c-j>', "<c-w>j", options)
vim.keymap.set('n', '<c-k>', "<c-w>k", options)
vim.keymap.set('n', '<c-h>', "<c-w>h", options)
vim.keymap.set('n', '<c-l>', "<c-w>l", options)
vim.keymap.set('n', '<leader>wo', vim.cmd.only)
-- vim.keymap.set('n', '<leader>nn', ":Telescope file_browser<cr>")
-- vim.keymap.set('n', '<leader>nf', ":Telescope file_browser path=%:p:h select_buffer=true<cr>")
vim.keymap.set('n', '<leader>nn', ":NERDTreeToggle<cr>")
vim.keymap.set('n', '<leader>nf', ":NERDTreeFind<cr>")
vim.g.NERDTreeWinSize = 50

vim.keymap.set('n', '<leader>bl', "<c-^><cr>", options)
vim.o.swapfile = false
vim.o.cursorline = true
vim.o.scrolloff = 4
vim.o.hlsearch = true
vim.o.mouse = ''
vim.o.conceallevel = 3

vim.keymap.set('n', '<leader>fl', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>fg', function() return ":Ack " end, { expr = true, noremap = true })
vim.keymap.set('v', '<leader>vy', '"+y', { noremap = true })
vim.keymap.set('n', '<leader>vp', '"+p', { noremap = true })

vim.keymap.set('n', '<leader>cc', ':botright cope<cr>', { noremap = true })
vim.keymap.set('n', '<leader>cn', ':cn<cr>', { noremap = true })
vim.keymap.set('n', '<leader>cp', ':cp<cr>', { noremap = true })
vim.keymap.set('n', '<leader>bo', ':execute "%bd|e#|bd#"<cr>', { noremap = true, silent = true })

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.completion.spell,
    null_ls.builtins.diagnostics.pylint
  },
})

require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
          ["<C-o>"] = false,
        },
        ["n"] = {
          -- your custom normal mode mappings
          o = false,
        },
      },
      depth = 3,
      grouped = true,
      respect_gitignore = true,
    },
  },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"
vim.opt.foldlevel = 20
vim.o.foldmethod = "syntax"
