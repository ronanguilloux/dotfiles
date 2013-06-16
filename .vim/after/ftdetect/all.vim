" ------------------------------------------------------------------------------------
" Setting per-extension filetype parsing
" ------------------------------------------------------------------------------------
autocmd BufRead,BufNewFile *.markdown,*.md,*.mdown,*.mkd,*.mkdn,*.rst
      \ if &ft =~# '^\%(conf\|modula2\)$' |
      \   set ft=markdown |
      \ else |
      \   setf markdown |
      \ endif
autocmd BufRead,BufNewFile *.go     set filetype=go
autocmd BufRead,BufNewFile *.txt    set filetype=txt
autocmd BufRead,BufNewFile *.twig   set filetype=html
