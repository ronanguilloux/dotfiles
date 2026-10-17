" ------------------------------------------------------------------------------------
" Xml formating
" usage : :PrettyXML => reformat the current xml buffer
" see http://vim.wikia.com/wiki/Format_your_xml_document_using_xmllint
" ------------------------------------------------------------------------------------

" Indent XML readably
function! DoPrettyXML()
    1,$!xmllint --format --recover -
endfunction

command! PrettyXML call DoPrettyXML()
