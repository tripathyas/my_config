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
set ignorecase
set smartcase

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set magic
set scrolloff=4
set colorcolumn=80
set updatetime=50
set nocompatible
set exrc
set hlsearch
set laststatus=2
" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set mat=2

" Set 7 lines to the cursor - when moving vertically using j/k
set so=4

" Turn on the Wild menu
set wildmenu
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" Don't redraw while executing macros (good performance config)
set lazyredraw 

set nocscopeverbose

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

if has('signcolumn')                                                            
    set signcolumn=yes                                                          
end

set foldmethod=syntax
set foldnestmax=10
set foldlevel=4
set nofoldenable

let mapleader = " "

nnoremap <silent> <leader>wo :only<cr>
nnoremap <silent> <leader>af :ALEFirst<cr>
nnoremap <silent> <leader>al :ALELast<cr>
nnoremap <silent> <leader>an :ALENext<cr>
nnoremap <silent> <leader>ap :ALEPrevious<cr>
nnoremap <silent> <leader>ae :ALEEnable<cr>
nnoremap <silent> <leader>ad :ALEDisable<cr>
nmap <leader>bl <c-^><cr>

map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>cn :cn<cr>
map <leader>cp :cp<cr>
map <leader>cf :cfirst<cr>
map <leader>cl :clast<cr>

set ssop-=options    " do not store global and local values in a session

vnoremap <leader>vy "+y
nnoremap <leader>vp "+p
nnoremap <leader>vP "+P
nnoremap <leader>vw :w!<cr>

cnoreabbrev Ack Ack!
nnoremap <leader>fg :Ack!<Space>

if executable('rg')
  let g:ackprg = 'rg --vimgrep --smart-case'
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
command! -bang Bufferonly silent! execute "%bd|e#|bd#"

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
 
if has('nvim')
lua << EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    --virtual_text = {
    --  spacing = 4,
    --  prefix = '~',
    --},
    signs = true,
    update_in_insert = false,
  }
)
EOF
endif

if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add the database pointed to by environment variable
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose
endif

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"------------------breking change for remote machine having vim <8
call plug#begin('~/.vim/plugged')
    Plug 'gruvbox-community/gruvbox'
    Plug 'mbbill/undotree'
    Plug 'tpope/vim-fugitive'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'mileszs/ack.vim'
    Plug 'preservim/nerdtree'
    Plug 'junegunn/fzf.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'google/vim-maktaba'
    Plug 'google/vim-codefmt'
    Plug 'skywind3000/asyncrun.vim'
    Plug 'dense-analysis/ale'
    if v:version < 800
        Plug 'junegunn/fzf', {}
        Plug 'google/vim-glaive', {}
    else
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'google/vim-glaive', { 'do': { -> glaive#Install() } }
    endif

    if has('nvim')
        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
        Plug 'neovim/nvim-lspconfig'
    endif
call plug#end()



colorscheme gruvbox
if g:colors_name == 'gruvbox'
    set bg=dark
    hi Search cterm=NONE ctermfg=black ctermbg=Grey
    hi QuickFixLine cterm=NONE ctermfg=black ctermbg=Grey
fi

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'eslint', 'typecheck'],
\   'python': ['pylint', 'flake8', 'mypy'],
\   'go': ['go', 'golint', 'errcheck']
\}
let g:ale_javascript_prettier_eslint_use_global = 1
let g:ale_javascript_eslint_use_global = 1
let g:ale_enabled = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
map <silent> <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <silent> <leader>nf :NERDTreeFind<cr>
let g:NERDTreeChDirMode=2
let g:NERDTreeWinSize=50
autocmd FileType nerdtree setlocal relativenumber

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'bufnum', 'filename', 'readonly', 'modified', 'gitbranch', 'relativepath' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

nmap <Leader>fb  :Buffers<CR>
nnoremap <leader>ff :GFiles<CR>
nnoremap <leader>fF :Files<CR>
nmap <Leader>fl :Lines<CR>

set rtp+=~/.vim_runtime/my_plugins/fzf
if has('nvim')
          
    set completeopt=menuone,noinsert,noselect

    nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
    nnoremap <silent> gi :lua vim.lsp.buf.implementation()<CR>
    nnoremap <silent> gsh :lua vim.lsp.buf.signature_help()<CR>
    nnoremap <silent> grr :lua vim.lsp.buf.references()<CR>
    nnoremap <silent> grn :lua vim.lsp.buf.rename()<CR>
    nnoremap <silent> gh :lua vim.lsp.buf.hover()<CR>
    nnoremap <silent> gca :lua vim.lsp.buf.code_action()<CR>
    nnoremap <silent> gsd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>



    let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
    lua require'lspconfig'.tsserver.setup{}
    lua require'lspconfig'.clangd.setup{}
    lua require'lspconfig'.pyls.setup{}
    lua require'lspconfig'.gopls.setup{}
    lua require'lspconfig'.rust_analyzer.setup{}
    lua require'lspconfig'.bashls.setup{}
    " lua require'nvim_lsp'.sumneko_lua.setup{ on_attach=require'completion'.on_attach }

    "nnoremap <leader>ff <cmd>Telescope git_files<cr>
    "nnoremap <leader>fF <cmd>Telescope find_files<cr>
    "nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope command_history<cr>
    nnoremap <leader>fH <cmd>Telescope help_tags<cr>
endif
