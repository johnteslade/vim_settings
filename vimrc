version 6.0

" Setup vundle
set rtp+=~/.vim/bundle/vundle/
let path = '~/.vim/plugin/vundle_installed/'
call vundle#rc(path)

Plugin 'taglist.vim'
Plugin 'krisajenkins/vim-pipe'
Plugin 'techlivezheng/vim-plugin-minibufexpl'
Plugin 'mileszs/ack.vim'
"Plugin 'airblade/vim-gitgutter'
Plugin 'cscope.vim'
Plugin 'wincent/Command-T'
Plugin 'Yggdroot/indentLine'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'

set background=dark
set backspace=indent,eol,start
set cscopeprg=/usr/bin/cscope
set cscopetag
set cscopeverbose
set fileencodings=ucs-bom,utf-8,latin1
set formatoptions=tcql
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175,a:blinkon0

" Force minibuf to start - prevents problems with using command-T
let g:miniBufExplAutoStart = 1
let g:miniBufExplBuffersNeeded = 0

""""" FONTS
"set guifont=LucidaTypewriter\ 9
set guifont=Liberation\ Mono\ 10
"set guifont=Monaco\ 10
"set guifont=DroidSansMono\ 10
"set guifont=DejaVuSansMono\ 9 
"set guifont=CodingFontTobi\ 12

set helplang=en
set history=50
set hlsearch
set isfname=@,48-57,/,.,-,_,+,,,#,$,%,~,=,:
set mouse=a
set ruler
set termencoding=utf-8
set viminfo='20,\"50
set window=69
set number
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent


""""" COLORS
"colorscheme desert 
"colorscheme colorful
colorscheme gruvbox 

" lhs comments
map ,# :s/^/#/<CR>
map ,/ :s/^/\/\//<CR>
map ,> :s/^/> /<CR>
map ," :s/^/\"/<CR>
map ,% :s/^/%/<CR>
map ,! :s/^/!/<CR>
map ,; :s/^/;/<CR>
map ,- :s/^/--/<CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>

" wrapping comments
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>
map ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR>
map ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR> 

" Map CTRL X, C, V, A
vnoremap <C-X> "+x
vnoremap <C-C> "+y
map <C-V>               "+gP
map <C-A>               ggVG

" Ctrl-V in command line mode
cmap <C-V> <C-R>+

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>           :update<CR>
vnoremap <C-S>          <C-C>:update<CR>
inoremap <C-S>          <C-O>:update<CR>

" Ctrl-V in insert mode
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

" Setup django 
au BufRead,BufNewFile *.html set filetype=htmldjango

" scons
au BufRead,BufNewFile SConstruct set filetype=python
au BufRead,BufNewFile Sconscript set filetype=python

" Setup scala 
au BufRead,BufNewFile *.scala set filetype=java

" Json
au BufNewFile,BufRead *.json set ft=javascript

" vim: set ft=vim 

" Specific python settings
au FileType python set expandtab
au FileType python setl shiftwidth=4 tabstop=4

" Setup tags to recurse back up tree
set tags=tags;/

" func shortcuts
map <F2> :NERDTreeToggle<CR>
map <F3> :TlistToggle<CR>
map <F7> :make<CR>
map <F11> :bn<CR> :bd# <CR>

" vim pipe
let &splitright=1
autocmd FileType python let b:vimpipe_command="python"

" pylint settings
autocmd FileType python set makeprg=pylint\ --reports=n\ --msg-template=\"{path}:{line}:\ {msg_id}\ {symbol},\ {obj}\ {msg}\"\ %:p
autocmd FileType python set errorformat=%f:%l:\ %m

" Create ctags
command! Tags !ctags -R && cscope -Rb
 
" Setup command T
map <C-T> <Leader>t
map <C-B> <Leader>b
let g:CommandTMinHeight=20
let g:CommandTMaxHeight=20
let g:CommandTCursorStartMap='<Home>'
let g:CommandTCursorEndMap='<End>'
 
" Ack search
map <leader>a :Ack <cword><CR>

" Files to ignore
set wildignore=*.swp,*.bak,*.pyc,*.class,*.jar,*.gif,*.png,*.jpg,*.o,*.orig,*~

" Python debug line
nnoremap <leader>p yyp^Cimport pdb; pdb.set_trace()<ESC>

