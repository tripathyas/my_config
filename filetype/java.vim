
augroup java_files "{{{
        au!

        function! FindClass()
            let l:w = expand("<cword>")
            echomsg "Ack -F 'class " . l:w . " '"
            execute "Ack -F 'class " . l:w . " '"
        endfunction
        function! FindMethod()
            let l:w = expand("<cword>")
            execute "Ack -F ' " . l:w . "('"
        endfunction

        function! FindMethodLive()
            execute "Telescope live_grep" 
        endfunction


        function! FindClassLive()
            execute "Telescope live_grep default_text=class " 
        endfunction

augroup end "}}}
