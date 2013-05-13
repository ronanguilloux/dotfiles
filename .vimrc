" ------------------------------------------------------------------------------------
" Vim configuration file
" Author : Ronan Guilloux
" Copyright : 2011, Ronan GUILLOUX
" Licence : GNU Affero GPL v3 - http://www.gnu.org/licenses/agpl-3.0.txt
" Provided as is, without warranty of any kind
" Available on https://github.com/ronanguilloux/VimConfig
" ------------------------------------------------------------------------------------

" ------------------------------------------------------------------------------------
" Source local settings
" ------------------------------------------------------------------------------------
if filereadable("~/.vimlocalrc")
    source ~/.vimlocalrc
endif

" Use pathogen to easily modify the runtime path to include all
" " plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()


" ------------------------------------------------------------------------------------
" Basics
" ------------------------------------------------------------------------------------
if has("syntax")
    syntax on
endif

let mapleader=","               " the leader character
set shortmess=atI               " no more “Press ENTER or type command to continue”
set nocompatible                " explicitly get out of vi-compatible mode
set noerrorbells                " do not make any noise!
set visualbell                  " use the visual bell
set number                      " precede each line with its line number
set mouse=a                     " normal+visual+insert+command-line modes for mouse
set showcmd                     " show the command being typed
set showmode                    " show the mode we are in
set omnifunc=syntaxcomplete#Complete
set ruler                       " display current mouse position
set ttyfast                     " we use a rapid terminal
set history=1000                " increase history
set nobackup                    " do not backup files on overwrite
set undolevels=1000             " use many levels of undo
set noundofile                  " don't keep a persistent undofile
set title                       " display the default title at the top of the window
set wildmenu                    " long autocompletion shrowing various solutions
set wildmode=list:longest       " make it longest
set wildignore=*.o,*.fasl,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png " ignoring this
set clipboard+=unnamed          " share windows clipboard
set fileformats=unix,dos,mac    " support all three, in this order
set shell=/bin/bash
set scrolloff=3                 " cursor start the scrolling three lines before the bottom border

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc


" Run NERDTree on load
autocmd vimenter * NERDTree
" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1


" ------------------------------------------------------------------------------------
" Gvim conf
" ------------------------------------------------------------------------------------
if has('gui_running')
    set guifont=Monaco\ Bold\ 10
endif


" ------------------------------------------------------------------------------------
" Colorscheme solarized - https://github.com/altercation/vim-colors-solarized
" ------------------------------------------------------------------------------------
"let g:solarized_termcolors = 256
let g:solarized_termtrans = 0
let g:solarized_degrade = 0
let g:solarized_bold = 0
let g:solarized_underline = 1
let g:solarized_italic = 1
let g:solarized_contrast = "normal"
let g:solarized_visibility = "normal"
syntax enable
set background=dark
"colorscheme solarized
colorscheme default
" option name default optional
" ------------------------------------------------


" ------------------------------------------------------------------------------------
" Status line
" ------------------------------------------------------------------------------------
set laststatus=2                              " status bar : only if there are at least two windows
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ %r%{CurDir()}%h\ \ \ Line:\ %l/%L\ \ Col:%c%V\ \ Doc:%P\ (%{&encoding})
"set statusline=%<%F%h%m%r%h%w%y[%{CurDir()}%h]\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ line:%l\/%L\ col:%c%V\ pos:%o\ %P


" ------------------------------------------------------------------------------------
" Folding
" ------------------------------------------------------------------------------------
" set foldmarker={,} " Fold C style code (only use this as default if you use a high foldlevel)
set nofoldenable                                      " Turn off folding
"set foldmethod=marker                               " Fold on the marker
"set foldlevel=100 " Don't autofold anything (but I can still fold manually)
"set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
"function SimpleFoldText()
"    return getline(v:foldstart).' '
"endfunction
"set foldtext=SimpleFoldText() " Custom fold text function (cleaner than default)


" ------------------------------------------------------------------------------------
" Filetype : enable loading the plugins + indent file for specific file types
" ------------------------------------------------------------------------------------
if has("autocmd")
    filetype plugin indent on
endif


" ------------------------------------------------------------------------------------
" Invisible character
" ------------------------------------------------------------------------------------
nmap <leader>l :set list!<CR>
set listchars=nbsp:¤,tab:>-,trail:¤,extends:>,precedes:<,eol:¬,trail:·


" ------------------------------------------------------------------------------------
" Highlight current line
" ------------------------------------------------------------------------------------
set cursorline
hi CursorLine term=underline cterm=underline


" ------------------------------------------------------------------------------------
" Highlight & remove trailing whitespaces
" ------------------------------------------------------------------------------------
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" ------------------------------------------------------------------------------------
" Automatically remove trailing whitespace before write
" ------------------------------------------------------------------------------------
function! StripTrailingWhitespace()
    normal mZ
    %s/\s\+$//e
    if line("'Z") != line(".")
        echo "Stripped whitespace\n"
    endif
    normal `Z
endfunction
" don't include .md below, empty spaces are parsed by markdown
autocmd BufWritePre *.txt,*.twig,*.php,*.yml,*.xml,*.js,*.html,*.css,*.java,*.c,*.cpp,*.vim :call StripTrailingWhitespace()


" ------------------------------------------------------------------------------------
" Swapping
" ------------------------------------------------------------------------------------
set backupdir=~/.vim/tmp/,~/.tmp,~/tmp,/var/tmp,/tmp   " Keep swap files in one location
set directory=~/.vim/tmp/,~/.tmp,~/tmp,/var/tmp,/tmp   " Keep swap files in one location


" ------------------------------------------------------------------------------------
" Editing
" ------------------------------------------------------------------------------------
set ff=unix                     " unix EOL
set fileencoding=UTF-8          " speak UTF-8
set encoding=UTF-8              " display UTF-8
set autowrite                   " write the contents of the file, if it has been modified (:next, :make),
set showmatch                   " show matching (){}[]
set mat=2                       " how many tenths of a second to blink
set autoread                    " if current file is modified by another IDE, vim will refresh it
set listchars=tab:>-,trail:-    " show tabs and trailing
set report=0                    " tell us when anything is changed via :...
set gfn=Monospace\ 10
set wrap                        " wrap lines
" C-c and C-v - Copy/Paste :
vmap <C-C> "+yi
imap <C-V> <esc>"+gPi
map <S-Insert> <MiddleMouse>


" ------------------------------------------------------------------------------------
" Indentation
" ------------------------------------------------------------------------------------
"set smartindent
set autoindent
set copyindent                  " copy the previous indentation on autoindenting
set shiftround                  "round to a multiple of our tab setting
"set cindent                     " C-like indentation


" ------------------------------------------------------------------------------------
" Tabs Versus Spaces : any tab char become 4 space chars
" ------------------------------------------------------------------------------------
set tabstop=4                   " number of spaces that a <Tab> in the file counts for.
set shiftwidth=4                " number of spaces to use for each step of (auto)indent.
set expandtab                   " in Insert mode: Use the appropriate number of spaces to insert a <Tab>
set smarttab
set softtabstop=4               "softtab value, 4 spaces
set backspace=indent,eol,start


" ------------------------------------------------------------------------------------
" Search options
" ------------------------------------------------------------------------------------
" Enable folding by indentation
" Use: zc, zo, zC, zO, zR, zM
" Ctrl-K .3 for ⋯
" set foldmethod=indent
highlight Folded ctermfg=red
highlight FoldColumn ctermfg=white
set fillchars=fold:⋯


" ------------------------------------------------------------------------------------
" Search options
" ------------------------------------------------------------------------------------
set wrapscan                    " make search wrap around
set hlsearch                    " when there is a previous search pattern, highlight all its matches
set incsearch                   " enable incremental search
set ignorecase                  " search is case insensitive
set smartcase                   " search becomes case sensitive if expression contains uppercase character
" Clear search highlight :
nmap <silent> <leader>/ :let @/=""<cr>


" ------------------------------------------------------------------------------------
" SQL Syntax
" ------------------------------------------------------------------------------------
autocmd FileType sql set omnifunc=sqlcomplete#Complete


" ------------------------------------------------------------------------------------
" SnipMate
" ------------------------------------------------------------------------------------
ino <c-j> <c-r>=TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>


" ------------------------------------------------------------------------------------
" Markdown
" ------------------------------------------------------------------------------------
au! BufRead,BufNewFile *.markdown,*.md set filetype=mkd
au! BufRead,BufNewFile *.md set filetype=mkd

" ------------------------------------------------------------------------------------
" reStructuredText
" ------------------------------------------------------------------------------------
au! BufRead,BufNewFile *.rst set filetype=rst


" ------------------------------------------------------------------------------------
" Latex
" ------------------------------------------------------------------------------------
let g:Tex_ViewRule_pdf = 'okular'
let g:Tex_MultipleCompileFormats = 'dvi,ps,pdf'
let g:Tex_DefaultTargetFormat = 'pdf'


" ------------------------------------------------------------------------------------
" GO language Syntax check
" see http://go-lang.cat-v.org/text-editors/vim/
" ------------------------------------------------------------------------------------
autocmd BufRead,BufNewFile *.go set filetype=go
set rtp+=$GOROOT/misc/vim
syntax on


" ------------------------------------------------------------------------------------
" TEMPLATES
" ------------------------------------------------------------------------------------
"autocmd bufNewFile *.html 0r ~/.vim/templates/html
" See vim-templates bundle


" ------------------------------------------------------------------------------------
" CTAGS
" ------------------------------------------------------------------------------------
" Cf. http://goo.gl/P6AAT
set tags=tags;/ " Look in the current directory for "tags", towards $HOME, until one is found
let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=1
let Tlist_Show_One_File=0 " 1 = Only show tags for current buffer
let Tlist_Enable_Fold_Column=0 " no fold column (only showing one file)
let Tlist_Compact_Format=0
let Tlist_WinWidth=28
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close = 1
"let Tlist_Process_File_Always = 1
"let Tlist_GainFocus_On_ToggleOpen = 1  " set focus on Tlist at start
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
map <F4> :TlistToggle<cr>
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" Alt-right/left to navigate forward/backward in the tags stack
map <M-Left> <C-T>
map <M-Right> <C-]>
" Explore tags for the word under the cursor
map <C-l> <C-]>
" Back to previous location after browsing tags
map <C-h> <C-T>
" Jump to next tag match
map ]t :tnext<CR>
" Jump to previous tag match
map [t :tprevious<CR>


" ------------------------------------------------------------------------------------
" TABS (buffer tabs)
" ------------------------------------------------------------------------------------
" Always display tab label
" Tip : using visual mode, this allows double click to add a new tab in the tab line
set showtabline=2

" Tabs key bindings: movements commands
" [Ctrl]+T plus a directional arrow
map ,t :tabnew<cr>
map ,w :tabclose<cr>
" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove
" Improving tab name readability
highlight TabLine term=none cterm=none
highlight TabLineSel ctermbg=darkblue


"set rtp+=/home/ronan/dotfiles/.vim/bundle/powerline/powerline/bindings/vim


" ------------------------------------------------------------------------------------
" Keybord shortcuts
" ------------------------------------------------------------------------------------
" Selct all
map <C-a> ggVG
" Copy (le gv c'est pour remettre la sélection)
map <C-c> "+ygv
" Cut
map <C-x> "+x
" Past
map <C-p> "+gP


" ------------------------------------------------------------------------------------
" Text file
" ------------------------------------------------------------------------------------
au BufRead,BufNewFile *.txt     set filetype=txt


" ------------------------------------------------------------------------------------
" Vim 7 spell checker
" ------------------------------------------------------------------------------------
if has("spell")
    " Language : FR
    map ,lf :setlocal spell spelllang=fr<cr>
    " Language : EN
    map ,le :setlocal spell spelllang=en<cr>
    " Language : Aucun
    map ,ln :setlocal spell spelllang=<cr>
endif

set spellsuggest=5
autocmd BufEnter *.txt set spell
" autocmd BufEnter *.txt set spelllang=fr
autocmd BufEnter *.txt set spelllang=   " no default lang
set nospell


" ------------------------------------------------------------------------------------
" Xml formating
" usage : vim badFormatted.xml => will open & immediatly format any bad formatted xml file 
" see http://vim.wikia.com/wiki/Format_your_xml_document_using_xmllint
" ------------------------------------------------------------------------------------
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"


" ------------------------------------------------------------------------------------
" Javascript
" see http://amix.dk/vim/vimrc.html
" ------------------------------------------------------------------------------------
"autocmd FileType javascript call JavaScriptFold()
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


" ------------------------------------------------------------------------------------
" Vim Templates
" ------------------------------------------------------------------------------------
augroup templates
    au!
    " read in template files
    autocmd BufNewFile *.* silent! execute '0r $HOME/vimfiles/templates/skeleton.'.expand("<afile>:e")

    " parse special text in the templates after the read
    autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
augroup END


" ------------------------------------------------------------------------------------
" Vim Functions
" ------------------------------------------------------------------------------------

" CleanCode function,
" thanks to @ornicar
function! CleanCode()
    %retab          " Replace tabs with spaces
    %s/\r/\r/eg     " Turn DOS returns ^M into real returns
    %s=  *$==e      " Delete end of line blanks
    echo "Cleaned up this mess."
endfunction
nmap <leader>cc :call CleanCode()<cr>

" Indent XML readably
function! DoPrettyXML()
    1,$!xmllint --format --recover -
endfunction
command! PrettyXML call DoPrettyXML()

function! CurDir()
    let curdir = substitute(getcwd(), '/home/ronan/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction
