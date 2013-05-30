" ------------------------------------------------------------------------------------
" Xml formating
" usage : vim badFormatted.xml => will open & immediatly format any bad formatted xml file
" see http://vim.wikia.com/wiki/Format_your_xml_document_using_xmllint
" ------------------------------------------------------------------------------------
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" Indent XML readably
function! DoPrettyXML()
    1,$!xmllint --format --recover -
endfunction

command! PrettyXML call DoPrettyXML()

