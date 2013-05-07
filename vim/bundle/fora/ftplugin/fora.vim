if exists('b:fora')
    finish
endif

function! EvaluateForaFile()
    silent !clear
    execute "!fora ".bufname("%")
endfunction
command! -buffer -nargs=0 ForaCheck :call EvaluateForaFile()
"au BufWritePost <buffer> ForaCheck

let b:fora = 1

setlocal commentstring=//%s

