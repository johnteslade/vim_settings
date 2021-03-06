" Setup vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'techlivezheng/vim-plugin-minibufexpl'
Plugin 'taglist.vim'
Plugin 'krisajenkins/vim-pipe'
Plugin 'cscope.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'drmikehenry/vim-fontsize'
Plugin 'wincent/Command-T'
"Plugin 'scrooloose/syntastic'
"Plugin 'wting/rust.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-fugitive'
Plugin 'ShowTrailingWhitespace'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/nagios-syntax'
Plugin 'docker/docker' , {'rtp': 'contrib/syntax/vim/'}
Plugin 'klen/python-mode'

" Colorschemes

Plugin 'morhetz/gruvbox'
Plugin 'vim-scripts/herald.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
Plugin '29decibel/codeschool-vim-theme'
Plugin 'endel/vim-github-colorscheme'
Plugin 'twerth/ir_black'
Plugin 'vim-scripts/moria'
Plugin 'vim-scripts/nuvola.vim'
Plugin 'vim-scripts/Wombat'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'lepture/vim-jinja'

call vundle#end()            " required
filetype plugin indent on "required!

set backspace=indent,eol,start " backspace as normal
set fileencodings=ucs-bom,utf-8,latin1
set formatoptions=tcql
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175,a:blinkon0

" cscope settings
set cscopeprg=/usr/bin/cscope
set cscopetag
set cscopeverbose

""""" FONTS
"set guifont=LucidaTypewriter\ 9
"set guifont=Liberation\ Mono\ 10
"set guifont=Monaco\ 10
"set guifont=DroidSansMono\ 10
"set guifont=DejaVuSansMono\ 9
"set guifont=CodingFontTobi\ 12
"set guifont=Monaco\ 9

"" Switch depending on distro
set guifont=Hack\ 10
let g:ack_default_options = " --ignore-file=is:tags -s -H --nocolor --nogroup --column "

set t_Co=256 " Force terminal to 256

set helplang=en
set history=50
set hlsearch
set isfname=@,48-57,/,.,-,_,+,,,#,$,%,~,=,:
set mouse=a
set ruler
set termencoding=utf-8
set window=69
set number " Show line numbers
set completeopt=longest,menuone " Don't autofill in complete options

let g:is_posix = 1 " Do POSIX formatting for .sh files

" Tab Settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set autoindent
set smartindent
set guioptions-=T guioptions-=m " No tool bars

" Python mode settings
let g:pymode_folding = 0
let g:pymode_syntax = 1

" Force minibuf to start - prevents problems with using command-T
let g:miniBufExplAutoStart = 1
let g:miniBufExplBuffersNeeded = 0

" Fixing Whitespace problems
function! s:FixWhitespace(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
    call setpos('.', l:save_cursor)
endfunction
command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)
vnoremap <F6> :FixWhitespace <CR>

" Copy to clipboard

" relative path (src/foo.txt)
nnoremap <leader>cr :let @+=expand("%")<CR>
" absolute path (/something/src/foo.txt)
nnoremap <leader>ca :let @+=expand("%:p")<CR>
" filename (foo.txt)
nnoremap <leader>cf :let @+=expand("%:t")<CR>
" directory name (/something/src)
nnoremap <leader>cd :let @+=expand("%:p:h")<CR>

" Font sizes
nmap <F10> <Plug>FontsizeInc
nmap <F9> <Plug>FontsizeDec

" Col markings

nnoremap <F8> :call ToggleColMarkings()<CR>
function! ToggleColMarkings()
  if &cc == 0
    set cc=80
    hi ColorColumn ctermbg=red ctermfg=white guibg=#592929
    highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    match OverLength /\%80v.\+/
    echo "Columns marked"
  else
    set cc=0
    highlight OverLength None
    echo "Columns not marked"
  endif
endfunction

" Fullscreen
map <silent> <F11>
    \   :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>


""""" COLORS - need install path to theme
set background=dark
set rtp+=~/.vim/bundle/gruvbox
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='medium'
colorscheme gruvbox

nnoremap <F7> :call ToggleBackground()<CR>
function! ToggleBackground()
  if &background == "dark"
    set background=light
  else
    set background=dark
  endif
endfunction

" Open images in eog
nnoremap g0 :silent exe '!eog '.expand("%:p:h").'/'.expand('<cfile>').'&'<CR>:redraw!<CR>

" lhs comments
map ,# :s/^/#/<CR>:noh<CR>
map ,/ :s/^/\/\//<CR>:noh<CR>
map ,> :s/^/> /<CR>:noh<CR>
map ," :s/^/\"/<CR>:noh<CR>
map ,% :s/^/%/<CR>:noh<CR>
map ,! :s/^/!/<CR>:noh<CR>
map ,; :s/^/;/<CR>:noh<CR>
map ,- :s/^/--/<CR>:noh<CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:noh<CR>

" wrapping comments
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>:noh<CR>
map ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>:noh<CR>
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR>:noh<CR>
map ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:noh<CR>

" Create ctags
command! Tags !ctags -R && cscope -Rb

" Map CTRL X, C, V, A
vnoremap <C-X> "+x
vnoremap <C-C> "+y
map <C-V> "+gP
map <C-A> ggVG

" Ctrl-V in insert mode
set pastetoggle=<C-F12>
inoremap <C-v> <C-F12><C-r>+<C-F12>

" Ctrl-V in command line mode
cmap <C-V> <C-R>+

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" File type settings

" scons
au BufRead,BufNewFile SConstruct set filetype=python
au BufRead,BufNewFile Sconscript set filetype=python

" vagrant
au BufRead,BufNewFile Vagrantfile set filetype=ruby

" scala
au BufRead,BufNewFile *.scala set filetype=java

" Json
au BufNewFile,BufRead *.json set filetype=javascript
command! JsonPretty %!json_xs -f json -t json-pretty

" Conf files
au BufRead,BufNewFile *.conf set filetype=dosini

" Markdown
au BufRead,BufNewFile *.md set filetype=markdown

" Dockerfile
au BufNewFile,BufRead [Dd]ockerfile,Dockerfile.* set filetype=dockerfile

" Set indent amounts
au FileType html setl tabstop=2 shiftwidth=2 softtabstop=2
let g:indentLine_char = '┆'

" Setup tags to recurse back up tree
set tags=tags;/

" Function key mappings

map <F2> :NERDTreeToggle<CR>
map <F3> :TlistToggle<CR>
map <F4> :TagbarToggle<CR>
map <F5> :CommandTFlush<CR>
map <F1> :MBEToggle<CR>
" Close buffer and keep window layout (Ctrl for discard changes)
map <F12> :bn<CR> :bd# <CR>
map <C-F12> :bn!<CR> :bd! # <CR>
" New file
map <C-n> :enew<CR>

au BufRead,BufNewFile *.rs set filetype=rust

" HTML settings
au FileType jinja setl ts=2 sw=2 sts=2 et

" Nerdtree
map <leader>f :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$', '\.o$']

" vim pipe
let &splitright=1
autocmd FileType python let b:vimpipe_command="python"
autocmd FileType c let b:vimpipe_command="gcc -Wall -x c - && ./a.out"

" pylint settings
autocmd FileType python set makeprg=pylint\ --reports=n\ --msg-template=\"{path}:{line}:\ {msg_id}\ {symbol},\ {obj}\ {msg}\"\ %:p
autocmd FileType python set errorformat=%f:%l:\ %m

autocmd FileType c set makeprg=make

" Create ctags
command! Tags !ctags -R && cscope -Rb

" Setup command T
map <C-T> :CommandT .<CR>
map <C-B> :CommandTMRU<CR>
let g:CommandTMinHeight=20
let g:CommandTMaxHeight=20
let g:CommandTCursorStartMap='<Home>'
let g:CommandTCursorEndMap='<End>'
let g:CommandTMaxFiles=500000
let g:CommandTFileScanner='find'
let g:CommandTMaxCachedDirectories=10

" Ack search
map <leader>a :Ack <cword><CR>

" Files to ignore
set wildignore=*.swp,*.bak,*.pyc,*.class,*.jar,*.gif,*.png,*.jpg,*.o,*.orig,*~

" Python specific stuff
nnoremap <leader>pd yyp^Cimport pdb; pdb.set_trace()<ESC>
nnoremap <leader>pm 0^Cif __name__ == "__main__":<CR><Tab>
command! SetPy setfiletype python

" Powerline setup
set laststatus=2

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? "\ue0a0 "._ : ''
  endif
  return ''
endfunction

" Diff setup

noremap <Leader>d :call DiffToggle()<CR>

function! DiffToggle()
    if &diff
        diffoff
    else
        diffthis
    endif
:endfunction

" Spell check

noremap <Leader>s :call SpellToggle()<CR>
noremap <Leader>ss z=
inoremap <Leader>ss <C-O>z=

function! SpellToggle()
   set spelllang=en_gb
   if &spell
      setlocal nospell
   else
      setlocal spell
   endif
:endfunction

set complete+=kspell

autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
    endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

