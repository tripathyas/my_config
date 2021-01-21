" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set exrc
set relativenumber
set nu
set hidden
set smartcase

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=4
set colorcolumn=80
set updatetime=50
set nocompatible
set exrc
set hlsearch
set laststatus=2

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

if has('signcolumn')                                                            
    set signcolumn=yes                                                          
end



call plug#begin('~/.vim/plugged')
    Plug 'gruvbox-community/gruvbox'
    Plug 'mbbill/undotree'
    Plug 'tpope/vim-fugitive'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'mileszs/ack.vim'
    Plug 'preservim/nerdtree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'itchyny/lightline.vim'
    if v:version < 800
        Plug 'junegunn/fzf', {}
    else
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    endif

    if has('nvim')
        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
        Plug 'neovim/nvim-lspconfig'
    else
    endif
call plug#end()



colorscheme gruvbox
set bg=dark
let mapleader = " "

nnoremap <leader>wo :only<cr>



nnoremap <leader>fg :Ack<Space>

if executable('rg')
  let g:ackprg = 'rg --vimgrep --smart-case'
endif

if has('nvim')
          
    set completeopt=menuone,noinsert,noselect

    nnoremap gd :lua vim.lsp.buf.definition()<CR>
    nnoremap gi :lua vim.lsp.buf.implementation()<CR>
    nnoremap gsh :lua vim.lsp.buf.signature_help()<CR>
    nnoremap grr :lua vim.lsp.buf.references()<CR>
    nnoremap grn :lua vim.lsp.buf.rename()<CR>
    nnoremap gh :lua vim.lsp.buf.hover()<CR>
    nnoremap gca :lua vim.lsp.buf.code_action()<CR>
    nnoremap gsd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>

    let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
    lua require'lspconfig'.tsserver.setup{}
    lua require'lspconfig'.clangd.setup{}
    lua require'lspconfig'.pyls.setup{}
    lua require'lspconfig'.gopls.setup{}
    lua require'lspconfig'.rust_analyzer.setup{}
    " lua require'nvim_lsp'.sumneko_lua.setup{ on_attach=require'completion'.on_attach }

    nnoremap <leader>ff <cmd>Telescope git_files<cr>
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope command_history<cr>
    nnoremap <leader>fH <cmd>Telescope help_tags<cr>
else
    nnoremap <leader>ff :FZF<CR>
    nnoremap <leader>fF :Files<CR>
    nmap <Leader>fb  :Buffers<CR>
endif

" Delete trailing white space on save, useful for some filetypes ;)
function! TrimTrailingWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

command! -bang Trimtrailingwhitespace call TrimTrailingWhitespace()

nnoremap <silent> <leader>s1 : call CreateSession('s1') <cr>
nnoremap <silent> <leader>s2 : call CreateSession('s2') <cr>
nnoremap <silent> <leader>s3 : call CreateSession('s3') <cr>
nnoremap <silent> <leader>s4 : call CreateSession('s4') <cr>
nnoremap <silent> <leader>s5 : call CreateSession('s5') <cr>

function! CreateSession(sessionName)
    exe "mks! ". a:sessionName
    echo "created session ". a:sessionName
endfunction



function! CscopeDone()
	exe "cs add cscope.out"
endfunc

function! CscopeUpdate()
	try | exe "cs kill cscope.out" | catch | endtry
	exe "AsyncRun -post=call\\ g:CscopeDone() ".
                \ "git ls-files >cscope.files && ".
				\ "cscope -bi cscope.files"
endfunction

command! CscopeUpdate call CscopeUpdate()
 

set rtp+=~/.vim_runtime/my_plugins/fzf
nmap <Leader>fl :Lines<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>
let g:NERDTreeChDirMode=2
let g:NERDTreeWinSize=60
autocmd FileType nerdtree setlocal relativenumber

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

