" ------------------------------------------------------------------------------------
" GO language Syntax check
" see http://go-lang.cat-v.org/text-editors/vim/
" ------------------------------------------------------------------------------------
autocmd BufRead,BufNewFile *.go set filetype=go
set rtp+=$GOROOT/misc/vim
syntax on

