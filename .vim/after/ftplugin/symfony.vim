" ------------------------------------------------------------------------------------
" Symfony
" see http://geekblog.over-blog.com/article-21837155.html
" ------------------------------------------------------------------------------------
map <F2> :!phptags :set tags=.ctags
map <F5> :!svn up
map <F6> :!svn ci
map <F7> :!svn
map <F9> :!./symfony cc
map <F10> :!./symfony propel:build-model
map <F11> :!./symfony propel:build-all-load
map <F12> :!./symfony
let g:symfony_fuf = 1
" Symfony
map <leader>sa :Saction <CR>
map <leader>sv :Sview <CR>


