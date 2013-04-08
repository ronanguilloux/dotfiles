"
" Filetype detection
"
augroup filetypedetect
	" Detect .txt as 'text'
	autocmd! BufNewFile,BufRead *.txt setfiletype text
	au BufNewFile,BufRead *.xt setf xt
augroup END
