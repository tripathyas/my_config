setlocal foldmethod=indent

function! FindMethod()
    let l:w = expand("<cword>")
    execute "Ack -F 'def " . l:w . "('"
endfunction
