  setlocal conceallevel=2
  nnoremap <buffer> <silent> gO :exec 'lvimgrep /\v^#+.*(' . expand('<cword>') . ')/ %' \| :lopen<CR>
