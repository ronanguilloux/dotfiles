" ------------------------------------------------------------------------------------
" Javascript
" see http://amix.dk/vim/vimrc.html
" ------------------------------------------------------------------------------------
"autocmd FileType javascript call JavaScriptFold()
au FileType json setlocal equalprg=python\ -m\ json.tool
autocmd FileType javascript setl fen
autocmd FileType javascript setl nocindent

autocmd FileType javascript imap <c-t> AJS.log();<esc>hi
autocmd FileType javascript imap <c-a> console.log();<esc>hi

autocmd FileType javascript inoremap <buffer> $r return
autocmd FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

"jquery color
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" Only do this when not done yet for this buffer
if exists("b:javascript_ftplugin_loaded")
    finish
endif
let b:javascript_ftplugin_loaded = 1

" don't use cindent for javascript
"setlocal nocindent
