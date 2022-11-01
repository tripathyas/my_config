
function! FindMethod()
    let l:w = expand("<cword>")
    execute "Ack -F ' " . l:w . "('"
endfunction

function! FindMethodLive()
    execute "Telescope live_grep" 
endfunction

function! FindClass()
    let l:w = expand("<cword>")
    execute "Ack 'class " . l:w . "'"
endfunction

function! FindClassLive()
    execute "Telescope live_grep default_text=class " 
endfunction
