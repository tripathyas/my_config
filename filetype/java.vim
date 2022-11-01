
function! FindMethod()
    let l:w = expand("<cword>")
    execute "Ack -F ' " . l:w . "('"
endfunction
