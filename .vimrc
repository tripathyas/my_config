" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set paste

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

"nnoremap <silent> <M-J> :normal 4j<CR>
"nnoremap <silent> <M-K> :normal 4k<CR>
"xnoremap <silent> <C-J> :normal gv4j<CR>
"xnoremap <silent> <C-K> :normal gv4k<CR>

vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

if has('signcolumn')                                                            
    set signcolumn=yes                                                          
end

"set foldmethod=syntax
set foldnestmax=10
set foldlevel=4
set nofoldenable

let mapleader = " "

nnoremap <silent> <leader>wo :only<cr>
nnoremap <silent> <leader>to :tabonly<cr>

nnoremap <silent> <leader>af :ALEFirst<cr>
nnoremap <silent> <leader>al :ALELast<cr>
nnoremap <silent> <leader>an :ALENext<cr>
nnoremap <silent> <leader>ap :ALEPrevious<cr>
nnoremap <silent> <leader>at :ALEToggle<cr>

nmap <leader>bl <c-^><cr>

map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>cn :cn<cr>
map <leader>cp :cp<cr>
map <leader>cf :cfirst<cr>
map <leader>cl :clast<cr>


"--------------
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv

"undo break points
inoremap . .<c-g>u
inoremap , ,<c-g>u
inoremap = =<c-g>u
"--------------

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

set foldmethod=indent
autocmd FileType python setlocal foldmethod=indent foldnestmax=10 foldlevel=4
autocmd FileType markdown nnoremap go :exec 'lvimgrep /\v^#+.*(' . expand('<cword>') . ')/ %' \| :lopen<CR>

function! FindMethod()
    let l:w = expand("<cword>")
    execute "Ack -F 'def " . l:w . "('"
endfunction

function! FindClass()
    let l:w = expand("<cword>")
    execute "Ack 'class " . l:w . "'"
endfunction

function! FindTestMethod()
    let l:shorter='test_'
    let l:w = expand("<cword>")

    if l:w[0:len(l:shorter)-1] ==# l:shorter
        execute "Ack 'def " . l:w[len(l:shorter):len(l:w)-1] . "'"
    else
        execute "Ack 'def test_" . l:w . "'"
    endif
endfunction

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

nnoremap <leader>fm : call FindMethod() <cr>
nnoremap <leader>fc : call FindClass() <cr>
nnoremap <leader>ftm : call FindTestMethod() <cr>
nnoremap <silent> <leader>s1 : call CreateSession('Session1.vim') <cr>
nnoremap <silent> <leader>s2 : call CreateSession('Session2.vim') <cr>
nnoremap <silent> <leader>s3 : call CreateSession('Session3.vim') <cr>
nnoremap <silent> <leader>s4 : call CreateSession('Session4.vim') <cr>
nnoremap <silent> <leader>s5 : call CreateSession('Session5.vim') <cr>


function! CreateSession(sessionName)
    exe "mks! ". a:sessionName
    echo "created session ". a:sessionName
endfunction

function! CscopeDone()
	exe "cs add cscope.out"
endfunc



function! CtagUpdate()
    exe "AsyncRun git ls-files |  ctags  -R . -L-"
endfunction

function! CscopeUpdate()
	try | exe "cs kill cscope.out" | catch | endtry
	exe "AsyncRun -post=call\\ g:CscopeDone() ".
                \ "git ls-files >cscope.files && ".
				\ "cscope -bi cscope.files && (git ls-files |  ctags  -R . -L-)"
endfunction

command! CscopeUpdate call CscopeUpdate()
command! CtagUpdate call CtagUpdate()
 

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
    Plug 'mbbill/undotree'
    Plug 'tpope/vim-fugitive'
    Plug 'mileszs/ack.vim'
    Plug 'preservim/nerdtree'
    Plug 'junegunn/fzf.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'google/vim-maktaba'
    Plug 'google/vim-codefmt'
    Plug 'skywind3000/asyncrun.vim'
    Plug 'dense-analysis/ale'
    Plug 'airblade/vim-gitgutter'
    if v:version < 800
        Plug 'junegunn/fzf', {}
        Plug 'google/vim-glaive', {}
    else
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'google/vim-glaive', { 'do': { -> glaive#Install() } }
    endif

    if has('nvim')
        Plug 'gruvbox-community/gruvbox'
        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-telescope/telescope.nvim'
        Plug 'nvim-telescope/telescope-fzy-native.nvim'

        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
        Plug 'neovim/nvim-lspconfig'
    endif
call plug#end()

let g:gitgutter_enabled=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)
let g:gitgutter_map_keys = 0


let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'eslint', 'typecheck'],
\   'python': ['pyright', 'pylint', 'flake8', 'mypy'],
\   'go': ['go', 'golint', 'errcheck']
\}
let g:ale_javascript_prettier_eslint_use_global = 1
let g:ale_javascript_eslint_use_global = 1
let g:ale_enabled = 1
"let g:ale_lsp_show_message_severity = 'error'


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
nmap <silent> <Leader>rt :call BufDo('set relativenumber!') <cr> 

function! BufDo(command)
  let currBuff=bufnr("%")
  execute 'bufdo ' . a:command
  execute 'buffer ' . currBuff
endfunction

set rtp+=~/.vim_runtime/my_plugins/fzf
if has('nvim')
          
    colorscheme gruvbox
    set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
    if g:colors_name == 'gruvbox'
        set bg=dark
        hi Search cterm=NONE ctermfg=black ctermbg=Grey
        hi QuickFixLine cterm=NONE ctermfg=black ctermbg=Grey
    endif
    set completeopt=menuone,noinsert,noselect
    nnoremap <leader>ff :Telescope find_files <CR>

    nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
    nnoremap <silent> gD :lua vim.lsp.buf.definition()<CR>
    nnoremap <silent> gi :lua vim.lsp.buf.implementation()<CR>
    nnoremap <silent> gsh :lua vim.lsp.buf.signature_help()<CR>
    nnoremap <silent> grr :lua vim.lsp.buf.references()<CR>
    nnoremap <silent> grn :lua vim.lsp.buf.rename()<CR>
    nnoremap <silent> gh :lua vim.lsp.buf.hover()<CR>
    nnoremap <silent> gca :lua vim.lsp.buf.code_action()<CR>
    nnoremap <silent> gld :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
    nnoremap <silent> [d :lua vim.lsp.diagnostic.goto_prev()<CR>
    nnoremap <silent> ]d :lua vim.lsp.diagnostic.goto_next()<CR>



    nnoremap <leader>fh <cmd>Telescope command_history<cr>
    nnoremap <leader>fH <cmd>Telescope help_tags<cr>
    nnoremap <leader>fL <cmd>Telescope live_grep<cr>
    nnoremap <leader>fw <cmd>Telescope grep_string<cr>
    let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
    lua require'lspconfig'.pyright.setup{}
    lua require'lspconfig'.tsserver.setup{}
    lua require'lspconfig'.clangd.setup{}
    lua require'lspconfig'.gopls.setup{}
    lua require'lspconfig'.rust_analyzer.setup{}
    lua require'lspconfig'.bashls.setup{}
    " lua require'nvim_lsp'.sumneko_lua.setup{ on_attach=require'completion'.on_attach }

    "nnoremap <leader>ff <cmd>Telescope git_files<cr>
    "nnoremap <leader>fF <cmd>Telescope find_files<cr>
    "nnoremap <leader>fb <cmd>Telescope buffers<cr>

endif

if has('nvim')
lua << EOF
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        virtual_text = {
          spacing = 4,
          prefix = '~',
        },
        signs = true,
        update_in_insert = false,
      }
    )

    require("telescope").setup({
        extensions = {
            fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true,
                minimum_grep_characters = 2,
                minimum_files_characters = 2,
            },
        },
    })
    require("telescope").load_extension("fzy_native")
EOF
endif

" Filter the quickfix list
function! FilterQFList(type, action, pattern)
    " get current quickfix list
    let s:curList = getqflist()
    let s:newList = []
    for item in s:curList
        if a:type == 0     " filter on file names
            let s:cmpPat = bufname(item.bufnr)
        elseif a:type == 1 " filter by line content
            let s:cmpPat = item.text . item.pattern
        endif
        if item.valid
            if a:action < 0
                " Keep only nonmatching lines
                if s:cmpPat !~ a:pattern
                    let s:newList += [item]
                endif
            else
                " Keep only matching lines
                if s:cmpPat =~ a:pattern
                    let s:newList += [item]
                endif
            endif
        endif
    endfor
    call setqflist(s:newList)
endfunction


"nnoremap ø :call FilterQFList(0, -1, inputdialog('Remove file names matching:', ''))<CR>
"nnoremap ø :call FilterQFList(0, 1, inputdialog('Keep only file names matching:', ''))<CR>
"nnoremap qf :call FilterQFList(1, -1, inputdialog('Remove all lines matching:', ''))<CR>
"nnoremap ww :call FilterQFList(1, 1, inputdialog('Keep only lines matching:', ''))<CR>
