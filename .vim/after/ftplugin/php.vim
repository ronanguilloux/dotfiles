" Only do this when not done yet for this buffer
if exists("b:php_ftplugin_loaded")
    finish
endif
let b:php_ftplugin_loaded = 1


" ------------------------------------------------------------------------------------
" PHP : Syntax
" ------------------------------------------------------------------------------------
set makeprg=php\ -l\ %          " php syntax check while using make
let php_no_shorttags = 1
let php_folding = 0
let php_sql_query = 1           " sql request colorization
let php_htmlInStrings = 1       " html tags colorization


" ------------------------------------------------------------------------------------
" PHP : Tools
" see http://vim.wikia.com/wiki/Runtime_syntax_check_for_php
" ------------------------------------------------------------------------------------
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd BufRead,BufNewFile *.phps set filetype=php   " .phps files handled like .php
autocmd bufNewFile *.php 0r ~/.vim/templates/php.php
" run file with PHP CLI (CTRL-M)
"autocmd FileType php noremap <C-M> :w!<CR>:!/usr/bin/php %<CR>
" PHP parser check (CTRL-L)
autocmd FileType php noremap <C-L> :!/usr/bin/php -l %<CR>
autocmd FileType php noremap <C-M> :!/usr/bin/phpcs --standard=PEAR %<CR>
let g:debuggerPort = 9000
" Use errorformat for parsing PHP error output
setlocal errorformat=%m\ in\ %f\ on\ line\ %l
" Rebuild tag index
nnoremap <silent> <C-F7> :silent !ctags -h ".php" --PHP-kinds=+cf --recurse --exclude=*/cache/* --exclude=*/logs/* --exclude=*/data/* --exclude="\.git" --exclude="\.svn" --languages=PHP &<cr>


" ------------------------------------------------------------------------------------
" Behat
" see https://github.com/veloce/vim-behat
" ------------------------------------------------------------------------------------
let feature_filetype='behat'


" ------------------------------------------------------------------------------------
" Twig
" ------------------------------------------------------------------------------------
au BufNewFile,BufRead *.twig set filetype=twig
" Twig surrounding
let g:surround_{char2nr('-')} = "{% \r %}"


" ------------------------------------------------------------------------------------
" PDV : phpDocumentor for Vim
" see http://stackoverflow.com/questions/3298820/vim-phpdoc-multiline-comment-autoindent
" ------------------------------------------------------------------------------------
let g:pdv_cfg_Version = "$Id$"
let g:pdv_cfg_Author = "Ronan Guilloux <ronan.guilloux@gmail.com>"
let g:pdv_cfg_Copyright = "Copyleft (ɔ) 2011 Ronan Guilloux"
let g:pdv_cfg_License = "{@link http://www.gnu.org/licenses/agpl.txt} GNU AFFERO GPL v3"
let g:pdv_cfg_php4always = 0 " Ignore PHP4 tags
nnoremap <leader>d :call PhpDocSingle()<CR>
vnoremap <leader>d :call PhpDocRange()<CR>
set formatoptions+=or           " fix <Enter> in /* ...  */ new lines


" ------------------------------------------------------------------------------------
" VIM-PHP-CS-FIXER : https://github.com/stephpy/vim-php-cs-fixer
" ------------------------------------------------------------------------------------
let g:php_cs_fixer_path = "/usr/local/bin/php-cs-fixer" " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "all"                " which level ?
let g:php_cs_fixer_config = "default"           " configuration
let g:php_cs_fixer_php_path = "php"             " Path to PHP
let g:php_cs_fixer_fixers_list = ""             " List of fixers
let g:php_cs_fixer_enable_default_mapping = 1   " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                  " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                  " Return the output of command if 1, else an inline information.


" ------------------------------------------------------------------------------------
" CODE Folding
" see http://www.vim.org/scripts/script.php?script_id=1623
" ------------------------------------------------------------------------------------
let g:DisableAutoPHPFolding = 1


" ------------------------------------------------------------------------------------
" PHP : Shortcuts
" ------------------------------------------------------------------------------------
imap <buffer> ` ->
imap <C-j> $this->
" Insert current class name
nmap <buffer> <leader>pcn "%pdF.xBdf/:s#/#\\#<CR>
" Insert current namespace at the top of the file
"nmap <leader>pn ggo<CR><ESC>"%PdF/r;:s#/#\\#<CR>Inamespace  <ESC>d/[A-Z]<CR>
" Replace namespace and class name based on filename
nmap <buffer> <leader>pn gg/namespace <CR>D"%PdF/r;:s#/#\\#<CR>Inamespace  <ESC>d/[A-Z]<CR>/class <CR>wcw<C-R>=expand("%:t:r")<CR><ESC>
" Insert current namespace and opens php and create empty class
nmap <buffer> <leader>pc ggO<?php<CR><CR><ESC>"%PdF/r;:s#/#\\#<CR>Inamespace  <ESC>d/[A-Z]<CR>Goclass <C-R>=expand("%:t:r")<CR><CR>{<CR>
" Public version:
" Insert current namespace and opens php and create empty class
"nmap <F9> ggO<?php<CR><CR><ESC>"%PdF/r;:s#/#\\#g<CR>Inamespace  <ESC>d/[A-Z]<CR>Goclass <C-R>=expand("%:t:r")<CR><CR>{<CR>
" Open word under cursor with php.net
nmap <buffer> <silent> <leader>pu :!elinks http://us2.php.net/<C-R><C-W>\#function.<C-R><C-W><CR>
" Single line mode documentation
nnoremap <buffer> <leader>pd :call PhpDocSingle()<CR>
" Multi line mode documentation (in visual mode)
vnoremap <buffer> <leader>pd :call PhpDocRange()<CR>
" Align selected code
vnoremap <buffer> <leader>pa :call PhpAlign()<CR>
noremap <buffer> <leader>p{ vi{:call PhpAlign()<CR>
noremap <buffer> <leader>p} vi}:call PhpAlign()<CR>
noremap <buffer> <leader>p( vi(:call PhpAlign()<CR>
noremap <buffer> <leader>p) vi):call PhpAlign()<CR>

" Wether to create @uses tags for implementation of interfaces and inheritance
let g:pdv_cfg_Uses = 0
" Wether for PHP5 code PHP4 tags should be set, like @access,... (1|0)?
let g:pdv_cfg_php4always = 0
" Wether to guess scopes after PEAR coding standards:
" $_foo/_bar() == <private|protected> (1|0)?
let g:pdv_cfg_php4guess = 0


" ------------------------------------------------------------------------------------
" PHP : Vim functions
" ------------------------------------------------------------------------------------

func! PhpAlign() range
    let l:paste = &g:paste
    let &g:paste = 0

    let l:line        = a:firstline
    let l:endline     = a:lastline
    let l:maxlength = 0
    while l:line <= l:endline
		" Skip comment lines
		if getline (l:line) =~ '^\s*\/\/.*$'
			let l:line = l:line + 1
			continue
		endif
		" \{-\} matches ungreed *
        let l:index = substitute (getline (l:line), '^\s*\(.\{-\}\)\s*\S\{0,1}=\S\{0,1\}\s.*$', '\1', "")
        let l:indexlength = strlen (l:index)
        let l:maxlength = l:indexlength > l:maxlength ? l:indexlength : l:maxlength
        let l:line = l:line + 1
    endwhile

	let l:line = a:firstline
	let l:format = "%s%-" . l:maxlength . "s %s %s"

	while l:line <= l:endline
		if getline (l:line) =~ '^\s*\/\/.*$'
			let l:line = l:line + 1
			continue
		endif
        let l:linestart = substitute (getline (l:line), '^\(\s*\).*', '\1', "")
        let l:linekey   = substitute (getline (l:line), '^\s*\(.\{-\}\)\s*\(\S\{0,1}=\S\{0,1\}\)\s\(.*\)$', '\1', "")
        let l:linesep   = substitute (getline (l:line), '^\s*\(.\{-\}\)\s*\(\S\{0,1}=\S\{0,1\}\)\s\(.*\)$', '\2', "")
        let l:linevalue = substitute (getline (l:line), '^\s*\(.\{-\}\)\s*\(\S\{0,1}=\S\{0,1\}\)\s\(.*\)$', '\3', "")

        let l:newline = printf (l:format, l:linestart, l:linekey, l:linesep, l:linevalue)
        call setline (l:line, l:newline)
        let l:line = l:line + 1
    endwhile
    let &g:paste = l:paste
endfunc
